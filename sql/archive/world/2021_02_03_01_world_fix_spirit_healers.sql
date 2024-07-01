UPDATE `creature_template` SET `gossip_menu_id` = 0, `npcflag` = 16385, `InhabitType` = 4, unit_flags=768, unit_flags2=2048 WHERE `name` = 'Spirit Healer';

UPDATE creature_template_addon SET bytes1=0 WHERE entry IN
(29259,32537,39660,65183,72676,88148,92355,94070,112180,104689,115774,133783,6491,144412,126141,163311,163310,158175,173514);

