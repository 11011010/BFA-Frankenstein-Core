-- Fix Problem with aura 78517
SET @ENTRY := 135064;
DELETE FROM smart_scripts WHERE entryOrGuid = 135064 AND source_type = 0;
UPDATE creature_template SET AIName="SmartAI" WHERE entry= @ENTRY;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(@ENTRY, 0, 0, 1, 62, 0, 100, 0, 21990, 1, 0, 0, 33, 137839, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "On gossip action 1 from menu 21990 selected - Action invoker: Give kill credit Kul Tiran Rowboat"),
(@ENTRY, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 33, 137875, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "On link - Action invoker: Give kill credit Kill Credit: Taelia at Boralus Docks"),
(@ENTRY, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 62, 1643, 0, 0, 0, 0, 0, 7, 0, 0, 0, 511.478, -435.6, 0.318, 3.9806, "On link - Teleport Action invoker to (511,478, -435,6, 0,318, 3,9806) on map 1643"),
(@ENTRY, 0, 3, 4, 62, 0, 100, 0, 21990, 2, 0, 0, 33, 138116, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "On gossip action 2 from menu 21990 selected - Action invoker: Give kill credit Credit - Ferry Taken"),
(@ENTRY, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 62, 1643, 0, 0, 0, 0, 0, 7, 0, 0, 0, -133.1, 1758.74, 1.05483, 2.41917, "On link - Teleport Action invoker to (-133,1, 1758,74, 1,05483, 2,41917) on map 1643");
-- Only Gossip can see on quest The Missing Fleet and The Vanishing Lord
DELETE FROM `conditions` WHERE (`SourceGroup` = 21990);
INSERT INTO `conditions`(`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (15, 21990, 1, 0, 0, 9, 0, 47952, 0, 0, 0, 0, '', 'gossip only if have quest 48622');
INSERT INTO `conditions`(`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (15, 21990, 2, 0, 0, 9, 0, 48622, 0, 0, 0, 0, '', 'gossip only if have quest 48622');

