-- Fix items Forgotten Techniques of Kul Tiras
-- Myra Cabot (Mining)
UPDATE `npc_vendor` SET `OverrideGoldCost` = 10000000 WHERE `entry` = 136091 AND `item` = 163836;

-- Camilla Darksky (Skinning)
UPDATE `npc_vendor` SET `OverrideGoldCost` = 10000000 WHERE `entry` = 136061 AND `item` = 163838;

-- Declan Senal (Herbalism)
UPDATE `npc_vendor` SET `OverrideGoldCost` = 10000000 WHERE `entry` = 136096 AND `item` = 163834;

-- Fix Items Forgotten Techniques of Zandalar
-- Battersnoosh and Granda Watae (Herbalism)
UPDATE `npc_vendor` SET `OverrideGoldCost` = 10000000 WHERE `entry` = 132130 AND `item` = 163835;
UPDATE `npc_vendor` SET `OverrideGoldCost` = 10000000 WHERE `entry` = 138065 AND `item` = 163835;

-- Secott the Goldsmith (Mining)
UPDATE `npc_vendor` SET `OverrideGoldCost` = 10000000 WHERE `entry` = 122694 AND `item` = 163837;

-- Rana the Cutta (Skinning)
UPDATE `npc_vendor` SET `OverrideGoldCost` = 10000000 WHERE `entry` = 122699 AND `item` = 163839;