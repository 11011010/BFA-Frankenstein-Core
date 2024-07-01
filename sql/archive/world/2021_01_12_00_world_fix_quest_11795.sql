-- Fizzcrank Recon Pilot SAI
-- Fix Quest Emergency Protocol: Section 8.2, Paragraph C
SET @ENTRY := 25841;
UPDATE `creature_template` SET `AIName`="SmartAI" , `scriptname` ="" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,512,0,0,0,0,82,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fizzcrank Recon Pilot - On spawn - set gossip flag"),
(@ENTRY,0,1,2,62,0,100,512,9190,1,0,0,11,46362,2,0,0,0,0,7,0,0,0,0,0,0,0,"Fizzcrank Recon Pilot - On gossip option 0 select - cast spell"),
(@ENTRY,0,2,3,61,0,100,512,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Fizzcrank Recon Pilot - close gossip"),
(@ENTRY,0,3,7,61,0,100,512,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fizzcrank Recon Pilot - remove gossip flag"),
(@ENTRY,0,4,5,62,0,100,512,9190,0,0,0,11,46166,2,0,0,0,0,7,0,0,0,0,0,0,0,"Fizzcrank Recon Pilot - cast spell"),
(@ENTRY,0,5,6,61,0,100,512,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Fizzcrank Recon Pilot - close gossip"),
(@ENTRY,0,6,7,61,0,100,512,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fizzcrank Recon Pilot - remove gossip flag"),
(@ENTRY,0,7,0,61,0,100,512,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fizzcrank Recon Pilot - Despawn");