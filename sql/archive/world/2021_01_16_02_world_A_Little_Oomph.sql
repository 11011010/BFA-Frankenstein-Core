/*Adding missing poi points for the quest A Little Oomph (id: 25013)*/
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`) VALUES
(25013, 1, 0, 1752, -730, 22908),
(25013, 0, 7, 2317, -1083, 22908),
(25013, 0, 6, 2119, -889, 22908),
(25013, 0, 5, 2094, -858, 22908),
(25013, 0, 4, 2099, -845, 22908),
(25013, 0, 3, 2152, -717, 22908),
(25013, 0, 2, 2186, -694, 22908),
(25013, 0, 1, 2417, -784, 22908),
(25013, 0, 0, 2350, -1114, 22908);

/*Adding missing pois for the quest A Little Oomph (id: 25013)*/
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES
(25013, 0, 0, 0, 263089, 2872, 0, 20, 0, 1, 0, 0, 0, 0, 22908),
(25013, 1, 1, -1, 0, 0, 0, 20, 0, 1, 0, 0, 0, 0, 22908);
/*END OF PATCH*/
/*wr4i7h#3301*/
