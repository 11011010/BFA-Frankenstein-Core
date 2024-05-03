/*-----------------RACE-VOID-NATHANOS-------------------------------*/
DELETE FROM `conversation_actors` WHERE (`ConversationId`=6531 AND `Idx`=0);
INSERT INTO `conversation_actors` (`ConversationId`, `ConversationActorNearId`, `Idx`, `VerifiedBuild`) VALUES
(6531, 131326, 0, 31478); -- Full: 0x2000289880803F800000000000000020 Creature/0 R10/S0 Map: Broken Isles Entry: First Arcanist Thalyssra Low: 32

DELETE FROM `conversation_actor_template` WHERE `Id`=131326;
INSERT INTO `conversation_actor_template` (`Id`, `CreatureId`, `CreatureModelId`, `VerifiedBuild`) VALUES
(131326, 131326, 67345, 31478);

DELETE FROM `conversation_line_template` WHERE `Id` IN (15516, 15515, 15514, 15513, 15511, 14832, 14831, 14830, 14829, 14828);
INSERT INTO `conversation_line_template` (`Id`, `StartTime`, `UiCameraID`, `ActorIdx`, `Flags`, `VerifiedBuild`) VALUES
(15516, 47630, 606, 0, 0, 31478),
(15515, 35678, 606, 0, 0, 31478),
(15514, 20366, 606, 0, 0, 31478),
(15513, 10427, 606, 0, 0, 31478),
(15511, 0, 606, 0, 0, 31478),
(14832, 38895, 0, 0, 0, 31478),
(14831, 32475, 0, 0, 0, 31478),
(14830, 25441, 0, 0, 0, 31478),
(14829, 13279, 0, 0, 0, 31478),
(14828, 0, 0, 0, 0, 31478);

UPDATE `conversation_template` SET `Id`='6800', `FirstLineId`='15511', `LastLineEndTime`='56960', `TextureKitId`='5125', `ScriptName`='', `VerifiedBuild`='26972' WHERE (`Id`='6800');

DELETE FROM `conversation_template` WHERE `Id` IN (6531);
INSERT INTO `conversation_template` (`Id`, `FirstLineID`, `LastLineEndTime`, `TextureKitId`, `VerifiedBuild`) VALUES
(6531, 14828, 46895, 0, 31478);

DELETE FROM `quest_conversation` WHERE `questId` = '49933';
INSERT INTO `quest_conversation` (`questId`, `questAcceptConversation`, `questCompleteConversation`) VALUES ('49933', '6531', '0');

DELETE FROM `smart_scripts` WHERE `entryorguid` = '131326';

UPDATE `creature_template` SET `entry`='131326', `AIName`='' WHERE (`entry`='131326');

DELETE FROM `gameobject` WHERE `guid` = '162991';


/*----------------RACE-VOID-ELF----------------------------*/
DELETE FROM `conversation_actors` WHERE `ConversationId` IN (6798);
INSERT INTO `conversation_actors` (`ConversationId`, `ConversationActorNearId`, `Idx`, `VerifiedBuild`) VALUES
(6798, 131345, 0, 31478), -- Full: 0x200028E9208044400000000000000045 Creature/0 R10/S0 Map: Telogrus Rift Entry: 131345 Low: 69
(6798, 132382, 1, 31478); -- Full: 0x200028E9208147800000000000000046 Creature/0 R10/S0 Map: Telogrus Rift Entry: 132382 Low: 70

DELETE FROM `conversation_actor_template` WHERE `Id` IN (131345, 132382);
INSERT INTO `conversation_actor_template` (`Id`, `CreatureId`, `CreatureModelId`, `VerifiedBuild`) VALUES
(131345, 131345, 78869, 31478),
(132382, 132382, 82404, 31478);

DELETE FROM `conversation_actors` WHERE `ConversationId` = '6793';
INSERT INTO `conversation_actors` (`ConversationId`, `ConversationActorId`, `ConversationActorGuid`, `ConversationActorNearId`, `Idx`, `VerifiedBuild`) VALUES ('6793', '126306', '0', '0', '0', '26972');

DELETE FROM `conversation_template` WHERE `Id` = '6793';
INSERT INTO `conversation_template` (`Id`, `FirstLineId`, `LastLineEndTime`, `TextureKitId`, `ScriptName`, `VerifiedBuild`) VALUES ('6793', '15489', '37063', '5124', '', '28768');

DELETE FROM `conversation_actor_template` WHERE `Id` = '126306'; 
INSERT INTO `conversation_actor_template` (`Id`, `CreatureId`, `CreatureModelId`, `VerifiedBuild`) VALUES ('126306', '126306', '65199', '26972');

DELETE FROM `conversation_line_template` WHERE `Id` IN (15509, 15508, 15507, 15506, 15505, 15493, 15492, 15489);
INSERT INTO `conversation_line_template` (`Id`, `StartTime`, `UiCameraID`, `ActorIdx`, `Flags`, `VerifiedBuild`) VALUES
(15509, 33052, 0, 0, 0, 31478),
(15508, 28191, 0, 1, 0, 31478),
(15507, 15696, 0, 1, 0, 31478),
(15506, 8589, 0, 0, 0, 31478),
(15505, 0, 0, 0, 0, 31478),
(15493, 23228, 82, 0, 0, 31478),
(15492, 9141, 82, 0, 0, 31478),
(15489, 0, 82, 0, 0, 31478);

DELETE FROM `gameobject` WHERE `guid` = '20373549';

DELETE FROM `gameobject` WHERE `guid` IN (80000000, 80000001, 80000002);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `PhaseId`, `PhaseGroup`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
(80000000, 281339, 0, 1519, 9171, '0', '0', 0, -8341.76953125, 641.75701904296875, 95.85759735107421875, 3.787369966506958007, 0, 0, -0.94832324981689453, 0.317305892705917358, 120, 255, 1, 31478),
(80000001, 298865, 0, 1519, 9171, '0', '0', 0, -8156.31005859375, 823.7449951171875, 76.10880279541015625, 3.922300100326538085, 0, 0, -0.924774169921875, 0.380516409873962402, 120, 255, 1, 31478),
(80000002, 316736, 0, 1519, 9171, '0', '0', 0, -8146.39013671875, 814.06597900390625, 75.7173004150390625, 3.893830060958862304, 0, 0, -0.93009757995605468, 0.367312550544738769, 120, 255, 1, 31478);

DELETE FROM `conversation_template` WHERE `Id` IN (6798);
INSERT INTO `conversation_template` (`Id`, `FirstLineID`, `LastLineEndTime`, `TextureKitId`, `VerifiedBuild`) VALUES
(6798, 15505, 41052, 0, 31478);

UPDATE `creature_template` SET `entry`='132382', `AIName`='' WHERE (`entry`='132382');
UPDATE `creature_template` SET `entry`='131345', `AIName`='' WHERE (`entry`='131345');

DELETE FROM `quest_conversation` WHERE `questId` = '49788';
INSERT INTO `quest_conversation` (`questId`, `questAcceptConversation`, `questCompleteConversation`) VALUES ('49788', '6798', '0');

UPDATE `quest_template_addon` SET `ID`='49788', `NextQuestID`='50305' WHERE (`ID`='49788');

DELETE FROM `creature_queststarter` WHERE `quest` = '50305';
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES ('133362', '50305');
