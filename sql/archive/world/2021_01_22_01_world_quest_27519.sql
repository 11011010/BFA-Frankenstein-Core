-- fix quest Under the Choking Sands 
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 45715;
UPDATE `creature_template` SET `npcflag` = '1' WHERE `entry` = 45715;
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = 45715);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(45715, 0, 0, 1, 64, 0, 100, 0, 0, 0, 0, 0, 33, 45715, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On gossip hello credit for quest 27519'),
(45715, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Orsis Survivor - despawn');