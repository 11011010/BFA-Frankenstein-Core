##Delete the two custom heirloom vendors I will leave them to make it easier to find.
##DELETE FROM `bfa_world`.`creature` WHERE  `guid`=2103360742289;
##DELETE FROM `bfa_world`.`creature` WHERE  `guid`=2103360742288;

UPDATE `bfa_world`.`npc_vendor` SET `ExtendedCost`=5563 WHERE  `entry`=500511 AND `ExtendedCost`=0 AND `type`=1;
UPDATE `bfa_world`.`npc_vendor` SET `ExtendedCost`=5563 WHERE  `entry`=142086 AND `ExtendedCost`=0 AND `type`=1;
UPDATE `bfa_world`.`npc_vendor` SET `ExtendedCost`=5563 WHERE  `entry`=142185 AND `ExtendedCost`=0 AND `type`=1;
UPDATE `bfa_world`.`npc_vendor` SET `ExtendedCost`=5563 WHERE  `entry`=46602 AND `ExtendedCost`=0 AND `type`=1;



UPDATE `bfa_world`.`npc_vendor` SET `OverrideGoldCost`=10000000 WHERE  `entry`=500511 AND `ExtendedCost`=5563 AND `type`=1;
UPDATE `bfa_world`.`npc_vendor` SET `OverrideGoldCost`=10000000 WHERE  `entry`=142086 AND `ExtendedCost`=5563 AND `type`=1;
UPDATE `bfa_world`.`npc_vendor` SET `OverrideGoldCost`=10000000 WHERE  `entry`=142185 AND `ExtendedCost`=5563 AND `type`=1;
UPDATE `bfa_world`.`npc_vendor` SET `OverrideGoldCost`=10000000 WHERE  `entry`=46602 AND `ExtendedCost`=5563 AND `type`=1;