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


    float reductionPercentage = 0.2f; // 20% reduction
    
    if (player->getRace() == RACE_NIGHTBORNE || 
        player->getRace() == RACE_HIGHMOUNTAIN_TAUREN || 
        player->getRace() == RACE_VOID_ELF || 
        player->getRace() == RACE_LIGHTFORGED_DRAENEI || 
        player->getRace() == RACE_DARK_IRON_DWARF || 
        player->getRace() == RACE_MAGHAR_ORC)
    {
        float reducedAmount = amount * (1 - reductionPercentage);        
        amount = static_cast<uint32>(reducedAmount);    
    }


    
    // No reduction for other races

			
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