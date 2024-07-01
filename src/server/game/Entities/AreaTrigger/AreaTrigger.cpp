/*
 * Copyright (C) 2020 BfaCore
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "AreaTrigger.h"
#include "AreaTriggerAI.h"
#include "AreaTriggerDataStore.h"
#include "AreaTriggerPackets.h"
#include "CellImpl.h"
#include "Chat.h"
#include "DB2Stores.h"
#include "GridNotifiersImpl.h"
#include "Language.h"
#include "Log.h"
#include "Object.h"
#include "ObjectMgr.h"
#include "ObjectAccessor.h"
#include "PathGenerator.h"
#include "PhasingHandler.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "SpellInfo.h"
#include "SpellMgr.h"
#include "Spline.h"
#include "Transport.h"
#include "Unit.h"
#include "UpdateData.h"
#include <G3D/AABox.h>

AreaTrigger::AreaTrigger() : WorldObject(false), MapObject(), _aurEff(nullptr),
    _duration(0), _totalDuration(0), _timeSinceCreated(0), _periodicProcTimer(0), _basePeriodicProcTimer(0),
    _previousCheckOrientation(std::numeric_limits<float>::infinity()),
    _isBeingRemoved(false), _isRemoved(false), _reachedDestination(false), _lastSplineIndex(0), _movementTime(0),
    _areaTriggerTemplate(nullptr), _areaTriggerMiscTemplate(nullptr), _spawnId(0), _guidScriptId(0), _ai()
{
    m_objectType |= TYPEMASK_AREATRIGGER;
    m_objectTypeId = TYPEID_AREATRIGGER;

    m_updateFlag.Stationary = true;
    m_updateFlag.AreaTrigger = true;
}

AreaTrigger::~AreaTrigger()
{
}

void AreaTrigger::AddToWorld()
{
    ///- Register the AreaTrigger for guid lookup and for caster
    if (!IsInWorld())
    {
        GetMap()->GetObjectsStore().Insert<AreaTrigger>(GetGUID(), this);
        WorldObject::AddToWorld();
    }
}

void AreaTrigger::RemoveFromWorld()
{
    ///- Remove the AreaTrigger from the accessor and from all lists of objects in world
    if (IsInWorld())
    {
        _isRemoved = true;

        if (Unit* caster = GetCaster())
            caster->_UnregisterAreaTrigger(this);

        _ai->OnRemove();

        // Handle removal of all units, calling OnUnitExit & deleting auras if needed
        HandleUnitEnterExit({});

        if (_ai)
            _ai->OnRemove();

        WorldObject::RemoveFromWorld();
        GetMap()->GetObjectsStore().Remove<AreaTrigger>(GetGUID());
    }
}

bool AreaTrigger::LoadFromDB(ObjectGuid::LowType guidLow, Map* map)
{
    AreaTriggerDataStore::AreaTriggerDataList const* areaTriggerList = sAreaTriggerDataStore->GetStaticAreaTriggersByMap(map->GetId());
    if (!areaTriggerList)
        return false;

    for (AreaTriggerData const& trigger : *areaTriggerList)
    {
        if (trigger.guid == guidLow)
        {
            Position pos(trigger.position_x, trigger.position_y, trigger.position_z);
            return CreateStaticAreaTrigger(trigger.id, guidLow, pos, map, trigger.scriptId);
        }
    }

    return false;
}

bool AreaTrigger::Create(uint32 spellMiscId, Unit* caster, Unit* target, SpellInfo const* spell, Position const& pos, int32 duration, uint32 spellXSpellVisualId, ObjectGuid const& castId, AuraEffect const* aurEff, AreaTriggerOrbitInfo* customCmi)
{
    _targetGuid = target ? target->GetGUID() : ObjectGuid::Empty;
    _aurEff = aurEff;

    SetMap(caster->GetMap());
    Relocate(pos);
    if (!IsPositionValid())
    {
        TC_LOG_ERROR("entities.areatrigger", "AreaTrigger (spellMiscId %u) not created. Invalid coordinates (X: %f Y: %f)", spellMiscId, GetPositionX(), GetPositionY());
        return false;
    }

    _areaTriggerMiscTemplate = sAreaTriggerDataStore->GetAreaTriggerMiscTemplate(spellMiscId);
    if (!_areaTriggerMiscTemplate)
    {
        TC_LOG_ERROR("entities.areatrigger", "AreaTrigger (spellMiscId %u) not created. Invalid areatrigger miscid (%u)", spellMiscId, spellMiscId);
        return false;
    }

    _areaTriggerTemplate = _areaTriggerMiscTemplate->Template;

    Object::_Create(ObjectGuid::Create<HighGuid::AreaTrigger>(GetMapId(), GetTemplate()->Id, caster->GetMap()->GenerateLowGuid<HighGuid::AreaTrigger>()));

    SetEntry(GetTemplate()->Id);
    SetDuration(duration);

    SetObjectScale(1.0f);

    auto areaTriggerData = m_values.ModifyValue(&AreaTrigger::m_areaTriggerData);
    SetUpdateFieldValue(areaTriggerData.ModifyValue(&UF::AreaTriggerData::Caster), caster->GetGUID());
    SetUpdateFieldValue(areaTriggerData.ModifyValue(&UF::AreaTriggerData::CreatingEffectGUID), castId);

    SetUpdateFieldValue(areaTriggerData.ModifyValue(&UF::AreaTriggerData::SpellID), spell->Id);
    SetUpdateFieldValue(areaTriggerData.ModifyValue(&UF::AreaTriggerData::SpellForVisuals), spell->Id);
    SetUpdateFieldValue(areaTriggerData.ModifyValue(&UF::AreaTriggerData::SpellXSpellVisualID), spellXSpellVisualId);
    SetUpdateFieldValue(areaTriggerData.ModifyValue(&UF::AreaTriggerData::TimeToTargetScale), GetMiscTemplate()->TimeToTargetScale != 0 ? GetMiscTemplate()->TimeToTargetScale : *m_areaTriggerData->Duration);
    SetUpdateFieldValue(areaTriggerData.ModifyValue(&UF::AreaTriggerData::BoundsRadius2D), GetTemplate()->MaxSearchRadius);
    SetUpdateFieldValue(areaTriggerData.ModifyValue(&UF::AreaTriggerData::DecalPropertiesID), GetMiscTemplate()->DecalPropertiesId);

    if (GetMiscTemplate()->ExtraScale.Data.Structured.StartTimeOffset)
        SetUpdateFieldValue(areaTriggerData.ModifyValue(&UF::AreaTriggerData::ExtraScaleCurve).ModifyValue(&UF::ScaleCurve::StartTimeOffset), GetMiscTemplate()->ExtraScale.Data.Structured.StartTimeOffset);
    if (GetMiscTemplate()->ExtraScale.Data.Structured.Points[0] || GetMiscTemplate()->ExtraScale.Data.Structured.Points[1])
    {
        Position point(GetMiscTemplate()->ExtraScale.Data.Structured.Points[0], GetMiscTemplate()->ExtraScale.Data.Structured.Points[1]);
        SetUpdateFieldValue(areaTriggerData.ModifyValue(&UF::AreaTriggerData::ExtraScaleCurve).ModifyValue(&UF::ScaleCurve::Points, 0), point);
    }
    if (GetMiscTemplate()->ExtraScale.Data.Structured.Points[2] || GetMiscTemplate()->ExtraScale.Data.Structured.Points[3])
    {
        Position point(GetMiscTemplate()->ExtraScale.Data.Structured.Points[2], GetMiscTemplate()->ExtraScale.Data.Structured.Points[3]);
        SetUpdateFieldValue(areaTriggerData.ModifyValue(&UF::AreaTriggerData::ExtraScaleCurve).ModifyValue(&UF::ScaleCurve::Points, 1), point);
    }
    if (GetMiscTemplate()->ExtraScale.Data.Raw[5])
        SetUpdateFieldValue(areaTriggerData.ModifyValue(&UF::AreaTriggerData::ExtraScaleCurve).ModifyValue(&UF::ScaleCurve::ParameterCurve), GetMiscTemplate()->ExtraScale.Data.Raw[5]);
    if (GetMiscTemplate()->ExtraScale.Data.Structured.OverrideActive)
        SetUpdateFieldValue(areaTriggerData.ModifyValue(&UF::AreaTriggerData::ExtraScaleCurve).ModifyValue(&UF::ScaleCurve::OverrideActive), GetMiscTemplate()->ExtraScale.Data.Structured.OverrideActive);

    PhasingHandler::InheritPhaseShift(this, caster);

    if (target && GetTemplate()->HasFlag(AREATRIGGER_FLAG_HAS_ATTACHED))
    {
        m_movementInfo.transport.guid = target->GetGUID();
    }

    UpdateShape();

    uint32 timeToTarget = GetMiscTemplate()->TimeToTarget != 0 ? GetMiscTemplate()->TimeToTarget : *m_areaTriggerData->Duration;

    if (GetTemplate()->HasFlag(AREATRIGGER_FLAG_HAS_CIRCULAR_MOVEMENT))
    {
        AreaTriggerOrbitInfo cmi = customCmi ? *customCmi : GetMiscTemplate()->OrbitInfo;
        if (target && GetTemplate()->HasFlag(AREATRIGGER_FLAG_HAS_ATTACHED))
            cmi.PathTarget = target->GetGUID();
        else
            cmi.Center = pos;

        InitOrbit(cmi, timeToTarget);
    }
    else if (GetMiscTemplate()->HasSplines())
    {
        InitSplineOffsets(GetMiscTemplate()->SplinePoints, timeToTarget);
    }

    // movement on transport of areatriggers on unit is handled by themself
    Transport* transport = m_movementInfo.transport.guid.IsEmpty() ? caster->GetTransport() : nullptr;
    if (transport)
    {
        float x, y, z, o;
        pos.GetPosition(x, y, z, o);
        transport->CalculatePassengerOffset(x, y, z, &o);
        m_movementInfo.transport.pos.Relocate(x, y, z, o);

        // This object must be added to transport before adding to map for the client to properly display it
        transport->AddPassenger(this);
    }

    AI_Initialize();

    // Relocate areatriggers with circular movement again
    if (HasOrbit())
        Relocate(CalculateOrbitPosition());

    if (!GetMap()->AddToMap(this))
    {
        // Returning false will cause the object to be deleted - remove from transport
        if (transport)
            transport->RemovePassenger(this);
        return false;
    }

    caster->_RegisterAreaTrigger(this);

    _ai->OnCreate();

    return true;
}

AreaTrigger* AreaTrigger::CreateAreaTrigger(uint32 spellMiscId, Unit* caster, Unit* target, SpellInfo const* spell, Position const& pos, int32 duration, uint32 spellXSpellVisualId, ObjectGuid const& castId /*= ObjectGuid::Empty*/, AuraEffect const* aurEff /*= nullptr*/)
{
    AreaTrigger* at = new AreaTrigger();
    if (!at->Create(spellMiscId, caster, target, spell, pos, duration, spellXSpellVisualId, castId, aurEff))
    {
        delete at;
        return nullptr;
    }

    return at;
}

AreaTrigger* AreaTrigger::CreateAreaTrigger(uint32 spellMiscId, Unit* caster, uint32 spellId, Position const& pos, int32 duration, float radius, float angle, uint32 timeToTarget, bool canLoop, bool counterClockwise)
{
    SpellInfo const* spellEntry = sSpellMgr->GetSpellInfo(spellId);
    if (!spellEntry)
        return nullptr;

    AreaTrigger* at = new AreaTrigger();
    AreaTriggerOrbitInfo* cmi = new AreaTriggerOrbitInfo();
    cmi->CanLoop = canLoop;
    cmi->Center = pos;
    cmi->Radius = radius;
    cmi->CounterClockwise = counterClockwise;
    cmi->InitialAngle = angle;
    cmi->TimeToTarget = timeToTarget;
    if (!at->Create(spellMiscId, caster, caster, spellEntry, pos, duration, spellEntry->GetSpellVisual(), ObjectGuid::Empty, nullptr, cmi))
    {
        delete at;
        delete cmi;
        return nullptr;
    }

    return at;
}

bool AreaTrigger::CreateStaticAreaTrigger(uint32 entry, ObjectGuid::LowType guidLow, Position const& pos, Map* map, uint32 scriptId /*= 0*/)
{
    ASSERT(map != nullptr);

    _targetGuid = ObjectGuid::Empty;
    _aurEff = nullptr;
    _spawnId = guidLow;
    _guidScriptId = scriptId;

    SetMap(map);
    Relocate(pos);
    if (!IsPositionValid())
    {
        TC_LOG_ERROR("entities.areatrigger", "AreaTrigger (entry %u) not staticaly created. Invalid coordinates (X: %f Y: %f)", entry, GetPositionX(), GetPositionY());
        return false;
    }

    _areaTriggerTemplate = sAreaTriggerDataStore->GetAreaTriggerTemplate(entry);
    if (!_areaTriggerTemplate)
    {
        TC_LOG_ERROR("entities.areatrigger", "AreaTrigger not created. Invalid areatrigger entry (%u)", entry);
        return false;
    }

    Object::_Create(ObjectGuid::Create<HighGuid::AreaTrigger>(GetMapId(), GetTemplate()->Id, guidLow));

    SetEntry(GetTemplate()->Id);
    SetDuration(-1);

    SetObjectScale(1.0f);

    auto areaTriggerData = m_values.ModifyValue(&AreaTrigger::m_areaTriggerData);
    SetUpdateFieldValue(areaTriggerData.ModifyValue(&UF::AreaTriggerData::BoundsRadius2D), GetTemplate()->MaxSearchRadius);

    UpdateShape();

    AI_Initialize();

    _ai->OnCreate();

    return true;
}

void AreaTrigger::Update(uint32 diff)
{
    if (_isBeingRemoved)
        return;

    WorldObject::Update(diff);
    _timeSinceCreated += diff;

    // "If" order matter here, Orbit > Attached > Splines
    if (HasOrbit())
    {
        UpdateOrbitPosition(diff);
    }
    else if (GetTemplate()->HasFlag(AREATRIGGER_FLAG_HAS_ATTACHED))
    {
        if (Unit* target = GetTarget())
            GetMap()->AreaTriggerRelocation(this, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation());
    }
    else
        UpdateSplinePosition(diff);

    if (GetDuration() != -1)
    {
        if (GetDuration() > int32(diff))
            _UpdateDuration(_duration - diff);
        else
        {
            Remove(); // expired
            return;
        }
    }

    UpdateTargetList();

    _ai->OnUpdate(diff);

    if (_basePeriodicProcTimer)
    {
        if (_periodicProcTimer <= diff)
        {
            _ai->OnPeriodicProc();
            _periodicProcTimer = _basePeriodicProcTimer;
        }
        else
            _periodicProcTimer -= diff;
    }
}

void AreaTrigger::Remove()
{
    if (this->GetEntry() >= 100000 && this->GetEntry() < 100008)
        return;
    else
    {
        if (IsInWorld())
        {
            _isBeingRemoved = true;
            AddObjectToRemoveList(); // calls RemoveFromWorld
        }
    }
}

void AreaTrigger::SetDuration(int32 newDuration)
{
    _duration = newDuration;
    _totalDuration = newDuration;

    // negative duration (permanent areatrigger) sent as 0
    SetUpdateFieldValue(m_values.ModifyValue(&AreaTrigger::m_areaTriggerData).ModifyValue(&UF::AreaTriggerData::Duration), std::max(newDuration, 0));
}

GuidUnorderedSet const AreaTrigger::GetInsidePlayers() const
{
    GuidUnorderedSet insidePlayers;
    std::copy_if(_insideUnits.begin(), _insideUnits.end(), std::inserter(insidePlayers, insidePlayers.begin()), [](ObjectGuid guid)
    {
        return guid.IsPlayer();
    });

    return insidePlayers;
}

void AreaTrigger::_UpdateDuration(int32 newDuration)
{
    _duration = newDuration;

    // should be sent in object create packets only
    SetUpdateFieldValue(m_values.ModifyValue(&AreaTrigger::m_areaTriggerData).ModifyValue(&UF::AreaTriggerData::Duration), _duration);
    const_cast<UF::AreaTriggerData&>(*m_areaTriggerData).ClearChanged(&UF::AreaTriggerData::Duration);
}

float AreaTrigger::GetProgress() const
{
    return GetTimeSinceCreated() < GetTimeToTargetScale() ? float(GetTimeSinceCreated()) / float(GetTimeToTargetScale()) : 1.0f;
}

void AreaTrigger::UpdateTargetList()
{
    std::list<Unit*> targetList;

    switch (GetTemplate()->Type)
    {
        case AREATRIGGER_TYPE_SPHERE:
            SearchUnitInSphere(targetList);
            break;
        case AREATRIGGER_TYPE_BOX:
            SearchUnitInBox(targetList);
            break;
        case AREATRIGGER_TYPE_POLYGON:
            SearchUnitInPolygon(targetList);
            break;
        case AREATRIGGER_TYPE_CYLINDER:
            SearchUnitInCylinder(targetList);
            break;
        default:
            break;
    }

    HandleUnitEnterExit(targetList);
}

void AreaTrigger::SearchUnitInSphere(std::list<Unit*>& targetList)
{
    float radius = GetTemplate()->SphereDatas.Radius;
    if (GetTemplate()->HasFlag(AREATRIGGER_FLAG_HAS_DYNAMIC_SHAPE))
    {
        if (AreaTriggerMiscTemplate const* miscTemplate = GetMiscTemplate())
        {
            if (miscTemplate->MorphCurveId)
            {
                radius = G3D::lerp(GetTemplate()->SphereDatas.Radius,
                    GetTemplate()->SphereDatas.RadiusTarget,
                    sDB2Manager.GetCurveValueAt(miscTemplate->MorphCurveId, GetProgress()));
            }
            else if (miscTemplate->ScaleCurveId)
            {
                float initialRadius = .0f;

                if (GetTemplate()->SphereDatas.Radius != GetTemplate()->SphereDatas.RadiusTarget)
                    initialRadius = GetTemplate()->SphereDatas.Radius;

                radius = G3D::lerp(initialRadius,
                    GetTemplate()->SphereDatas.RadiusTarget,
                    sDB2Manager.GetCurveValueAt(miscTemplate->ScaleCurveId, GetProgress()));
            }
        }
    }

    Trinity::AnyUnitInObjectRangeCheck check(this, radius);
    Trinity::UnitListSearcher<Trinity::AnyUnitInObjectRangeCheck> searcher(this, targetList, check);
    Cell::VisitAllObjects(this, searcher, GetTemplate()->MaxSearchRadius);
}

void AreaTrigger::SearchUnitInBox(std::list<Unit*>& targetList)
{
    float extentsX = GetTemplate()->BoxDatas.Extents[0];
    float extentsY = GetTemplate()->BoxDatas.Extents[1];
    float extentsZ = GetTemplate()->BoxDatas.Extents[2];

    Trinity::AnyUnitInObjectRangeCheck check(this, GetTemplate()->MaxSearchRadius, false);
    Trinity::UnitListSearcher<Trinity::AnyUnitInObjectRangeCheck> searcher(this, targetList, check);
    Cell::VisitAllObjects(this, searcher, GetTemplate()->MaxSearchRadius);

    float halfExtentsX = extentsX / 2.0f;
    float halfExtentsY = extentsY / 2.0f;
    float halfExtentsZ = extentsZ / 2.0f;

    float minX = GetPositionX() - halfExtentsX;
    float maxX = GetPositionX() + halfExtentsX;

    float minY = GetPositionY() - halfExtentsY;
    float maxY = GetPositionY() + halfExtentsY;

    float minZ = GetPositionZ() - halfExtentsZ;
    float maxZ = GetPositionZ() + halfExtentsZ;

    G3D::AABox const box({ minX, minY, minZ }, { maxX, maxY, maxZ });

    targetList.remove_if([&box](Unit* unit) -> bool
    {
        return !box.contains({ unit->GetPositionX(), unit->GetPositionY(), unit->GetPositionZ() });
    });
}

void AreaTrigger::SearchUnitInPolygon(std::list<Unit*>& targetList)
{
    Trinity::AnyUnitInObjectRangeCheck check(this, GetTemplate()->MaxSearchRadius, false);
    Trinity::UnitListSearcher<Trinity::AnyUnitInObjectRangeCheck> searcher(this, targetList, check);
    Cell::VisitAllObjects(this, searcher, GetTemplate()->MaxSearchRadius);

    float height = GetTemplate()->PolygonDatas.Height;
    float minZ = GetPositionZ() - height;
    float maxZ = GetPositionZ() + height;

    targetList.remove_if([this, minZ, maxZ](Unit* unit) -> bool
    {
        return !CheckIsInPolygon2D(unit)
            || unit->GetPositionZ() < minZ
            || unit->GetPositionZ() > maxZ;
    });
}

void AreaTrigger::SearchUnitInCylinder(std::list<Unit*>& targetList)
{
    Trinity::AnyUnitInObjectRangeCheck check(this, GetTemplate()->MaxSearchRadius, false);
    Trinity::UnitListSearcher<Trinity::AnyUnitInObjectRangeCheck> searcher(this, targetList, check);
    Cell::VisitAllObjects(this, searcher, GetTemplate()->MaxSearchRadius);

    float height = GetTemplate()->CylinderDatas.Height;
    float minZ = GetPositionZ() - height;
    float maxZ = GetPositionZ() + height;

    targetList.remove_if([minZ, maxZ](Unit* unit) -> bool
    {
        return unit->GetPositionZ() < minZ
            || unit->GetPositionZ() > maxZ;
    });
}

void AreaTrigger::HandleUnitEnterExit(std::list<Unit*> const& newTargetList)
{
    GuidUnorderedSet exitUnits = _insideUnits;
    _insideUnits.clear();

    std::vector<Unit*> enteringUnits;

    for (Unit* unit : newTargetList)
    {
        if (exitUnits.erase(unit->GetGUID()) == 0) // erase(key_type) returns number of elements erased
            enteringUnits.push_back(unit);

        _insideUnits.insert(unit->GetGUID());
    }

    // Handle after _insideUnits have been reinserted so we can use GetInsideUnits() in hooks
    for (Unit* unit : enteringUnits)
    {
        if (Player* player = unit->ToPlayer())
        {
            if (player->isDebugAreaTriggers)
                ChatHandler(player->GetSession()).PSendSysMessage(LANG_DEBUG_AREATRIGGER_ENTERED, GetTemplate()->Id);

            if (ObjectGuid::LowType spawnId = GetSpawnId())
                if (AreaTriggerTeleportStruct const* at = sObjectMgr->GetAreaTrigger(-int64(spawnId)))
                    player->TeleportTo(at);
        }

        DoActions(unit);

        _ai->OnUnitEnter(unit);
    }

    for (ObjectGuid const& exitUnitGuid : exitUnits)
    {
        if (Unit* leavingUnit = ObjectAccessor::GetUnit(*this, exitUnitGuid))
        {
            if (Player* player = leavingUnit->ToPlayer())
                if (player->isDebugAreaTriggers)
                    ChatHandler(player->GetSession()).PSendSysMessage(LANG_DEBUG_AREATRIGGER_LEFT, GetTemplate()->Id);

            UndoActions(leavingUnit);

            if (_ai)
                _ai->OnUnitExit(leavingUnit);
        }
    }
}

AreaTriggerTemplate const* AreaTrigger::GetTemplate() const
{
    return _areaTriggerTemplate;
}

uint32 AreaTrigger::GetScriptId() const
{
    if (_guidScriptId != 0)
        return _guidScriptId;

    return GetTemplate()->ScriptId;
}

Unit* AreaTrigger::GetCaster() const
{
    return ObjectAccessor::GetUnit(*this, GetCasterGuid());
}

Unit* AreaTrigger::GetTarget() const
{
    return ObjectAccessor::GetUnit(*this, _targetGuid);
}

Position const& AreaTrigger::GetRollPitchYaw() const
{
    if (GetMiscTemplate())
        return GetMiscTemplate()->RollPitchYaw;

    return Position::Empty;
}

Position const& AreaTrigger::GetTargetRollPitchYaw() const
{
    if (GetMiscTemplate())
        return GetMiscTemplate()->TargetRollPitchYaw;

    return Position::Empty;
}

void AreaTrigger::UpdatePolygonOrientation()
{
    float newOrientation = GetOrientation();

    // No need to recalculate, orientation didn't change
    if (G3D::fuzzyEq(_previousCheckOrientation, newOrientation))
        return;

    _polygonVertices.assign(GetTemplate()->PolygonVertices.begin(), GetTemplate()->PolygonVertices.end());

    float angleSin = std::sin(newOrientation);
    float angleCos = std::cos(newOrientation);

    // This is needed to rotate the vertices, following orientation
    for (Position& vertice : _polygonVertices)
    {
        float x = vertice.GetPositionX() * angleCos - vertice.GetPositionY() * angleSin;
        float y = vertice.GetPositionY() * angleCos + vertice.GetPositionX() * angleSin;
        vertice.Relocate(x, y);
    }

    _previousCheckOrientation = newOrientation;
}

bool AreaTrigger::CheckIsInPolygon2D(Position const* pos) const
{
    float testX = pos->GetPositionX();
    float testY = pos->GetPositionY();

    //this method uses the ray tracing algorithm to determine if the point is in the polygon
    bool locatedInPolygon = false;

    for (std::size_t vertex = 0; vertex < _polygonVertices.size(); ++vertex)
    {
        std::size_t nextVertex;

        //repeat loop for all sets of points
        if (vertex == (_polygonVertices.size() - 1))
        {
            //if i is the last vertex, let j be the first vertex
            nextVertex = 0;
        }
        else
        {
            //for all-else, let j=(i+1)th vertex
            nextVertex = vertex + 1;
        }

        float vertX_i = GetPositionX() + _polygonVertices[vertex].GetPositionX();
        float vertY_i = GetPositionY() + _polygonVertices[vertex].GetPositionY();
        float vertX_j = GetPositionX() + _polygonVertices[nextVertex].GetPositionX();
        float vertY_j = GetPositionY() + _polygonVertices[nextVertex].GetPositionY();

        // following statement checks if testPoint.Y is below Y-coord of i-th vertex
        bool belowLowY = vertY_i > testY;
        // following statement checks if testPoint.Y is below Y-coord of i+1-th vertex
        bool belowHighY = vertY_j > testY;

        /* following statement is true if testPoint.Y satisfies either (only one is possible)
        -->(i).Y < testPoint.Y < (i+1).Y        OR
        -->(i).Y > testPoint.Y > (i+1).Y

        (Note)
        Both of the conditions indicate that a point is located within the edges of the Y-th coordinate
        of the (i)-th and the (i+1)- th vertices of the polygon. If neither of the above
        conditions is satisfied, then it is assured that a semi-infinite horizontal line draw
        to the right from the testpoint will NOT cross the line that connects vertices i and i+1
        of the polygon
        */
        bool withinYsEdges = belowLowY != belowHighY;

        if (withinYsEdges)
        {
            // this is the slope of the line that connects vertices i and i+1 of the polygon
            float slopeOfLine = (vertX_j - vertX_i) / (vertY_j - vertY_i);

            // this looks up the x-coord of a point lying on the above line, given its y-coord
            float pointOnLine = (slopeOfLine* (testY - vertY_i)) + vertX_i;

            //checks to see if x-coord of testPoint is smaller than the point on the line with the same y-coord
            bool isLeftToLine = testX < pointOnLine;

            if (isLeftToLine)
            {
                //this statement changes true to false (and vice-versa)
                locatedInPolygon = !locatedInPolygon;
            }//end if (isLeftToLine)
        }//end if (withinYsEdges
    }

    return locatedInPolygon;
}

void AreaTrigger::UpdateShape()
{
    if (GetTemplate()->IsPolygon())
        UpdatePolygonOrientation();
}

bool UnitFitToActionRequirement(Unit* unit, Unit* caster, AreaTriggerAction const& action)
{
    switch (action.TargetType)
    {
        case AREATRIGGER_ACTION_USER_FRIEND:
        {
            return caster->_IsValidAssistTarget(unit, sSpellMgr->GetSpellInfo(action.Param));
        }
        case AREATRIGGER_ACTION_USER_ENEMY:
        {
            return caster->_IsValidAttackTarget(unit, sSpellMgr->GetSpellInfo(action.Param));
        }
        case AREATRIGGER_ACTION_USER_RAID:
        {
            return caster->IsInRaidWith(unit);
        }
        case AREATRIGGER_ACTION_USER_PARTY:
        {
            return caster->IsInPartyWith(unit);
        }
        case AREATRIGGER_ACTION_USER_CASTER:
        {
            return unit->GetGUID() == caster->GetGUID();
        }
        case AREATRIGGER_ACTION_USER_ANY:
        default:
            break;
    }

    return true;
}

void AreaTrigger::DoActions(Unit* unit)
{
    if (Unit* caster = GetCaster())
    {
        for (AreaTriggerAction const& action : GetTemplate()->Actions)
        {
            if (UnitFitToActionRequirement(unit, caster, action))
            {
                switch (action.ActionType)
                {
                    case AREATRIGGER_ACTION_CAST:
                        caster->CastSpell(unit, action.Param, true);
                        break;
                    case AREATRIGGER_ACTION_ADDAURA:
                        caster->AddAura(action.Param, unit);
                        break;
                    default:
                        break;
                }
            }
        }
    }
}

void AreaTrigger::UndoActions(Unit* unit)
{
    for (AreaTriggerAction const& action : GetTemplate()->Actions)
        if (action.ActionType == AREATRIGGER_ACTION_CAST || action.ActionType == AREATRIGGER_ACTION_ADDAURA)
            unit->RemoveAurasDueToSpell(action.Param, GetCasterGuid());
}

void AreaTrigger::InitSplineOffsets(std::vector<Position> const& offsets, uint32 timeToTarget)
{
    float angleSin = std::sin(GetOrientation());
    float angleCos = std::cos(GetOrientation());

    // This is needed to rotate the spline, following caster orientation
    std::vector<G3D::Vector3> rotatedPoints;
    rotatedPoints.reserve(offsets.size());
    for (Position const& offset : offsets)
    {
        float x = GetPositionX() + (offset.GetPositionX() * angleCos - offset.GetPositionY() * angleSin);
        float y = GetPositionY() + (offset.GetPositionY() * angleCos + offset.GetPositionX() * angleSin);
        float z = GetPositionZ();

        UpdateAllowedPositionZ(x, y, z);
        z += offset.GetPositionZ();

        rotatedPoints.emplace_back(x, y, z);
    }

    InitSplines(std::move(rotatedPoints), timeToTarget);
}

void AreaTrigger::InitSplines(std::vector<G3D::Vector3> splinePoints, uint32 timeToTarget)
{
    if (splinePoints.size() < 2)
        return;

    _movementTime = 0;

    _spline = std::make_unique<::Movement::Spline<int32>>();
    _spline->init_spline(&splinePoints[0], splinePoints.size(), ::Movement::SplineBase::ModeCatmullrom);
    _spline->initLengths();

    // should be sent in object create packets only
    SetUpdateFieldValue(m_values.ModifyValue(&AreaTrigger::m_areaTriggerData).ModifyValue(&UF::AreaTriggerData::TimeToTarget), timeToTarget);
    const_cast<UF::AreaTriggerData&>(*m_areaTriggerData).ClearChanged(&UF::AreaTriggerData::TimeToTarget);

    if (IsInWorld())
    {
        if (_reachedDestination)
        {
            WorldPackets::AreaTrigger::AreaTriggerRePath reshape;
            reshape.TriggerGUID = GetGUID();
            SendMessageToSet(reshape.Write(), true);
        }

        WorldPackets::AreaTrigger::AreaTriggerRePath reshape;
        reshape.TriggerGUID = GetGUID();
        reshape.AreaTriggerSpline = boost::in_place();
        reshape.AreaTriggerSpline->ElapsedTimeForMovement = GetElapsedTimeForMovement();
        reshape.AreaTriggerSpline->TimeToTarget = timeToTarget;
        for (auto point : _spline->getPoints())
            reshape.AreaTriggerSpline->Points.emplace_back(point.x, point.y, point.z);

        SendMessageToSet(reshape.Write(), true);
    }

    _reachedDestination = false;
}

bool AreaTrigger::HasSplines() const
{
    return bool(_spline);
}

void AreaTrigger::UpdateTimeToTarget(uint32 timeToTarget)
{
    if (!HasSplines())
        return;

    float currentTimePercent = GetCurrentTimePercent();
    int lastPositionIndex = 0;
    float percentFromLastPoint = 0;

    _spline->computeIndex(currentTimePercent, lastPositionIndex, percentFromLastPoint);

    std::vector<G3D::Vector3> newPoints;
    newPoints.push_back(G3D::Vector3(GetPositionX(), GetPositionY(), GetPositionZ()));
    newPoints.push_back(newPoints[0]);

    for (int i = lastPositionIndex + 1; i < _spline->getPointCount(); ++i)
        newPoints.push_back(_spline->getPoint(i));

    InitSplines(newPoints, timeToTarget);
}

bool AreaTrigger::SetDestination(Position const& pos, uint32 timeToTarget)
{
    PathGenerator path(GetCaster());
    bool result = path.CalculatePath(GetPosition(), pos, true);

    if (!result || path.GetPathType() & PATHFIND_NOPATH)
        return false;

    InitSplines(path.GetPath(), timeToTarget);
    return true;
}

void AreaTrigger::InitOrbit(AreaTriggerOrbitInfo const& cmi, uint32 timeToTarget)
{
    // Circular movement requires either a center position or an attached unit
    ASSERT(cmi.Center.is_initialized() || cmi.PathTarget.is_initialized());

    // should be sent in object create packets only
    SetUpdateFieldValue(m_values.ModifyValue(&AreaTrigger::m_areaTriggerData).ModifyValue(&UF::AreaTriggerData::TimeToTarget), timeToTarget);
    const_cast<UF::AreaTriggerData&>(*m_areaTriggerData).ClearChanged(&UF::AreaTriggerData::TimeToTarget);

    _orbitInfo = cmi;

    _orbitInfo->TimeToTarget = timeToTarget;
    _orbitInfo->ElapsedTimeForMovement = 0;

    if (IsInWorld())
    {
        WorldPackets::AreaTrigger::AreaTriggerRePath reshape;
        reshape.TriggerGUID = GetGUID();
        reshape.AreaTriggerOrbit = _orbitInfo;

        SendMessageToSet(reshape.Write(), true);
    }
}

bool AreaTrigger::HasOrbit() const
{
    return _orbitInfo.is_initialized();
}

Position const* AreaTrigger::GetOrbitCenterPosition() const
{
    if (!_orbitInfo.is_initialized())
        return nullptr;

    if (_orbitInfo->PathTarget.is_initialized())
        if (WorldObject* center = ObjectAccessor::GetWorldObject(*this, *_orbitInfo->PathTarget))
            return center;

    if (_orbitInfo->Center.is_initialized())
        return &_orbitInfo->Center->Pos;

    return nullptr;
}

Position AreaTrigger::CalculateOrbitPosition() const
{
    Position const* centerPos = GetOrbitCenterPosition();
    if (!centerPos)
        return GetPosition();

    AreaTriggerOrbitInfo const& cmi = *_orbitInfo;

    // AreaTrigger make exactly "Duration / TimeToTarget" loops during his life time
    float pathProgress = float(cmi.ElapsedTimeForMovement) / float(cmi.TimeToTarget);

    // We already made one circle and can't loop
    if (!cmi.CanLoop)
        pathProgress = std::min(1.f, pathProgress);

    float radius = cmi.Radius;
    if (G3D::fuzzyNe(cmi.BlendFromRadius, radius))
    {
        float blendCurve = (cmi.BlendFromRadius - radius) / radius;
        // 4.f Defines four quarters
        blendCurve = RoundToInterval(blendCurve, 1.f, 4.f) / 4.f;
        float blendProgress = std::min(1.f, pathProgress / blendCurve);
        radius = G3D::lerp(cmi.BlendFromRadius, cmi.Radius, blendProgress);
    }

    // Adapt Path progress depending of circle direction
    if (!cmi.CounterClockwise)
        pathProgress *= -1;

    float angle = cmi.InitialAngle + 2.f * float(M_PI) * pathProgress;
    float x = centerPos->GetPositionX() + (radius * std::cos(angle));
    float y = centerPos->GetPositionY() + (radius * std::sin(angle));
    float z = centerPos->GetPositionZ() + cmi.ZOffset;

    return { x, y, z, angle };
}

void AreaTrigger::UpdateOrbitPosition(uint32 /*diff*/)
{
    if (_orbitInfo->StartDelay > GetElapsedTimeForMovement())
        return;

    _orbitInfo->ElapsedTimeForMovement = GetElapsedTimeForMovement() - _orbitInfo->StartDelay;

    Position pos = CalculateOrbitPosition();

    GetMap()->AreaTriggerRelocation(this, pos.GetPositionX(), pos.GetPositionY(), pos.GetPositionZ(), pos.GetOrientation());
#ifdef TRINITY_DEBUG
    DebugVisualizePosition();
#endif
}

void AreaTrigger::UpdateSplinePosition(uint32 diff)
{
    if (_reachedDestination)
        return;

    if (!HasSplines())
        return;

    _movementTime += diff;

    if (_movementTime >= GetTimeToTarget())
    {
        _reachedDestination = true;
        _lastSplineIndex = int32(_spline->last());

        G3D::Vector3 lastSplinePosition = _spline->getPoint(_lastSplineIndex);
        GetMap()->AreaTriggerRelocation(this, lastSplinePosition.x, lastSplinePosition.y, lastSplinePosition.z, GetOrientation());
#ifdef TRINITY_DEBUG
        DebugVisualizePosition();
#endif

        _ai->OnSplineIndexReached(_lastSplineIndex);
        _ai->OnDestinationReached();
        return;
    }

    float currentTimePercent = GetCurrentTimePercent();

    int lastPositionIndex = 0;
    float percentFromLastPoint = 0;

    if (currentTimePercent > 0.0f)
        _spline->computeIndex(currentTimePercent, lastPositionIndex, percentFromLastPoint);

    G3D::Vector3 currentPosition;
    _spline->evaluate_percent(lastPositionIndex, percentFromLastPoint, currentPosition);

    float orientation = GetOrientation();
    if (GetTemplate()->HasFlag(AREATRIGGER_FLAG_HAS_FACE_MOVEMENT_DIR))
    {
        G3D::Vector3 const& nextPoint = _spline->getPoint(lastPositionIndex + 1);
        orientation = GetAngle(nextPoint.x, nextPoint.y);
    }

    GetMap()->AreaTriggerRelocation(this, currentPosition.x, currentPosition.y, currentPosition.z, orientation);
#ifdef TRINITY_DEBUG
    DebugVisualizePosition();
#endif

    if (_lastSplineIndex != lastPositionIndex)
    {
        _lastSplineIndex = lastPositionIndex;
        _ai->OnSplineIndexReached(_lastSplineIndex);
    }
}

float AreaTrigger::GetCurrentTimePercent()
{
    float currentTimePercent = float(_movementTime) / float(GetTimeToTarget());

    if (currentTimePercent <= 0.f)
        return 0.0f;

    if (GetMiscTemplate() && GetMiscTemplate()->MoveCurveId)
    {
        float progress = sDB2Manager.GetCurveValueAt(GetMiscTemplate()->MoveCurveId, currentTimePercent);
        if (progress < 0.f || progress > 1.f)
        {
            TC_LOG_ERROR("entities.areatrigger", "AreaTrigger (Id: %u, SpellMiscId: %u) has wrong progress (%f) caused by curve calculation (MoveCurveId: %u)",
                GetTemplate()->Id, GetMiscTemplate()->MiscId, progress, GetMiscTemplate()->MorphCurveId);
        }
        else
            currentTimePercent = progress;
    }

    // currentTimePercent must be between 0.f and 1.f
    return std::max(0.f, std::min(currentTimePercent, 1.f));
}

void AreaTrigger::DebugVisualizePosition()
{
    if (Unit* caster = GetCaster())
        if (Player* player = caster->ToPlayer())
            if (player->isDebugAreaTriggers)
                player->SummonCreature(1, *this, TEMPSUMMON_TIMED_DESPAWN, GetTimeToTarget());
}

void AreaTrigger::AI_Initialize()
{
    AI_Destroy();
    AreaTriggerAI* ai = sScriptMgr->GetAreaTriggerAI(this);
    if (!ai)
        ai = new NullAreaTriggerAI(this);

    _ai.reset(ai);
    _ai->OnInitialize();
}

void AreaTrigger::AI_Destroy()
{
    _ai.reset();
}

void AreaTrigger::BuildValuesCreate(ByteBuffer* data, Player const* target) const
{
    UF::UpdateFieldFlag flags = GetUpdateFieldFlagsFor(target);
    std::size_t sizePos = data->wpos();
    *data << uint32(0);
    *data << uint8(flags);
    m_objectData->WriteCreate(*data, flags, this, target);
    m_areaTriggerData->WriteCreate(*data, flags, this, target);
    data->put<uint32>(sizePos, data->wpos() - sizePos - 4);
}

void AreaTrigger::BuildValuesUpdate(ByteBuffer* data, Player const* target) const
{
    UF::UpdateFieldFlag flags = GetUpdateFieldFlagsFor(target);
    std::size_t sizePos = data->wpos();
    *data << uint32(0);
    *data << uint32(m_values.GetChangedObjectTypeMask());

    if (m_values.HasChanged(TYPEID_OBJECT))
        m_objectData->WriteUpdate(*data, flags, this, target);

    if (m_values.HasChanged(TYPEID_AREATRIGGER))
        m_areaTriggerData->WriteUpdate(*data, flags, this, target);

    data->put<uint32>(sizePos, data->wpos() - sizePos - 4);
}

void AreaTrigger::BuildValuesUpdateForPlayerWithMask(UpdateData* data, UF::ObjectData::Mask const& requestedObjectMask,
    UF::AreaTriggerData::Mask const& requestedAreaTriggerMask, Player const* target) const
{
    UpdateMask<NUM_CLIENT_OBJECT_TYPES> valuesMask;
    if (requestedObjectMask.IsAnySet())
        valuesMask.Set(TYPEID_OBJECT);

    if (requestedAreaTriggerMask.IsAnySet())
        valuesMask.Set(TYPEID_AREATRIGGER);

    ByteBuffer buffer = PrepareValuesUpdateBuffer();
    std::size_t sizePos = buffer.wpos();
    buffer << uint32(0);
    buffer << uint32(valuesMask.GetBlock(0));

    if (valuesMask[TYPEID_OBJECT])
        m_objectData->WriteUpdate(buffer, requestedObjectMask, true, this, target);

    if (valuesMask[TYPEID_AREATRIGGER])
        m_areaTriggerData->WriteUpdate(buffer, requestedAreaTriggerMask, true, this, target);

    buffer.put<uint32>(sizePos, buffer.wpos() - sizePos - 4);

    data->AddUpdateBlock(buffer);
}

void AreaTrigger::ClearUpdateMask(bool remove)
{
    m_values.ClearChangesMask(&AreaTrigger::m_areaTriggerData);
    Object::ClearUpdateMask(remove);
}
