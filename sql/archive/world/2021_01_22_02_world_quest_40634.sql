-- fix quest Thunder on the Sands
-- Update creature_template
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 100556;
UPDATE `creature_template` SET `minlevel` = '110' WHERE `entry` = 100556;
UPDATE `creature_template` SET `maxlevel` = '110' WHERE `entry` = 100556;
UPDATE `creature_template` SET `faction` = '16' WHERE `entry` = 100556;
UPDATE `creature_template` SET `unit_flags` = '32832' AND `unit_flags2` = '2048'  WHERE `entry` = 100556;
-- Add Smart Script Text
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = 100556);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(100556, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC - Say Text'),
(100556, 0, 1, 0, 6, 0, 100, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Death - Say Text');
-- Add Text
DELETE FROM `creature_text` WHERE (`CreatureID` = 100556);
INSERT INTO `creature_text`(`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES (100556, 0, 0, 'Filthy $r, I\'ll bring your head to lord Typhinius!', 12, 0, 100, 0, 0, 0, 103427, 0, 'Nader to Player');
INSERT INTO `creature_text`(`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES (100556, 1, 0, 'Lord Typhinius... I have failed you...', 12, 0, 100, 0, 0, 0, 103428, 0, 'Nader to Player');
-- Spawn Creature
DELETE FROM `creature` WHERE (`id` = 100556);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `PhaseId`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(3530203330003114, 100556, 1, 5034, 5647, 0, 0, 0, -8620.68, -384.698, 196.491, 2.9795, 180, 0, 0, 0, 0, 0, 0, 0, 0);