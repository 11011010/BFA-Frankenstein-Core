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