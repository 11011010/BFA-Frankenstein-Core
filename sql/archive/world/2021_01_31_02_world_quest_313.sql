-- Fix Quest Forced to Watch from Afar
-- Fix Creature Mountaineer Valgrum
UPDATE creature_template SET ScriptName="" WHERE entry= 41056;
SET @ENTRY := 41056;
DELETE FROM smart_scripts WHERE entryOrGuid = 41056;
UPDATE creature_template SET AIName="SmartAI" WHERE entry= @ENTRY;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(@ENTRY, 0, 0, 0, 62, 0, 100, 0, 11457, 0, 0, 0, 33, 41056, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "On gossip action 0 from menu 11457 selected - Action invoker: Give kill credit Mountaineer Valgrum"),
(@ENTRY, 0, 1, 0, 62, 0, 100, 0, 11457, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On gossip action 0 from menu 11457 selected - Self: Talk 0 to invoker");

-- Fix Creature Mountaineer Lewin
SET @ENTRY := 40994;
DELETE FROM smart_scripts WHERE entryOrGuid = 40994;
UPDATE creature_template SET AIName="SmartAI" WHERE entry= @ENTRY;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(@ENTRY, 0, 0, 0, 62, 0, 100, 0, 11456, 0, 0, 0, 33, 40994, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "On gossip action 0 from menu 11456 selected - Action invoker: Give kill credit Mountaineer Lewin"),
(@ENTRY, 0, 1, 0, 62, 0, 100, 0, 11456, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On gossip action 0 from menu 11456 selected - Self: Talk 0 to invoker");

-- Fix Creature Mountaineer Dunstan
SET @ENTRY := 40991;
DELETE FROM smart_scripts WHERE entryOrGuid = 40991;
UPDATE creature_template SET AIName="SmartAI" WHERE entry= @ENTRY;
INSERT INTO smart_scripts (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
(@ENTRY, 0, 0, 0, 62, 0, 100, 0, 11455, 0, 0, 0, 33, 40991, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "On gossip action 0 from menu 11455 selected - Action invoker: Give kill credit Mountaineer Dunstan"),
(@ENTRY, 0, 1, 0, 62, 0, 100, 0, 11455, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On gossip action 0 from menu 11455 selected - Self: Talk 0 to invoker");




