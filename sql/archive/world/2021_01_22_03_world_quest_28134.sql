-- fix quest Impending Retribution
-- Sun Priest Asaris Update creature_template
UPDATE `creature_template` SET `gossip_menu_id` = '47715' WHERE `entry` = 47715;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 47715;

-- Add smart scripts to Sun Priest Asaris
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = 47715);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(47715, 0, 0, 1, 62, 0, 100, 0, 47715, 0, 0, 0, 33, 47933, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On gossip select - Give credit'),
(47715, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Close gossip');

-- add gossip_menu to Sun Priest Asaris
DELETE FROM `gossip_menu_option` WHERE (`MenuId` = 47715);
INSERT INTO `gossip_menu_option`(`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES (47715, 0, 0, 'I might be able to help. Were the Neferset behind this?', 0, 1, 1, 0);

-- only gossip can see you have quest 28134
DELETE FROM `conditions` WHERE (`SourceGroup` = 47715);
INSERT INTO `conditions`(`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (15, 47715, 0, 0, 0, 9, 0, 28134, 0, 0, 0, 0, '', 'gossip only if have quest 28134');


-- Nomarch Teneth Update creature_template
UPDATE `creature_template` SET `gossip_menu_id` = '46603' WHERE `entry` = 46603;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 46603;

-- Add smart scripts to Nomarch Teneth
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = 46603);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(46603, 0, 0, 1, 62, 0, 100, 0, 46603, 0, 0, 0, 33, 47932, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On gossip select - Give credit'),
(46603, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Close gossip');

-- add gossip_menu to Nomarch Teneth
DELETE FROM `gossip_menu_option` WHERE (`MenuId` = 46603);
INSERT INTO `gossip_menu_option`(`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES (46603, 0, 0, 'King Phaoris sent me to ask you about Neferset activity.', 0, 1, 1, 0);

-- only gossip can see you have quest 28134
DELETE FROM `conditions` WHERE (`SourceGroup` = 46603);
INSERT INTO `conditions`(`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (15, 46603, 0, 0, 0, 9, 0, 28134, 0, 0, 0, 0, '', 'gossip only if have quest 28134');


-- Asaq Update creature_template
UPDATE `creature_template` SET `gossip_menu_id` = '47930' WHERE `entry` = 47930;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 47930;

-- Add smart scripts to Asaq
DELETE FROM `smart_scripts` WHERE (`source_type` = 0 AND `entryorguid` = 47930);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(47930, 0, 0, 1, 62, 0, 100, 0, 47930, 0, 0, 0, 33, 47936, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On gossip select - Give credit'),
(47930, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Close gossip');

-- add gossip_menu to Asaq
DELETE FROM `gossip_menu_option` WHERE (`MenuId` = 47930);
INSERT INTO `gossip_menu_option`(`MenuId`, `OptionIndex`, `OptionIcon`, `OptionText`, `OptionBroadcastTextId`, `OptionType`, `OptionNpcFlag`, `VerifiedBuild`) VALUES (47930, 0, 0, 'King Phaoris sent me to ask you about Neferset activity.', 0, 1, 1, 0);

-- only gossip can see you have quest 28134
DELETE FROM `conditions` WHERE (`SourceGroup` = 47930);
INSERT INTO `conditions`(`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (15, 47930, 0, 0, 0, 9, 0, 28134, 0, 0, 0, 0, '', 'gossip only if have quest 28134');
