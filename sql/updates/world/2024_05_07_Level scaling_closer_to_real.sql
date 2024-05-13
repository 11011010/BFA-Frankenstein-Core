## this change just brings the numbers closer to what they should be, it is not perfect or finished but much better than most things scaling from level 1 or to level 100 or 120...
## about 13,960 creatues changed.

##Scale the old world , kalimdor
UPDATE creature_template_scaling ct
JOIN creature c ON ct.Entry = c.id
SET LevelScalingMin = ((
    SELECT MIN(minlevel)
    FROM creature_template
    WHERE entry = ct.Entry
)-8),
LevelScalingMax = 63
WHERE c.map = 1
AND (
    SELECT MIN(maxlevel)
    FROM creature_template
    WHERE entry = ct.Entry
) < 66;


##Scale the old world, eastern kingdoms
UPDATE creature_template_scaling ct
JOIN creature c ON ct.Entry = c.id
SET LevelScalingMin = ((
    SELECT MIN(minlevel)
    FROM creature_template
    WHERE entry = ct.Entry
)-8),
LevelScalingMax = 63
WHERE c.map = 0
AND (
    SELECT MIN(maxlevel)
    FROM creature_template
    WHERE entry = ct.Entry
) < 66;

#all outland area
UPDATE creature_template_scaling ct
JOIN creature c ON ct.Entry = c.id
SET LevelScalingMin = (
    SELECT MIN(minlevel)
    FROM creature_template
    WHERE entry = ct.Entry
),
LevelScalingMax = 83
WHERE c.map = 530;

##Northrend -10 seems to be the sweetspot here.
UPDATE creature_template_scaling ct
JOIN creature c ON ct.Entry = c.id
SET LevelScalingMin = ((
    SELECT MIN(minlevel)
    FROM creature_template
    WHERE entry = ct.Entry
)-10),
LevelScalingMax = 93
WHERE c.map = 870;

##MOP -6 seems to be the sweetspot here.
UPDATE creature_template_scaling ct
JOIN creature c ON ct.Entry = c.id
SET LevelScalingMin = ((
    SELECT MIN(minlevel)
    FROM creature_template
    WHERE entry = ct.Entry
)-6),
LevelScalingMax = 93
WHERE c.map = 870;


##MOP panda starting area seems to be the sweetspot here.
UPDATE creature_template_scaling ct
JOIN creature c ON ct.Entry = c.id
SET LevelScalingMin = 1,
LevelScalingMax = 20
WHERE c.map = 860;


## dreanor no need for -x adjustment seems to be fine
UPDATE creature_template_scaling ct
JOIN creature c ON ct.Entry = c.id
SET LevelScalingMin = (
    SELECT MIN(minlevel)
    FROM creature_template
    WHERE entry = ct.Entry
),
LevelScalingMax = 103
WHERE c.map = 1116;

#Legion
UPDATE creature_template_scaling ct
JOIN creature c ON ct.Entry = c.id
SET LevelScalingMin = (
    SELECT MIN(minlevel)
    FROM creature_template
    WHERE entry = ct.Entry
),
LevelScalingMax = 123
WHERE c.map = 1220;


##Legion argus
UPDATE creature_template_scaling ct
JOIN creature c ON ct.Entry = c.id
SET LevelScalingMin = (
    SELECT MIN(minlevel)
    FROM creature_template
    WHERE entry = ct.Entry
),
LevelScalingMax = 123
WHERE c.map = 1669;


## do not forget to fix errors coused by -x to have minlevel 1 ant now lower
UPDATE creature_template_scaling
SET LevelScalingMin  = 1
WHERE LevelScalingMin  < 1;
