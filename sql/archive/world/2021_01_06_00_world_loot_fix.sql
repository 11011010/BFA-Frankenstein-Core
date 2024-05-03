/* ******* */
/* STEP 1: */
/* ******* */
/* fix and delete bad data */
/*
NOTE TO DEVS: Zero value of Chance is allowed for grouped entries only.
0 chance on group means equal chance. -Varjgard
*/
UPDATE creature_loot_template      SET chance = 100 WHERE chance > 100;
UPDATE gameobject_loot_template    SET chance = 100 WHERE chance > 100;
UPDATE disenchant_loot_template    SET chance = 100 WHERE chance > 100;
UPDATE fishing_loot_template       SET chance = 100 WHERE chance > 100;
UPDATE item_loot_template          SET chance = 100 WHERE chance > 100;
UPDATE milling_loot_template       SET chance = 100 WHERE chance > 100;
UPDATE pickpocketing_loot_template SET chance = 100 WHERE chance > 100;
UPDATE prospecting_loot_template   SET chance = 100 WHERE chance > 100;
UPDATE spell_loot_template         SET chance = 100 WHERE chance > 100;
UPDATE skinning_loot_template      SET chance = 100 WHERE chance > 100;
UPDATE reference_loot_template     SET chance = 100 WHERE chance > 100;
UPDATE creature_loot_template      SET chance = 20  WHERE chance = 0 AND GroupId=0;
UPDATE gameobject_loot_template    SET chance = 20  WHERE chance = 0 AND GroupId=0;
UPDATE disenchant_loot_template    SET chance = 20  WHERE chance = 0 AND GroupId=0;
UPDATE fishing_loot_template       SET chance = 20  WHERE chance = 0 AND GroupId=0;
UPDATE item_loot_template          SET chance = 20  WHERE chance = 0 AND GroupId=0;
UPDATE milling_loot_template       SET chance = 20  WHERE chance = 0 AND GroupId=0;
UPDATE pickpocketing_loot_template SET chance = 20  WHERE chance = 0 AND GroupId=0;
UPDATE prospecting_loot_template   SET chance = 20  WHERE chance = 0 AND GroupId=0;
UPDATE spell_loot_template         SET chance = 20  WHERE chance = 0 AND GroupId=0;
UPDATE skinning_loot_template      SET chance = 20  WHERE chance = 0 AND GroupId=0;
UPDATE reference_loot_template     SET chance = 20  WHERE chance = 0 AND GroupId=0;
UPDATE creature_loot_template      SET MinCount=1, MaxCount=1 WHERE MinCount=0 OR MaxCount=0;
UPDATE gameobject_loot_template    SET MinCount=1, MaxCount=1 WHERE MinCount=0 OR MaxCount=0;
UPDATE disenchant_loot_template    SET MinCount=1, MaxCount=1 WHERE MinCount=0 OR MaxCount=0;
UPDATE fishing_loot_template       SET MinCount=1, MaxCount=1 WHERE MinCount=0 OR MaxCount=0;
UPDATE item_loot_template          SET MinCount=1, MaxCount=1 WHERE MinCount=0 OR MaxCount=0;
UPDATE milling_loot_template       SET MinCount=1, MaxCount=1 WHERE MinCount=0 OR MaxCount=0;
UPDATE pickpocketing_loot_template SET MinCount=1, MaxCount=1 WHERE MinCount=0 OR MaxCount=0;
UPDATE prospecting_loot_template   SET MinCount=1, MaxCount=1 WHERE MinCount=0 OR MaxCount=0;
UPDATE spell_loot_template         SET MinCount=1, MaxCount=1 WHERE MinCount=0 OR MaxCount=0;
UPDATE skinning_loot_template      SET MinCount=1, MaxCount=1 WHERE MinCount=0 OR MaxCount=0;
UPDATE reference_loot_template     SET MinCount=1, MaxCount=1 WHERE MinCount=0 OR MaxCount=0;
DELETE FROM creature_loot_template      WHERE item < 1 OR chance < 0;
DELETE FROM gameobject_loot_template    WHERE item < 1 OR chance < 0; 
DELETE FROM disenchant_loot_template    WHERE item < 1 OR chance < 0; 
DELETE FROM fishing_loot_template       WHERE item < 1 OR chance < 0; 
DELETE FROM item_loot_template          WHERE item < 1 OR chance < 0; 
DELETE FROM milling_loot_template       WHERE item < 1 OR chance < 0; 
DELETE FROM pickpocketing_loot_template WHERE item < 1 OR chance < 0; 
DELETE FROM prospecting_loot_template   WHERE item < 1 OR chance < 0; 
DELETE FROM spell_loot_template         WHERE item < 1 OR chance < 0; 
DELETE FROM skinning_loot_template      WHERE item < 1 OR chance < 0; 
DELETE FROM reference_loot_template     WHERE item < 1 OR chance < 0; 




/* ******* */
/* STEP 2: */
/* ******* */
/* creature_loot_template */
/* set loot to 0 if not exists */
UPDATE creature_template SET lootid=0 WHERE lootid NOT IN (SELECT DISTINCT entry FROM creature_loot_template);
/* set loot to entry */
UPDATE creature_template SET lootid=entry WHERE lootid=0;
/* recheck loot and set to 0 if still not exists */
UPDATE creature_template SET lootid=0 WHERE lootid NOT IN (SELECT DISTINCT entry FROM creature_loot_template);

/* pickpocketing_loot_template */
/* set loot to 0 if not exists */
UPDATE creature_template SET pickpocketloot=0 WHERE pickpocketloot NOT IN (SELECT DISTINCT entry FROM pickpocketing_loot_template);
/* set loot to entry */
UPDATE creature_template SET pickpocketloot=entry WHERE lootid=0;
/* recheck loot and set to 0 if still not exists */
UPDATE creature_template SET pickpocketloot=0 WHERE pickpocketloot NOT IN (SELECT DISTINCT entry FROM pickpocketing_loot_template);

/* skinning_loot_template */
/* set loot to 0 if not exists */
UPDATE creature_template SET skinloot=0 WHERE skinloot NOT IN (SELECT DISTINCT entry FROM skinning_loot_template);
/* set loot to entry */
UPDATE creature_template SET skinloot=entry WHERE lootid=0;
/* recheck loot and set to 0 if still not exists */
UPDATE creature_template SET skinloot=0 WHERE skinloot NOT IN (SELECT DISTINCT entry FROM skinning_loot_template);

/* gameobject_loot_template */
/* set loot to 0 if not exists (chests) */
UPDATE gameobject_template SET Data1=0 WHERE Data1 NOT IN (SELECT DISTINCT entry FROM gameobject_loot_template) AND type=3;
/* set loot to entry  (chests) */
UPDATE `gameobject_template` SET Data1=entry WHERE Data1=0 AND type=3;
/* recheck loot and set to 0 if still not exists  (chests) */
UPDATE gameobject_template SET Data1=0 WHERE Data1 NOT IN (SELECT DISTINCT entry FROM gameobject_loot_template) AND type=3;

/* fishing_loot_template */
/* set loot to 0 if not exists (fishing holes) */
UPDATE gameobject_template SET Data1=0 WHERE Data1 NOT IN (SELECT DISTINCT entry FROM fishing_loot_template) AND type=25;
/* set loot to entry  (fishing holes) */
UPDATE `gameobject_template` SET Data1=entry WHERE Data1=0 AND type=25;
/* recheck loot and set to 0 if still not exists  (fishing holes) */
UPDATE gameobject_template SET Data1=0 WHERE Data1 NOT IN (SELECT DISTINCT entry FROM fishing_loot_template) AND type=25;



/* step3 will be done later for bfacore, it is done already for shadowcore -Varjgard */
/* ******* */
/* STEP 3: */
/* ******* */
/* now delete entries that are not used */
/*
MYSQL CANT HANDLE THESE AS DELETE QUERIES!!! TOO HEAVY!!! DO THIS PART MANUALLY!!!
USE SELECT, AND EXPORT THE DATA, THEN MAKE QUERIES MANUALLY FOR PART 3!!!

SELECT DISTINCT entry FROM creature_loot_template WHERE entry NOT IN (SELECT DISTINCT lootid FROM creature_template);
SELECT DISTINCT entry FROM pickpocketing_loot_template WHERE entry NOT IN (SELECT DISTINCT pickpocketloot FROM creature_template);
SELECT DISTINCT entry FROM skinning_loot_template WHERE entry NOT IN (SELECT DISTINCT skinloot FROM creature_template);
SELECT DISTINCT entry FROM gameobject_loot_template WHERE entry NOT IN (SELECT DISTINCT Data1 FROM gameobject_template);
SELECT DISTINCT entry FROM fishing_loot_template WHERE entry NOT IN (SELECT DISTINCT Data1 FROM gameobject_template);
*/


DELETE FROM creature_loot_template WHERE entry IN
(152612, 152661, 152708, 152875, 152898, 152905, 152995, 153174);

/* this had no unused entries */
/*DELETE FROM pickpocketing_loot_template WHERE entry IN
(xxx);*/

DELETE FROM skinning_loot_template WHERE entry IN
(1140, 1513, 2032, 3581, 5185, 5314, 5347, 5352, 5434, 5435, 5823, 5828, 5935, 5936, 5937, 6582, 6583, 6648, 8204, 8302, 8303, 8976, 10077, 10105, 10150, 10357, 11740, 11741, 11897, 12123, 12124, 12715, 14222, 14223, 14237, 14280, 14339, 14344, 14476, 14477, 14491, 15689, 16180, 16863, 16879, 16880, 16932, 16933, 16934, 16950, 17130, 17131, 17132, 17133, 17144, 17156, 17521, 18033, 18128, 18129, 18130, 18131, 18205, 18213, 18214, 18258, 18259, 18280, 18285, 18286, 18289, 18290, 18334, 18461, 18463, 18464, 18465, 18476, 18477, 18648, 18670, 18678, 18692, 18877, 18879, 18880, 18884, 18964, 19183, 19189, 19349, 19350, 19423, 19458, 19459, 19706, 19729, 19730, 19784, 19852, 19980, 20021, 20058, 20196, 20279, 20280, 20283, 20324, 20330, 20332, 20387, 20502, 20557, 20607, 20610, 20634, 20671, 20673, 20713, 20728, 20729, 20748, 20749, 20751, 20773, 20777, 20924, 20925, 20931, 20932, 20987, 21004, 21022, 21032, 21033, 21102, 21108, 21123, 21124, 21389, 21408, 21462, 21648, 21721, 21722, 21723, 21801, 21802, 21816, 21854, 21864, 21878, 21879, 21897, 21901, 21956, 22052, 22100, 22105, 22123, 22180, 22181, 22255, 22394, 22807, 23026, 23061, 23169, 23219, 23261, 23264, 23267, 23269, 23281, 23282, 23285, 23326, 23353, 23501, 23680, 23688, 23689, 23690, 23691, 23740, 23744, 23772, 23785, 23886, 23887, 23959, 23994, 24026, 24076, 24128, 24160, 24173, 24206, 24277, 24475, 24478, 24516, 24517, 24547, 24562, 24563, 24566, 24613, 24614, 24633, 24637, 24673, 24677, 24681, 24785, 24786, 24791, 24797, 24863, 24899, 24901, 24922, 25203, 25204, 25294, 25355, 25445, 25448, 25452, 25454, 25481, 25482, 25487, 25488, 25489, 25582, 25585, 25596, 25600, 25619, 25622, 25675, 25680, 25712, 25713, 25716, 25717, 25718, 25721, 25722, 25728, 25743, 25750, 25774, 25791, 25968, 26272, 26273, 26281, 26322, 26349, 26358, 26359, 26360, 26363, 26402, 26413, 26418, 26426, 26446, 26467, 26472, 26482, 26511, 26521, 26522, 26586, 26592, 26605, 26606, 26613, 26615, 26616, 26633, 26643, 26644, 26706, 26806, 27020, 27131, 27230, 27294, 27329, 27408, 27523, 27578, 27617, 28001, 28002, 28003, 28009, 28010, 28011, 28096, 28097, 28098, 28129, 28145, 28203, 28213, 28221, 28233, 28257, 28258, 28288, 28297, 28325, 28358, 28378, 28379, 28380, 28381, 28399, 28404, 28467, 28477, 28847, 28851, 29319, 29327, 29334, 29358, 29390, 29392, 29402, 29411, 29412, 29452, 29461, 29469, 29479, 29486, 29487, 29559, 29562, 29590, 29605, 29664, 29693, 29698, 29710, 29753, 29875, 29958, 30148, 30164, 30167, 30204, 30205, 30206, 30291, 30422, 30430, 30445, 30447, 30448, 30451, 30452, 30541, 30543, 30831, 30952, 31037, 31039, 31233, 31236, 31265, 31402, 31403, 31404, 32280, 32361, 32377, 32400, 32485, 32490, 32572, 32630, 33776, 35189, 38453);

DELETE FROM gameobject_loot_template WHERE entry IN
(3215, 17280, 17321, 17440, 17441, 17494, 17496, 17497, 17498, 17500, 17502, 17518, 17519, 17520, 17521, 17534, 17537, 17538, 17539, 17675, 19604, 19605, 19611, 19616, 19618, 19619, 23917, 23918, 25106, 25662, 25663, 25664, 25665, 25668, 25669, 25670, 25671, 25673, 25674, 27003, 28553, 28556, 28559, 28561, 28563, 28567, 29667, 38644, 38652, 39449, 41495, 180184, 180901, 182953, 202781, 210216, 212163, 212169, 212171, 212172, 212174, 212175, 212177, 214547, 218539, 218576, 218577, 218629, 218630, 218631, 218632, 218633, 218634, 218635, 218636, 218648, 218649, 218650, 218651, 218652, 218653, 221548, 221549, 229067, 229068, 229069, 229070, 229071, 229072, 229073, 237295, 237342, 243325);

DELETE FROM fishing_loot_template WHERE entry IN
(33, 37, 38, 41, 46, 47, 51, 66, 67, 104, 115, 117, 122, 130, 139, 141, 148, 150, 169, 209, 210, 215, 226, 267, 271, 294, 295, 298, 299, 301, 302, 305, 306, 307, 311, 327, 328, 331, 357, 361, 367, 368, 384, 385, 386, 388, 391, 392, 393, 394, 400, 401, 406, 414, 440, 443, 445, 449, 454, 456, 463, 490, 493, 495, 513, 516, 517, 518, 598, 616, 618, 636, 702, 718, 720, 796, 814, 815, 878, 1039, 1108, 1112, 1116, 1117, 1120, 1121, 1156, 1176, 1222, 1226, 1227, 1228, 1229, 1230, 1231, 1234, 1256, 1377, 1477, 1497, 1519, 1537, 1577, 1578, 1581, 1583, 1584, 1637, 1638, 1657, 1797, 1977, 2017, 2077, 2079, 2100, 2104, 2318, 2322, 2324, 2325, 2339, 2365, 2397, 2398, 2399, 2402, 2403, 2405, 2406, 2408, 2521, 2557, 2717, 2817, 2979, 3140, 3277, 3317, 3357, 3430, 3433, 3456, 3470, 3473, 3475, 3479, 3482, 3483, 3489, 3496, 3507, 3508, 3513, 3514, 3515, 3518, 3519, 3520, 3521, 3523, 3524, 3525, 3526, 3527, 3528, 3537, 3557, 3558, 3586, 3595, 3607, 3636, 3653, 3655, 3656, 3658, 3659, 3684, 3690, 3691, 3692, 3711, 3716, 3805, 3859, 3911, 3979, 3980, 3982, 3994, 3999, 4001, 4002, 4022, 4039, 4043, 4047, 4055, 4058, 4071, 4080, 4109, 4113, 4123, 4134, 4151, 4152, 4157, 4166, 4181, 4197, 4212, 4224, 4225, 4241, 4242, 4244, 4256, 4257, 4263, 4273, 4290, 4395, 4411, 4478, 4479, 4493, 4560, 4567, 4568, 4646, 4706, 4709, 4714, 4720, 4722, 4742, 4755, 4812, 4813, 4815, 4922, 4926, 4945, 4950, 4987, 5004, 5034, 5035, 5042, 5095, 5144, 5145, 5146, 5287, 5339, 5389, 5396, 5449, 5695, 5785, 5805, 5840, 5841, 5842, 5861, 6134, 6138, 6457, 6662, 6719, 6720, 6721, 6722, 6723, 6755, 6757, 6941, 7004, 7078, 7592, 7595, 8270);

DELETE FROM reference_loot_template WHERE entry IN
(4002, 4106, 4110, 4111, 4112, 4205, 4208, 4209, 4210, 24104, 109, 110, 1052, 1053, 4113, 6001, 6002, 6003, 6010, 9482, 10026, 10028, 10030, 10031, 10032, 10033, 10034, 10796, 11005, 11012, 11013, 11015, 11016, 11017, 11021, 11022, 11023, 11024, 11025, 11026, 11100, 11104, 11105, 11107, 11117, 13535, 16899, 18363, 19698, 19719, 20261, 20885, 20888, 20890, 21004, 21296, 22712, 23077, 24072, 24116, 24118, 24119, 24120, 24127, 24153, 24158, 24161, 24737, 25030, 25100, 25101, 25102, 25104, 25105, 25106, 26024, 26026, 26027, 26028, 26043, 29754, 30236, 30240, 30247, 32303, 34004, 34005, 34006, 34007, 34016, 34017, 34018, 34019, 34020, 34021, 34022, 34023, 34024, 34025, 34031, 34033, 34035, 34036, 34037, 34039, 34056, 34059, 34060, 34064, 34066, 34080, 34082, 34086, 34087, 34088, 34089, 34090, 34096, 34150, 34151, 34152, 34153, 34851, 35009, 35011, 35012, 35013, 35015, 35016, 35017, 35018, 35019, 35020, 35021, 35026, 35027, 35028, 35045, 35049, 35053, 35070, 35072, 35077, 35078, 35079, 35080, 35081, 35082, 35084, 43722, 43723, 44001, 44002, 44003, 44004, 44005, 44008, 45000, 45004, 45008, 45009, 55020, 55023, 78491, 83746, 91781, 91784, 91788, 91789, 91797, 91808, 95805, 96028, 96512, 98203, 98205, 98206, 98207, 98208, 98542, 98696, 98949, 99192, 99200, 99611, 101411, 101467, 102672, 103344, 107544, 108541, 108543, 115844, 119533, 119597, 119749, 120393, 120395, 120704, 120723, 121250, 121251, 121531, 121546, 121563, 121575, 121670, 121671, 121672, 122039, 122041, 122835, 122838, 122911, 122912, 122942, 122947, 123130, 123301, 123302, 123421, 123422, 123464, 123658, 123659, 123689, 123918, 123919, 124432, 124435, 124440, 124448, 124670, 124775, 124804, 125121, 125129, 125151, 125152, 125158, 125159, 125190, 125294, 125388, 125497, 125498, 125820, 125824, 126152, 126165, 126168, 126193, 126233, 126254, 126338, 126419, 126457, 126458, 126765, 126815, 126852, 126860, 126862, 126864, 126865, 126866, 126867, 126868, 126869, 126887, 126889, 126896, 126899, 126900, 126908, 126912, 126913, 126941, 126995, 126997, 126998, 127090, 127103, 127114, 127116, 127118, 127162, 127188, 127288, 127300, 127376, 127579, 127587, 127596, 127597, 127599, 127700, 127703, 127705, 127783, 127784, 127791, 127795, 127796, 127797, 127934, 145967, 148028, 148292, 149004, 149707, 149839, 150373, 150376, 150508, 150667, 150696, 150698, 150937, 150940, 151301, 151602, 151609, 151610, 151612, 151640, 151660, 151662, 151663, 151667, 151720, 151792, 151799, 151800, 151801, 151806, 151852, 151858, 151880, 151897, 151943, 151960, 151992, 151995, 152356, 152357, 152358, 152359, 152362, 152541, 152638, 152639, 152649, 152653, 152657, 153107, 153179, 153192, 153542, 153544, 153570, 153804, 153812, 153814, 153843, 153888, 153896, 153903, 153904, 153905, 153910, 154091, 154448, 154482, 154491, 155465, 155468, 155542, 155544, 155545, 155703, 155834, 155914, 155918, 155957, 156078, 156299, 156458, 156565, 156567, 156568, 156572, 156576, 156637, 156652, 156654, 156675, 156709, 157034, 157087, 157097, 157101, 157103, 157120, 157156, 157157, 157160, 157164, 157167, 157170, 157171, 157176, 157183, 157266, 157267, 157287, 157291, 157345, 157390, 157443, 157469, 157470, 157472, 157473, 157476, 157680, 157755, 157757, 157759, 157792, 157793, 157794, 157808, 157942, 157947, 157959, 158052, 158557, 158594, 158595, 158597, 158633, 158636, 158871, 158872, 158873, 159261, 159262, 159271, 160462, 160463, 160464, 160465, 160538, 160550, 160623, 160810, 160825, 160826, 160867, 160868, 160872, 160874, 160878, 160893, 160906, 160914, 160920, 160922, 162140, 162141, 162142, 162147, 162163, 162170, 162172, 162173, 162241, 162243, 162244, 162246, 162247, 162249, 162250, 162251, 162252, 162253, 162287, 162288, 162289, 163072, 163300, 163301, 163303, 163304, 163306, 163308, 163703, 163704, 163705, 521510, 521550);



/* ################ */
/* ### CLEAN UP ### */
/* ################ */

/* delete poi if quest does not exist */
DELETE FROM `quest_poi`        WHERE QuestID NOT IN (SELECT ID FROM `quest_template`);
DELETE FROM `quest_poi_points` WHERE QuestID NOT IN (SELECT ID FROM `quest_template`);

/* clean creature and gameobject tables from not existing entries */
DELETE FROM creature   WHERE id NOT IN (SELECT entry FROM creature_template);
DELETE FROM gameobject WHERE id NOT IN (SELECT entry FROM gameobject_template);
DELETE FROM creature_addon   WHERE guid NOT IN (SELECT guid FROM creature);
DELETE FROM gameobject_addon WHERE guid NOT IN (SELECT guid FROM gameobject);
DELETE FROM creature_template_addon   WHERE entry NOT IN (SELECT entry FROM creature_template);
DELETE FROM gameobject_template_addon WHERE entry NOT IN (SELECT entry FROM gameobject_template);

/* refresh creature table stats */
UPDATE creature SET currentwaypoint=0, curhealth=0, curmana=0;

/* #################### */
/* ### CLEAN UP END ### */
/* #################### */



