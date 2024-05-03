UPDATE `creature_template` SET `flags_extra`='128' WHERE (`entry`='37995');
UPDATE `quest_objectives` SET `Description`='Capture Swiftclaw' WHERE (`ID`='266030');
UPDATE `quest_objectives` SET `Description`='Return Swiftclaw to the Raptor Pens' WHERE (`ID`='266031');
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_swiftclaw_37989' WHERE (`entry`='37989');
DELETE FROM smart_scripts WHERE entryorguid = 37989;
UPDATE `creature_template` SET `ScriptName`='npc_kijara_37969' WHERE (`entry`='37969');
