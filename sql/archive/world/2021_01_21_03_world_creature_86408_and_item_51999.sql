-- Fix level from Stormshield Guard
UPDATE `creature_template` SET `minlevel` = 100 WHERE `entry` = 86408;
UPDATE `creature_template` SET `maxlevel` = 100 WHERE `entry` = 86408;

-- Fix item loot Satchel of Helpful Goods
UPDATE `item_loot_template` SET `Chance` = 23 WHERE `Entry` = 51999 AND `Item` = 51964;
UPDATE `item_loot_template` SET `Chance` = 14 WHERE `Entry` = 51999 AND `Item` = 51968;
UPDATE `item_loot_template` SET `Chance` = 10 WHERE `Entry` = 51999 AND `Item` = 51978;
UPDATE `item_loot_template` SET `GroupId` = 0 WHERE `Entry` = 51999 AND `Item` = 51964;
UPDATE `item_loot_template` SET `GroupId` = 0 WHERE `Entry` = 51999 AND `Item` = 51968;
UPDATE `item_loot_template` SET `GroupId` = 0 WHERE `Entry` = 51999 AND `Item` = 51978;
UPDATE `item_loot_template` SET `GroupId` = 0 WHERE `Entry` = 51999 AND `Item` = 51994;
UPDATE `item_loot_template` SET `Item` = 143582, `Reference` = 0, `Chance` = 1.1 WHERE `Entry` = 51999 AND `Item` = 3;
UPDATE `item_loot_template` SET `Item` = 143580, `Reference` = 0, `Chance` = 0.8 WHERE `Entry` = 51999 AND `Item` = 1;
DELETE FROM `item_loot_template` WHERE `Entry` = 51999 AND `Item` = 2;