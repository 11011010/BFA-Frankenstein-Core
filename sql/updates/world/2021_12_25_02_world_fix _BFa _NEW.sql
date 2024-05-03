UPDATE `creature_template` SET `MovementType` = 1, `HoverHeight` = 4 WHERE `entry` = 50372;

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999327','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','npc_ragefire_stage3','35662');

DELETE FROM `spell_script_names` WHERE `spell_id` = 39238;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(39238, 'spell_q10929_fumping');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999326','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_freeze_cyclone_ice_tomb','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999325','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_trail_handlers','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999324','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_rushing_wind_5','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999323','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_rushing_wind_4','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999322','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_rushing_wind_3','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999321','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_rushing_wind_2','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999270','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_jikun_teleport_to_durumu','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999271','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_durumu_platform_teleport','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999259','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_maze_safespot_controler','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999320','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_disintegration_beam_movement','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999301','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_niuzao_constellation_succes_1','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999256','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_maze','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999252','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_walls_of_ice_3','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999251','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_walls_of_ice_2','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999250','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_walls_of_ice_1','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999249','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_lingering_gaze','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999320','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_lei_shen_teleport_after_encounter ','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999319','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_overloaded_circuits','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999278','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_lei_shen_teleport_players','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999318','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_xuen_constellation_succes_6','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999317','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_xuen_constellation_succes_5','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999316','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_xuen_constellation_succes_4','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999315','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_xuen_constellation_succes_3','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999314','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_xuen_constellation_succes_2','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999313','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_xuen_constellation_succes_1','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999312','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_xuen_constellation_fail','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999311','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_chiji_constellation_succes_6','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999310','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_chiji_constellation_succes_5','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999309','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_chiji_constellation_succes_4','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999308','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_chiji_constellation_succes_3','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999307','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_chiji_constellation_succes_2','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999306','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_chiji_constellation_succes_1','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999305','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_chiji_constellation_fail','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999304','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_niuzao_constellation_succes_5 ','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999303','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_niuzao_constellation_succes_4 ','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999302','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_niuzao_constellation_succes_3 ','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999301','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_niuzao_constellation_succes_2 ','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999300','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_niuzao_constellation_fail','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999299','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_yulon_constellation_succes_5','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999298','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_yulon_constellation_succes_4  ','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999297','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_yulon_constellation_succes_3 ','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999296','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_yulon_constellation_succes_2 ','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999295','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_yulon_constellation_succes_1 ','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('697040','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_melt_ice_comet','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999369','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_yulon_constellation_fail','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999368','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_yulon_constellation_fail','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999480','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_twin_consorts_controler','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999479','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_crane_rush_trigger','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999481','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_tidal_force_slow','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999288','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_anima_orb_areatrigger','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('662202','0','0','0','0','0','HORRIDON EVENT HELPER','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999287','0','0','0','0','0','Anima Rings Move','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_anima_rings_move','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999286','0','0','0','0','0','Anima Rings','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_anima_rings','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('6622020','0','0','0','0','0','HORRIDON EVENT HELPER RP','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','npc_horridon_rp_event_helper','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999455','0','0','0','0','0','VOLATILE POOL','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('999454','0','0','0','0','0','MUTAGENIC POOL','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','bfa_npc_mutagenic_pool','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('500517','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('5005170','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','mob_trigger_liu_flameheart','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('500501','0','0','0','0','0','Apetagonize Core','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','npc_apetagonize_core','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('500522','0','0','0','0','0','Lions Roar','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','npc_lions_roar','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('500600','0','0','0','0','0','Entropic Buildup','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','npc_entropic_buildup','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('500523','0','0','0','0','0','Void Orb','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','npc_void_orb','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('500524','0','0','0','0','0','Goal Portal','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','npc_goal_portal','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('158781','0','0','0','0','0','Shredded Psyche','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('500506','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','npc_mana_orb','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('500528','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','npc_generic_bunny_nyalotha','35662');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `FadeRegionRadius`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('500500','0','0','0','0','0','Trigger','','',NULL,'','0','1','1','4','0','0','35','0','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','','35662');
UPDATE `creature_template` SET `ScriptName`='npc_ularogg_rokmora_start' WHERE (`entry`='105300');
UPDATE `creature_template` SET `ScriptName`='npc_navarogg_rokmora_start' WHERE (`entry`='100700');
UPDATE `creature_template` SET `ScriptName`='npc_spiritwalker_ebonhorn' WHERE (`entry`='100701');
UPDATE `creature_template` SET `ScriptName`='mob_angry_crowd' WHERE (`entry`='109137');
DELETE FROM `spell_script_names` WHERE ScriptName = 'spell_rokmora_shatter';
INSERT INTO spell_script_names VALUES (188114, 'spell_rokmora_shatter');
DELETE FROM `spell_script_names` WHERE ScriptName = 'spell_ularogg_mountain_stance';
INSERT INTO spell_script_names VALUES (198565, 'spell_ularogg_mountain_stance');
DELETE FROM `spell_script_names` WHERE ScriptName = 'spell_idol_falling_debris';
INSERT INTO spell_script_names VALUES (193270, 'spell_idol_falling_debris');
DELETE FROM `spell_script_names` WHERE ScriptName = 'spell_mountain_strike_trigger';
INSERT INTO spell_script_names VALUES (216290, 'spell_mountain_strike_trigger');
DELETE FROM `spell_script_names` WHERE ScriptName = 'spell_mountain_strike_dest';
INSERT INTO spell_script_names VALUES
(216292, "spell_mountain_strike_dest"),
(210164, "spell_mountain_strike_dest"),
(200722, "spell_mountain_strike_dest"),
(200338, "spell_mountain_strike_dest");
UPDATE `creature_template` SET `ScriptName`='npc_vha_impale_dummy' WHERE  `entry`=99850;
DELETE FROM `spell_script_names` WHERE ScriptName = 'spell_dargrul_magma_wave';
INSERT INTO spell_script_names VALUES (200404, 'spell_dargrul_magma_wave');
DELETE FROM `spell_script_names` WHERE ScriptName = 'spell_dargrul_crystal_spikes';
INSERT INTO spell_script_names VALUES (200551, 'spell_dargrul_crystal_spikes');
UPDATE `creature_template` SET `ScriptName`='mob_emberhusk_dominator' WHERE (`entry`='113537');
DELETE FROM `spell_script_names` WHERE ScriptName = 'spell_dargrul_landslide';
INSERT INTO spell_script_names VALUES (200700, 'spell_dargrul_landslide');

DELETE FROM `spell_script_names` WHERE ScriptName = 'spell_naraxas_rancid_maw';
INSERT INTO spell_script_names VALUES (205549, 'spell_naraxas_rancid_maw');

DELETE FROM `spell_script_names` WHERE ScriptName = 'spell_naraxas_toxic_retch';
INSERT INTO spell_script_names VALUES (210150, 'spell_naraxas_toxic_retch');

DELETE FROM `spell_script_names` WHERE ScriptName = 'spell_naraxas_spiked_tongue';
INSERT INTO spell_script_names VALUES (199176, 'spell_naraxas_spiked_tongue');

DELETE FROM `spell_script_names` WHERE ScriptName = 'spell_naraxas_spiked_tongue';
INSERT INTO spell_script_names VALUES (199176, 'spell_naraxas_spiked_tongue');
UPDATE `creature_template` SET
`ScriptName` = 'npc_kara_restless_bones',
`minLevel` = 112, 
`maxLevel` = 112, 
`faction` = 16
WHERE `entry` IN (114906, 11490601, 11490602);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (231869, 227776, 227447, 227477, 228221, 227449, 227453, 227777, 227783);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(231869, 'spell_opera_wikket_bond'),
(227776, 'spell_opera_magic_magnificient'),
(227447, 'spell_opera_defy_gravity'),
(227477, 'spell_opera_summon_assistants'),
(228221, 'spell_opera_severe_dusting'),
(227449, 'spell_opera_dashing_gale'),
(227453, 'spell_opera_dashing_gale_area'),
(227777, 'spell_opera_thunder_ritual'),
(227783, 'spell_opera_wash_away');
UPDATE `creature_template` SET `ScriptName`='npc_riathia_silverstar' WHERE  `entry`=152238;
UPDATE `creature_template` SET `scriptname`= 'npc_where_the_road_leads' WHERE `entry` in ('151065');
UPDATE `creature_template` SET
`ScriptName` = 'npc_kara_invisible_vehicle',
`minLevel` = 112, 
`maxLevel` = 112, 
`faction` = 35,
`InhabitType` = 4,
`speed_walk` = 4,
`speed_run` = 4,
`flags_extra` = 128,
`VehicleId` = 5009
WHERE `entry` IN (115361, 11536101, 11536102);

UPDATE `creature_template` SET 
`ScriptName` = 'npc_kara_guardian_image', 
`minLevel` = 112, 
`maxLevel` = 112, 
`faction` = 16,
`unit_class` = 2,
`InhabitType` = 1,
`mechanic_immune_mask` = `mechanic_immune_mask` |617299967
WHERE `entry` IN (114675, 11467501, 11467502);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (228334, 227806, 228269);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(228269, 'spell_shade_medivh_flame_wreath'),
(227806, 'spell_shade_medivh_ceaseless_winter'),
(228334, 'spell_shade_medivh_guardian_image');



UPDATE `creature_template` SET `ScriptName`='mana_drained_90880' WHERE `entry`=90880;
UPDATE `creature_template` SET `ScriptName`='mana_drained_900880' WHERE `entry`=900880;
UPDATE `creature_template` SET `ScriptName`='npc_demon_86963' WHERE `entry`=86963;
UPDATE `creature_template` SET `ScriptName`='npc_olmyr_ghost' WHERE `entry`=102557;


UPDATE `creature_template` SET `ScriptName`='npc_putrid_sludge' WHERE `entry`=113512;
UPDATE `creature_template` SET `ScriptName`='npc_putrid_sludge' WHERE `entry`=112251;
UPDATE `creature_template` SET `ScriptName`='npc_tr_slime_pool' WHERE `entry`=112293;
UPDATE `creature_template` SET `ScriptName`='npc_kara_stabilize_rift' WHERE `entry`=115789;

DELETE FROM `spell_script_names` WHERE `spell_id` IN (229159, 229283, 229287, 229246, 229151, 230084);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(229159, 'spell_vizaduum_chaotic_shadows'),
(229283, 'spell_vizaduum_bombardment_charge'),
(229287, 'spell_vizaduum_bombardment_aura'),
(229246, 'spell_vizaduum_fel_beam_charge'),
(229151, 'spell_vizaduum_disintegrate'),
(230084, 'spell_vizaduum_stabilize_rift');

UPDATE `gameobject_template` SET 
`ScriptName` = 'go_door_entrance'
WHERE `entry` = 259690;

UPDATE `creature_template` SET `ScriptName`='npc_arc_chrono_shard' WHERE `entry`=103109;
UPDATE `creature_template` SET `ScriptName`='npc_arc_chrono_shard' WHERE `entry`=102849;
UPDATE `creature_template` SET `ScriptName`='npc_arc_timeless_wraith' WHERE `entry`=103130;
UPDATE `creature_template` SET `ScriptName`='npc_enter_the_eternal_battlefield' WHERE `entry`=209;
UPDATE `creature_template` SET `ScriptName`='npc_deathtouched_slaver' WHERE `entry`=135552;
UPDATE `creature_template` SET `ScriptName`='npc_wasting_servant' WHERE `entry`=133361;
UPDATE `creature_template` SET `ScriptName`='npc_boot' WHERE (`entry`='38387');
UPDATE `creature_template` SET `ScriptName`='npc_soul_thorns' WHERE `entry`=136330;
UPDATE `creature_template` SET `ScriptName`='npc_burning_soul' WHERE `entry`=136436;
UPDATE `creature_template` SET `ScriptName`='npc_lady_waycrest_intro' WHERE `entry`=135357;
UPDATE `creature_template` SET `ScriptName`='npc_lucille_waycrest_intro' WHERE `entry`=136084;
UPDATE `creature_template` SET `ScriptName`='npc_inquisitor_mace' WHERE `entry`=136086;
UPDATE `creature_template` SET `ScriptName`='npc_inquisitor_notley' WHERE `entry`=136094;
UPDATE `creature_template` SET `ScriptName`='npc_inquisitor_yorrick' WHERE `entry`=136085;
UPDATE `creature_template` SET `ScriptName`='npc_inquisitor_sterntide' WHERE `entry`=136087;
UPDATE `creature_template` SET `ScriptName`='npc_dread_cannon_bunny' WHERE `entry`=500500;
UPDATE `creature_template` SET `ScriptName`='npc_wekemara_handler' WHERE `entry`=155702;
UPDATE `creature_template` SET `ScriptName`='npc_generic_soldier_fortunate_souls' WHERE `entry`=154943;
UPDATE `creature_template` SET `ScriptName`='npc_generic_soldier_fortunate_souls' WHERE `entry`=150355;
UPDATE `creature_template` SET `ScriptName`='npc_hidden_treasure' WHERE `entry`=150710;
UPDATE `creature_template` SET `ScriptName`='npc_up_against_scene_trigger' WHERE `entry`=500517;
UPDATE `creature_template` SET `ScriptName`='npc_generic_ashvane' WHERE `entry`=152311;
UPDATE `creature_template` SET `ScriptName`='npc_generic_ashvane' WHERE `entry`=152312;
UPDATE `creature_template` SET `ScriptName`='npc_generic_ashvane' WHERE `entry`=156133;
UPDATE `creature_template` SET `ScriptName`='npc_lightning_orbs_ep' WHERE `entry`=153521;
UPDATE `creature_template` SET `ScriptName`='npc_shredded_psyche' WHERE `entry`=158781;
UPDATE `creature_template` SET `ScriptName`='npc_hivemind' WHERE `entry`=160599;
UPDATE `creature_template` SET `ScriptName`='npc_hivemind' WHERE `entry`=157255;
UPDATE `creature_template` SET `ScriptName`='npc_hivemind' WHERE `entry`=157256;
UPDATE `creature_template` SET `ScriptName`='npc_plague_toad ' WHERE `entry`=146695;
UPDATE `creature_template` SET `ScriptName`='npc_plague_toad ' WHERE `entry`=146698;
UPDATE `creature_template` SET `ScriptName`='npc_plague_toad ' WHERE `entry`=146700;
UPDATE `creature_template` SET `ScriptName`='npc_eye_of_drestagath' WHERE `entry`=157612;
UPDATE `creature_template` SET `ScriptName`='npc_tentacle_of_drestagath' WHERE `entry`=157614;
UPDATE `creature_template` SET `ScriptName`='npc_maw_of_drestagath' WHERE `entry`=157613;
UPDATE `creature_template` SET `ScriptName`='npc_queen_azshara_xanesh' WHERE `entry`=156579;
UPDATE `creature_template` SET `ScriptName`='npc_torment_vehicle' WHERE `entry`=156840;
UPDATE `creature_template` SET `ScriptName`='npc_ritual_obelisk' WHERE `entry`=162098;
UPDATE `creature_template` SET `ScriptName`='npc_ritual_obelisk' WHERE `entry`=157126;
UPDATE `creature_template` SET `ScriptName`='npc_void_ascendant' WHERE `entry`=162719;
UPDATE `creature_template` SET `ScriptName`='npc_gift_of_the_void' WHERE `entry`=157422;
UPDATE `creature_template` SET `ScriptName`='npc_dark_gateway' WHERE `entry`=161148;
UPDATE `creature_template` SET `ScriptName`='npc_fanatic' WHERE `entry`=162716;
UPDATE `creature_template` SET `ScriptName`='npc_fanatic' WHERE `entry`=162715;
UPDATE `creature_template` SET `ScriptName`='npc_living_miasma' WHERE `entry`=157229;
UPDATE `creature_template` SET `ScriptName`='npc_essence_raden' WHERE `entry`=160663;
UPDATE `creature_template` SET `ScriptName`='npc_essence_raden' WHERE `entry`=156980;
UPDATE `creature_template` SET `ScriptName`='npc_essence_raden' WHERE `entry`=156884;
UPDATE `creature_template` SET `ScriptName`='npc_void_hunter_crackling_stalker' WHERE `entry`=157365;
UPDATE `creature_template` SET `ScriptName`='npc_void_hunter_crackling_stalker' WHERE `entry`=157366;
UPDATE `creature_template` SET `ScriptName`='ilgynoth_n' WHERE `entry`=158328;
UPDATE `creature_template` SET `ScriptName`='npc_organ_of_corruption' WHERE `entry`=158343;
UPDATE `creature_template` SET `ScriptName`='npc_blood_of_nyalotha' WHERE `entry`=159514;
UPDATE `creature_template` SET `ScriptName`='npc_clotted_corruption' WHERE `entry`=163678;
UPDATE `creature_template` SET `ScriptName`='npc_thrashing_tentacle' WHERE `entry`=162159;
UPDATE `creature_template` SET `ScriptName`='npc_synthesis_growth' WHERE `entry`=157475;
UPDATE `creature_template` SET `ScriptName`='npc_mycelial_cyst' WHERE `entry`=157461;
UPDATE `creature_template` SET `ScriptName`='npc_nightmare_antigen' WHERE `entry`=157452;
UPDATE `creature_template` SET `ScriptName`='npc_psychus' WHERE `entry`=158376;
UPDATE `creature_template` SET `ScriptName`='npc_wrathion_carapace ' WHERE `entry`=160177;
UPDATE `creature_template` SET `ScriptName`='npc_exposed_synapse' WHERE `entry`=159578;
UPDATE `creature_template` SET `ScriptName`='npc_basher_tentacle' WHERE `entry`=158367;
UPDATE `creature_template` SET `ScriptName`='npc_corruptor_tentacle_158375' WHERE `entry`=158375;
UPDATE `creature_template` SET `ScriptName`='npc_spike_tentacle' WHERE `entry`=160249;
UPDATE `creature_template` SET `ScriptName` = 'npc_sap_puddle' WHERE `entry` IN (61613);
UPDATE `creature_template` SET `AIName`='', `ScriptName`='mob_nodding_tiger' WHERE (`entry`='59544');
update creature_template set ScriptName = 'mob_strife' where entry = 59051;
update creature_template set ScriptName = 'mob_zao' where entry = 58826;
update creature_template set ScriptName = 'mob_lesser_sha' where entry = 59598;
update creature_template set ScriptName = 'mob_lesser_sha' where entry = 58319;
UPDATE `creature_template` SET `ScriptName`='npc_minds_eye' WHERE `entry`=158122;
UPDATE `creature_template` SET `ScriptName`='npc_thought_harvester' WHERE `entry`=162933;
UPDATE `creature_template` SET `ScriptName`='npc_shadow_demon' WHERE `entry`=23375;
UPDATE `creature_template` SET `ScriptName`='mob_minion_of_doubt' WHERE `entry`=65362;
UPDATE `creature_template` SET `ScriptName`='mob_minion_of_doubt' WHERE `entry`=57109;
UPDATE `creature_template` SET  `ScriptName`='mob_golden_beetle' WHERE (`entry`='59545');
UPDATE `creature_template` SET  `ScriptName`='mob_jiang_xiang' WHERE (`entry`='65317');
UPDATE `creature_template` SET  `ScriptName`='mob_songbird_queen' WHERE (`entry`='59553');
UPDATE `creature_template` SET `ScriptName`='mob_talking_fish' WHERE (`entry`='59546');
REPLACE  INTO `criteria_data`(`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) values 
(19825,11,0,0,'achievement_run_with_the_wind'),
(17836,11,0,0,'achievement_master_of_the_molten_flow'),
(24823,11,0,0,'achievement_almost_blink_luck'),
(37930,11,0,0,'achievement_kill_antoran_demons'),
(23525,11,0,0,'achievement_weighed_down'),
(22644,11,0,0,'achievement_a_test_of_valor'),
(22645,11,0,0,'achievement_a_test_of_valor'),
(6455, 41, 0, 0, 'achievement_show_me_you_moves');
UPDATE `creature_template` SET `scriptname`= 'npc_engorged_parasite' WHERE `entry` in ('140478');
UPDATE creature_template SET  ScriptName = "npc_dark_of_night" WHERE entry = 63346;
UPDATE `creature_template` SET `ScriptName` = 'mob_corrupting_waters' WHERE `entry` = 60621;
UPDATE `creature_template` SET `ScriptName` = 'mob_cleansing_water' WHERE `entry` = 60646;
UPDATE `creature_template` SET `ScriptName` = 'mob_defiled_ground' WHERE `entry` = 60906;
UPDATE `creature_template` SET `ScriptName` = 'mob_coalesced_corruption' WHERE `entry` = 60886;
UPDATE `creature_template` SET `ScriptName`='bfa_npc_the_light_of_day' WHERE `entry`=63337;
UPDATE `creature_template` SET `ScriptName`='mob_lei_shi_hidden' WHERE `entry`=63099;
UPDATE `creature_template` SET `ScriptName`='mob_terror_spawn' WHERE `entry`=61034;
UPDATE `creature_template` SET `ScriptName`='npc_sha_of_fear_bowman' WHERE `entry`=61042;
UPDATE `creature_template` SET `ScriptName`='npc_sha_of_fear_bowman' WHERE `entry`=61038;
UPDATE `creature_template` SET `ScriptName`='npc_sha_of_fear_bowman' WHERE `entry`=61046;
UPDATE `creature_template` SET `ScriptName`='npc_sha_globe' WHERE `entry`=65691;
UPDATE `creature_template` SET `ScriptName`='bfa_npc_volatile_pool' WHERE `entry`=999455;
UPDATE `creature_template` SET `ScriptName`='npc_horridon_event_helper' WHERE `entry`=662202;
UPDATE `creature_template` SET `ScriptName`='bfa_npc_anima_orb' WHERE `entry`=69756;
UPDATE `creature_template` SET `scriptname`= 'npc_animated_ichor' WHERE `entry` in ('139195');
UPDATE `creature_template` SET `scriptname`= 'npc_pool_of_darkness' WHERE `entry` in ('139171');
UPDATE `creature_template` SET `ScriptName`='bfa_npc_beast_of_nightmare' WHERE `entry`=69479;
UPDATE `creature_template` SET `ScriptName`='npc_generic_barrier' WHERE `entry`=147374;
UPDATE `creature_template` SET `scriptname`= 'npc_pathogen_bomb' WHERE `entry` in ('135687');
UPDATE `creature_template` SET `scriptname`= 'npc_nerubian_voidweaver' WHERE `entry` in ('135824');
UPDATE `creature_template` SET `ScriptName`='npc_generic_zul_minion' WHERE `entry`=138493;
UPDATE `creature_template` SET `ScriptName`='npc_generic_zul_minion' WHERE `entry`=139051;
UPDATE `creature_template` SET `ScriptName`='npc_generic_zul_minion' WHERE `entry`=139057;
UPDATE `creature_template` SET `ScriptName`='npc_generic_zul_minion' WHERE `entry`=139059;
UPDATE `creature_template` SET `scriptname`= 'npc_projection_of_yogg_saron' WHERE `entry` in ('135129');
UPDATE `creature_template` SET `scriptname`= 'npc_ominous_cloud_stalker' WHERE `entry` in ('135079');
UPDATE `creature_template` SET `scriptname`= 'npc_orb_of_corruption' WHERE `entry` in ('157502');
UPDATE `creature_template` SET `scriptname`= 'npc_orb_of_corruption' WHERE `entry` in ('135310');
UPDATE `creature_template` SET `scriptname`= 'npc_orb_of_corruption' WHERE `entry` in ('115166');
UPDATE `creature_template` SET `ScriptName`='npc_voldun_julwaba' WHERE `entry`=134162;
UPDATE `creature_template` SET `ScriptName`='npc_hoodoo_hexer' WHERE `entry`=136250;
UPDATE `creature_template` SET `ScriptName`='npc_hoodoo_hexer' WHERE `entry`=137204;
UPDATE `creature_template` SET `ScriptName`='npc_orb_of_swirling' WHERE  `entry`=120988;

UPDATE `creature_template` SET `ScriptName`='npc_xalzaix' WHERE `entry`=138324;
UPDATE `creature_template` SET `ScriptName`='npc_oblivion_sphere' WHERE `entry`=138492;
UPDATE `creature_template` SET `ScriptName`='npc_energy_fragment' WHERE `entry`=142929;
UPDATE `creature_template` SET `ScriptName`='npc_energy_core' WHERE `entry`=135445;



UPDATE `creature_template` SET `ScriptName`='npc_reorigination_drive' WHERE `entry`=136263;
UPDATE `creature_template` SET `ScriptName`='npc_spawn_of_ghuun' WHERE `entry`=141851;
UPDATE `creature_template` SET `ScriptName`='npc_gibbering_horror' WHERE `entry`=134010;
UPDATE `creature_template` SET `ScriptName`='npc_bursting_boil' WHERE `entry`=141695;
UPDATE `creature_template` SET `ScriptName`='npc_matrix_surge' WHERE `entry`=139910;
UPDATE `creature_template` SET `ScriptName`='npc_blightspreader_tendril' WHERE `entry`=134590;
UPDATE `creature_template` SET `ScriptName`='npc_lightforged_beacon_125720' WHERE `entry`=125720;
UPDATE `creature_template` SET `ScriptName`='npc_lightforged_beacon_125720' WHERE `entry`=125720;


REPLACE INTO spell_script_names VALUES (203622, "spell_betrug_chaotic_energy");
REPLACE INTO spell_script_names VALUES (202328, "spell_betrug_mighty_slash");
REPLACE INTO spell_script_names VALUES (202339, "spell_betrug_mighty_slash_jump");
REPLACE INTO spell_script_names VALUES (210879, "spell_betrug_seed_of_destruction");
REPLACE INTO spell_script_names VALUES (202361, "spell_betrug_execution");
REPLACE INTO spell_script_names VALUES (201495, "spell_vha_recongealing");
REPLACE INTO spell_script_names VALUES (201356, "spell_vha_swarn_rockets");

REPLACE INTO spell_script_names VALUES (202361, "spell_betrug_execution");

DELETE FROM spell_script_names WHERE scriptname IN ("aura_nythendra_infested", "aura_nythendra_infested_mind", "spell_nythendra_rot", "aura_nythendra_rot", "aura_nythendra_infested_breath", "aura_nythendra_volatile_rot");
INSERT INTO spell_script_names VALUES
(204504, "aura_nythendra_infested"),
(205043, "aura_nythendra_infested_mind"),
(202977, "aura_nythendra_infested_breath"),
(203096, "aura_nythendra_rot"),
(204463, "aura_nythendra_volatile_rot");
UPDATE `creature_template` SET `ScriptName`='npc_bilewater_slime' WHERE  `entry`=116195;
DELETE FROM spell_script_names WHERE scriptname IN ("spell_nythendra_rot", "spell_nythendra_volatile_rot_damage");
INSERT INTO spell_script_names VALUES
(203096, "spell_nythendra_rot"),
(204470, "spell_nythendra_volatile_rot_damage");

REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(209628, 'spell_melandrus_piercing_gale'),
(209602, 'spell_melandrus_blade_surge'),
(224327, 'spell_melandrus_enveloping_winds'),
(59910,'spell_novos_summon_minions'),
(101847, 'spell_gen_shoe_baby'),
(101883, 'spell_heal_injuried_carnie'),
(101992, 'spell_put_up_darkmoon_banner'),
(108941, 'spell_darkmoon_deathmatch'),
(43471, 'spell_shoot_gallery_shoot'),
(42919, 'spell_tricky_treat'),
(123816, 'bfa_spell_the_light_of_day'),
(122881, 'bfa_spell_unstable_bolt_selfdamage'),
(119414, 'bfa_spell_toes_breath_of_fear'),
(125786, 'bfa_spell_toes_breath_of_fear'),
(138609, 'bfa_spell_matter_swap'),
(134824, 'bfa_spell_discharged_energy_duration'),
(134825, 'bfa_spell_discharged_energy_duration'),
(134827, 'bfa_spell_discharged_energy_duration'),
(289169, 'aura_bwonsamdis_toon'),
(310358, 'aura_mutterings_of_insanity'),
(310277, 'aura_volatile_seed'),
(307359, 'aura_despair'),
(307314, 'aura_encroaching_shadows'),
(307358, 'aura_debilatiting_spit'),
(119108, 'bfa_spell_toes_conjure_terror_spawn'),
(119693, 'bfa_spell_toes_ominous_caclke_target'),
(119692, 'bfa_spell_toes_ominous_caclke_target'),
(119593, 'bfa_spell_toes_ominous_caclke_target'),
(306273, 'aura_unstable_vita'),
(311159, 'aura_cursed_blood'),
(311367, 'aura_touch_of_the_corruptor'),
(306973, 'aura_madness_bomb'),
(306984, 'aura_insanity_bomb'),
(307071, 'aura_synthesis'),
(117866, 'bfa_spell_toes_champion_of_light'),
(120047, 'bfa_spell_toes_dread_spray'),
(125786, 'bfa_spell_toes_breath_of_fear_fear'),
(119887, 'bfa_spell_toes_death_blossom'),
(120221, 'bfa_spell_toes_dread_expanse_tp'),
(120285, 'bfa_spell_transfer_light'),
(129147, 'bfa_spell_toes_ominous_cackle_immunities'),
(120519, 'bfa_spell_toes_waterspout_periodic'),
(118977, 'bfa_spell_toes_fearless'),
(136584, 'bfa_spell_toes_fearless_pet'),
(138923, 'spell_caw'),
(137479, 'spell_lightning_fissure_damage'),



(137648, 'spell_crystal_shell_absorb'),
(133946, 'spell_furious_stone_breath_damage'),
(222100, 'aura_item_avalanche_elixir'),
(288449, 'aura_deaths_door'),
(285349, 'aura_plague_of_fire'),
(286646, 'aura_gigavolt_charge'),


(276434, 'aura_decaying_flesh'),
(274271, 'aura_deathwish'),
(273365, 'aura_dark_revelation'),
(281473, 'spell_roiling_deceit_damage'),
(265662, 'aura_corruptors_path'),
(265061, 'spell_titan_spark_selector'),
(265437, 'spell_roiling_deceit_selector'),
(265237, 'spell_shatter'),
(265231, 'spell_void_second_lash_selector'),
(264383, 'spell_eye_beam_selector'),
(265178, 'aura_evolving_affliction'),
(274990, 'aura_burning_lesions'),
(270449, 'spell_plasma_discharge'),
(272536, 'aura_imminent_ruin'),
(255835, 'spell_priestess_transfusion_heal'),
(196354, 'spell_archdruid_glaidalis_grevious_leap_damage'),
(196354, 'spell_archdruid_glaidalis_grevious_leap_damage'),
(196354, 'spell_archdruid_glaidalis_grevious_leap_damage'),
(196354, 'spell_archdruid_glaidalis_grevious_leap_damage'),
(196354, 'spell_archdruid_glaidalis_grevious_leap_damage'),
(196354, 'spell_archdruid_glaidalis_grevious_leap_damage'),
(196354, 'spell_archdruid_glaidalis_grevious_leap_damage'),



(65032,  'spell_xt002_321_boombot_aura'),
(74634, "spell_ground_siege"),
(105065, 'spell_alizabal_seething_hate'),
(229254 ,'spell_odyn_arcing_storm'),
(231363, "spell_burning_armor"),
(208593, 'teleport_xavius'),
(203882, 'spell_vandros_banish_in_time'),
(203914, 'spell_vandros_banish_in_time_buff'),
(203883, 'spell_vandros_banish_in_time_tele'),
(203952, 'spell_arc_breach'),
(197776, 'spell_xakal_fel_fissure'),
(197786, 'spell_arc_bombardment'),
(204044,'spell_ysondre_shadow_burst_filter'),
(203110,'spell_ysondre_slumbering_nightmare'),
(199956, 'spell_naltira_nether_venom'),
(200024, 'spell_naltira_nether_venom_dmg'),
(211543, 'spell_arc_devour'),
(49107, 'spell_vehicle_warhead_fuse'),
(71289,'spell_deathwhisper_dominated_mind'),
(196804, 'spell_ivanyr_nether_link'),
(196805, 'spell_ivanyr_nether_link_dmg'),
(199810, 'spell_naltira_blink_strikes'),
(199811, 'spell_naltira_blink_strikes_dmg'),
(200284, 'spell_naltira_tangled_web_dmg'),
(202974, 'spell_vandros_force_bomb'),
(201153, 'spell_eternal_darkness'),
(201920, 'spell_shadow_crash'),
(202341,'spell_anubesset_impale'),
(194344, 'spell_harbaron_fragment_dmg'),
(194325, 'spell_harbaron_fragment'),
(192307, 'spell_sanctify'),
(194266, 'spell_mos_void_snap');

REPLACE  INTO `criteria_data`(`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) values 
(19825,11,0,0,'achievement_run_with_the_wind'),
(17836,11,0,0,'achievement_master_of_the_molten_flow'),
(24823,11,0,0,'achievement_almost_blink_luck'),
(37930,11,0,0,'achievement_kill_antoran_demons'),
(23525,11,0,0,'achievement_weighed_down'),
(22644,11,0,0,'achievement_a_test_of_valor'),
(22645,11,0,0,'achievement_a_test_of_valor'),
(3804,11,0,0, 'achievement_resilient_victory'),
(3805,11,0,0, 'achievement_resilient_victory'),
(3806,11,0,0, 'achievement_resilient_victory'),
(3807,11,0,0, 'achievement_resilient_victory'),
(3808,11,0,0, 'achievement_resilient_victory'),
(3809,11,0,0, 'achievement_resilient_victory'),
(3810,11,0,0, 'achievement_resilient_victory'),
(3811,11,0,0, 'achievement_resilient_victory'),
(3812,11,0,0, 'achievement_resilient_victory'),
(3813,11,0,0, 'achievement_resilient_victory'),
(6455, 41, 0, 0, 'achievement_show_me_you_moves');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19, 20) AND `SourceEntry` IN (13177, 13179, 13178, 13180);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 13177, 0, 0, 32, 0, 144, 0, 0, 0, 0, 0, "condition_is_wintergrasp_alliance", "Alliance quest 'No Mercy for the Merciless' is available if Wintergrasp is held by Alliance"),
(20, 0, 13177, 0, 0, 32, 0, 144, 0, 0, 0, 0, 0, "condition_is_wintergrasp_alliance", "Quest mark for Alliance quest 'No Mercy for the Merciless' is available if Wintergrasp is held by Alliance"),
(19, 0, 13179, 0, 0, 32, 0, 144, 0, 0, 0, 0, 0, "condition_is_wintergrasp_horde", "Alliance quest 'No Mercy for the Merciless' is available if Wintergrasp is held by Horde"),
(20, 0, 13179, 0, 0, 32, 0, 144, 0, 0, 0, 0, 0, "condition_is_wintergrasp_horde", "Quest mark for Alliance quest 'No Mercy for the Merciless' is available if Wintergrasp is held by Horde"),
(19, 0, 13178, 0, 0, 32, 0, 144, 0, 0, 0, 0, 0, "condition_is_wintergrasp_horde", "Horde quest 'Slay Them All!' is available if Wintergrasp is held by Horde"),
(20, 0, 13178, 0, 0, 32, 0, 144, 0, 0, 0, 0, 0, "condition_is_wintergrasp_horde", "Quest mark for Horde quest 'Slay Them All!' is available if Wintergrasp is held by Horde"),
(19, 0, 13180, 0, 0, 32, 0, 144, 0, 0, 0, 0, 0, "condition_is_wintergrasp_alliance", "Horde quest 'Slay Them All!' is available if Wintergrasp is held by Alliance"),
(20, 0, 13180, 0, 0, 32, 0, 144, 0, 0, 0, 0, 0, "condition_is_wintergrasp_alliance", "Quest mark for Horde quest 'Slay Them All!' is available if Wintergrasp is held by Alliance");

DELETE FROM `spell_script_names` WHERE `spell_id`=69232;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(69232,'spell_tyrannus_rimefang_icy_blast');

DELETE FROM spell_script_names WHERE scriptname IN ("spell_shattering_star_dummy", "aura_crashing_comet");
INSERT INTO spell_script_names VALUES
(233274, "spell_shattering_star_dummy"),
(232249, "aura_crashing_comet");

REPLACE INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES 
(9509, 'at_ordos_entrance'),
(9211, 'at_tom_bone_apart'),
(4354, 'at_wod_dark_portal');

UPDATE `creature_template` SET `scriptname`='npc_mountaineer_watch' WHERE entry=41056;
UPDATE `creature_template` SET `ScriptName`='npc_magma_trap' WHERE `entry`='53086';
UPDATE `gameobject_template` SET `ScriptName`='go_finding_the_scepter_obj' WHERE `entry`=251696;
UPDATE `gameobject_template` SET `ScriptName`='go_finding_the_scepter_obj' WHERE `entry`=251697;
UPDATE `gameobject_template` SET `ScriptName`='go_finding_the_scepter_obj' WHERE `entry`=251698;
UPDATE `creature_template` SET `ScriptName` = 'npc_whirling_winds_hoo' WHERE `entry` =41245;

UPDATE `gameobject_template` SET `ScriptName`='go_violethold_exit_portal' WHERE `entry`=193609;
UPDATE `gameobject_template` SET `ScriptName`='go_dru_training_troops' WHERE `entry`=250872;
UPDATE `gameobject_template` SET `ScriptName`='go_dru_training_troops' WHERE `entry`=250872;
UPDATE `gameobject_template` SET `ScriptName`='go_dru_training_troops' WHERE `entry`=250872;

REPLACE INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
('15788', 'at_seeds_of_chaos');

UPDATE `creature_template` SET 
`minLevel` = 112, 
`maxLevel` = 112,
`faction` = 16,
`flags_extra` = `flags_extra` |128,
`ScriptName` = 'npc_mos_helya_dummy'
WHERE `entry` IN (100361, 10036101, 10036102, 100359, 10035901, 10035902, 99803, 9980301, 9980302, 99800, 9980001, 9980002, 102306, 10230601, 10230602, 97099, 9709901, 9709902);

UPDATE `creature_template` SET `ScriptName`='npc_dark_ranger_thyala_36312' WHERE (`entry`='36312');
DELETE FROM areatrigger_scripts WHERE entry IN (164556);
INSERT INTO areatrigger_scripts (entry, ScriptName) VALUES
(164556, "at_unchecked_growth");

UPDATE areatrigger_template SET ScriptName='at_flamestrike' WHERE Id=8352;

SET @HELYA := 96759;

UPDATE `creature_template` SET 
`ScriptName` = 'boss_helya_maw', 
`minLevel` = 112, 
`maxLevel` = 112, 
`faction` = 16,
`unit_class` = 4,
`unit_flags` = 32832,
`InhabitType` = 4,
`mechanic_immune_mask` = `mechanic_immune_mask` |617299967
WHERE `entry` IN (@HELYA, 9675901, 9675902);

UPDATE `creature_template` SET 
`ScriptName` = 'npc_mos_destructor_tentacle',
`minLevel` = 112, 
`maxLevel` = 112,
`faction` = 16,
`InhabitType` = 1
WHERE `entry` IN (99801, 9980101, 9980102);

UPDATE `creature_template` SET 
`ScriptName` = 'npc_mos_grasping_tentacle',
`minLevel` = 112, 
`maxLevel` = 112,
`faction` = 16,
`unit_flags` = `unit_flags` |131072,
`flags_extra` = `flags_extra` |2,
`InhabitType` = 1
WHERE `entry` IN (100360, 100362, 98363);

UPDATE `creature_template` SET 
`ScriptName` = 'npc_mos_piercing_tentacle',
`minLevel` = 112, 
`maxLevel` = 112,
`faction` = 16,
`unit_flags` = 33554432,
`unit_flags2` = 4196352,
`flags_extra` = 0
WHERE `entry` IN (100188, 10018801, 10018802);

DELETE FROM `creature_template_addon` WHERE `entry` = 102306;

UPDATE `creature_template` SET `VehicleId` = 4496 WHERE `entry` IN (100361, 10036101, 10036102);
UPDATE `creature_template` SET `VehicleId` = 4495 WHERE `entry` IN (100359, 10035901, 10035902);
UPDATE `creature_template` SET `VehicleId` = 4471 WHERE `entry` IN (99803, 9980301, 9980302);
UPDATE `creature_template` SET `VehicleId` = 4470 WHERE `entry` IN (99800, 9980001, 9980002);
UPDATE `gameobject_template` SET `data4` = 31853, `data10` = 31853 WHERE `entry` = 246919;

UPDATE `creature_model_info` SET `CombatReach` = 18 WHERE `DisplayId` = 66618;
UPDATE `creature_model_info` SET `CombatReach` = 22.5 WHERE `DisplayId` = 66619;
UPDATE `creature_model_info` SET `CombatReach` = 31.5 WHERE `DisplayId` = 65778;
UPDATE `creature_model_info` SET `CombatReach` = 33 WHERE `DisplayId` = 66238;

DELETE FROM `creature` WHERE `id` IN (100188, 10018801, 10018802, 99801, 9980101, 9980102, 100360, 10036001, 10036002, 100362, 10036201, 10036202, 98363, 9836301, 9836302) AND `map` = 1492;

UPDATE `creature_template` SET 
`minLevel` = 112, 
`maxLevel` = 112,
`faction` = 16,
`flags_extra` = `flags_extra` |128,
`ScriptName` = 'npc_mos_helya_dummy'
WHERE `entry` IN (100361, 10036101, 10036102, 100359, 10035901, 10035902, 99803, 9980301, 9980302, 99800, 9980001, 9980002, 102306, 10230601, 10230602, 97099, 9709901, 9709902);

UPDATE `creature` SET `spawnDifficulties` = 8388870 WHERE `map` = 1492;
UPDATE `gameobject` SET `spawnDifficulties` = 8388870 WHERE `map` = 1492;

DELETE FROM `creature` WHERE `id` = 59018 AND `map` = 1492;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `ScriptName`, `VerifiedBuild`) VALUES
('1025620','59018','1492','0','0','8388608','0','0','0','0','2917.3','917.827','512.319','4.66261','300','0','0','22988','0','0','0','33554432','0','','0'),
('1025623','59018','1492','0','0','8388608','0','0','0','0','2933.7','914.794','512.383','4.6147','300','0','0','22988','0','0','0','33554432','0','','0'),
('1025619','59018','1492','0','0','8388608','0','0','0','0','2948.84','917.392','512.285','4.77727','300','0','0','22988','0','0','0','33554432','0','','0');

DELETE FROM `areatrigger_template` WHERE `id` IN (5070, 4048, 8856, 5179);
INSERT INTO `areatrigger_template` (`id`, `type`, `flags`, `Data0`, `Data1`, `Data2`,`Data3`, `Data4`, `Data5`, `ScriptName`) VALUES
(5070, 1, 0, 4.5, 4.5, 0.5, 4.5, 4.5, 0.5, 'at_mos_swirling_water'),
(4048, 1, 0, 0, 0, 0, 0, 0, 0, ''),
(8856, 0, 0, 1, 1, 0, 0, 0, 0, ''),
(5179, 0, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `areatrigger_template_polygon_vertices` WHERE `AreaTriggerId` = 4048;
INSERT INTO`areatrigger_template_polygon_vertices` (`AreaTriggerId`, `Idx`, `VerticeX`, `VerticeY`, `VerticeTargetX`, `VerticeTargetY`, `VerifiedBuild`) VALUES
(4048, 3, 200, 30, 0, 0, 23360),
(4048, 2, 200, -30, 0, 0, 23360),
(4048, 1, 0, -30, 0, 0, 23360),
(4048, 0, 0, 30, 0, 0, 23360);

DELETE FROM `spell_areatrigger` WHERE `SpellMiscId` IN (5070, 4048, 8856, 5179);
INSERT INTO `spell_areatrigger` (`SpellMiscId`, `AreaTriggerId`, `MoveCurveId`, `ScaleCurveId`, `MorphCurveId`, `FacingCurveId`, `DecalPropertiesId`, `TimeToTarget`, `TimeToTargetScale`, `VerifiedBuild`) VALUES
(5070, 5070, 0, 0, 0, 0, 0, 0, 0, 23420),
(8856, 8856, 0, 0, 0, 0, 0, 0, 0, 23420),
(4048, 4048, 0, 0, 0, 0, 0, 0, 1000, 23420),
(5179, 5179, 0, 0, 0, 0, 0, 0, 1000, 23420);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (197262, 197753, 202088, 195231, 197734, 197653, 196534, 194839, 227233, 227234, 198520, 196947);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(197262, 'spell_helya_maw_taint_of_sea'),
(197753, 'spell_helya_maw_turbulent_waters'),
(202088, 'spell_helya_maw_brackwater_barrage'),
(195231, 'spell_helya_maw_emerge'),
(197734, 'spell_helya_maw_phase_two_model'),
(197653, 'spell_helya_maw_knockdown'),
(196534, 'spell_mos_smash'),
(194839, 'spell_mos_knockdown'),
(227233, 'spell_helya_maw_corrupted_bellow'),
(227234, 'spell_helya_maw_corrupted_bellow_dmg'),
(198520, 'spell_helya_maw_wing_buffet'),
(196947, 'spell_helya_maw_submerged');

delete from criteria_data where ScriptName = 'achievement_iron_dwarf_medium_rare';
delete from criteria_data where criteria_id in (10062,10063,39334);

INSERT INTO `criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(33104, 11, 0, 0, 'achievement_iron_dwarf_medium_rare'),
(33105, 11, 0, 0, 'achievement_iron_dwarf_medium_rare'),
(10062, 11, 0, 0, 'achievement_quick_shave_deprecated_disable'),
(10063, 11, 0, 0, 'achievement_quick_shave_deprecated_disable'),
(39334, 11, 0, 0, 'achievement_quick_shave');

UPDATE `creature_template` SET `scriptname`= 'npc_urduu' WHERE `entry` in ('152568');
UPDATE `creature_template` SET `scriptname`= 'npc_unleashed_arcano_fiend' WHERE `entry` in ('153307');
DELETE FROM `creature_text` WHERE `CreatureID` = @HELYA;
INSERT INTO `creature_text`(`CreatureID`, `groupid`, `id`, `text`, `type`, `probability`, `sound`, `comment`) VALUES
(@HELYA, '0', '0', 'You ALL will regret trespassing in my realm.', '14', '100', '54387', 'HELYA - INTRO'),
(@HELYA, '1', '0', 'You have come far enough. Time to die.', '14', '100', '54371', 'HELYA - AGGRO'),
(@HELYA, '2', '0', 'Your fate rains down!', '14', '100', '54378', 'HELYA - TAIN_OF_SEA'),
(@HELYA, '2', '1', 'Embrace your fate, fools!', '14', '100', '54388', 'HELYA - TAIN_OF_SEA'),
(@HELYA, '3', '0', 'You will pay for that.', '14', '100', '54385', 'HELYA - TENTACLE DIE'),
(@HELYA, '3', '1', 'I am losing my patience.', '14', '100', '54386', 'HELYA - TENTACLE DIE'),
(@HELYA, '3', '2', 'No! This is not possible!', '14', '100', '54384', 'HELYA - TENTACLE DIE'),
(@HELYA, '3', '3', 'What manner of creatures ARE you??', '14', '100', '54382', 'TENTACLE DIE'),
(@HELYA, '3', '4', 'Odyn values these creatures?', '14', '100', '54377', 'HELYA - TENTACLE DIE'),
(@HELYA, '4', '0', 'An eternity of agony awaits you.', '14', '100', '54376', 'HELYA - CORRUPTED BELLOW'),
(@HELYA, '4', '1', 'I will drown you all like rats!', '14', '100', '54379', 'HELYA - CORRUPTED BELLOW'),
(@HELYA, '4', '2', 'Hold still!', '14', '100', '54376', 'HELYA - CORRUPTED BELLOW'),
(@HELYA, '4', '3', 'Stop squirming!', '14', '100', '54376', 'HELYA - CORRUPTED BELLOW'),
(@HELYA, '5', '0', 'Your soul will not find shelter here.', '14', '100', '54376', 'HELYA - KILL'),
(@HELYA, '5', '1', 'Begone to the next life.', '14', '100', '54376', 'HELYA - KILL'),
(@HELYA, '6', '0', 'It is finished. I banish your weak mortal souls forever more.', '14', '100', '54376', 'HELYA - WIPE'),
(@HELYA, '7', '0', 'Do you think you have won? You have merely survived the storm... The seas are unstoppable.', '14', '100', '54376', 'HELYA - DEATH'),
(@HELYA, '8', '0', '|TInterface\Icons\Spell_Frost_SummonWaterElemental_2.blp:20|t %s begins to cast |cFFFF0000|Hspell:202098|h[Brackwater Barrage]|h|r. Look out!', '41', '100', '0', 'HELYA - BRACKWATER BARRAGE'),
(@HELYA, '9', '0', '|TInterface\\Icons\\Spell_Shadow_Possession:20|t %s begins to cast |cFFFF0000|Hspell:227233|h[Corrupted Bellow]|h|r. Look out!', 41, 100, 54400, 'Helya');
UPDATE `gameobject_template` SET `scriptname`='go_tadpole_cage' WHERE `entry`=187373;

UPDATE `gameobject_template` SET `ScriptName`='go_twilight_outhouse' WHERE `entry`=280948;

REPLACE INTO `criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES 
(18391, 11, 0, 0, 'achievement_minutes_to_midnight');

DELETE FROM `scene_template` WHERE `SceneId`=1904;
INSERT INTO `scene_template` (`SceneId`, `Flags`, `ScriptPackageID`, `ScriptName`) VALUES (1904, 26, 2004, 'scene_the_power_in_our_hands');

UPDATE `gameobject_template` SET `ScriptName`='go_mothers_cache' WHERE `entry`=291079;
UPDATE `gameobject_template` SET `ScriptName`='go_glimmering_chest' WHERE `entry`=322413;

UPDATE `gameobject_template` SET `ScriptName`='go_zul_trapdoor' WHERE `entry`=287416;
UPDATE `gameobject_template` SET `ScriptName`='go_glimmering_chest' WHERE `entry`=322413;
UPDATE `gameobject_template` SET `ScriptName`='go_glimmering_chest' WHERE `entry`=322413;
UPDATE `gameobject_template` SET `ScriptName`='go_glimmering_chest' WHERE `entry`=322413;
UPDATE `gameobject_template` SET `ScriptName`='go_glimmering_chest' WHERE `entry`=322413;