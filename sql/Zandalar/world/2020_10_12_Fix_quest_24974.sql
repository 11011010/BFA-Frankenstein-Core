/*Hdeste70 Fix Quest 24974 */
SET @ENTRY := 1543;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Puddlejumper - Between 0-15% Health - Flee For Assist (No Repeat)"),
(@ENTRY,0,1,2,2,0,100,1,0,15,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Puddlejumper - Between 0-15% Health - Say Line 0 (No Repeat)"),
(@ENTRY,0,2,3,4,0,100,1,0,0,0,0,11,75002,0,0,0,0,0,2,0,0,0,0,0,0,0,"Vile Fin Puddlejumper - On Aggro - Cast 'Leaping Rush' (No Repeat)"),
(@ENTRY,0,3,4,8,0,100,0,73108,0,0,0,85,73109,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Puddlejumper - On Spellhit 'Murloc Leash' - Invoker Cast 'Summon Captured Vile Fin Puddlejumper'"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,33,38923,0,0,0,0,0,7,0,0,0,0,0,0,0,"Quest Kredit Kill Monster on Spell Hit"),
(@ENTRY,0,5,0,61,0,100,0,73108,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Puddlejumper - On Spellhit 'Murloc Leash' - Despawn Instant");
SET @ENTRY := 1544;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,2,0,100,0,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Between 0-15% Health - Flee For Assist (No Repeat)-1"),
(@ENTRY,0,1,2,61,0,100,0,0,15,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Between 0-15% Health - Say Line 0 (No Repeat)-2"),
(@ENTRY,0,2,3,0,0,100,0,0,0,3400,4700,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - In Combat - Cast 'Lightning Bolt'-3"),
(@ENTRY,0,3,4,1,0,100,0,500,1000,600000,600000,11,12550,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - Out of Combat - Cast 'Lightning Shield'-4"),
(@ENTRY,0,4,5,16,0,100,0,12550,1,15000,30000,11,12550,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - On Friendly Unit Missing Buff 'Lightning Shield' - Cast 'Lightning Shield'-5"),
(@ENTRY,0,5,6,8,0,100,0,73108,0,0,0,85,73433,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - On Spellhit 'Murloc Leash' - Invoker Cast 'Summon Captured Vile Fin Minor Oracle'-6"),
(@ENTRY,0,6,7,61,0,100,0,0,0,0,0,33,39078,0,0,0,0,0,7,0,0,0,0,0,0,0,"Quest Kredit Kill Monster on Spell Hit-7"),
(@ENTRY,0,7,0,61,0,100,0,73108,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile Fin Minor Oracle - On Spellhit 'Murloc Leash' - Despawn Instant-8");