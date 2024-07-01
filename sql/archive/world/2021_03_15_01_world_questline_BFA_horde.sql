-- Only Horde Races can see quest
-- quest The Speaker's Imperative
UPDATE `quest_template` SET `AllowableRaces`=1308636082 WHERE id=53031;

-- quest Battle for Azeroth: Mission Statement
UPDATE `quest_template` SET `AllowableRaces`=1308636082 WHERE id=51443;

-- Fix Quest Complete NPC
UPDATE `creature_template` SET `npcflag` = 3  WHERE (`entry` = 135205);

-- quest The Stormwind Extraction
UPDATE `quest_template` SET `AllowableRaces`=1308636082 WHERE id=50769;
