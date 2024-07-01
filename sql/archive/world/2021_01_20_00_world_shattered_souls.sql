REPLACE INTO `areatrigger_template` (`Id`, `Type`, `Flags`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `ScriptName`, `VerifiedBuild`) VALUES ('10666', '0', '0', '6', '6', '0', '0', '0', '0', '', '28153');
REPLACE INTO `spell_areatrigger` (`SpellMiscId`, `AreaTriggerId`) VALUES ('6007', '10666');
UPDATE `spell_areatrigger` SET `TimeToTargetScale`='20000' WHERE (`SpellMiscId`='6007');
UPDATE `areatrigger_template` SET `ScriptName`='at_shattered_soul_fragment' WHERE (`Id`='10665');
UPDATE `areatrigger_template` SET `ScriptName`='at_shattered_soul_fragment' WHERE (`Id`='10666');
REPLACE INTO `areatrigger_template` (`Id`, `Type`, `Flags`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `ScriptName`, `VerifiedBuild`) VALUES (10665, 0, 0, 6, 6, 0, 0, 0, 0, 'at_shattered_soul_fragment', 28153);
REPLACE INTO `areatrigger_template` (`Id`, `Type`, `Flags`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `ScriptName`, `VerifiedBuild`) VALUES (10666, 0, 0, 6, 6, 0, 0, 0, 0, 'at_shattered_soul_fragment', 28153);
REPLACE INTO `spell_areatrigger` (`SpellMiscId`, `AreaTriggerId`, `MoveCurveId`, `ScaleCurveId`, `MorphCurveId`, `FacingCurveId`, `AnimId`, `AnimKitId`, `DecalPropertiesId`, `TimeToTarget`, `TimeToTargetScale`, `VerifiedBuild`) VALUES (5977, 10665, 0, 0, 0, 0, 0, 0, 0, 0, 20000, 32750);
REPLACE INTO `spell_areatrigger` (`SpellMiscId`, `AreaTriggerId`, `MoveCurveId`, `ScaleCurveId`, `MorphCurveId`, `FacingCurveId`, `AnimId`, `AnimKitId`, `DecalPropertiesId`, `TimeToTarget`, `TimeToTargetScale`, `VerifiedBuild`) VALUES (6007, 10666, 0, 0, 0, 0, 0, 0, 0, 0, 20000, 32750);
