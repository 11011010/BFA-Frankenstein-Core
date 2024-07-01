REPLACE INTO `areatrigger_template` (`Id`, `Type`, `Flags`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `ScriptName`, `VerifiedBuild`) VALUES ('6212', '0', '2', '8', '8', '0', '0', '0', '0', 'at_dk_defile', '27377');
REPLACE INTO `spell_areatrigger` (`SpellMiscId`, `AreaTriggerId`, `MoveCurveId`, `ScaleCurveId`, `MorphCurveId`, `FacingCurveId`, `AnimId`, `AnimKitId`, `DecalPropertiesId`, `TimeToTarget`, `TimeToTargetScale`, `VerifiedBuild`) VALUES ('1713', '6212', '0', '0', '0', '0', '0', '0', '0', '0', '0', '27377');
UPDATE `creature_template` SET `ScriptName`='npc_dk_defile' WHERE (`entry`='82521');
REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES ('156004', 'spell_dk_defile_aura');
