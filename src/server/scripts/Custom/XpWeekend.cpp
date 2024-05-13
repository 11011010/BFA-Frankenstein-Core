#include "Player.h"
#include "ScriptMgr.h"
#include "Chat.h"
#include "World.h"
#include "boost/date_time.hpp"
#include "Config.h"

    class XpWeekend : public PlayerScript
    {
    public:
        XpWeekend() : PlayerScript("XpWeekend") { }
        void OnGiveXP(Player* player, uint32& amount, Unit* victim)override
        {
			uint32 reduction = 0.8f;
		   	if (player->getRace() == RACE_NIGHTBORNE)
                amount = amount * reduction;
             if (player->getRace() == RACE_HIGHMOUNTAIN_TAUREN)
                 amount = amount * reduction;
             if (player->getRace() == RACE_VOID_ELF)
                 amount = amount * reduction;
             if (player->getRace() == RACE_LIGHTFORGED_DRAENEI)
                 amount = amount * reduction;;
             if (player->getRace() == RACE_DARK_IRON_DWARF)
                 amount = amount * reduction;
             if (player->getRace() == RACE_MAGHAR_ORC)
                 amount = amount * reduction;
			
            if (sConfigMgr->GetBoolDefault("DynamicXP.Enable", true))
            {
                boost::gregorian::date date(boost::gregorian::day_clock::local_day());
                auto day = date.day_of_week();
                if (day == boost::date_time::Friday ||
                    day == boost::date_time::Saturday ||
                    day == boost::date_time::Sunday) {

                    amount = amount * 1.5;
                }
            }
        }
        void OnLogin(Player* player, bool firstLogin)
        {
            if (sConfigMgr->GetBoolDefault("DynamicXP.Enable", true))
            {
                boost::gregorian::date date(boost::gregorian::day_clock::local_day());
                auto day = date.day_of_week();
                if (day == boost::date_time::Friday ||
                    day == boost::date_time::Saturday ||
                    day == boost::date_time::Sunday) {

                    ChatHandler(player->GetSession()).PSendSysMessage("On Weekends xp gained is increased by 50%");
                }
            }
        }

    };

void AddSC_XpWeekend()
{
    new XpWeekend();
}