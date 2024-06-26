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

#include "ScriptMgr.h"
#include "BattlegroundSA.h"
#include "BattlegroundIC.h"
#include "Creature.h"
#include "Player.h"

class achievement_resilient_victory : public AchievementCriteriaScript
{
    public:
        achievement_resilient_victory() : AchievementCriteriaScript("achievement_resilient_victory") { }

        bool OnCheck(Player* source, Unit* target) override
        {
            if (Battleground* bg = source->GetBattleground())
                return bg->CheckAchievementCriteriaMeet(BG_CRITERIA_CHECK_RESILIENT_VICTORY, source, target);

            return false;
        }
};

class achievement_bg_control_all_nodes : public AchievementCriteriaScript
{
    public:
        achievement_bg_control_all_nodes() : AchievementCriteriaScript("achievement_bg_control_all_nodes") { }

        bool OnCheck(Player* source, Unit* /*target*/) override
        {
            if (Battleground* bg = source->GetBattleground())
                return bg->IsAllNodesControlledByTeam(source->GetTeam());

            return false;
        }
};

class achievement_save_the_day : public AchievementCriteriaScript
{
    public:
        achievement_save_the_day() : AchievementCriteriaScript("achievement_save_the_day") { }

        bool OnCheck(Player* source, Unit* target) override
        {
            if (Battleground* bg = source->GetBattleground())
                return bg->CheckAchievementCriteriaMeet(BG_CRITERIA_CHECK_SAVE_THE_DAY, source, target);

            return false;
        }
};

class achievement_bg_ic_resource_glut : public AchievementCriteriaScript
{
    public:
        achievement_bg_ic_resource_glut() : AchievementCriteriaScript("achievement_bg_ic_resource_glut") { }

        bool OnCheck(Player* source, Unit* /*target*/) override
        {
            if (source->HasAura(SPELL_OIL_REFINERY) && source->HasAura(SPELL_QUARRY))
                return true;

            return false;
        }
};

class achievement_bg_ic_glaive_grave : public AchievementCriteriaScript
{
    public:
        achievement_bg_ic_glaive_grave() : AchievementCriteriaScript("achievement_bg_ic_glaive_grave") { }

        bool OnCheck(Player* source, Unit* /*target*/) override
        {
            if (Creature* vehicle = source->GetVehicleCreatureBase())
            {
                if (vehicle->GetEntry() == NPC_GLAIVE_THROWER_H ||  vehicle->GetEntry() == NPC_GLAIVE_THROWER_A)
                    return true;
            }

            return false;
        }
};

class achievement_bg_ic_mowed_down : public AchievementCriteriaScript
{
    public:
        achievement_bg_ic_mowed_down() : AchievementCriteriaScript("achievement_bg_ic_mowed_down") { }

        bool OnCheck(Player* source, Unit* /*target*/) override
        {
            if (Creature* vehicle = source->GetVehicleCreatureBase())
            {
                if (vehicle->GetEntry() == NPC_KEEP_CANNON)
                    return true;
            }

            return false;
        }
};

class achievement_bg_sa_artillery : public AchievementCriteriaScript
{
    public:
        achievement_bg_sa_artillery() : AchievementCriteriaScript("achievement_bg_sa_artillery") { }

        bool OnCheck(Player* source, Unit* /*target*/) override
        {
            if (Creature* vehicle = source->GetVehicleCreatureBase())
            {
                if (vehicle->GetEntry() == NPC_ANTI_PERSONNAL_CANNON)
                    return true;
            }

            return false;
        }
};

class achievement_arena_kills : public AchievementCriteriaScript
{
    public:
        achievement_arena_kills(char const* name, uint8 arenaType) : AchievementCriteriaScript(name),
            _arenaType(arenaType)
        {
        }

        bool OnCheck(Player* source, Unit* /*target*/) override
        {
            // this checks GetBattleground() for NULL already
            if (!source->InArena())
                return false;

            return source->GetBattleground()->GetArenaType() == _arenaType;
        }

    private:
        uint8 const _arenaType;
};

class achievement_sickly_gazelle : public AchievementCriteriaScript
{
public:
    achievement_sickly_gazelle() : AchievementCriteriaScript("achievement_sickly_gazelle") { }

    bool OnCheck(Player* /*source*/, Unit* target) override
    {
        if (!target)
            return false;

        if (Player* victim = target->ToPlayer())
            if (victim->IsMounted())
                return true;

        return false;
    }
};

class achievement_everything_counts : public AchievementCriteriaScript
{
    public:
        achievement_everything_counts() : AchievementCriteriaScript("achievement_everything_counts") { }

        bool OnCheck(Player* source, Unit* target) override
        {
            if (Battleground* bg = source->GetBattleground())
                return bg->CheckAchievementCriteriaMeet(BG_CRITERIA_CHECK_EVERYTHING_COUNTS, source, target);

            return false;
        }
};

class achievement_bg_av_perfection : public AchievementCriteriaScript
{
    public:
        achievement_bg_av_perfection() : AchievementCriteriaScript("achievement_bg_av_perfection") { }

        bool OnCheck(Player* source, Unit* target) override
        {
            if (Battleground* bg = source->GetBattleground())
                return bg->CheckAchievementCriteriaMeet(BG_CRITERIA_CHECK_AV_PERFECTION, source, target);

            return false;
        }
};

class achievement_bg_sa_defense_of_ancients : public AchievementCriteriaScript
{
    public:
        achievement_bg_sa_defense_of_ancients() : AchievementCriteriaScript("achievement_bg_sa_defense_of_ancients") { }

        bool OnCheck(Player* source, Unit* target) override
        {
            if (Battleground* bg = source->GetBattleground())
                return bg->CheckAchievementCriteriaMeet(BG_CRITERIA_CHECK_DEFENSE_OF_THE_ANCIENTS, source, target);

            return false;
        }
};

class achievement_tilted : public AchievementCriteriaScript
{
    public:
        achievement_tilted() : AchievementCriteriaScript("achievement_tilted") { }

        bool OnCheck(Player* player, Unit* /*target*/) override
        {
            if (!player)
                return false;

            bool checkArea = player->GetAreaId() == AREA_ICECROWN_ARGENT_TOURNAMENT_FIELDS ||
                                player->GetAreaId() == AREA_ICECROWN_RING_OF_ASPIRANTS ||
                                player->GetAreaId() == AREA_ICECROWN_RING_OF_ARGENT_VALIANTS ||
                                player->GetAreaId() == AREA_ICECROWN_RING_OF_ALLIANCE_VALIANTS ||
                                player->GetAreaId() == AREA_ICECROWN_RING_OF_HORDE_VALIANTS ||
                                player->GetAreaId() == AREA_ICECROWN_RING_OF_CHAMPIONS;

            return checkArea && player->duel && player->duel->isMounted;
        }
};

class achievement_not_even_a_scratch : public AchievementCriteriaScript
{
    public:
        achievement_not_even_a_scratch() : AchievementCriteriaScript("achievement_not_even_a_scratch") { }

        bool OnCheck(Player* source, Unit* target) override
        {
            if (Battleground* bg = source->GetBattleground())
                return bg->CheckAchievementCriteriaMeet(BG_CRITERIA_CHECK_NOT_EVEN_A_SCRATCH, source, target);

            return false;
        }
};

enum FlirtWithDisaster
{
    AURA_PERFUME_FOREVER           = 70235,
    AURA_PERFUME_ENCHANTRESS       = 70234,
    AURA_PERFUME_VICTORY           = 70233,
};

class achievement_flirt_with_disaster_perf_check : public AchievementCriteriaScript
{
    public:
        achievement_flirt_with_disaster_perf_check() : AchievementCriteriaScript("achievement_flirt_with_disaster_perf_check") { }

        bool OnCheck(Player* player, Unit* /*target*/) override
        {
            if (!player)
                return false;

            if (player->HasAura(AURA_PERFUME_FOREVER) || player->HasAura(AURA_PERFUME_ENCHANTRESS) || player->HasAura(AURA_PERFUME_VICTORY))
                return true;

            return false;
        }
};

class achievement_killed_exp_or_honor_target : public AchievementCriteriaScript
{
    public:
        achievement_killed_exp_or_honor_target() : AchievementCriteriaScript("achievement_killed_exp_or_honor_target") { }

        bool OnCheck(Player* player, Unit* target) override
        {
            return target && player->isHonorOrXPTarget(target);
        }
};


class achievement_a_test_of_valor : public AchievementCriteriaScript
{
public:
    achievement_a_test_of_valor() : AchievementCriteriaScript("achievement_a_test_of_valor") { }

    bool OnCheck(Player* source, Unit* /*target*/) override
    {
        if (source->GetQuestStatus(32474) == QUEST_STATUS_INCOMPLETE || source->GetQuestStatus(32476) == QUEST_STATUS_INCOMPLETE)
            return true;

        return false;
    }
};

//BG: Deepwind Gorge. Achiev: Weighed Down
class achievement_weighed_down : public AchievementCriteriaScript
{
public:
    achievement_weighed_down() : AchievementCriteriaScript("achievement_weighed_down") {}

    bool OnCheck(Player* player, Unit* target) override
    {
        if (!player)
            return false;

        if (target->HasAura(140876))
            return true;

        if (AchievementEntry const* achiev = sAchievementStore.LookupEntry(8355))
            if (!player->HasAchieved(8355))
                player->CompletedAchievement(achiev);

        return false;
    }
};

//37930
class achievement_kill_antoran_demons : public AchievementCriteriaScript
{
public:
    achievement_kill_antoran_demons() : AchievementCriteriaScript("achievement_kill_antoran_demons") { }

    bool OnCheck(Player* source, Unit* target) override
    {
        if (!target)
            return false;

        if (auto cre = target->ToCreature())
            if (cre->GetMapId() == 1669 && cre->GetCreatureType() == CREATURE_TYPE_DEMON)
                return true;

        return false;
    }
};

//24823
class achievement_almost_blink_luck : public AchievementCriteriaScript
{
public:
    achievement_almost_blink_luck() : AchievementCriteriaScript("achievement_almost_blink_luck") { }

    bool OnCheck(Player* source, Unit* target) override
    {
        if (!source)
            return false;

        if (source->HasAura(65607))
          //  if (IsEventActive(24))
                return true;

        return false;
    }
};

//17836
class achievement_master_of_the_molten_flow : public AchievementCriteriaScript
{
public:
    achievement_master_of_the_molten_flow() : AchievementCriteriaScript("achievement_master_of_the_molten_flow") { }

    bool OnCheck(Player* source, Unit* target) override
    {
        if (!target)
            return false;

        if (auto npc = target->ToCreature())
            if (npc->IsAIEnabled && npc->AI()->GetData(1))
                return true;

        return false;
    }
};

//19825
class achievement_run_with_the_wind : public AchievementCriteriaScript
{
public:
    achievement_run_with_the_wind() : AchievementCriteriaScript("achievement_run_with_the_wind") { }

    bool OnCheck(Player* source, Unit* target) override
    {
        if (!source)
            return false;

        if (source->HasAura(125146))
            return true;

        return false;
    }
};

void AddSC_achievement_scripts()
{
    new achievement_resilient_victory();
    new achievement_bg_control_all_nodes();
    new achievement_save_the_day();
    new achievement_bg_ic_resource_glut();
    new achievement_bg_ic_glaive_grave();
    new achievement_bg_ic_mowed_down();
    new achievement_bg_sa_artillery();
    new achievement_sickly_gazelle();
    new achievement_everything_counts();
    new achievement_bg_av_perfection();
    new achievement_arena_kills("achievement_arena_2v2_kills", SLOT_ARENA_2V2);
    new achievement_arena_kills("achievement_arena_3v3_kills", SLOT_ARENA_3V3);
    new achievement_arena_kills("achievement_arena_5v5_kills", SLOT_ARENA_5V5);
    new achievement_bg_sa_defense_of_ancients();
    new achievement_tilted();
    new achievement_not_even_a_scratch();
    new achievement_flirt_with_disaster_perf_check();
    new achievement_killed_exp_or_honor_target();
    new achievement_a_test_of_valor();
    new achievement_weighed_down();
    new achievement_kill_antoran_demons();
    new achievement_almost_blink_luck();
    new achievement_master_of_the_molten_flow();
    new achievement_run_with_the_wind();
}
