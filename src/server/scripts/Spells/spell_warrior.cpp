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

/*
 * Scripts for spells with SPELLFAMILY_WARRIOR and SPELLFAMILY_GENERIC spells used by warrior players.
 * Ordered alphabetically using scriptname.
 * Scriptnames of files in this file should be prefixed with "spell_warr_".
 */

#include "AreaTrigger.h"
#include "AreaTriggerAI.h"
#include "AreaTriggerTemplate.h"
#include "Creature.h"
#include "Item.h"
#include "Map.h"
#include "MotionMaster.h"
#include "MoveSpline.h"
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "PathGenerator.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "Spell.h"
#include "SpellAuraEffects.h"
#include "SpellHistory.h"
#include "SpellMgr.h"
#include "SpellPackets.h"
#include "SpellScript.h"
#include "Unit.h"

enum WarriorSpells
{
    SPELL_WARRIOR_ALLOW_RAGING_BLOW                 = 131116,
    SPELL_WARRIOR_ANGER_MANAGEMENT                  = 152278,
    SPELL_WARRIOR_BERZERKER_RAGE_EFFECT             = 23691,
    SPELL_WARRIOR_BLADESTORM_PERIODIC_WHIRLWIND     = 50622,
    SPELL_WARRIOR_BLOODTHIRST                       = 23885,
    SPELL_WARRIOR_BLOODTHIRST_DAMAGE                = 23881,
    SPELL_WARRIOR_BLOODTHIRST_HEAL                  = 117313,
    SPELL_WARRIOR_BLOOD_AND_THUNDER                 = 84615,
    SPELL_WARRIOR_BOUNDING_STRIDE                   = 202163,
    SPELL_WARRIOR_BOUNDING_STRIDE_SPEED             = 202164,
    SPELL_WARRIOR_CHARGE                            = 34846,
    SPELL_WARRIOR_CHARGE_EFFECT                     = 218104,
    SPELL_WARRIOR_CHARGE_EFFECT_BLAZING_TRAIL       = 198337,
    SPELL_WARRIOR_CHARGE_PAUSE_RAGE_DECAY           = 109128,
    SPELL_WARRIOR_CHARGE_ROOT_EFFECT                = 105771,
    SPELL_WARRIOR_CHARGE_SLOW_EFFECT                = 236027,
    SPELL_WARRIOR_COLOSSUS_SMASH                    = 167105,
    SPELL_WARRIOR_COLOSSUS_SMASH_BUFF               = 208086,
    SPELL_WARRIOR_DEEP_WOUNDS                       = 115767,
    SPELL_WARRIOR_DEEP_WOUNDS_PERIODIC              = 12721,
    SPELL_WARRIOR_DEEP_WOUNDS_RANK_1                = 12162,
    SPELL_WARRIOR_DEEP_WOUNDS_RANK_2                = 12850,
    SPELL_WARRIOR_DEEP_WOUNDS_RANK_3                = 12868,
    SPELL_WARRIOR_DEEP_WOUNDS_RANK_PERIODIC         = 12721,
    SPELL_WARRIOR_DEVASTATE                         = 20243,
    SPELL_WARRIOR_DOUBLE_TIME                       = 103827,
    SPELL_WARRIOR_DRAGON_ROAR_KNOCK_BACK            = 118895,
    SPELL_WARRIOR_ENRAGE                            = 184361,
    SPELL_WARRIOR_ENRAGE_AURA                       = 184362,
	SPELL_WARRIOR_EXECUTE_FURY                      = 5308,
    SPELL_WARRIOR_EXECUTE                           = 163201,
    SPELL_WARRIOR_EXECUTE_PVP                       = 217955,
    SPELL_WARRIOR_FOCUSED_RAGE_ARMS                 = 207982,
    SPELL_WARRIOR_FOCUSED_RAGE_PROTECTION           = 204488,
    SPELL_WARRIOR_FROTHING_BERSERKER                = 215572,
    SPELL_WARRIOR_FURIOUS_SLASH                     = 100130,
    SPELL_WARRIOR_GLYPH_OF_THE_BLAZING_TRAIL        = 123779,
    SPELL_WARRIOR_GLYPH_OF_EXECUTION                = 58367,
    SPELL_WARRIOR_GLYPH_OF_HEROIC_LEAP              = 159708,
    SPELL_WARRIOR_GLYPH_OF_HEROIC_LEAP_BUFF         = 133278,
    SPELL_WARRIOR_GLYPH_OF_HINDERING_STRIKES        = 58366,
    SPELL_WARRIOR_GLYPH_OF_MORTAL_STRIKE            = 58368,
    SPELL_WARRIOR_HEAVY_REPERCUSSIONS               = 203177,
    SPELL_WARRIOR_HEROIC_LEAP_DAMAGE                = 52174,
    SPELL_WARRIOR_HEROIC_LEAP_JUMP                  = 94954,
    SPELL_WARRIOR_HEROIC_LEAP_SPEED                 = 133278,
    SPELL_WARRIOR_IGNORE_PAIN                       = 190456,
    SPELL_WARRIOR_IMPENDING_VICTORY                 = 202168,
    SPELL_WARRIOR_IMPROVED_HEROIC_LEAP              = 157449,
    SPELL_WARRIOR_INTERCEPT_STUN                    = 105771,
    SPELL_WARRIOR_INTERVENE_TRIGGER                 = 147833,
    SPELL_WARRIOR_ITEM_PVP_SET_4P_BONUS             = 133277,
    SPELL_WARRIOR_JUGGERNAUT_CRIT_BONUS_BUFF        = 65156,
    SPELL_WARRIOR_JUGGERNAUT_CRIT_BONUS_TALENT      = 64976,
    SPELL_WARRIOR_JUMP_TO_SKYHOLD_AURA              = 215997,
    SPELL_WARRIOR_JUMP_TO_SKYHOLD_JUMP              = 192085,
    SPELL_WARRIOR_JUMP_TO_SKYHOLD_TELEPORT          = 216016,
    SPELL_WARRIOR_LAST_STAND                        = 12975,
    SPELL_WARRIOR_LAST_STAND_TRIGGERED              = 12976,
    SPELL_WARRIOR_MASSACRE                          = 206315,
    SPELL_WARRIOR_WHIRLWIND_PASSIVE                 = 85739,
    SPELL_WARRIOR_MOCKING_BANNER_TAUNT              = 114198,
    SPELL_WARRIOR_MORTAL_STRIKE                     = 12294,
    SPELL_WARRIOR_MORTAL_STRIKE_AURA                = 12294,
    SPELL_WARRIOR_MORTAL_WOUNDS                     = 213667,
    SPELL_WARRIOR_NEW_BLADESTORM                    = 222634,
    SPELL_WARRIOR_OLD_BLADESTORM                    = 227847,
    SPELL_WARRIOR_OPPORTUNITY_STRIKE_DAMAGE         = 76858,
    SPELL_WARRIOR_OVERPOWER_PROC                    = 60503,
    SPELL_WARRIOR_RALLYING_CRY                      = 97462,
    SPELL_WARRIOR_RALLYING_CRY_TRIGGER              = 97462,
    SPELL_WARRIOR_RAMPAGE                           = 184367,
    SPELL_WARRIOR_RAVAGER                           = 152277,
    SPELL_WARRIOR_RAVAGER_DAMAGE                    = 156287,
    SPELL_WARRIOR_RAVAGER_ENERGIZE                  = 248439,
    SPELL_WARRIOR_RAVAGER_PARRY                     = 227744,
    SPELL_WARRIOR_RAVAGER_SUMMON                    = 227876,
    SPELL_WARRIOR_REND                              = 94009,
    SPELL_WARRIOR_RENEWED_FURY                      = 202288,
    SPELL_WARRIOR_RENEWED_FURY_EFFECT               = 202289,
    SPELL_WARRIOR_RETALIATION_DAMAGE                = 22858,
    SPELL_WARRIOR_SEASONED_SOLDIER                  = 279423,
    SPELL_WARRIOR_SECOND_WIND_DAMAGED               = 202149,
    SPELL_WARRIOR_SECOND_WIND_HEAL                  = 202147,
    SPELL_WARRIOR_SHIELD_BLOCKC_TRIGGERED           = 132404,
    SPELL_WARRIOR_SHIELD_SLAM                       = 23922,
    SPELL_WARRIOR_SHOCKWAVE                         = 46968,
    SPELL_WARRIOR_SHOCKWAVE_STUN                    = 132168,
    SPELL_WARRIOR_SLAM                              = 23922,
    SPELL_WARRIOR_SLAM_ARMS                         = 1464,
    SPELL_WARRIOR_SLUGGISH                          = 129923,
    SPELL_WARRIOR_STORM_BOLT_STUN                   = 132169,
    SPELL_WARRIOR_SUNDER_ARMOR                      = 58567,
    SPELL_WARRIOR_SWEEPING_STRIKES_EXTRA_ATTACK     = 26654,
    SPELL_WARRIOR_SWEEPING_STRIKES_EXTRA_ATTACK_1   = 12723,
    SPELL_WARRIOR_SWEEPING_STRIKES_EXTRA_ATTACK_2   = 26654,
    SPELL_WARRIOR_SWORD_AND_BOARD                   = 199127,
    SPELL_WARRIOR_TACTICIAN_CD                      = 184783,
    SPELL_WARRIOR_TASTE_FOR_BLOOD                   = 206333,
    SPELL_WARRIOR_TASTE_FOR_BLOOD_DAMAGE_DONE       = 125831,
    SPELL_WARRIOR_TAUNT                             = 355,
    SPELL_WARRIOR_THUNDERSTRUCK                     = 199045,
    SPELL_WARRIOR_THUNDERSTRUCK_STUN                = 199042,
    SPELL_WARRIOR_THUNDER_CLAP                      = 6343,
    SPELL_WARRIOR_TRAUMA_DOT                        = 215537,
    SPELL_WARRIOR_UNCHACKLED_FURY                   = 76856,
    SPELL_WARRIOR_UNRELENTING_ASSAULT_RANK_1        = 46859,
    SPELL_WARRIOR_UNRELENTING_ASSAULT_RANK_2        = 46860,
    SPELL_WARRIOR_UNRELENTING_ASSAULT_TRIGGER_1     = 64849,
    SPELL_WARRIOR_UNRELENTING_ASSAULT_TRIGGER_2     = 64850,
    SPELL_WARRIOR_VENGEANCE                         = 76691,
    SPELL_WARRIOR_VENGEANCE_AURA                    = 202572,
    SPELL_WARRIOR_VENGEANCE_FOCUSED_RAGE            = 202573,
    SPELL_WARRIOR_VENGEANCE_IGNORE_PAIN             = 202574,
	SPELL_WARRIOR_VICTORIOUS                        = 32216,
    SPELL_WARRIOR_VICTORIOUS_STATE                  = 32215,
    SPELL_WARRIOR_VICTORY_RUSH_DAMAGE               = 34428,
    SPELL_WARRIOR_VICTORY_RUSH_HEAL                 = 118779,
    SPELL_WARRIOR_VIGILANCE_PROC                    = 50725,
    SPELL_WARRIOR_WAR_MACHINE_TALENT_AURA           = 215556,
    SPELL_WARRIOR_WAR_MACHINE_AURA                  = 215566,
    SPELL_WARRIOR_WARBRINGER                        = 103828,
    SPELL_WARRIOR_WARBRINGER_ROOT                   = 105771,
    SPELL_WARRIOR_WARBRINGER_SNARE                  = 137637,
    SPELL_WARRIOR_WEAKENED_BLOWS                    = 115798,
    SPELL_WARRIOR_WHIRLWIND                         = 190411,
    SPELL_WARRIOR_WHIRLWIND_ARMS                    = 1680,
    SPELL_WARRIOR_WHIRLWIND_MAINHAND                = 199667,
    SPELL_WARRIOR_WHIRLWIND_OFFHAND                 = 44949,
    SPELL_WARRIOR_WRECKING_BALL_EFFECT              = 215570,
    SPELL_WARRIOR_COMMANDING_SHOUT                  = 97463,
    SPELL_WARRIOR_GLYPH_OF_MIGHTY_VICTORY           = 58104,
    SPELL_WARRIOR_INTO_THE_FRAY                     = 202602,
    NPC_WARRIOR_RAVAGER                             = 76168,
    SPELL_WARRIOR_COLD_STEEL_HOT_BLOOD_MAIN         = 288080,
    SPELL_WARRIOR_COLD_STEEL_HOT_BLOOD              = 288085,
    SPELL_WARRIOR_COLD_STEEL_HOT_BLOOD_GIVE_POWER   = 288087,
    SPELL_WARRIOR_GUSHING_WOUND                     = 288091,
    // 8.0
    SPELL_WARRIOR_WAR_MACHINE = 262231,
    SPELL_WARRRIOR_WAR_MACHINE_BUFF = 262232,
    SPELL_WARRIOR_FURIOUS_CHARGE = 202224,
    SPELL_WARRIOR_FURIOUS_CHARGE_BUFF = 202225,
    SPELL_WARRIOR_FRESH_MEAT = 215568,
    SPELL_WARRIOR_MEAT_CLEAVER = 280392,
    SPELL_WARRIOR_THIRST_FOR_BATTLE = 199202,
    SPELL_WARRIOR_THIRST_FOR_BATTLE_BUFF = 199203,
    SPELL_WARRIOR_BARBARIAN = 280745,
    SPELL_WARRIOR_BARBARIAN_ALLOW_HEROIC_LEAP = 280746,
    SPELL_WARRIOR_BATTLE_TRANCE = 213857,
    SPELL_WARRIOR_BATTLE_TRANCE_BUFF = 213858,
    SPELL_WARRIOR_ENDLESS_RAGE = 202296,
    SPELL_WARRIOR_ENDLESS_RAGE_GIVE_POWER = 280283,
    SPELL_WARRIOR_SUDDEN_DEATH = 280721,
    SPELL_WARRIOR_SUDDEN_DEATH_PROC = 280776,
    SPELL_WARRIOR_WAR_BANNER_BUFF = 236321,
};

enum WarriorSpellIcons
{
    WARRIOR_ICON_ID_SUDDEN_DEATH                    = 1989
};

enum MiscSpells
{
    SPELL_VISUAL_BLAZING_CHARGE                     = 26423,
};

// 97462 Commanding Shout 7.3.5
class spell_warr_commanding_shout : public SpellScript
{
    PrepareSpellScript(spell_warr_commanding_shout);

    void HandleScript(SpellEffIndex /*effIndex*/)
    {
        if (Unit* target = GetHitUnit())
            GetCaster()->CastSpell(target, SPELL_WARRIOR_COMMANDING_SHOUT, true);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_warr_commanding_shout::HandleScript, EFFECT_0, SPELL_EFFECT_DUMMY);
    }
};

// Jump to Skyhold Jump - 192085
class spell_warr_jump_to_skyhold : public SpellScriptLoader
{
public:
    spell_warr_jump_to_skyhold() : SpellScriptLoader("spell_warr_jump_to_skyhold") {}

    class spell_warr_jump_to_skyhold_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_jump_to_skyhold_SpellScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_WARRIOR_JUMP_TO_SKYHOLD_TELEPORT))
                return false;
            return true;
        }

        void HandleJump(SpellEffIndex effIndex)
        {
            PreventHitDefaultEffect(effIndex);

            if (Unit* caster = GetCaster())
            {
                float pos_x = caster->GetPositionX();
                float pos_y = caster->GetPositionY();
                float pos_z = caster->GetPositionZ() + 30.0f;

                JumpArrivalCastArgs arrivalCast;
                arrivalCast.SpellId = SPELL_WARRIOR_JUMP_TO_SKYHOLD_TELEPORT;
                arrivalCast.Target = caster->GetGUID();
                caster->GetMotionMaster()->MoveJump(pos_x, pos_y, pos_z, caster->GetOrientation(), 20.f, 20.f, EVENT_JUMP, false, &arrivalCast);

                caster->RemoveAurasDueToSpell(SPELL_WARRIOR_JUMP_TO_SKYHOLD_AURA);
            }
        }

        void Register() override
        {
            OnEffectLaunch += SpellEffectFn(spell_warr_jump_to_skyhold_SpellScript::HandleJump, EFFECT_0, SPELL_EFFECT_JUMP_DEST);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_jump_to_skyhold_SpellScript();
    }
};


// Rampage damage dealers - 218617, 184707, 184709, 201364, 201363
class spell_warr_rampage : public SpellScript
{
    PrepareSpellScript(spell_warr_rampage);

    void HandleAuras()
    {
        Unit* caster = GetCaster();
        if (!caster)
            return;
        
        if (Aura* enrage = caster->GetAura(SPELL_WARRIOR_ENRAGE_AURA))
            enrage->RefreshDuration();
        else
            caster->CastSpell(caster, SPELL_WARRIOR_ENRAGE_AURA, true);
    }

    void HandleOnHit()
    {
        Unit* caster = GetCaster();
        Unit* target = GetHitUnit();
        if (!caster || !target)
            return;

        if (target != ObjectAccessor::GetUnit(*caster, caster->GetTarget()))
            SetHitDamage(GetHitDamage() / 2);

        if (caster == target)
            SetHitDamage(0);
    }

    void Register() override
    {
        OnCast += SpellCastFn(spell_warr_rampage::HandleAuras);
        OnHit += SpellHitFn(spell_warr_rampage::HandleOnHit);
    }
};

// Whirlwind - 190411
class spell_warr_whirlwind : public SpellScript
{
    PrepareSpellScript(spell_warr_whirlwind);

    void HandleAfterCast()
    {
        Unit* caster = GetCaster();

        if (!caster)
            return;

        if (caster->HasAura(SPELL_WARRIOR_WRECKING_BALL_EFFECT))
            caster->RemoveAura(SPELL_WARRIOR_WRECKING_BALL_EFFECT);

        if (caster->HasAura(SPELL_WARRIOR_MEAT_CLEAVER))
            if (roll_chance_f(10))
                caster->CastSpell(nullptr, SPELL_WARRIOR_ENRAGE_AURA, true);

        if (caster->HasAura(SPELL_WARRIOR_THIRST_FOR_BATTLE))
        {
            caster->AddAura(SPELL_WARRIOR_THIRST_FOR_BATTLE_BUFF);
            if (AuraEffect* thirst = caster->GetAura(SPELL_WARRIOR_THIRST_FOR_BATTLE_BUFF)->GetEffect(0))
                thirst->GetAmount();
        }

        caster->AddAura(85739);
    }

    void Register() override
    {        
        AfterCast += SpellCastFn(spell_warr_whirlwind::HandleAfterCast);
    }
};

// Meat Cleaver - 12950
class spell_warr_meat_cleaver : public SpellScriptLoader
{
public:
    spell_warr_meat_cleaver() : SpellScriptLoader("spell_warr_meat_cleaver") {}

    class spell_warr_meat_cleaver_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_meat_cleaver_AuraScript);

        bool CheckProc(ProcEventInfo& /*eventInfo*/)
        {
            return false;
        }

        void Register() override
        {
            DoCheckProc += AuraCheckProcFn(spell_warr_meat_cleaver_AuraScript::CheckProc);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_meat_cleaver_AuraScript();
    }
};

// Enrage - 184361
class spell_warr_enrage : public SpellScriptLoader
{
public:
    spell_warr_enrage() : SpellScriptLoader("spell_warr_enrage") {}

    class spell_warr_enrage_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_enrage_AuraScript);

        bool CheckProc(ProcEventInfo& eventInfo)
        {
            if (eventInfo.GetSpellInfo()->Id == SPELL_WARRIOR_BLOODTHIRST_DAMAGE &&
                eventInfo.GetHitMask() & PROC_HIT_CRITICAL)
                return true;
            return false;
        }

        void Register() override
        {
            DoCheckProc += AuraCheckProcFn(spell_warr_enrage_AuraScript::CheckProc);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_enrage_AuraScript();
    }
};

// Taste for Blood - 206333
class spell_warr_taste_for_blood : public SpellScriptLoader
{
public:
    spell_warr_taste_for_blood() : SpellScriptLoader("spell_warr_taste_for_blood") {}

    class spell_warr_taste_for_blood_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_taste_for_blood_AuraScript);

        bool CheckProc(ProcEventInfo& eventInfo)
        {
            if ((eventInfo.GetHitMask() & PROC_HIT_CRITICAL) &&
                eventInfo.GetSpellInfo()->Id == SPELL_WARRIOR_BLOODTHIRST_DAMAGE)
            {
                GetAura()->SetDuration(0);
                return true;
            }
            return false;
        }

        void Register() override
        {
            DoCheckProc += AuraCheckProcFn(spell_warr_taste_for_blood_AuraScript::CheckProc);
            //OnProc += AuraProcFn(spell_warr_taste_for_blood_AuraScript::HandleProc);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_taste_for_blood_AuraScript();
    }
};

// Enrage Aura - 184362
class spell_warr_enrage_aura : public AuraScript
{
    PrepareAuraScript(spell_warr_enrage_aura);

    void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        if (Unit* caster = GetCaster())
            if (caster->HasAura(SPELL_WARRIOR_ENDLESS_RAGE))
                caster->CastSpell(nullptr, SPELL_WARRIOR_ENDLESS_RAGE_GIVE_POWER, true);
    }

    void HandleRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        Unit* caster = GetCaster();
        caster->RemoveAurasDueToSpell(SPELL_WARRIOR_UNCHACKLED_FURY);
    }

    void Register() override
    {
        OnEffectApply += AuraEffectApplyFn(spell_warr_enrage_aura::OnApply, EFFECT_0, SPELL_AURA_MELEE_SLOW, AURA_EFFECT_HANDLE_REAL);
        OnEffectRemove += AuraEffectRemoveFn(spell_warr_enrage_aura::HandleRemove, EFFECT_0, SPELL_AURA_MELEE_SLOW, AURA_EFFECT_HANDLE_REAL);
    }
};

// Bloodthirst - 23881
class spell_warr_bloodthirst : public SpellScript
{
    PrepareSpellScript(spell_warr_bloodthirst);

    void HandleHeal()
    {
        Unit* caster = GetCaster();
        if (!caster)
            return;

        caster->CastSpell(caster, SPELL_WARRIOR_BLOODTHIRST_HEAL, true);
    }

    void HandleOnHit()
    {
        Unit* caster = GetCaster();
        Unit* target = GetHitUnit();
        if (!caster || !target)
            return;

        if (target != ObjectAccessor::GetUnit(*caster, caster->GetTarget()))
            SetHitDamage(GetHitDamage() / 2);

        if (caster->HasAura(SPELL_WARRIOR_FRESH_MEAT))
            if (roll_chance_f(15))
                caster->CastSpell(nullptr, SPELL_WARRIOR_ENRAGE_AURA, true);

        if (caster->HasAura(SPELL_WARRIOR_THIRST_FOR_BATTLE))
        {
            caster->AddAura(SPELL_WARRIOR_THIRST_FOR_BATTLE_BUFF);
            if (AuraEffect* thirst = caster->GetAura(SPELL_WARRIOR_THIRST_FOR_BATTLE_BUFF)->GetEffect(0))
                thirst->GetAmount();
        }
    }

    void Register() override
    {
        OnCast += SpellCastFn(spell_warr_bloodthirst::HandleHeal);
        OnHit += SpellHitFn(spell_warr_bloodthirst::HandleOnHit);
    }
};

// 5246 - Intimidating Shout
class spell_warr_intimidating_shout : public SpellScript
{
    PrepareSpellScript(spell_warr_intimidating_shout);

    void FilterTargets(std::list<WorldObject*>& unitList)
    {
        unitList.remove(GetExplTargetWorldObject());
    }

    void Register() override
    {
        OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_warr_intimidating_shout::FilterTargets, EFFECT_2, TARGET_UNIT_SRC_AREA_ENEMY);
        OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_warr_intimidating_shout::FilterTargets, EFFECT_3, TARGET_UNIT_SRC_AREA_ENEMY);
        OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_warr_intimidating_shout::FilterTargets, EFFECT_5, TARGET_UNIT_SRC_AREA_ENEMY);
    }
};

/// Updated 8.3.7
// 12975 - Last Stand
class spell_warr_last_stand : public SpellScriptLoader
{
public:
    spell_warr_last_stand() : SpellScriptLoader("spell_warr_last_stand") { }

    class spell_warr_last_stand_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_last_stand_SpellScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_WARRIOR_LAST_STAND))
                return false;
            return true;
        }

        void HandleDummy(SpellEffIndex /*effIndex*/)
        {
            Unit* caster = GetCaster();
            int32 healthModSpellBasePoints0 = int32(caster->CountPctFromMaxHealth(GetEffectValue()));
            caster->CastCustomSpell(caster, SPELL_WARRIOR_LAST_STAND, &healthModSpellBasePoints0, nullptr, nullptr, true, nullptr);
        }

        void Register() override
        {
            // add dummy effect spell handler to Last Stand
            OnEffectHit += SpellEffectFn(spell_warr_last_stand_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
            OnEffectHit += SpellEffectFn(spell_warr_last_stand_SpellScript::HandleDummy, EFFECT_1, SPELL_EFFECT_HEAL_PCT);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_last_stand_SpellScript();
    }
};

// 7384 - Overpower
class spell_warr_overpower : public SpellScriptLoader
{
public:
    spell_warr_overpower() : SpellScriptLoader("spell_warr_overpower") { }

    class spell_warr_overpower_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_overpower_SpellScript);

        void HandleEffect(SpellEffIndex /*effIndex*/)
        {
            if (!GetCaster())
                return;

            uint32 spellId = 0;
            if (GetCaster()->HasAura(SPELL_WARRIOR_UNRELENTING_ASSAULT_RANK_1))
                spellId = SPELL_WARRIOR_UNRELENTING_ASSAULT_TRIGGER_1;
            else if (GetCaster()->HasAura(SPELL_WARRIOR_UNRELENTING_ASSAULT_RANK_2))
                spellId = SPELL_WARRIOR_UNRELENTING_ASSAULT_TRIGGER_2;

            if (!spellId)
                return;

            if (Player* target = GetHitPlayer())
                if (target->IsNonMeleeSpellCast(false, false, true)) // UNIT_STATE_CASTING should not be used here, it's present during a tick for instant casts
                    target->CastSpell(target, spellId, true);
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_warr_overpower_SpellScript::HandleEffect, EFFECT_0, SPELL_EFFECT_ANY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_overpower_SpellScript();
    }
};

// 94009 - Rend
class spell_warr_rend : public SpellScriptLoader
{
public:
    spell_warr_rend() : SpellScriptLoader("spell_warr_rend") { }

    class spell_warr_rend_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_rend_AuraScript);

        void CalculateAmount(AuraEffect const* aurEff, int32& amount, bool& canBeRecalculated)
        {
            if (Unit* caster = GetCaster())
            {
                canBeRecalculated = false;

                // $0.25 * (($MWB + $mwb) / 2 + $AP / 14 * $MWS) bonus per tick
                float ap = caster->GetTotalAttackPowerValue(BASE_ATTACK);
                int32 mws = caster->getAttackTimer(BASE_ATTACK);
                float mwbMin = caster->GetWeaponDamageRange(BASE_ATTACK, MINDAMAGE);
                float mwbMax = caster->GetWeaponDamageRange(BASE_ATTACK, MAXDAMAGE);
                float mwb = ((mwbMin + mwbMax) / 2 + ap * mws / 14000) * 0.266f;
                amount += int32(caster->ApplyEffectModifiers(GetSpellInfo(), aurEff->GetEffIndex(), mwb));
            }
        }

        void Register() override
        {
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_warr_rend_AuraScript::CalculateAmount, EFFECT_1, SPELL_AURA_PERIODIC_DAMAGE);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_rend_AuraScript();
    }
};

// 64380, 65941 - Shattering Throw
class spell_warr_shattering_throw : public SpellScriptLoader
{
public:
    spell_warr_shattering_throw() : SpellScriptLoader("spell_warr_shattering_throw") { }

    class spell_warr_shattering_throw_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_shattering_throw_SpellScript);

        void HandleScript(SpellEffIndex effIndex)
        {
            PreventHitDefaultEffect(effIndex);

            // remove shields, will still display immune to damage part
            if (Unit* target = GetHitUnit())
                target->RemoveAurasWithMechanic(1 << MECHANIC_IMMUNE_SHIELD, AURA_REMOVE_BY_ENEMY_SPELL);
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_warr_shattering_throw_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_shattering_throw_SpellScript();
    }
};

//1464
class spell_warr_slam : public SpellScript
{
    PrepareSpellScript(spell_warr_slam);

    void HandleOnHit()
    {
        return;
    }

    void Register() override
    {
        OnHit += SpellHitFn(spell_warr_slam::HandleOnHit);
    }
};

class spell_warr_second_wind_proc : public SpellScriptLoader
{
public:
    spell_warr_second_wind_proc() : SpellScriptLoader("spell_warr_second_wind_proc") { }

    class spell_warr_second_wind_proc_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_second_wind_proc_AuraScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_WARRIOR_SECOND_WIND_DAMAGED) ||
                !sSpellMgr->GetSpellInfo(SPELL_WARRIOR_SECOND_WIND_HEAL))
                return false;
            return true;
        }

        void HandleProc(AuraEffect const* /*aurEff*/, ProcEventInfo& /*eventInfo*/)
        {
            if(!GetCaster())
                return;

            GetCaster()->CastSpell(GetCaster(), SPELL_WARRIOR_SECOND_WIND_DAMAGED, true);
        }

        void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            caster->RemoveAura(SPELL_WARRIOR_SECOND_WIND_DAMAGED);
            caster->RemoveAura(SPELL_WARRIOR_SECOND_WIND_HEAL);
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_warr_second_wind_proc_AuraScript::HandleProc, EFFECT_0, SPELL_AURA_DUMMY);
            OnEffectRemove += AuraEffectRemoveFn(spell_warr_second_wind_proc_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
        }

    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_second_wind_proc_AuraScript();
    }
};

class spell_warr_second_wind_damaged : public SpellScriptLoader
{
public:
    spell_warr_second_wind_damaged() : SpellScriptLoader("spell_warr_second_wind_damaged") { }

    class spell_warr_second_wind_damaged_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_second_wind_damaged_AuraScript);

        void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            /*if(Aura* aura = caster->GetAura(SPELL_WARRIOR_SECOND_WIND_HEAL))
                aura->GetEffect(EFFECT_0)->SetAmount(0);*/
            caster->RemoveAura(SPELL_WARRIOR_SECOND_WIND_HEAL);
        }

        void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            /*if (Aura* aura = caster->GetAura(SPELL_WARRIOR_SECOND_WIND_HEAL))
                aura->GetEffect(EFFECT_0)->SetAmount(sSpellMgr->GetSpellInfo(SPELL_WARRIOR_SECOND_WIND_HEAL)->GetEffect(EFFECT_0)->BasePoints);*/
            caster->CastSpell(caster, SPELL_WARRIOR_SECOND_WIND_HEAL, true);
        }

        void Register() override
        {
            OnEffectApply += AuraEffectApplyFn(spell_warr_second_wind_damaged_AuraScript::OnApply, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL_OR_REAPPLY_MASK);
            OnEffectRemove += AuraEffectRemoveFn(spell_warr_second_wind_damaged_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_second_wind_damaged_AuraScript();
    }
};


// 12328, 18765, 35429 - Sweeping Strikes
class spell_warr_sweeping_strikes : public SpellScriptLoader
{
public:
    spell_warr_sweeping_strikes() : SpellScriptLoader("spell_warr_sweeping_strikes") { }

    class spell_warr_sweeping_strikes_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_sweeping_strikes_AuraScript);

    public:
        spell_warr_sweeping_strikes_AuraScript()
        {
            _procTarget = nullptr;
        }

    private:
        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_WARRIOR_SWEEPING_STRIKES_EXTRA_ATTACK_1) || !sSpellMgr->GetSpellInfo(SPELL_WARRIOR_SWEEPING_STRIKES_EXTRA_ATTACK_2))
                return false;
            return true;
        }

        bool CheckProc(ProcEventInfo& eventInfo)
        {
            _procTarget = eventInfo.GetActor()->SelectNearbyTarget(eventInfo.GetProcTarget());
            return _procTarget != nullptr;
        }

        void HandleProc(AuraEffect const* aurEff, ProcEventInfo& eventInfo)
        {
            PreventDefaultAction();
            if (eventInfo.GetDamageInfo())
            {
                SpellInfo const* spellInfo = eventInfo.GetDamageInfo()->GetSpellInfo();
                if (spellInfo && (spellInfo->Id == SPELL_WARRIOR_BLADESTORM_PERIODIC_WHIRLWIND ||
                    (spellInfo->Id == SPELL_WARRIOR_EXECUTE && !_procTarget->HasAuraState(AURA_STATE_HEALTHLESS_20_PERCENT)) ||
                    (spellInfo->Id == SPELL_WARRIOR_EXECUTE_PVP && !_procTarget->HasAuraState(AURA_STATE_HEALTHLESS_25_PERCENT))))
                {
                    // If triggered by Execute (while target is not under 20% hp) or Bladestorm deals normalized weapon damage
                    GetTarget()->CastSpell(_procTarget, SPELL_WARRIOR_SWEEPING_STRIKES_EXTRA_ATTACK_2, true, nullptr, aurEff);
                }
                else
                {
                    int32 damage = eventInfo.GetDamageInfo()->GetDamage();
                    GetTarget()->CastCustomSpell(SPELL_WARRIOR_SWEEPING_STRIKES_EXTRA_ATTACK_1, SPELLVALUE_BASE_POINT0, damage, _procTarget, true, nullptr, aurEff);
                }
            }
        }

        void Register() override
        {
            DoCheckProc += AuraCheckProcFn(spell_warr_sweeping_strikes_AuraScript::CheckProc);
            OnEffectProc += AuraEffectProcFn(spell_warr_sweeping_strikes_AuraScript::HandleProc, EFFECT_0, SPELL_AURA_DUMMY);
        }

    private:
        Unit* _procTarget;
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_sweeping_strikes_AuraScript();
    }
};

// 32216 - Victorious
// 82368 - Victorious
class spell_warr_victorious : public SpellScriptLoader
{
public:
    spell_warr_victorious() : SpellScriptLoader("spell_warr_victorious") { }

    class spell_warr_victorious_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_victorious_AuraScript);

        void HandleEffectProc(AuraEffect const* /*aurEff*/, ProcEventInfo& /*eventInfo*/)
        {
            PreventDefaultAction();
            GetTarget()->RemoveAura(GetId());
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_warr_victorious_AuraScript::HandleEffectProc, EFFECT_0, SPELL_AURA_ADD_PCT_MODIFIER);
            OnEffectProc += AuraEffectProcFn(spell_warr_victorious_AuraScript::HandleEffectProc, EFFECT_1, SPELL_AURA_ADD_FLAT_MODIFIER);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_victorious_AuraScript();
    }
};

// 97462 - Rallying Cry
class spell_warr_rallying_cry : public SpellScriptLoader
{
public:
    spell_warr_rallying_cry() : SpellScriptLoader("spell_warr_rallying_cry") {}

    class spell_warr_rallying_cry_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_rallying_cry_SpellScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            return sSpellMgr->GetSpellInfo(SPELL_WARRIOR_RALLYING_CRY_TRIGGER) != nullptr;
        }

        void HandleDummy(SpellEffIndex /*effIndex*/)
        {
            Unit* caster = GetCaster();
            Unit* target = GetHitUnit();
            if (!caster || !target)
                return;

            uint32 amount = CalculatePct(caster->GetMaxHealth(), GetEffectValue());
            caster->CastCustomSpell(SPELL_WARRIOR_RALLYING_CRY_TRIGGER, SPELLVALUE_BASE_POINT0, amount, target, true);
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_warr_rallying_cry_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_rallying_cry_SpellScript();
    }
};

// Called by Devastate - 20243

// Intercept (As of Legion) - 198304
class spell_warr_intercept : public SpellScriptLoader
{
public:
    spell_warr_intercept() : SpellScriptLoader("spell_warr_intercept") {}

    class spell_warr_intercept_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_intercept_SpellScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            return sSpellMgr->GetSpellInfo(SPELL_WARRIOR_INTERVENE_TRIGGER) != nullptr;
        }

        void HandleDummy(SpellEffIndex /*effIndex*/)
        {
            Unit* caster = GetCaster();
            Unit* target = GetHitUnit();
            if (!target)
                return;

            if(target->IsFriendlyTo(caster))
                caster->CastSpell(target, SPELL_WARRIOR_INTERVENE_TRIGGER, true);
            else
            {
                caster->CastSpell(target, SPELL_WARRIOR_CHARGE_EFFECT, true);
                if (caster->HasAura(SPELL_WARRIOR_WARBRINGER))
                    caster->CastSpell(target, SPELL_WARRIOR_WARBRINGER_ROOT, true);
                else
                    caster->CastSpell(target, SPELL_WARRIOR_INTERCEPT_STUN, true);
            }
        }

        SpellCastResult CheckCast()
        {
            Unit* caster = GetCaster();
            Unit* target = GetExplTargetUnit();
            Position pos = target->GetPosition();

            if (caster->GetDistance(pos) < 8.0f && !caster->IsFriendlyTo(target))
            {
                return SPELL_FAILED_TOO_CLOSE;
            }
            return SPELL_CAST_OK;
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_warr_intercept_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            OnCheckCast += SpellCheckCastFn(spell_warr_intercept_SpellScript::CheckCast);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_intercept_SpellScript();
    }
};

// 223657 Safeguard
class spell_warr_safeguard : public SpellScriptLoader
{
public:
    spell_warr_safeguard() : SpellScriptLoader("spell_warr_safeguard") {}

    class spell_warrior_intervene_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warrior_intervene_SpellScript);

        void HandleOnHit()
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            caster->RemoveMovementImpairingAuras();
        }

        void Register() override
        {
            OnHit += SpellHitFn(spell_warrior_intervene_SpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warrior_intervene_SpellScript();
    }
};

//18499
class spell_warr_berzerker_rage : public SpellScriptLoader
{
public:
    spell_warr_berzerker_rage() : SpellScriptLoader("spell_warr_berzerker_rage") { }

    class spell_warr_berzerker_rage_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_berzerker_rage_AuraScript);

        void HandleRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            Unit* caster = GetCaster();

            caster->RemoveAurasDueToSpell(SPELL_WARRIOR_UNCHACKLED_FURY);
        }

        void Register() override
        {
            OnEffectRemove += AuraEffectRemoveFn(spell_warr_berzerker_rage_AuraScript::HandleRemove, EFFECT_0, SPELL_AURA_ADD_PCT_MODIFIER, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_berzerker_rage_AuraScript();
    }
};

// 167105 Colossus Smash
class spell_warr_colossus_smash : public SpellScriptLoader
{
public:
    spell_warr_colossus_smash() : SpellScriptLoader("spell_warr_colossus_smash") { }

    class spell_warr_colossus_smash_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_colossus_smash_SpellScript);

        void HandleOnHit()
        {
            if (Player* _player = GetCaster()->ToPlayer())
                if (Unit* target = GetHitUnit())
                {
                    _player->CastCustomSpell(SPELL_WARRIOR_COLOSSUS_SMASH_BUFF, SPELLVALUE_BASE_POINT0, 15.0f + _player->m_activePlayerData->Mastery, target, true);
                }

            if (Unit* caster = GetCaster())
            {
                if (Aura* inForTheKill = caster->GetAura(248621)) // In For The Kill
                {
                    int32 hpPct = inForTheKill->GetSpellEffectInfo(EFFECT_2)->CalcValue(caster);
                    int32 hastePct = inForTheKill->GetEffect(EFFECT_0)->GetAmount();
                    if (Unit* target = GetHitUnit())
                        if (target->HealthBelowPct(hpPct))
                            hastePct = inForTheKill->GetSpellEffectInfo(EFFECT_1)->CalcValue(caster);
                    caster->CastCustomSpell(caster, 248622, &hastePct, nullptr, nullptr, true); // In For The Kill
                }
            }
        }

        void Register() override
        {
            OnHit += SpellHitFn(spell_warr_colossus_smash_SpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_colossus_smash_SpellScript();
    }
};

// 118000
class spell_warr_dragon_roar : public SpellScriptLoader
{
public:
    spell_warr_dragon_roar() : SpellScriptLoader("spell_warr_dragon_roar") { }

    class spell_warr_dragon_roar_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_dragon_roar_SpellScript);
        void HandleOnHit()
        {
            if (Player* _player = GetCaster()->ToPlayer())
                if (Unit* target = GetHitUnit())
                    _player->CastSpell(target, SPELL_WARRIOR_DRAGON_ROAR_KNOCK_BACK, true);
        }

        void Register() override
        {
            OnHit += SpellHitFn(spell_warr_dragon_roar_SpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_dragon_roar_SpellScript();
    }
};

// Mortal Strike - 12294
class spell_warr_mortal_strike : public SpellScriptLoader
{
public:
    spell_warr_mortal_strike() : SpellScriptLoader("spell_warr_mortal_strike") { }

    class spell_warr_mortal_strike_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_mortal_strike_SpellScript);

        void HandleOnHit()
        {
            // Fix Apply Mortal strike buff on player only if he has the correct glyph
            if (Unit* caster = GetCaster())
            {
                if (Unit* target = GetHitUnit())
                {
                    caster->CastSpell(target, 115804, true); // Mortal Wounds
                }
                caster->RemoveAurasDueToSpell(7384); // Mortal Strike buff
            }
        }

        void Register() override
        {
            OnHit += SpellHitFn(spell_warr_mortal_strike_SpellScript::HandleOnHit);
        }
    };
    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_mortal_strike_SpellScript();
    }
};

// 85288
class spell_warr_raging_blow : public SpellScript
{
    PrepareSpellScript(spell_warr_raging_blow);

private:
    uint8 targetHit;

    void HandleOnHit()
    {
        if (Player* player = GetCaster()->ToPlayer())
            player->CastSpell(player, SPELL_WARRIOR_ALLOW_RAGING_BLOW, true);

        if (GetCaster()->HasAura(SPELL_WARRIOR_BATTLE_TRANCE))
        {
            Unit* target = GetCaster()->ToPlayer()->GetSelectedUnit();
            ObjectGuid targetGUID = target->GetGUID();
            targetHit++;

            if (this->targetHit == 4)
            {
                //targetGUID.Clear();
                this->targetHit = 0;
                GetCaster()->CastSpell(nullptr, SPELL_WARRIOR_BATTLE_TRANCE_BUFF, true);
                if (AuraEffect* battleTrance = GetCaster()->GetAura(SPELL_WARRIOR_BATTLE_TRANCE_BUFF)->GetEffect(0))
                    battleTrance->GetAmount();
            }
        }

        if (roll_chance_f(20))
            GetCaster()->GetSpellHistory()->ResetCooldown(85288, true);

        if (Aura* whirlWind = GetCaster()->GetAura(SPELL_WARRIOR_WHIRLWIND_PASSIVE))
            whirlWind->ModStackAmount(-1, AuraRemoveMode::AURA_REMOVE_BY_DEFAULT, false, false);
    }

    void Register() override
    {
        OnHit += SpellHitFn(spell_warr_raging_blow::HandleOnHit);
    }
};

// Unshackled Fury - 76856
class spell_warr_unshackled_fury : public SpellScriptLoader
{
public:
    spell_warr_unshackled_fury() : SpellScriptLoader("spell_warr_unshackled_fury") { }

    class spell_warr_unshackled_fury_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_unshackled_fury_AuraScript);

        void CalculateAmount(const AuraEffect* /*aurEff*/, int32& amount, bool & /*canBeRecalculated*/)
        {
            if (Unit* caster = GetCaster())
                if (!caster->HasAuraState(AURA_STATE_ENRAGE))
                    amount = 0;
        }

        void Register() override
        {
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_warr_unshackled_fury_AuraScript::CalculateAmount, EFFECT_0, SPELL_AURA_MOD_DAMAGE_PERCENT_DONE);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_unshackled_fury_AuraScript();
    }
};

// 6343 - Thunder Clap
class spell_warr_thunder_clap : public SpellScriptLoader
{
public:
    spell_warr_thunder_clap() : SpellScriptLoader("spell_warr_thunder_clap") { }

    class spell_warr_thunder_clap_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_thunder_clap_SpellScript);

        void HandleOnHit()
        {
            if (Player* _player = GetCaster()->ToPlayer())
            {
                if (Unit* target = GetHitUnit())
                {
                    _player->CastSpell(target, SPELL_WARRIOR_WEAKENED_BLOWS, true);

                    if (_player->HasAura(SPELL_WARRIOR_THUNDERSTRUCK))
                        _player->CastSpell(target, SPELL_WARRIOR_THUNDERSTRUCK_STUN, true);
                }
            }
        }

        void Register() override
        {
            OnHit += SpellHitFn(spell_warr_thunder_clap_SpellScript::HandleOnHit);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_thunder_clap_SpellScript();
    }
};


// 2565
class spell_warr_shield_block : public SpellScriptLoader
{
public:
    spell_warr_shield_block() : SpellScriptLoader("spell_warr_shield_block") { }

    class spell_warr_shield_block_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_shield_block_SpellScript);

        void HandleOnHit()
        {
            if (Player* _player = GetCaster()->ToPlayer())
                _player->CastSpell(_player, SPELL_WARRIOR_SHIELD_BLOCKC_TRIGGERED, true);
        }

        void Register() override
        {
            OnHit += SpellHitFn(spell_warr_shield_block_SpellScript::HandleOnHit);
        }
    };

    class spell_warr_shield_block_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_shield_block_AuraScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_WARRIOR_SHIELD_BLOCKC_TRIGGERED))
                return false;
            return true;
        }

        void CalculateAmount(AuraEffect const* /*aurEff*/, int32& amount, bool& /*canBeRecalculated*/)
        {
            if (Unit* caster = GetCaster())
                if (caster->HasAura(SPELL_WARRIOR_HEAVY_REPERCUSSIONS))
                    amount += 30;
        }

        void Register() override
        {
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_warr_shield_block_AuraScript::CalculateAmount, EFFECT_0, SPELL_AURA_NONE);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_shield_block_SpellScript();
    }

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_shield_block_AuraScript();
    }
};

// 107570
class spell_warr_storm_bolt : public SpellScriptLoader
{
public:
    spell_warr_storm_bolt() : SpellScriptLoader("spell_warr_storm_bolt") { }

    class spell_warr_storm_bolt_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_storm_bolt_SpellScript);

        void HandleOnHitTarget(SpellEffIndex /* effIndex */)
        {
            Unit* caster = GetCaster();
            Unit* target = GetHitUnit();
            if (!caster || !target)
                return;

            caster->CastSpell(target, SPELL_WARRIOR_STORM_BOLT_STUN, true);
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_warr_storm_bolt_SpellScript::HandleOnHitTarget, EFFECT_1, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_storm_bolt_SpellScript();
    }
};

// 203179 - Opportunity Strike
class spell_warr_opportunity_strike : public SpellScriptLoader
{
public:
    spell_warr_opportunity_strike() : SpellScriptLoader("spell_warr_opportunity_strike") { }


    class spell_warr_opportunity_strike_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_opportunity_strike_AuraScript);

        void HandleProc(ProcEventInfo& eventInfo)
        {
            if (!GetCaster())
                return;

            if (eventInfo.GetDamageInfo() && eventInfo.GetDamageInfo()->GetSpellInfo() && eventInfo.GetDamageInfo()->GetSpellInfo()->Id == SPELL_WARRIOR_OPPORTUNITY_STRIKE_DAMAGE)
                return;

            if (Unit* target = eventInfo.GetActionTarget())
            {
                if (Player* _player = GetCaster()->ToPlayer())
                {
                    if (Aura* aur = GetAura())
                    {
                        if (AuraEffect *eff = aur->GetEffect(0))
                        {
                            if (roll_chance_i(eff->GetAmount()))
                                _player->CastSpell(target, SPELL_WARRIOR_OPPORTUNITY_STRIKE_DAMAGE, true);
                        }
                    }
                }
            }
        }

        void Register() override
        {
            OnProc += AuraProcFn(spell_warr_opportunity_strike_AuraScript::HandleProc);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_opportunity_strike_AuraScript();
    }
};

// 34428 - Victory Rush
class spell_warr_victory_rush : public SpellScript
{
    PrepareSpellScript(spell_warr_victory_rush);

    void HandleOnHit()
    {
        if (Unit* caster = GetCaster())
        {
            caster->CastSpell(nullptr, 118779, true);
            caster->RemoveAura(SPELL_WARRIOR_VICTORIOUS);
        }
    }

    void Register() override
    {
        OnHit += SpellHitFn(spell_warr_victory_rush::HandleOnHit);
    }
};

// 32215 - Victorious
/// Last update: 7.3.5 26972
class aura_warr_victorious : public AuraScript
{
    PrepareAuraScript(aura_warr_victorious);

    bool CheckProc(ProcEventInfo& eventInfo)
    {
        if (Unit* caster = GetCaster())
        {
            if (Player* player = caster->ToPlayer())
            {
                if ((player->GetSpecializationId() == TALENT_SPEC_WARRIOR_PROTECTION) || (player->GetSpecializationId() == TALENT_SPEC_WARRIOR_ARMS))
                    return true;
            }
        }

        return false;
    }

    void Register() override
    {
        DoCheckProc += AuraCheckProcFn(aura_warr_victorious::CheckProc);
    }
};

// Victory Rush (heal) - 118779
class spell_warr_victory_rush_heal : public SpellScriptLoader
{
public:
    spell_warr_victory_rush_heal() : SpellScriptLoader("spell_warr_victory_rush_heal") { }

    class spell_warr_victory_rush_heal_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_victory_rush_heal_SpellScript);

        bool Validate(SpellInfo const* /*SpellEntry*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_WARRIOR_GLYPH_OF_MIGHTY_VICTORY))
                return false;
            return true;
        }

        void HandleHeal()
        {
            Unit* caster = GetCaster();
            int32 heal = GetHitHeal();

            if (AuraEffect* GlyphOfVictoryRush = caster->GetAuraEffect(SPELL_WARRIOR_GLYPH_OF_MIGHTY_VICTORY, EFFECT_0))
                AddPct(heal, GlyphOfVictoryRush->GetAmount());

            SetHitHeal(heal);
        }

        void Register() override
        {
            OnHit += SpellHitFn(spell_warr_victory_rush_heal_SpellScript::HandleHeal);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_victory_rush_heal_SpellScript;
    }
};

// 100 - Charge
class spell_warr_charge : public SpellScript
{
    PrepareSpellScript(spell_warr_charge);

    bool Validate(SpellInfo const* /*spellInfo*/) override
    {
        return ValidateSpellInfo
        ({
            SPELL_WARRIOR_CHARGE_EFFECT,
            SPELL_WARRIOR_CHARGE_EFFECT_BLAZING_TRAIL
        });
    }

    void HandleDummy(SpellEffIndex /*effIndex*/)
    {
        uint32 spellId = SPELL_WARRIOR_CHARGE_EFFECT;
        if (GetCaster()->HasAura(SPELL_WARRIOR_GLYPH_OF_THE_BLAZING_TRAIL))
            spellId = SPELL_WARRIOR_CHARGE_EFFECT_BLAZING_TRAIL;

        GetCaster()->CastSpell(GetHitUnit(), spellId, true);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_warr_charge::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
    }
};

// 126661 - Warrior Charge Drop Fire Periodic
class spell_warr_charge_drop_fire_periodic : public AuraScript
{
    PrepareAuraScript(spell_warr_charge_drop_fire_periodic);

    void DropFireVisual(AuraEffect const* aurEff)
    {
        PreventDefaultAction();
        if (GetTarget()->IsSplineEnabled())
        {
            for (uint32 i = 0; i < 5; ++i)
            {
                int32 timeOffset = 6 * i * aurEff->GetPeriod() / 25;
                Movement::Location loc = GetTarget()->movespline->ComputePosition(timeOffset);
                GetTarget()->SendPlaySpellVisual(Position(loc.x, loc.y, loc.z, loc.orientation), 0.f, SPELL_VISUAL_BLAZING_CHARGE, 0, 0, 1.f, true);
            }
        }
    }

    void Register() override
    {
        OnEffectPeriodic += AuraEffectPeriodicFn(spell_warr_charge_drop_fire_periodic::DropFireVisual, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
    }
};

// 198337 - Charge Effect (dropping Blazing Trail)
// 218104 - Charge Effect
class spell_warr_charge_effect : public SpellScript
{
    PrepareSpellScript(spell_warr_charge_effect);

    bool Validate(SpellInfo const* /*spellInfo*/) override
    {
        return ValidateSpellInfo
        ({
            SPELL_WARRIOR_CHARGE_PAUSE_RAGE_DECAY,
            SPELL_WARRIOR_CHARGE_ROOT_EFFECT,
            SPELL_WARRIOR_CHARGE_SLOW_EFFECT
        });
    }

    void HandleCharge(SpellEffIndex /*effIndex*/)
    {
        Unit* caster = GetCaster();
        Unit* target = GetHitUnit();
        caster->CastCustomSpell(SPELL_WARRIOR_CHARGE_PAUSE_RAGE_DECAY, SPELLVALUE_BASE_POINT0, 0, caster, true);
        caster->CastSpell(target, SPELL_WARRIOR_CHARGE_ROOT_EFFECT, true);
        caster->CastSpell(target, SPELL_WARRIOR_CHARGE_SLOW_EFFECT, true);
    }

    void Register() override
    {
        OnEffectLaunchTarget += SpellEffectFn(spell_warr_charge_effect::HandleCharge, EFFECT_0, SPELL_EFFECT_CHARGE);
    }
};

// 23920 Spell Reflect
class spell_warr_spell_reflect : public SpellScriptLoader
{
public:
    spell_warr_spell_reflect() : SpellScriptLoader("spell_warr_spell_reflect") { }

    class spell_warr_spell_reflect_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_spell_reflect_AuraScript);

        void OnApply(const AuraEffect* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            Unit* caster = GetCaster();
            if (!caster || caster->GetTypeId() != TYPEID_PLAYER)
                return;

            Item* item = caster->ToPlayer()->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_OFFHAND);
            if (item && item->GetTemplate()->GetInventoryType() == INVTYPE_SHIELD)
                caster->CastSpell(caster, 146120, true);
            else if (caster->getFaction() == 1732) // Alliance
                caster->CastSpell(caster, 147923, true);
            else // Horde
                caster->CastSpell(caster, 146122, true);
        }

        void OnRemove(const AuraEffect* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            Unit* caster = GetCaster();
            if (!caster || caster->GetTypeId() != TYPEID_PLAYER)
                return;

            // Visuals
            caster->RemoveAura(146120);
            caster->RemoveAura(147923);
            caster->RemoveAura(146122);
        }

        void Register() override
        {
            OnEffectApply += AuraEffectApplyFn(spell_warr_spell_reflect_AuraScript::OnApply, EFFECT_0, SPELL_AURA_REFLECT_SPELLS, AURA_EFFECT_HANDLE_REAL_OR_REAPPLY_MASK);
            OnEffectRemove += AuraEffectRemoveFn(spell_warr_spell_reflect_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_REFLECT_SPELLS, AURA_EFFECT_HANDLE_REAL_OR_REAPPLY_MASK);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_spell_reflect_AuraScript();
    }
};

class spell_warr_shield_slam : public SpellScriptLoader
{
public:
    spell_warr_shield_slam() : SpellScriptLoader("spell_warr_shield_slam") { }

    class spell_warr_shield_slam_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_shield_slam_SpellScript);

        void HandleDispel(SpellEffIndex effIndex)
        {
            // 6.0.3 HOTFIX: Shield Slam modified by Glyph of Shield Slam now only dispels 1 magical effect while the Warrior is in Defensive Stance.
            if (GetCaster()->GetShapeshiftForm() != FORM_DEFENSIVE_STANCE)
                PreventHitDefaultEffect(effIndex);
        }

        void HandlePassive(SpellEffIndex /*effIndex*/)
        {
            //Handles the passive bonuses
            if (Unit* caster = GetCaster())
                if (caster->HasAura(SPELL_WARRIOR_HEAVY_REPERCUSSIONS) && caster->HasAura(SPELL_WARRIOR_SHIELD_BLOCKC_TRIGGERED))
                     caster->GetAura(SPELL_WARRIOR_SHIELD_BLOCKC_TRIGGERED)->SetDuration(caster->GetAura(SPELL_WARRIOR_SHIELD_BLOCKC_TRIGGERED)->GetDuration() + 1500);
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_warr_shield_slam_SpellScript::HandleDispel, EFFECT_1, SPELL_EFFECT_DUMMY);
            OnEffectHitTarget += SpellEffectFn(spell_warr_shield_slam_SpellScript::HandlePassive, EFFECT_2, SPELL_EFFECT_ENERGIZE);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_shield_slam_SpellScript();
    }
};

// Heroic leap - 6544
class spell_warr_heroic_leap : public SpellScriptLoader
{
public:
    spell_warr_heroic_leap() : SpellScriptLoader("spell_warr_heroic_leap") { }

    class spell_warr_heroic_leap_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_heroic_leap_SpellScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_WARRIOR_HEROIC_LEAP_JUMP))
                return false;
            return true;
        }

        SpellCastResult CheckElevation()
        {
            if (WorldLocation const* dest = GetExplTargetDest())
            {
                if (GetCaster()->HasUnitMovementFlag(MOVEMENTFLAG_ROOT))
                    return SPELL_FAILED_ROOTED;

                if (GetCaster()->GetMap()->Instanceable())
                {
                    float range = GetSpellInfo()->GetMaxRange(true, GetCaster()) * 1.5f;

                    PathGenerator generatedPath(GetCaster());
                    generatedPath.SetPathLengthLimit(range);

                    bool result = generatedPath.CalculatePath(dest->GetPositionX(), dest->GetPositionY(), dest->GetPositionZ(), false, true);
                    if (generatedPath.GetPathType() & PATHFIND_SHORT)
                        return SPELL_FAILED_OUT_OF_RANGE;
                    else if (!result || generatedPath.GetPathType() & PATHFIND_NOPATH)
                    {
                        result = generatedPath.CalculatePath(dest->GetPositionX(), dest->GetPositionY(), dest->GetPositionZ(), false, false);
                        if (generatedPath.GetPathType() & PATHFIND_SHORT)
                            return SPELL_FAILED_OUT_OF_RANGE;
                        else if (!result || generatedPath.GetPathType() & PATHFIND_NOPATH)
                            return SPELL_FAILED_NOPATH;
                    }
                }
                else if (dest->GetPositionZ() > GetCaster()->GetPositionZ() + 4.0f)
                    return SPELL_FAILED_NOPATH;

                return SPELL_CAST_OK;
            }

            return SPELL_FAILED_NO_VALID_TARGETS;
        }

        void HandleDummy(SpellEffIndex /*effIndex*/)
        {
            if (WorldLocation* dest = GetHitDest())
            {
                GetCaster()->CastSpell(dest->GetPositionX(), dest->GetPositionY(), dest->GetPositionZ(), SPELL_WARRIOR_HEROIC_LEAP_JUMP, true);
            }

            if (Unit* caster = GetCaster())
                if (caster->HasAura(SPELL_WARRIOR_BOUNDING_STRIDE))
                    caster->CastSpell(caster, SPELL_WARRIOR_BOUNDING_STRIDE_SPEED, true);
        }

        void Register() override
        {
            OnCheckCast += SpellCheckCastFn(spell_warr_heroic_leap_SpellScript::CheckElevation);
            OnEffectHit += SpellEffectFn(spell_warr_heroic_leap_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_heroic_leap_SpellScript();
    }
};

// Bladestorm - 227847 and 46924
class spell_warr_bladestorm : public SpellScriptLoader
{
public:
    spell_warr_bladestorm() : SpellScriptLoader("spell_warr_bladestorm") { }

    class spell_warr_bladestorm_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_bladestorm_SpellScript);

        void HandleOnHit(SpellEffIndex effIndex)
        {
            PreventHitAura();
            PreventHitDamage();
            PreventHitDefaultEffect(effIndex);
            PreventHitEffect(effIndex);
            PreventHitHeal();
        }

        void CastBS()
        {
            GetCaster()->CastSpell(GetCaster(), SPELL_WARRIOR_NEW_BLADESTORM, true);
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_warr_bladestorm_SpellScript::HandleOnHit, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
            OnEffectHitTarget += SpellEffectFn(spell_warr_bladestorm_SpellScript::HandleOnHit, EFFECT_1, SPELL_EFFECT_APPLY_AURA);
            OnEffectHitTarget += SpellEffectFn(spell_warr_bladestorm_SpellScript::HandleOnHit, EFFECT_2, SPELL_EFFECT_APPLY_AURA);
            OnCast += SpellCastFn(spell_warr_bladestorm_SpellScript::CastBS);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_bladestorm_SpellScript();
    }
};

// New Bladestorm - 222634
class spell_warr_bladestorm_new : public SpellScriptLoader
{
public:
    spell_warr_bladestorm_new() : SpellScriptLoader("spell_warr_bladestorm_new") { }

    class spell_warr_bladestorm_new_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_bladestorm_new_AuraScript);


        bool Validate(SpellInfo const* /*SpellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_WARRIOR_NEW_BLADESTORM))
                return false;
            return true;
        }

        void HandlePeriodicDummy(AuraEffect const* /*auraEff*/)
        {
            GetCaster()->CastSpell(GetCaster(), 50622, true); // Bladestorm main hand damage
        }

        void Register() override
        {
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_warr_bladestorm_new_AuraScript::HandlePeriodicDummy, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_bladestorm_new_AuraScript();
    }
};

// 95738 - Bladestorm Offhand
class spell_warr_bladestorm_offhand : public SpellScriptLoader
{
public:
    spell_warr_bladestorm_offhand() : SpellScriptLoader("spell_warr_bladestorm_offhand") { }

    class spell_warr_bladestorm_offhand_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_bladestorm_offhand_SpellScript);

        void HandleOnHit(SpellEffIndex effIndex)
        {
            Player* caster = GetCaster()->ToPlayer();
            if (!caster)
                return;

            uint32 _spec = caster->GetSpecializationId();
            if (_spec != TALENT_SPEC_WARRIOR_FURY) //only fury warriors should deal damage with offhand
            {
                PreventHitDamage();
                PreventHitDefaultEffect(effIndex);
                PreventHitEffect(effIndex);
            }
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_warr_bladestorm_offhand_SpellScript::HandleOnHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
            //OnEffectHitTarget += SpellEffectFn(spell_warr_bladestorm_offhand_SpellScript::HandleOnHit, EFFECT_1, SPELL_EFFECT_WEAPON_PERCENT_DAMAGE);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_bladestorm_offhand_SpellScript();
    }
};

//190456 - Ignore Pain
class spell_warr_ignore_pain : public SpellScript
{
    PrepareSpellScript(spell_warr_ignore_pain);

    bool Validate(SpellInfo const* /*spellInfo*/) override
    {
        return ValidateSpellInfo({ SPELL_WARRIOR_RENEWED_FURY, SPELL_WARRIOR_VENGEANCE_FOCUSED_RAGE });
    }

    void HandleDummy(SpellEffIndex /*effIndex*/)
    {
        if (Unit* caster = GetCaster())
        {
            if(caster->HasAura(SPELL_WARRIOR_RENEWED_FURY))
                caster->CastSpell(caster, SPELL_WARRIOR_RENEWED_FURY_EFFECT, true);
            if (caster->HasAura(SPELL_WARRIOR_VENGEANCE_AURA))
                caster->CastSpell(caster, SPELL_WARRIOR_VENGEANCE_FOCUSED_RAGE, true);
        }
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_warr_ignore_pain::HandleDummy, EFFECT_1, SPELL_EFFECT_DUMMY);
    }
};

//190456 - Ignore Pain
class aura_warr_ignore_pain : public AuraScript
{
    PrepareAuraScript(aura_warr_ignore_pain);

    int32 m_ExtraSpellCost;

    bool Load() override
    {
        Unit* caster = GetCaster();
        // In this phase the initial 20 Rage cost is removed already
        // We just check for bonus.
        m_ExtraSpellCost = std::min(caster->GetPower(POWER_RAGE), 400);
        return true;
    }

    void CalcAmount(AuraEffect const* /*aurEff*/, int32& amount, bool& /*canBeRecalculated*/)
    {
        if (Unit* caster = GetCaster())
        {
            amount = (float)(22.3f * caster->GetTotalAttackPowerValue(BASE_ATTACK)) * (float(m_ExtraSpellCost+200) / 600.0f);
            int32 m_newRage = caster->GetPower(POWER_RAGE) - m_ExtraSpellCost;
            if (m_newRage < 0)
                m_newRage = 0;
            caster->SetPower(POWER_RAGE, m_newRage);
            /*if (Player* player = caster->ToPlayer())
                player->SendPowerUpdate(POWER_RAGE, m_newRage);*/
        }
    }

    void OnAbsorb(AuraEffect * /*aurEff*/, DamageInfo& dmgInfo, uint32& /*absorbAmount*/)
    {
        if (Unit* caster = GetCaster())
        {
            SpellNonMeleeDamage spell(caster, caster, SPELL_WARRIOR_IGNORE_PAIN, 0, SPELL_SCHOOL_MASK_NORMAL);
            spell.damage = dmgInfo.GetDamage() - dmgInfo.GetDamage() * 0.9f;
            spell.cleanDamage = spell.damage;
            caster->DealSpellDamage(&spell, false);
            caster->SendSpellNonMeleeDamageLog(&spell);
        }
    }

    void Register() override
    {
        DoEffectCalcAmount += AuraEffectCalcAmountFn(aura_warr_ignore_pain::CalcAmount, EFFECT_0, SPELL_AURA_SCHOOL_ABSORB);
        OnEffectAbsorb += AuraEffectAbsorbFn(aura_warr_ignore_pain::OnAbsorb, EFFECT_0);
    }
};

//46968 - Shockwave
class spell_warr_shockwave : public SpellScriptLoader
{
public:
    spell_warr_shockwave() : SpellScriptLoader("spell_warr_shockwave") {}

    class spell_warr_shockwave_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_shockwave_SpellScript);

        void HandleHit(SpellEffIndex /*effIndex*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            std::list<Unit*> targets;
            caster->GetAttackableUnitListInRange(targets, 10.0f);
            uint16 amount_of_targets = 0;

            for (auto itr : targets)
            {
                if (caster->IsValidAttackTarget(itr))
                {
                    caster->CastSpell(itr, SPELL_WARRIOR_SHOCKWAVE_STUN, true);
                    amount_of_targets++;
                }
            }

            if (amount_of_targets >= sSpellMgr->GetSpellInfo(SPELL_WARRIOR_SHOCKWAVE)->GetEffect(EFFECT_0)->BasePoints)
            {
                if (Player* player = caster->ToPlayer())
                {
                    player->GetSpellHistory()->ModifyCooldown(SPELL_WARRIOR_SHOCKWAVE, -sSpellMgr->GetSpellInfo(SPELL_WARRIOR_SHOCKWAVE)->GetEffect(EFFECT_3)->BasePoints * IN_MILLISECONDS);
                }
            }
        }

        void Register() override
        {
            OnEffectHit += SpellEffectFn(spell_warr_shockwave_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_shockwave_SpellScript();
    }
};

//204488 - Focused Rage
class spell_warr_focused_rage_prot : public SpellScriptLoader
{
public:
    spell_warr_focused_rage_prot() : SpellScriptLoader("spell_warr_focused_rage_prot") {}

    class spell_warr_focused_rage_prot_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_focused_rage_prot_AuraScript);

        bool CheckProc(ProcEventInfo& eventInfo)
        {
            if (eventInfo.GetSpellInfo()->Id == SPELL_WARRIOR_SHIELD_SLAM)
                return true;
            return false;
        }

        void Register() override
        {
            DoCheckProc += AuraCheckProcFn(spell_warr_focused_rage_prot_AuraScript::CheckProc);
        }
    };

    class spell_warr_focused_rage_prot_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_focused_rage_prot_SpellScript);

        bool Validate(SpellInfo const* /*spellInfo*/) override
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_WARRIOR_VENGEANCE_IGNORE_PAIN))
                return false;
            return true;
        }

        void HandleDummy(SpellEffIndex /*effIndex*/)
        {
            if (Unit* caster = GetCaster())
            {
                if (caster->HasAura(SPELL_WARRIOR_VENGEANCE_AURA))
                    caster->CastSpell(caster, SPELL_WARRIOR_VENGEANCE_IGNORE_PAIN, true);
            }
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_warr_focused_rage_prot_SpellScript::HandleDummy, EFFECT_1, SPELL_EFFECT_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_focused_rage_prot_AuraScript();
    }

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_focused_rage_prot_SpellScript();
    }

};

//207982 - Focused Rage
class spell_warr_focused_rage_arms : public SpellScriptLoader
{
public:
    spell_warr_focused_rage_arms() : SpellScriptLoader("spell_warr_focused_rage_arms") {}

    class spell_warr_focused_rage_arms_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_focused_rage_arms_AuraScript);

        bool CheckProc(ProcEventInfo& eventInfo)
        {
            if (eventInfo.GetSpellInfo()->Id == SPELL_WARRIOR_MORTAL_STRIKE)
                return true;
            return false;
        }

        void Register() override
        {
            DoCheckProc += AuraCheckProcFn(spell_warr_focused_rage_arms_AuraScript::CheckProc);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_focused_rage_arms_AuraScript();
    }

};

//20243 - Devastate
class spell_warr_devastate : public SpellScriptLoader
{
public:
    spell_warr_devastate() : SpellScriptLoader("spell_warr_devastate") {}

    class spell_warr_devastate_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warr_devastate_SpellScript);

        void HandleOnHit(SpellEffIndex effIndex)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            if (roll_chance_i(sSpellMgr->GetSpellInfo(SPELL_WARRIOR_DEVASTATE)->GetEffect(effIndex)->BasePoints))
                if (Player* player = caster->ToPlayer())
                    player->GetSpellHistory()->ModifyCooldown(SPELL_WARRIOR_SHIELD_SLAM, -40 * IN_MILLISECONDS);

        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_warr_devastate_SpellScript::HandleOnHit, EFFECT_2, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warr_devastate_SpellScript();
    }
};

//202168 - Impending victory
class spell_warr_impending_victory : public SpellScript
{
    PrepareSpellScript(spell_warr_impending_victory);

    void HandleOnHit()
    {
        Unit* caster = GetCaster();
        caster->CastSpell(caster, 202166, true);
    }

    void Register() override
    {
        OnHit += SpellHitFn(spell_warr_impending_victory::HandleOnHit);
    }
};

//214871 - Odyn's fury
class spell_warr_odyns_fury : public SpellScriptLoader
{
public:
    spell_warr_odyns_fury() : SpellScriptLoader("spell_warr_odyns_fury") { }

    class spell_warr_odyns_fury_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_odyns_fury_AuraScript);

        void Absorb(AuraEffect* /* aurEff */, DamageInfo& /*dmgInfo*/, uint32& absorbAmount)
        {
            absorbAmount = 0;
        }

        void Register() override
        {
            OnEffectNameAbsorb += AuraEffectNameAbsorbFn(spell_warr_odyns_fury_AuraScript::Absorb, EFFECT_0, SPELL_AURA_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_odyns_fury_AuraScript();
    }
};

// 215570 - Wrecking Ball
class spell_warr_wrecking_ball_effect : public SpellScriptLoader
{
public:
    spell_warr_wrecking_ball_effect() : SpellScriptLoader("spell_warr_wrecking_ball_effect") { }

    class spell_warr_wrecking_ball_effect_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_wrecking_ball_effect_AuraScript);

        void HandleProc(AuraEffect const* /*aurEff*/, ProcEventInfo& /*procInfo*/)
        {
            if (Unit* caster = GetCaster())
            {
                if(caster->HasAura(SPELL_WARRIOR_WRECKING_BALL_EFFECT))
                    caster->RemoveAura(SPELL_WARRIOR_WRECKING_BALL_EFFECT);
            }
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_warr_wrecking_ball_effect_AuraScript::HandleProc, EFFECT_0, SPELL_AURA_ADD_PCT_MODIFIER);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_wrecking_ball_effect_AuraScript();
    }
};

//206315
class spell_warr_massacre : public SpellScriptLoader
{
public:
    spell_warr_massacre() : SpellScriptLoader("spell_warr_massacre") { }

    class spell_warr_massacre_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_massacre_AuraScript);

        bool CheckProc(ProcEventInfo& procInfo)
        {
            if(procInfo.GetSpellInfo()->Id == SPELL_WARRIOR_EXECUTE)
                if(procInfo.GetHitMask() & PROC_HIT_CRITICAL)
                    return true;

            return false;
        }

        void Register() override
        {
            DoCheckProc += AuraCheckProcFn(spell_warr_massacre_AuraScript::CheckProc);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_massacre_AuraScript();
    }
};

// BloodBath - 12292
class spell_warr_blood_bath : public SpellScriptLoader
{
public:
    spell_warr_blood_bath() : SpellScriptLoader("spell_warr_blood_bath") { }

    class spell_warr_blood_bath_Aurascript : public AuraScript
    {
        PrepareAuraScript(spell_warr_blood_bath_Aurascript);

        enum eSpells
        {
            BloodBath = 12292,
            BloodBathDamage = 113344
        };

        void HandleOnProc(AuraEffect const* aurEff, ProcEventInfo& p_ProcInfo)
        {
            PreventDefaultAction();

            if (!p_ProcInfo.GetDamageInfo() || !p_ProcInfo.GetDamageInfo()->GetDamage() || !p_ProcInfo.GetDamageInfo()->GetSpellInfo())
                return;

            if (p_ProcInfo.GetDamageInfo()->GetSpellInfo()->Id == eSpells::BloodBathDamage)
                return;

            Unit* l_Target = p_ProcInfo.GetActionTarget();
            Unit* l_Caster = GetCaster();
            if (l_Target == nullptr || l_Caster == nullptr || l_Target == l_Caster)
                return;

            SpellInfo const* l_SpellInfo = sSpellMgr->GetSpellInfo(eSpells::BloodBath);
            SpellInfo const* l_SpellInfoDamage = sSpellMgr->GetSpellInfo(eSpells::BloodBathDamage);

            if (l_SpellInfo == nullptr || l_SpellInfoDamage == nullptr)
                return;

            int32 l_Damage = CalculatePct(p_ProcInfo.GetDamageInfo()->GetDamage(), aurEff->GetBaseAmount());

            int32 l_PreviousTotalDamage = 0;

            if (AuraEffect* l_PreviousBloodBath = l_Target->GetAuraEffect(eSpells::BloodBathDamage, EFFECT_0, l_Caster->GetGUID()))
            {
                int32 l_PeriodicDamage = l_PreviousBloodBath->GetAmount();
                int32 l_Duration = l_Target->GetAura(eSpells::BloodBathDamage, l_Caster->GetGUID())->GetDuration();
                int32 l_Amplitude = l_PreviousBloodBath->GetSpellEffectInfo()->Amplitude;

                if (l_Amplitude)
                    l_PreviousTotalDamage = l_PeriodicDamage * ((l_Duration / l_Amplitude) + 1);

                l_PreviousTotalDamage /= (l_SpellInfoDamage->GetMaxDuration() / l_SpellInfoDamage->GetEffect(EFFECT_0)->Amplitude);
            }

            if (l_SpellInfoDamage->GetEffect(EFFECT_0)->Amplitude)
                l_Damage /= (l_SpellInfoDamage->GetMaxDuration() / l_SpellInfoDamage->GetEffect(EFFECT_0)->Amplitude);

            l_Damage += l_PreviousTotalDamage;

            if (l_Target->HasAura(eSpells::BloodBathDamage, l_Caster->GetGUID()))
            {
                if (Aura* l_ActualBloodBath = l_Target->GetAura(eSpells::BloodBathDamage, l_Caster->GetGUID()))
                    l_ActualBloodBath->SetDuration(l_ActualBloodBath->GetMaxDuration());
            }
            else
                l_Caster->CastSpell(l_Target, eSpells::BloodBathDamage, true);

            if (AuraEffect* l_NewBloodBath = l_Target->GetAuraEffect(eSpells::BloodBathDamage, EFFECT_0, l_Caster->GetGUID()))
                l_NewBloodBath->SetAmount(l_Damage);
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_warr_blood_bath_Aurascript::HandleOnProc, EFFECT_1, SPELL_AURA_NONE);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_blood_bath_Aurascript();
    }
};

//206313 Frenzy
class spell_warr_frenzy : public SpellScriptLoader
{
public:
    spell_warr_frenzy() : SpellScriptLoader("spell_warr_frenzy") { }

    class spell_warr_frenzy_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_frenzy_AuraScript);

        bool CheckProc(ProcEventInfo& procInfo)
        {
            if(procInfo.GetSpellInfo()->Id == SPELL_WARRIOR_FURIOUS_SLASH)
                return true;
            return false;
        }

        void Register() override
        {
            DoCheckProc += AuraCheckProcFn(spell_warr_frenzy_AuraScript::CheckProc);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_frenzy_AuraScript();
    }
};

//215571 Frothing Berserker
class spell_warr_frothing_berserker : public SpellScriptLoader
{
public:
    spell_warr_frothing_berserker() : SpellScriptLoader("spell_warr_frothing_berserker") { }

    class spell_warr_frothing_berserker_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_frothing_berserker_AuraScript);

        void HandleProc(AuraEffect const* /*aurEff*/, ProcEventInfo& /*eventInfo*/)
        {
            GetCaster()->CastSpell(GetCaster(), SPELL_WARRIOR_FROTHING_BERSERKER, true);
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_warr_frothing_berserker_AuraScript::HandleProc, EFFECT_0, SPELL_AURA_PROC_TRIGGER_SPELL);
            OnEffectProc += AuraEffectProcFn(spell_warr_frothing_berserker_AuraScript::HandleProc, EFFECT_1, SPELL_AURA_ADD_FLAT_MODIFIER);
            OnEffectProc += AuraEffectProcFn(spell_warr_frothing_berserker_AuraScript::HandleProc, EFFECT_2, SPELL_AURA_ADD_FLAT_MODIFIER);
            OnEffectProc += AuraEffectProcFn(spell_warr_frothing_berserker_AuraScript::HandleProc, EFFECT_3, SPELL_AURA_ADD_FLAT_MODIFIER);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_frothing_berserker_AuraScript();
    }
};

//200860 Unrivaled Strenght
class spell_warr_unrivaled_strenght : public SpellScriptLoader
{
public:
    spell_warr_unrivaled_strenght() : SpellScriptLoader("spell_warr_unrivaled_strenght") { }

    class spell_warr_unrivaled_strenght_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_unrivaled_strenght_AuraScript);

        void HandleProc(AuraEffect const* aurEff, ProcEventInfo& /*procInfo*/)
        {
            GetCaster()->CastSpell(GetCaster(), 200977, true);
            if(GetCaster()->HasAura(200977))
                GetCaster()->GetAura(200977)->GetEffect(EFFECT_0)->SetAmount(aurEff->GetBaseAmount());
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_warr_unrivaled_strenght_AuraScript::HandleProc, EFFECT_0, SPELL_AURA_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_unrivaled_strenght_AuraScript();
    }
};

// Defensive Stance - 71
class spell_warr_defensive_stance : public SpellScriptLoader
{
public:
    spell_warr_defensive_stance() : SpellScriptLoader("spell_warr_defensive_stance") {}

    class spell_warr_defensive_stance_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_defensive_stance_AuraScript);

        int32 damageTaken = 0;

        void HandleProc(ProcEventInfo& eventInfo)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            damageTaken = eventInfo.GetDamageInfo() ? eventInfo.GetDamageInfo()->GetDamage() : 0;
            if (damageTaken <= 0)
                return;

            int32 rageAmount = (50.0f * (float)damageTaken) / (float)caster->GetMaxHealth();
            caster->ModifyPower(POWER_RAGE, 10 * uint32(rageAmount));
        }

        void Register() override
        {
            OnProc += AuraProcFn(spell_warr_defensive_stance_AuraScript::HandleProc);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_defensive_stance_AuraScript();
    }
};

//184783
class spell_warr_tactician : public SpellScriptLoader
{
public:
    spell_warr_tactician() : SpellScriptLoader("spell_warr_tactician") { }

    class spell_warr_tactician_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_tactician_AuraScript);

        void HandleEffectProc(AuraEffect const* /*aurEff*/, ProcEventInfo& procInfo)
        {
            PreventDefaultAction();
            int32 rageSpent = 0;

            if (Unit* caster = GetCaster())
            {
                if (procInfo.GetSpellInfo())
                {
                    for (SpellPowerCost cost : procInfo.GetSpellInfo()->CalcPowerCost(caster, procInfo.GetSpellInfo()->GetSchoolMask()))
                    {
                        if (cost.Power != POWER_RAGE)
                            continue;

                        rageSpent = cost.Amount;
                    }

                    if (roll_chance_f((rageSpent / 10) * 1.40))
                    {
                        caster->GetSpellHistory()->ResetCooldown(SPELL_WARRIOR_COLOSSUS_SMASH, true);
                        caster->GetSpellHistory()->ResetCooldown(SPELL_WARRIOR_MORTAL_STRIKE, true);
                        caster->CastSpell(caster, SPELL_WARRIOR_TACTICIAN_CD, true);
                    }
                }
            }
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_warr_tactician_AuraScript::HandleEffectProc, EFFECT_0, SPELL_AURA_PROC_TRIGGER_SPELL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_tactician_AuraScript();
    }
};

//215538
class spell_warr_trauma : public SpellScriptLoader
{
public:
    spell_warr_trauma() : SpellScriptLoader("spell_warr_trauma") { }

    class spell_warr_trauma_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_trauma_AuraScript);

        bool CheckProc(ProcEventInfo& eventInfo)
        {
            if (eventInfo.GetSpellInfo()->Id == SPELL_WARRIOR_SLAM_ARMS || eventInfo.GetSpellInfo()->Id == SPELL_WARRIOR_WHIRLWIND_ARMS)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return false;

                Unit* target = eventInfo.GetActionTarget();
                if (!target)
                    return false;


                uint32 bonusDamage = eventInfo.GetDamageInfo() ? eventInfo.GetDamageInfo()->GetDamage() : 0;
                bonusDamage *= 0.2f;
                //If the target already has the dot
                if (target->HasAura(SPELL_WARRIOR_TRAUMA_DOT))
                {

                    Aura* currentDot = target->GetAura(SPELL_WARRIOR_TRAUMA_DOT);
                    uint32 currentDamage = currentDot->GetEffect(EFFECT_0)->GetAmount();

                    //Get the current total damage left
                    currentDamage *= ((3 - currentDot->GetEffect(EFFECT_0)->GetTickNumber()));

                    //Add the bonus and the current
                    bonusDamage += currentDamage;
                    //Divide by number of ticks
                    bonusDamage /= 3;

                    //Cast the DoT
                    caster->CastCustomSpell(SPELL_WARRIOR_TRAUMA_DOT, SPELLVALUE_BASE_POINT0, bonusDamage, target, true);
                }
                else
                {
                    caster->CastCustomSpell(SPELL_WARRIOR_TRAUMA_DOT, SPELLVALUE_BASE_POINT0, bonusDamage, target, true);
                }
                return true;

            }

            return false;
        }

        void Register() override
        {
            DoCheckProc += AuraCheckProcFn(spell_warr_trauma_AuraScript::CheckProc);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warr_trauma_AuraScript();
    }
};

// Overpower Proc Enabler - 60503
class spell_warrior_overpower_proc : public SpellScriptLoader
{
public:
    spell_warrior_overpower_proc() : SpellScriptLoader("spell_warrior_overpower_proc") {}

    class spell_warrior_overpower_proc_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warrior_overpower_proc_AuraScript);

        bool CheckProc(ProcEventInfo& eventInfo)
        {
            //"Your other melee abilities have a chance to activate Overpower."
            //According to sources it should only proc on Whirlwind, Colossus Smash, Mortal Strike and Slam with a 5% chance.
            uint32 _spellId = eventInfo.GetSpellInfo()->Id;
            std::vector<uint32> spellList = { 1680, 167105, 12294, 1464 };
            for (auto id : spellList)
                if (_spellId == id)
                    return true;

            return false;
        }

        void HandleProc(AuraEffect const* /*aurEff*/, ProcEventInfo& /*eventInfo*/)
        {
            Unit* caster = GetCaster();

            if (!caster->HasAura(SPELL_WARRIOR_OVERPOWER_PROC))
                caster->CastSpell(caster, SPELL_WARRIOR_OVERPOWER_PROC, true);
        }

        void Register() override
        {
            OnEffectProc += AuraEffectProcFn(spell_warrior_overpower_proc_AuraScript::HandleProc, EFFECT_0, SPELL_AURA_DUMMY);
            DoCheckProc += AuraCheckProcFn(spell_warrior_overpower_proc_AuraScript::CheckProc);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warrior_overpower_proc_AuraScript();
    }
};

// Ravager - 152277
// Ravager - 228920
class spell_warr_ravager : public SpellScript
{
    PrepareSpellScript(spell_warr_ravager);

    void HandleOnHit(SpellEffIndex /* effIndex */)
    {
        if (WorldLocation const* dest = GetExplTargetDest())
            GetCaster()->CastSpell(dest->GetPosition(), SPELL_WARRIOR_RAVAGER_SUMMON, true);
    }

    void Register() override
    {
        OnEffectHit += SpellEffectFn(spell_warr_ravager::HandleOnHit, EFFECT_1, SPELL_EFFECT_DUMMY);
    }
};

// Ravager - 152277
// Ravager - 228920
class aura_warr_ravager : public AuraScript
{
    PrepareAuraScript(aura_warr_ravager);

    void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        if (Player* player = GetTarget()->ToPlayer())
            if (player->GetSpecializationId() == TALENT_SPEC_WARRIOR_PROTECTION)
                player->CastSpell(player, SPELL_WARRIOR_RAVAGER_PARRY, true);
    }

    void OnTick(AuraEffect const* /*aurEff*/)
    {
        if (Creature* creature = GetTarget()->GetSummonedCreatureByEntry(NPC_WARRIOR_RAVAGER))
            GetTarget()->CastSpell(creature->GetPosition(), SPELL_WARRIOR_RAVAGER_DAMAGE, true);
    }

    void Register() override
    {
        OnEffectApply += AuraEffectApplyFn(aura_warr_ravager::OnApply, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL_OR_REAPPLY_MASK);
        OnEffectPeriodic += AuraEffectPeriodicFn(aura_warr_ravager::OnTick, EFFECT_2, SPELL_AURA_PERIODIC_DUMMY);
    }
};

// Ravager Damage - 156287
class spell_warr_ravager_damage : public SpellScript
{
    PrepareSpellScript(spell_warr_ravager_damage);

    void HandleOnHitTarget(SpellEffIndex /*effIndex*/)
    {
        if (!_alreadyProc)
        {
            GetCaster()->CastSpell(GetCaster(), SPELL_WARRIOR_RAVAGER_ENERGIZE, true);
            _alreadyProc = true;
        }
        if (GetCaster()->HasAura(262304)) // Deep Wounds
            GetCaster()->CastSpell(GetHitUnit(), 262115, true); // Deep Wounds
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_warr_ravager_damage::HandleOnHitTarget, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
    }

private:
    bool _alreadyProc = false;
};

// 163201  - Execute
// 217955  - Execute
// 281000  - Execute
class spell_warr_execute : public SpellScript
{
    PrepareSpellScript(spell_warr_execute);

    float m_powerTaken = 0.f;

    void HandleTakePower(SpellPowerCost& powerCost)
    {
        m_powerTaken = powerCost.Amount;
        uint32 requiredAmount = powerCost.Amount - powerCost.OptionalAmount;
        float dmgMultiplier = powerCost.Amount / (requiredAmount ? requiredAmount : 1);
        GetCaster()->Variables.Set("spell_warr_execute_damages::multiplier", dmgMultiplier);
    }

    void HandleAfterHit()
    {
        if (Unit* target = GetHitUnit())
            if (target->IsAlive())
                GetCaster()->ModifyPower(POWER_RAGE, CalculatePct(m_powerTaken, GetEffectInfo(EFFECT_1)->BasePoints));

        GetCaster()->Variables.Remove("spell_warr_execute_damages::multiplier");
        GetCaster()->RemoveAurasDueToSpell(SPELL_WARRIOR_SUDDEN_DEATH);
    }

    void Register() override
    {
        OnTakePower += SpellOnTakePowerFn(spell_warr_execute::HandleTakePower);
        AfterHit += SpellHitFn(spell_warr_execute::HandleAfterHit);
    }
};

// 260798  - Executes damages
class spell_warr_execute_damages : public SpellScript
{
    PrepareSpellScript(spell_warr_execute_damages);

    void HandleDamage(SpellEffIndex /*effIndex*/)
    {
        float damageMultiplier = GetCaster()->Variables.GetValue<float>("spell_warr_execute_damages::multiplier", 1.f);
        SetHitDamage(GetHitDamage() * damageMultiplier);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_warr_execute_damages::HandleDamage, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
    }
};


// War Machine 215556
class aura_warr_war_machine : public AuraScript
{
    PrepareAuraScript(aura_warr_war_machine);

    void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        if (Unit* caster = GetCaster())
            caster->CastSpell(caster, SPELL_WARRIOR_WAR_MACHINE_AURA, true);
    }

    void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        if (Unit* caster = GetCaster())
            caster->RemoveAurasDueToSpell(SPELL_WARRIOR_WAR_MACHINE_AURA);
    }

    void Register() override
    {
        OnEffectApply += AuraEffectApplyFn(aura_warr_war_machine::OnApply, EFFECT_0, SPELL_AURA_PROC_TRIGGER_SPELL, AURA_EFFECT_HANDLE_REAL);
        OnEffectRemove += AuraEffectRemoveFn(aura_warr_war_machine::OnRemove, EFFECT_0, SPELL_AURA_PROC_TRIGGER_SPELL, AURA_EFFECT_HANDLE_REAL);
    }
};

// Ravager - 76168
struct npc_warr_ravager : public ScriptedAI
{
    npc_warr_ravager(Creature* creature) : ScriptedAI(creature) { }

    enum eDatas
    {
        RAVAGER_DISPLAYID       = 55644,
        SPELL_RAVAGER_VISUAL    = 153709
    };

    void IsSummonedBy(Unit* summoner)
    {
        me->SetDisplayId(RAVAGER_DISPLAYID);
        me->CastSpell(me, SPELL_RAVAGER_VISUAL, true);
        me->SetReactState(ReactStates::REACT_PASSIVE);
        me->AddUnitState(UnitState::UNIT_STATE_ROOT);
        me->AddUnitFlag(UnitFlags(UNIT_FLAG_NOT_SELECTABLE |
                                        UNIT_FLAG_UNK_15 |
                                        UNIT_FLAG_PVP_ATTACKABLE));

        if (summoner == nullptr || !summoner->IsPlayer())
            return;

        if (Player* player = summoner->ToPlayer())
        {
            if (Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EquipmentSlots::EQUIPMENT_SLOT_MAINHAND))
            {
                if (ItemTemplate const* l_Proto = sObjectMgr->GetItemTemplate(item->GetModifier(ITEM_MODIFIER_TRANSMOG_APPEARANCE_ALL_SPECS)))
                    me->SetVirtualItem(0, l_Proto->GetId());
                else
                    me->SetVirtualItem(0, item->GetTemplate()->GetId());
            }

            if (Item* item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EquipmentSlots::EQUIPMENT_SLOT_OFFHAND))
            {
                if (ItemTemplate const* l_Proto = sObjectMgr->GetItemTemplate(item->GetModifier(ITEM_MODIFIER_TRANSMOG_APPEARANCE_ALL_SPECS)))
                    me->SetVirtualItem(2, l_Proto->GetId());
                else
                    me->SetVirtualItem(2, item->GetTemplate()->GetId());
            }
        }
    }
};

// 202603 Into the Fray
// MiscId - 5839
struct at_into_the_fray : AreaTriggerAI
{
    at_into_the_fray(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

    void OnUpdate(uint32 diff) override
    {
        Unit* caster = at->GetCaster();
        if (!caster)
            return;

        int32 timer = at->Variables.GetValue<int32>("_timer") + diff;
        if (timer >= 250)
        {
            at->Variables.Set<int32>("_timer", 0);
            if (uint32 count = at->GetInsideUnits().size() - 1) // -1 for self
            {
                if (!caster->HasAura(SPELL_WARRIOR_INTO_THE_FRAY))
                    caster->CastSpell(caster, SPELL_WARRIOR_INTO_THE_FRAY, true);
                if (Aura* itf = caster->GetAura(SPELL_WARRIOR_INTO_THE_FRAY))
                    itf->SetStackAmount(std::min(itf->GetMaxStackAmount(), count));
            }
            else
                caster->RemoveAurasDueToSpell(SPELL_WARRIOR_INTO_THE_FRAY);
        }
        else
            at->Variables.Set("_timer", timer);
    }
};

// 262161 Warbreaker
class spell_warr_warbreaker : public SpellScript
{
    PrepareSpellScript(spell_warr_warbreaker);

    void HandleOnHitTarget(SpellEffIndex /*effIndex*/)
    {
        if (Unit* caster = GetCaster())
        {
            if (Unit* target = GetHitUnit())
                caster->CastSpell(target, SPELL_WARRIOR_COLOSSUS_SMASH_BUFF, true);
        }
    }

    void CountTargets(std::list<WorldObject*>& targets)
    {
        if (Unit* caster = GetCaster())
        {
            if (Aura* inForTheKill = caster->GetAura(248621)) // In For The Kill
            {
                int32 hpPct = inForTheKill->GetSpellEffectInfo(EFFECT_2)->CalcValue(caster);
                int32 hastePct = inForTheKill->GetEffect(EFFECT_0)->GetAmount();
                for (std::list<WorldObject*>::const_iterator itr = targets.begin(); itr != targets.end(); ++itr)
                {
                    if (Unit* target = (*itr)->ToUnit())
                    {
                        if (target->HealthBelowPct(hpPct))
                        {
                            hastePct = inForTheKill->GetSpellEffectInfo(EFFECT_1)->CalcValue(caster);
                            break;
                        }
                    }
                }
                caster->CastCustomSpell(caster, 248622, &hastePct, nullptr, nullptr, true); // In For The Kill
            }
        }
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_warr_warbreaker::HandleOnHitTarget, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_warr_warbreaker::CountTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
    }
};

// 1680 Whirlwind
class spell_warr_wirlwind_dmg : public SpellScript
{
    PrepareSpellScript(spell_warr_wirlwind_dmg);

    void HandleOnHitTarget(SpellEffIndex /*effIndex*/)
    {
        if (Player* caster = GetCaster()->ToPlayer())
        {
            if (caster->HasAura(202316)) // Fervor of Battle
            {
                if (Unit* target = caster->GetSelectedUnit())
                {
                    if (caster->IsValidAttackTarget(target))
                    {
                        caster->CastSpell(target, SPELL_WARRIOR_SLAM_ARMS, true);
                    }
                }
            }
        }
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_warr_wirlwind_dmg::HandleOnHitTarget, EFFECT_0, SPELL_EFFECT_TRIGGER_SPELL);
    }
};

// Avatar - 107574
class spell_warr_avatar : public SpellScriptLoader
{
public:
    spell_warr_avatar() : SpellScriptLoader("spell_warr_avatar") { }

    class spell_warr_avatar_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warr_avatar_AuraScript);

        void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            if (Player* player = GetCaster()->ToPlayer())
            {
                player->RemoveMovementImpairingAuras();
            }
        }

        void Register() override
        {
            OnEffectApply += AuraEffectApplyFn(spell_warr_avatar_AuraScript::OnApply, EFFECT_0, SPELL_AURA_ADD_PCT_MODIFIER, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const
    {
        return new spell_warr_avatar_AuraScript();
    }
};


//152278 Anger Management 
class anger_management : public PlayerScript
{
public:
    anger_management() : PlayerScript("anger_management") { }

    void OnSpellCast(Player* player, Spell* spell, bool) override
    {
        if (!player->getClass() == CLASS_WARRIOR)
            return;

        if (Aura* anger = player->GetAura(SPELL_WARRIOR_ANGER_MANAGEMENT))
        {
            TalentSpecialization spec = player->GetSpecializationId();

            if (SpellPowerCost const* powerCost = spell->GetPowerCost(POWER_RAGE))
            {
                //int32 mod = powerCost->Amount * 100 / anger->GetEffect(EFFECT_0)->GetAmount();
                //int32 mod = std::max(powerCost->Amount * 100, anger->GetEffect(EFFECT_0)->GetAmount()) / 2;
                if (spec == TALENT_SPEC_WARRIOR_ARMS)
                {
                    player->GetSpellHistory()->ModifyCooldown(262161, -1000); // Warbreaker
                    player->GetSpellHistory()->ModifyCooldown(46924, -1000); // Bladestorm
                    player->GetSpellHistory()->ModifyCooldown(227847, -1000); // Bladestorm
                    player->GetSpellHistory()->ModifyCooldown(167105, -1000); // Colossus Smash
                }
                else if (spec == TALENT_SPEC_WARRIOR_FURY)
                {
                    player->GetSpellHistory()->ModifyCooldown(1719, -1000); // Recklessness
                }
                else if (spec == TALENT_SPEC_WARRIOR_PROTECTION)
                {
                    player->GetSpellHistory()->ModifyCooldown(107574, -1000); // Avatar
                    player->GetSpellHistory()->ModifyCooldown(12975, -1000); // Last Stand
                    player->GetSpellHistory()->ModifyCooldown(871, -1000); // Shield Wall
                    player->GetSpellHistory()->ModifyCooldown(1160, -1000); // Demoralizing Shout
                }
            }
        }
    }
};

//280721 Sudden Death
class spell_warr_sudden_death : public AuraScript
{
    PrepareAuraScript(spell_warr_sudden_death);

    void HandleProc(AuraEffect const* aurEff, ProcEventInfo& eventInfo)
    {
        GetTarget()->CastSpell(GetTarget(), SPELL_WARRIOR_SUDDEN_DEATH_PROC, true);
    }

    void Register() override
    {
        OnEffectProc += AuraEffectProcFn(spell_warr_sudden_death::HandleProc, EFFECT_0, SPELL_AURA_DUMMY);
    }
};

// 32215 Victorious State
class spell_warr_victorious_state : public AuraScript
{
    PrepareAuraScript(spell_warr_victorious_state);

    void HandleEffectProc(AuraEffect const* /*aurEff*/, ProcEventInfo& procInfo)
    {
        if (Unit* caster = GetCaster())
        {
            if (caster->HasSpell(202168)) // Impending Victory talent
            {
                PreventDefaultAction();
                caster->GetSpellHistory()->ResetCooldown(202168, true); // Impending Victory
            }
        }
    }

    void Register() override
    {
        OnEffectProc += AuraEffectProcFn(spell_warr_victorious_state::HandleEffectProc, EFFECT_0, SPELL_AURA_PROC_TRIGGER_SPELL);
    }
};

//280772 - Siegebreaker
class spell_warr_siegebreaker : public SpellScript
{
    PrepareSpellScript(spell_warr_siegebreaker);
    
    void HandleOnHit()
    {
        Unit* caster = GetCaster();       
        caster->CastSpell(nullptr, 280773, true);
    }

    void Register() override
    {
        OnHit += SpellHitFn(spell_warr_siegebreaker::HandleOnHit);
    }
};

//262231
class war_machine : public PlayerScript
{
public:
    war_machine() : PlayerScript("war_machine") { }

    void OnPVPKill(Player* killer, Player* killed) 
    { 
        if (killer->getClass() != CLASS_WARRIOR)
            return;

        if (killer->HasAura(SPELL_WARRIOR_WAR_MACHINE))
        {
            if (!killer->HasAura(SPELL_WARRRIOR_WAR_MACHINE_BUFF))
            {
                killer->CastSpell(nullptr, SPELL_WARRRIOR_WAR_MACHINE_BUFF, true);
            }
        }
    }

    void OnCreatureKill(Player* killer, Creature* killed)
    { 
        if (killer->getClass() != CLASS_WARRIOR)
            return;

        if (killer->HasAura(SPELL_WARRIOR_WAR_MACHINE))
        {
            if (!killer->HasAura(SPELL_WARRRIOR_WAR_MACHINE_BUFF))
            {
                killer->CastSpell(nullptr, SPELL_WARRRIOR_WAR_MACHINE_BUFF, true);
            }
        }
          
               
    }
};

//119052
struct npc_warr_banner : public ScriptedAI
{
    npc_warr_banner(Creature* creature) : ScriptedAI(creature)
    {
        Initialize();
    }

private:
    uint32 Timer;

    void Initialize()
    {
        Timer = 0;
    }

    void IsSummonedBy(Spell const* summonSpell) override
    {
        me->SetReactState(REACT_PASSIVE);
        me->GetOwnerGUID();
    }

    void UpdateAI(uint32 diff) override
    {
        if (Timer <= diff)
        {
            if (Unit* owner = me->GetOwner())
            {
                me->SetLevel(owner->getLevel());
                std::list<Unit*> allies;
                me->GetFriendlyUnitListInRange(allies, 30.0f, true);
                for (auto& targets : allies)
                {
                    if (targets->IsFriendlyTo(owner) && targets->IsPlayer())
                    {
                        if (!targets->HasAura(SPELL_WARRIOR_WAR_BANNER_BUFF))
                            targets->AddAura(SPELL_WARRIOR_WAR_BANNER_BUFF);

                        targets->GetScheduler().Schedule(15s, [this, targets](TaskContext context)
                        {
                            if (!targets)
                                return;

                            targets->RemoveAura(SPELL_WARRIOR_WAR_BANNER_BUFF);
                        });
                        Timer = 1000;
                    }                    
                }
            }
            else Timer -= diff;
        }
    }
};

//197690
class spell_defensive_state : public AuraScript
{
    PrepareAuraScript(spell_defensive_state);

    void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        if (Unit* caster = GetCaster())
            if (AuraEffect* defensiveState = caster->GetAura(197690)->GetEffect(0))
                defensiveState->GetAmount();
    }

    void Register() override
    {
        OnEffectApply += AuraEffectApplyFn(spell_defensive_state::OnApply, EFFECT_0, SPELL_AURA_MOD_DAMAGE_PERCENT_TAKEN, AURA_EFFECT_HANDLE_REAL);
    }
};

void AddSC_warrior_spell_scripts()
{
    new spell_warr_avatar();
    new spell_warr_berzerker_rage();
    new spell_warr_bladestorm();
    new spell_warr_bladestorm_new();
    new spell_warr_bladestorm_offhand();
    RegisterSpellScript(spell_warr_bloodthirst);
    new spell_warr_blood_bath();
    RegisterSpellScript(spell_warr_charge);
    RegisterAuraScript(spell_warr_charge_drop_fire_periodic);
    RegisterSpellScript(spell_warr_charge_effect);
    new spell_warr_colossus_smash();
    new spell_warr_defensive_stance();
    new spell_warr_devastate();
    new spell_warr_dragon_roar();
    new spell_warr_enrage();
    RegisterAuraScript(spell_warr_enrage_aura);
    new spell_warr_focused_rage_arms();
    new spell_warr_focused_rage_prot();
    new spell_warr_frenzy();
    new spell_warr_frothing_berserker();
    new spell_warr_heroic_leap();
    RegisterSpellAndAuraScriptPair(spell_warr_ignore_pain, aura_warr_ignore_pain);
    RegisterSpellScript(spell_warr_impending_victory);
    new spell_warr_intercept();
    new spell_warr_intimidating_shout();
    new spell_warr_last_stand();
    new spell_warr_massacre();
    new spell_warr_meat_cleaver();
    new spell_warr_mortal_strike();
    new spell_warr_odyns_fury();
    new spell_warr_opportunity_strike();
    new spell_warr_overpower();
    RegisterSpellScript(spell_warr_raging_blow);
    RegisterSpellScript(spell_warr_rampage);
    new spell_warr_rend();
    new spell_warr_safeguard();
    new spell_warr_second_wind_damaged();
    new spell_warr_second_wind_proc();
    new spell_warr_shattering_throw();
    new spell_warr_shield_block();
    new spell_warr_shield_slam();
    new spell_warr_shockwave();
    RegisterSpellScript(spell_warr_slam);
    new spell_warr_spell_reflect();
    new spell_warr_storm_bolt();
    new spell_warr_sweeping_strikes();    
    new spell_warr_tactician();
    new spell_warr_taste_for_blood();
    new spell_warr_thunder_clap();
    new spell_warr_trauma();
    new spell_warr_unshackled_fury();
    new spell_warr_unrivaled_strenght();
    new spell_warr_victorious();
    new spell_warr_victory_rush();
    new spell_warr_victory_rush_heal();
    RegisterSpellScript(spell_warr_whirlwind);
    new spell_warr_wrecking_ball_effect();
    RegisterSpellScript(spell_warr_warbreaker);
    new spell_warr_rallying_cry();
    new spell_warr_jump_to_skyhold();
    RegisterSpellScript(spell_warr_commanding_shout);
    RegisterSpellAndAuraScriptPair(spell_warr_ravager, aura_warr_ravager);
    RegisterSpellScript(spell_warr_ravager_damage);
    RegisterSpellScript(spell_warr_execute);
    RegisterSpellScript(spell_warr_execute_damages);
    RegisterAuraScript(aura_warr_war_machine);
    RegisterSpellScript(spell_warr_wirlwind_dmg);
    RegisterPlayerScript(anger_management);
    RegisterAuraScript(spell_warr_sudden_death);
    RegisterAreaTriggerAI(at_into_the_fray);
    RegisterCreatureAI(npc_warr_ravager);
    RegisterAuraScript(spell_warr_victorious_state);
	RegisterAuraScript(aura_warr_victorious);
    RegisterSpellScript(spell_warr_victory_rush);
    RegisterSpellScript(spell_warr_siegebreaker);
    RegisterPlayerScript(war_machine);
    RegisterCreatureAI(npc_warr_banner);
    RegisterAuraScript(spell_defensive_state);
}
