REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES ('33917', 'spell_dru_mangle');
UPDATE `spell_script_names` SET `ScriptName`='spell_dru_starsurge' WHERE (`spell_id`='78674') AND (`ScriptName`='spell_dru_eclipse');
DELETE FROM spell_script_names WHERE spell_id = 78674 AND ScriptName = 'spell_dru_eclipse';
REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES ('191034', 'spell_dru_starfall');
UPDATE `areatrigger_template` SET `ScriptName`='at_dru_fury_of_elune' WHERE (`Id`='11393');
UPDATE `spell_areatrigger` SET `DecalPropertiesId`='339' WHERE (`SpellMiscId`='6887');
