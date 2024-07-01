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

#include "WorldSession.h"
#include "AzeriteItem.h"
#include "Guild.h"
#include "GuildMgr.h"
#include "InspectPackets.h"
#include "Log.h"
#include "ObjectAccessor.h"
#include "Player.h"
#include "World.h"

void WorldSession::HandleInspectOpcode(WorldPackets::Inspect::Inspect& inspect)
{
    Player* player = ObjectAccessor::GetPlayer(*_player, inspect.Target);
    if (!player)
    {
        TC_LOG_DEBUG("network", "WorldSession::HandleInspectOpcode: Target %s not found.", inspect.Target.ToString().c_str());
        return;
    }

    TC_LOG_DEBUG("network", "WorldSession::HandleInspectOpcode: Target %s.", inspect.Target.ToString().c_str());

    if (GetPlayer()->IsValidAttackTarget(player))
        return;

    WorldPackets::Inspect::InspectResult inspectResult;
    inspectResult.DisplayInfo.Initialize(player);

    if (GetPlayer()->CanBeGameMaster() || sWorld->getIntConfig(CONFIG_TALENTS_INSPECTING) + (GetPlayer()->GetTeamId() == player->GetTeamId()) > 1)
    {
        PlayerTalentMap const* talents = player->GetTalentMap(player->GetActiveTalentGroup());
        for (PlayerTalentMap::value_type const& v : *talents)
            if (v.second != PLAYERSPELL_REMOVED)
                inspectResult.Talents.push_back(v.first);

        PlayerPvpTalentMap const& pvpTalents = player->GetPvpTalentMap(player->GetActiveTalentGroup());
        for (std::size_t i = 0; i < pvpTalents.size(); ++i)
            inspectResult.PvpTalents[i] = pvpTalents[i];
    }

    if (Guild* guild = sGuildMgr->GetGuildById(player->GetGuildId()))
    {
        inspectResult.GuildData = boost::in_place();
        inspectResult.GuildData->GuildGUID = guild->GetGUID();
        inspectResult.GuildData->NumGuildMembers = guild->GetMembersCount();
        inspectResult.GuildData->AchievementPoints = guild->GetAchievementMgr().GetAchievementPoints();
    }

    if (Item const* heartOfAzeroth = player->GetItemByEntry(ITEM_ID_HEART_OF_AZEROTH, ITEM_SEARCH_EVERYWHERE))
        if (AzeriteItem const* azeriteItem = heartOfAzeroth->ToAzeriteItem())
            inspectResult.AzeriteLevel = azeriteItem->GetEffectiveLevel();

    inspectResult.ItemLevel = int32(player->GetAverageItemLevelEquipped());
    inspectResult.LifetimeMaxRank = player->m_activePlayerData->LifetimeMaxRank;
    inspectResult.TodayHK = player->m_activePlayerData->TodayHonorableKills;
    inspectResult.YesterdayHK = player->m_activePlayerData->YesterdayHonorableKills;
    inspectResult.LifetimeHK = player->m_activePlayerData->LifetimeHonorableKills;
    inspectResult.HonorLevel = player->m_playerData->HonorLevel;

    SendPacket(inspectResult.Write());
}


/*void WorldSession::HandleRequestHonorStatsOpcode(WorldPackets::Inspect::RequestHonorStats& request)
{
    Player* player = ObjectAccessor::FindPlayer(request.TargetGUID);
    if (!player)
    {
        TC_LOG_DEBUG("network", "WorldSession::HandleRequestHonorStatsOpcode: Target %s not found.", request.TargetGUID.ToString().c_str());
        return;
    }

    TC_LOG_DEBUG("network", "WorldSession::HandleRequestHonorStatsOpcode: Target %s.", request.TargetGUID.ToString().c_str());

    if (GetPlayer()->IsValidAttackTarget(player))
        return;

    WorldPackets::Inspect::InspectHonorStats honorStats;
    honorStats.PlayerGUID  = request.TargetGUID;
    honorStats.LifetimeHK  = player->GetUInt32Value(ACTIVE_PLAYER_FIELD_LIFETIME_HONORABLE_KILLS);
    honorStats.YesterdayHK = player->GetUInt16Value(ACTIVE_PLAYER_FIELD_KILLS, PLAYER_FIELD_KILLS_OFFSET_YESTERDAY_KILLS);
    honorStats.TodayHK     = player->GetUInt16Value(ACTIVE_PLAYER_FIELD_KILLS, PLAYER_FIELD_KILLS_OFFSET_TODAY_KILLS);
    honorStats.LifetimeMaxRank = 0; /// @todo

    SendPacket(honorStats.Write());
}

void WorldSession::HandleInspectPVP(WorldPackets::Inspect::InspectPVPRequest& request)
{
    /// @todo: deal with request.InspectRealmAddress

    Player* player = ObjectAccessor::FindPlayer(request.InspectTarget);
    if (!player)
    {
        TC_LOG_DEBUG("network", "WorldSession::HandleInspectPVP: Target %s not found.", request.InspectTarget.ToString().c_str());
        return;
    }

    TC_LOG_DEBUG("network", "WorldSession::HandleInspectPVP: Target %s, InspectRealmAddress %u.", request.InspectTarget.ToString().c_str(), request.InspectRealmAddress);

    if (GetPlayer()->IsValidAttackTarget(player))
        return;

    WorldPackets::Inspect::InspectPVPResponse response;
    response.ClientGUID = request.InspectTarget;
    /// @todo: fill brackets

    SendPacket(response.Write());
}*/

void WorldSession::HandleQueryInspectAchievements(WorldPackets::Inspect::QueryInspectAchievements& inspect)
{
    Player* player = ObjectAccessor::GetPlayer(*_player, inspect.Guid);
    if (!player)
    {
        TC_LOG_DEBUG("network", "WorldSession::HandleQueryInspectAchievements: [%s] inspected unknown Player [%s]", GetPlayer()->GetGUID().ToString().c_str(), inspect.Guid.ToString().c_str());
        return;
    }

    TC_LOG_DEBUG("network", "WorldSession::HandleQueryInspectAchievements: [%s] inspected Player [%s]", GetPlayer()->GetGUID().ToString().c_str(), inspect.Guid.ToString().c_str());

    if (!GetPlayer()->IsWithinDistInMap(player, INSPECT_DISTANCE, false))
        return;

    if (GetPlayer()->IsValidAttackTarget(player))
        return;

    player->SendRespondInspectAchievements(GetPlayer());
}
