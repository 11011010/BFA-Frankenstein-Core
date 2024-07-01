-- Fix Blacksmithing Trainer Grix Barlow
-- now you can buy stuff and delete doppel Gossip Menu
DELETE FROM `gossip_menu_option` WHERE `MenuId` = 22155 AND `OptionIndex` = 1;
UPDATE `gossip_menu_option` SET `OptionIndex` = 1 WHERE `MenuId` = 22155 AND `OptionIndex` = 2;
UPDATE `gossip_menu_option` SET `OptionType` = 3 WHERE `MenuId` = 22155 AND `OptionIndex` = 1;
