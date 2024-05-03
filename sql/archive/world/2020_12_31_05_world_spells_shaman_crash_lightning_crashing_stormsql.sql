-- Crash Lightning and Crashing Storm Talent
replace into spell_script_names values (187874,'bfa_spell_crash_lightning');
-- Crashing Storm AreaTrigger 6826
DELETE FROM areatrigger_scripts WHERE `entry`='6826' AND `scriptname`='bfa_at_crashing_storm';
INSERT INTO areatrigger_scripts VALUES ('6826', 'bfa_at_crashing_storm');

DELETE FROM areatrigger_template WHERE `id` = '6826' AND `scriptname` = 'bfa_at_crashing_storm';
INSERT INTO areatrigger_template VALUES ('6826', '0', '0', '4', '4', '0', '0', '0', '0', 'bfa_at_crashing_storm', '0');

DELETE FROM spell_areatrigger WHERE `SpellMiscId` = '6826' AND `AreaTriggerId` = '6826';
INSERT INTO spell_areatrigger VALUES ('6826', '6826', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');