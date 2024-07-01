-- Creature Skinnable
-- Silverback Thumpknuckle
UPDATE `creature_template` SET `unit_flags` = 67141696  WHERE (`entry` = 130543);
-- Juvenile Thumpknuckle
UPDATE `creature_template` SET `unit_flags` = 67141632  WHERE (`entry` = 130512);
-- Wild Thumpknuckle
UPDATE `creature_template` SET `unit_flags` = 67141632  WHERE (`entry` = 130486);
 -- Sabertusk Empress
UPDATE `creature_template` SET `unit_flags` = 67141696  WHERE (`entry` = 129323);
-- Sabertusk Cub
UPDATE `creature_template` SET `unit_flags` = 67141632  WHERE (`entry` = 129338);
-- Sabertusk
UPDATE `creature_template` SET `unit_flags` = 67141696  WHERE (`entry` = 129337);
-- Brutosaur
UPDATE `creature_template` SET `unit_flags` = 67108928  WHERE (`entry` = 131630);
-- Wild Direhorn
UPDATE `creature_template` SET `unit_flags` = 67141632  WHERE (`entry` = 131626);
-- Direhorn Bull
UPDATE `creature_template` SET `unit_flags` = 67141696  WHERE (`entry` = 131628);
-- Southern Sabertusk
UPDATE `creature_template` SET `unit_flags` = 67141632  WHERE (`entry` = 140664);
-- Pterrordax
UPDATE `creature_template` SET `unit_flags` = 67141696  WHERE (`entry` = 122114);
-- Irritable Diemetradon
UPDATE `creature_template` SET `unit_flags` = 67141632  WHERE (`entry` = 126562);
-- Pinky
UPDATE `creature_template` SET `unit_flags` = 67141632  WHERE (`entry` = 126509);
-- Savagemane Ravasaur
UPDATE `creature_template` SET `unit_flags` = 67141632  WHERE (`entry` = 122504);
-- Invasive Eggsnatcher
UPDATE `creature_template` SET `unit_flags` = 67141632  WHERE (`entry` = 139326);
-- Direhorn Cow
UPDATE `creature_template` SET `unit_flags` = 67141632  WHERE (`entry` = 122060);
-- Young Savagelands Devilsaur
UPDATE `creature_template` SET `unit_flags` = 67141632  WHERE (`entry` = 139703);
-- Direhorn Calf
UPDATE `creature_template` SET `unit_flags` = 67141632  WHERE (`entry` = 134066);
-- Adolescent Direhorn
UPDATE `creature_template` SET `unit_flags` = 67141632  WHERE (`entry` = 130712);
-- Savagelands Devilsaur
UPDATE `creature_template` SET `unit_flags` = 67141696  WHERE (`entry` = 139706);
-- Muddy Riverbeast
UPDATE `creature_template` SET `unit_flags` = 67108864  WHERE (`entry` = 123651);
-- Riverbeast Calf
UPDATE `creature_template` SET `unit_flags` = 67141632  WHERE (`entry` = 130771);
-- King K'tal
UPDATE `creature_template` SET `unit_flags` = 67141632  WHERE (`entry` = 123502);
-- Pterrordax Skyrender
UPDATE `creature_template` SET `unit_flags` = 67141632  WHERE (`entry` = 122113);
-- Horned Leguaan
UPDATE `creature_template` SET `unit_flags` = 67141632  WHERE (`entry` = 133862);

-- King K'tal fix multi Spawn
DELETE FROM `creature` WHERE (`id` = 123502) AND (`guid` IN (210409599, 210408862, 210405365, 210404434));

-- Young Savagelands Devilsaur set faction to monster
UPDATE `creature_template` SET `faction` = 14  WHERE (`entry` = 139703);

-- Bramblewing fix multi spawn
DELETE FROM `creature` WHERE (`id` = 131718) AND (`guid` IN (210405268, 210405226));