-- Michael Crowe Fishing Trainer
-- Delete data from npc_trainer (not using it anymore)
DELETE FROM `npc_trainer` WHERE (`ID` = 23896);
DELETE FROM `creature_trainer` WHERE `CreatureId` = '23896';
INSERT INTO `creature_trainer` VALUES (23896, 23896, 7361, 0);
-- Define trainer
DELETE FROM `trainer_spell` WHERE `TrainerId` = '23896';
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES
('23896', '131476', '10', '0', '0', '0'),
('23896', '271657', '10', '356', '1', '0'),
('23896', '271659', '10', '356', '1', '0'),
('23896', '271661', '10', '356', '1', '0'),
('23896', '271663', '10', '356', '1', '0'),
('23896', '271665', '10', '356', '1', '0'),
('23896', '271673', '10', '356', '1', '0');

-- Fizzlok Fishing Trainer
-- Delete data from npc_trainer (not using it anymore)
DELETE FROM `npc_trainer` WHERE (`ID` = 138026);
DELETE FROM `creature_trainer` WHERE `CreatureId` = '138026';
INSERT INTO `creature_trainer` VALUES (138026, 138026, 17157, 0);
-- Define trainer
DELETE FROM `trainer_spell` WHERE `TrainerId` = '138026';
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES
('138026', '131476', '10', '0', '0', '0'),
('138026', '271657', '10', '356', '1', '0'),
('138026', '271659', '10', '356', '1', '0'),
('138026', '271661', '10', '356', '1', '0'),
('138026', '271663', '10', '356', '1', '0'),
('138026', '271665', '10', '356', '1', '0'),
('138026', '271673', '10', '356', '1', '0');

-- Set npcflag gossip
UPDATE `creature_template` SET `npcflag` = '81' WHERE `entry` = '138026';

-- Akan Fishing Trainer
-- Delete data from npc_trainer (not using it anymore)
DELETE FROM `npc_trainer` WHERE (`ID` = 138460);
DELETE FROM `creature_trainer` WHERE `CreatureId` = '138460';
INSERT INTO `creature_trainer` VALUES (138460, 138460, 17157, 0);
-- Define trainer
DELETE FROM `trainer_spell` WHERE `TrainerId` = '138460';
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES
('138460', '131476', '10', '0', '0', '0'),
('138460', '271657', '10', '356', '1', '0'),
('138460', '271659', '10', '356', '1', '0'),
('138460', '271661', '10', '356', '1', '0'),
('138460', '271663', '10', '356', '1', '0'),
('138460', '271665', '10', '356', '1', '0'),
('138460', '271673', '10', '356', '1', '0');

-- Set npcflag gossip
UPDATE `creature_template` SET `npcflag` = '81' WHERE `entry` = '138460';

-- Alan Goyle Fishing Trainer
-- Delete data from npc_trainer (not using it anymore)
DELETE FROM `npc_trainer` WHERE (`ID` = 136102);
DELETE FROM `creature_trainer` WHERE `CreatureId` = '136102';
INSERT INTO `creature_trainer` VALUES (136102, 136102, 17157, 0);
-- Define trainer
DELETE FROM `trainer_spell` WHERE `TrainerId` = '136102';
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES
('136102', '131476', '10', '0', '0', '0'),
('136102', '271657', '10', '356', '1', '0'),
('136102', '271659', '10', '356', '1', '0'),
('136102', '271661', '10', '356', '1', '0'),
('136102', '271663', '10', '356', '1', '0'),
('136102', '271665', '10', '356', '1', '0'),
('136102', '271719 ', '10', '356', '1', '0'),
('136102', '271673', '10', '356', '1', '0');

-- Mirvedon Apprentice Blacksmith
UPDATE `creature_template` SET `npcflag` = 1 WHERE (`entry` = 16671);
-- Gloresse Apprentice Engineer 
UPDATE `creature_template` SET `npcflag` = 1 WHERE (`entry` = 16668);
-- Toban Apprentice Jewelcrafter
UPDATE `creature_template` SET `npcflag` = 1 WHERE (`entry` = 19774);
-- Amin Apprentice Jewelcrafter
UPDATE `creature_template` SET `npcflag` = 1 WHERE (`entry` = 16703);
-- Talmar Apprentice Leatherworker
UPDATE `creature_template` SET `npcflag` = 1 WHERE (`entry` = 16687);

