/*Hdeste70 Fix Quest 24999*/
SET @ENTRY := 38937;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,23,0,100,512,73133,3,9999,9999,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Tadpole - Tetard - Has Aura x3 - Die"),
(@ENTRY,0,1,0,6,0,100,512,0,0,0,0,33,38937,0,0,0,0,0,18,15,0,0,0,0,0,0,"Vile Fin Tadpole - Tetard - On Death - KillCredit");
