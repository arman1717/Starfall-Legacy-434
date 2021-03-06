-- Deletes creature Tidebreaker Sailor (id: 49350, guid: 759018) in zone: 4922, area: 5140
DELETE FROM `creature` WHERE `guid` = 759018; DELETE FROM creature_addon WHERE guid = 759018;

-- Deletes creature Tidebreaker Sailor (id: 49350, guid: 759017) in zone: 4922, area: 5140
DELETE FROM `creature` WHERE `guid` = 759017; DELETE FROM creature_addon WHERE guid = 759017;

UPDATE `creature_template` SET `ScriptName`='npc_th_axebite_infantry' WHERE `entry`=49008;

UPDATE `creature` SET `phaseMask`=2 WHERE `id` IN (49342, 49008, 49284, 49009, 49028, 49143);
UPDATE `creature` SET `phaseMask`=2 WHERE `guid` IN (764707, 764980, 764265, 764264, 759032);
UPDATE `creature_template_addon` SET `bytes1`=0, `auras`='' WHERE `entry`=49009;
UPDATE `creature_template_addon` SET `auras`='95843' WHERE  `entry`=49284;
UPDATE `creature_template` SET `unit_flags`=0, `unit_flags2`=0 WHERE `entry`=49008;
UPDATE `creature_template` SET `unit_flags`=0, `unit_flags2`=2048, `dynamicflags`=0 WHERE `entry`=49009;
UPDATE `creature_template` SET `unit_flags`=0, `unit_flags2`=0 WHERE `entry`=49028;
UPDATE `creature_template` SET `ScriptName`='npc_th_tidebreaker_sailor' WHERE `entry`=49028;
UPDATE `creature_template` SET `ScriptName`='npc_th_highbank_guardsman' WHERE `entry`=49342;
UPDATE `creature_template` SET `unit_flags`=0, `unit_flags2`=0 WHERE `entry`=49342;
UPDATE `creature_template` SET `ScriptName`='npc_th_bilgewater_gunman' WHERE `entry`=49009;

DELETE FROM `creature` WHERE `guid` = '841873';
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(841873, 49022, 0, 1, 2, 0, 1, -4946.65, -6704.95, 14.9801, 5.30686, 300, 0, 0, 70946, 0, 0, 0, 0, 0);

DELETE FROM `creature_addon` WHERE `guid` = '841873';
INSERT INTO `creature_addon` (`guid`, `bytes2`, `emote`) VALUES
(841873, 1, 333);

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '1';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 1, 2, 0, 'Twilight Highlands [A]: Add Phase 2 On Quest Complete: Twilight Shores [28832]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '1' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28832';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 1, 0, 0, 28, 0, 28832, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '2';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 2, 2, 0, 'Twilight Highlands [A]: Add Phase 2 On Quest Rewarded: Twilight Shores [28832]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '2' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28832';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 2, 0, 0, 8, 0, 28832, 0, 0, 0, 0, 0, '', '');

UPDATE `creature` SET `spawntimesecs`=60, `spawndist`=4 WHERE `id` IN (49008,49009);

DELETE FROM `creature_addon` WHERE `guid` = '764265';
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES
(764265, '49414');

DELETE FROM `creature_addon` WHERE `guid` = '764264';
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES
(764264, '49414 93391');

DELETE FROM `spell_area` WHERE `spell` = '49416' AND `quest_start` = '28832';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`) VALUES
(49416, 5140, 28832, 28597, 1, 66);

UPDATE `quest_template` SET `PrevQuestId`='28596' WHERE `Id`=28597;

-- Position update for Fargo Flintlocke (id: 49020) in zone: 4922, area: 5140
UPDATE `creature` SET `position_x` = -4857.037, `position_y` = -6589.754, `position_z` = 10.661, `orientation`= 5.422 WHERE `guid` = 759162;

UPDATE `gameobject` SET `phaseMask`=2 WHERE `guid` IN (727493, 727494);
UPDATE `creature` SET `phaseMask`=2 WHERE `guid`=759162;

DELETE FROM `creature_addon` WHERE `guid` = '759162';
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES
(759162, '49415');

#IMPOSTARE QUESTEND
DELETE FROM `spell_area` WHERE `spell` = '49417' AND `quest_start` = '28597';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49417, 5140, 28597, 1, 66, 0);

UPDATE `creature_template` SET `ScriptName`='npc_th_fargo_near_cannon' WHERE `entry`=49020;
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=49020;
UPDATE `creature_template` SET `npcflag`=1 WHERE `entry`=49143;
UPDATE `creature_template` SET `ScriptName`='npc_th_cannon_powder_barrel' WHERE `entry`=49143;
UPDATE `creature` SET `spawntimesecs`=60 WHERE `id`=49143;
UPDATE `creature` SET `phaseMask`=2 WHERE `guid`=764274;

DELETE FROM `creature_addon` WHERE `guid` = '764274';
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES
(764274, '49415');

UPDATE `creature_addon` SET `bytes2`=1, `emote`=333 WHERE `guid`=759162;
UPDATE `quest_template` SET `Method`=0 WHERE `Id`=28598;

DELETE FROM `creature` WHERE `guid` = '841874';
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(841874, 49020, 0, 1, 1, 0, 1, -4849.76, -6597.83, 9.41808, 5.69525, 300, 0, 0, 96744, 0, 0, 0, 0, 0);

DELETE FROM `creature_addon` WHERE `guid` = '841874';
INSERT INTO `creature_addon` (`guid`) VALUES
(841874);

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '3';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 3, 2, 4, 'Twilight Highlands [A]: Negate Phase 2 On Quest Rewarded: Aiming High [28598]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '3' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28598';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 3, 0, 0, 8, 0, 28598, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '4';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 4, 1, 0, 'Twilight Highlands [A]: Add Phase 1 On Quest Rewarded: Aiming High [28598]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '4' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28598';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 4, 0, 0, 8, 0, 28598, 0, 0, 0, 0, 0, '', '');

UPDATE `quest_template` SET `PrevQuestId`='27537' WHERE `Id`=27545;
UPDATE `quest_template` SET `PrevQuestId`='27338' WHERE `Id` IN (27341, 27366);
UPDATE `creature_template_addon` SET `emote`=333 WHERE `entry`=45368;
UPDATE `creature_template` SET `ScriptName`='npc_th_highbank_sniper' WHERE `entry`=45368;
UPDATE `creature_template` SET `unit_flags`=0, `unit_flags2`=0 WHERE `entry` IN (45174, 45175);
UPDATE `creature_template` SET `ScriptName`='npc_th_highbank_guardsman' WHERE `entry`=45174;
UPDATE `creature_template` SET `ScriptName`='npc_th_axebite_marine' WHERE `entry`=45175;
UPDATE `quest_template` SET `Flags`=8, `SpecialFlags`=2 WHERE `Id`=27341;

DELETE FROM `areatrigger_scripts` WHERE `entry` IN (6304, 6425);
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(6304, 'th_control_point'),
(6425, 'th_control_point');

UPDATE `creature` SET `spawndist`=10, `MovementType`=1 WHERE `id`=45185;
UPDATE `creature` SET `phaseMask`=1 WHERE `guid`=771225;

#IMPOSTARE QUESTEND
DELETE FROM `spell_area` WHERE `spell` = '98392' AND `quest_start` = '28599';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(98392, 5425, 28599, 1, 64, 0);

DELETE FROM `creature_text` WHERE `entry`=45168;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(45168,0,0,'Can we fire some more cannons? I dunnae think we\'re firin\' nearly enough cannons.',12,0,100,1,0,0,'Comment'),
(45168,0,1,'More artillery... more! I never liked peninsulas.',12,0,100,1,0,0,'Comment'),
(45168,0,2,'So long as we\'re sendin\' troops up the beach, we should double-up the artillery-fire. You know, to help.',12,0,100,1,0,0,'Comment'),
(45168,0,3,'Thas\'it! Pulverize the beach! Leave nuthin\' but ... sand.',12,0,100,1,0,0,'Comment');

-- Fargo Flintlocke
SET @ENTRY := 45168;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,5000,25000,10000,30000,1,0,5000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Talk Random");

DELETE FROM `spell_area` WHERE `spell` = '49416' AND `quest_start` = '27514';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49416, 5425, 27514, 27516, 1, 66, 11);

UPDATE `creature` SET `phaseMask`=1 WHERE `guid` IN (771226, 771227);
UPDATE `quest_template` SET `PrevQuestId`='27516' WHERE `Id`=27538;
UPDATE `quest_template` SET `PrevQuestId`='27545' WHERE `Id`=27621;
UPDATE `creature` SET `spawntimesecs`=60 WHERE `id` IN (45175, 45174);
UPDATE `quest_template` SET `SpecialFlags`=2 WHERE `Id`=27200;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=45224;

DELETE FROM `creature_text` WHERE `entry`=45171;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(45171,0,0,'Avert yer eyes! Don\'t look at her!',12,0,100,1,0,0,'Comment'),
(45171,1,0,'Don\'t listen to her voice!',12,0,100,5,0,0,'Comment'),
(45171,2,0,'Don\'t look at her... ruby red... soft... sensual lips! Oh...',12,0,100,20,0,0,'Comment'),
(45171,3,0,'Eh - what? Who? What\'s going on?',12,0,100,1,0,0,'Comment'),
(45171,4,0,'Here she comes. Oh, foul temptress of the sea...',12,0,100,1,0,0,'Comment'),
(45171,5,0,'Hold fast. This is for yer own protection.',12,0,100,1,0,0,'Comment'),
(45171,6,0,'There! She reveals herself. Attack!',12,0,100,1,0,0,'Comment');

-- Position update for Stranded Crewman (id: 45210) in zone: 4922, area: 5424
UPDATE `creature` SET `position_x` = -4966.061, `position_y` = -6451.450, `position_z` = 1.987, `orientation`= 3.257 WHERE `guid` = 758985;

-- Position update for Stranded Crewman (id: 45210) in zone: 4922, area: 5424
UPDATE `creature` SET `position_x` = -4964.316, `position_y` = -6448.326, `position_z` = 1.857, `orientation`= 3.326 WHERE `guid` = 758987;

-- Position update for Stranded Crewman (id: 45210) in zone: 4922, area: 5424
UPDATE `creature` SET `position_x` = -4971.788, `position_y` = -6439.136, `position_z` = 0.437, `orientation`= 3.827 WHERE `guid` = 758972;

-- Position update for Stranded Crewman (id: 45210) in zone: 4922, area: 5424
UPDATE `creature` SET `position_x` = -4969.158, `position_y` = -6440.994, `position_z` = 0.824, `orientation`= 3.701 WHERE `guid` = 758971;

-- Position update for Ephram Hardstone (id: 45171) in zone: 4922, area: 5424
UPDATE `creature` SET `position_x` = -4964.463, `position_y` = -6443.625, `position_z` = 1.401, `orientation`= 0.480 WHERE `guid` = 758986;

UPDATE `creature_template` SET `InhabitType`=7, `ScriptName`='npc_th_ophelia' WHERE `entry`=45183;
UPDATE `creature_template` SET `ScriptName`='npc_th_ephram_hardstone' WHERE `entry`=45171;
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=45183;

-- Position update for Lashed to the Mast (id: 45224) in zone: 4922, area: 5424
UPDATE `creature` SET `position_x` = -4958.703, `position_y` = -6443.234, `position_z` = 4.683, `orientation`= 3.489 WHERE `guid` = 758970;

UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=45171;
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=45224;
UPDATE `creature_template` SET `scale`=1 WHERE `entry`=45224;

DELETE FROM `creature_template_addon` WHERE `entry` = '45183';
INSERT INTO `creature_template_addon` (`entry`, `emote`) VALUES
(45183, 474);

UPDATE `creature_template` SET `VehicleId`=1146 WHERE `entry`=45768;
UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE `menu_id`=12055 AND `id`=0;

DELETE FROM `conditions` WHERE `SourceGroup`=12055 AND `SourceEntry` = '0';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 12055, 0, 0, 0, 9, 0, 27516, 0, 0, 0, 0, 0, '', 'Thordun - Show gossip only if quest 27516 is active');

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '45768';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(45768, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '45768';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(45768, 45770, 1, 0, 'Thordun on Lightning', 8, 0);

DELETE FROM `script_waypoint` WHERE `entry` = '45768';
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES
(45768, 1, -4483.62, -6050.26, 48.07, 'Lightning WP'),
(45768, 2, -4492.00, -6322.43, 66.02, 'Lightning WP'),
(45768, 3, -4479.42, -6477.87, 66.02, 'Lightning WP'),
(45768, 4, -4539.45, -6508.91, 87.02, 'Lightning WP'),
(45768, 5, -4679.06, -6487.46, 107.66, 'Lightning WP'),
(45768, 6, -4884.82, -6597.59, 82.45, 'Lightning WP'),
(45768, 7, -4899.71, -6629.10, 51.92, 'Lightning WP'),
(45768, 8, -4894.23, -6639.71, 37.41, 'Lightning WP'),
(45768, 9, -4882.01, -6634.58, 24.63, 'Lightning WP'),
(45768, 10, -4884.83, -6629.58, 16.46, 'Lightning WP'),
(45768, 11, -4888.56, -6641.86, 9.86, 'Lightning WP');

DELETE FROM `creature_text` WHERE `entry`=45172;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(45172,0,0,'Hop aboard, $n. Let\'s move!',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=45770;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(45770,0,0,'I hope you Alliance are here to give them Dragonmaw Orcs a good thumpin\'.',12,0,100,0,0,0,'Comment'),
(45770,1,0,'Stuff me like a haggis! Kurdran Wildhammer - in the flesh. He lives!',12,0,100,0,0,0,'Comment'),
(45770,2,0,'You\'ve got quite the setup here, friend. Come with me while I find out who\'s in charge.',12,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `unit_flags`=768, `ScriptName`='npc_th_lightning_travel' WHERE `entry`=45768;

-- Thordun Hammerblow
SET @ENTRY := 45172;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,62,0,100,0,12055,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Close Gossip"),
(@ENTRY,@SOURCETYPE,1,0,62,0,100,0,12055,0,0,0,28,49416,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Remove Invisibility Detection"),
(@ENTRY,@SOURCETYPE,2,0,62,0,100,0,12055,0,0,0,85,85375,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Summon Lightning"),
(@ENTRY,@SOURCETYPE,3,0,19,0,100,0,27516,0,0,0,1,0,5000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Quest Accept - Talk 0");

UPDATE `creature_template` SET `minlevel`=84, `maxlevel`=84, `exp`=3, `unit_flags`=768 WHERE `entry`=45770;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=45768;
UPDATE `creature_template` SET `minlevel`=84, `maxlevel`=84, `exp`=3 WHERE `entry`=45768;

DELETE FROM `script_waypoint` WHERE `entry` = '45770';
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES
(45770, 1, -4892.89, -6637.95, 9.82, 'Thordrun WP'),
(45770, 2, -4902.30, -6645.80, 10.04, 'Thordrun WP'),
(45770, 3, -4911.70, -6648.11, 11.30, 'Thordrun WP'),
(45770, 4, -4921.20, -6635.78, 18.96, 'Thordrun WP'),
(45770, 5, -4907.91, -6613.29, 19.09, 'Thordrun WP');

UPDATE `creature_template` SET `ScriptName`='npc_th_thordrun_at_highbank' WHERE `entry`=45770;
UPDATE `creature` SET `phaseMask`=1 WHERE `guid`=771228;

DELETE FROM `spell_area` WHERE `spell` = '49416' AND `quest_start` = '27516';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49416, 5140, 27516, 1, 66, 0);

UPDATE `creature` SET `phaseMask`=1 WHERE `guid` IN (759144, 759104);
UPDATE `creature` SET `spawndist`=5, `MovementType`=1 WHERE `id`='44011';

DELETE FROM `creature_loot_template` WHERE `entry` = '44011';
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(44011, 33363, 0.05, 1, 0, 1, 1),
(44011, 33366, 0.05, 1, 0, 1, 1),
(44011, 33380, 0.05, 1, 0, 1, 1),
(44011, 33384, 0.05, 1, 0, 1, 1),
(44011, 33390, 0.05, 1, 0, 1, 1),
(44011, 33407, 0.05, 1, 0, 1, 1),
(44011, 33409, 0.05, 1, 0, 1, 1),
(44011, 33412, 0.05, 1, 0, 1, 1),
(44011, 33419, 0.05, 1, 0, 1, 1),
(44011, 33427, 0.05, 1, 0, 1, 1),
(44011, 33429, 0.05, 1, 0, 1, 1),
(44011, 33431, 0.05, 1, 0, 1, 1),
(44011, 52197, 0.0073, 1, 0, 1, 1),
(44011, 52326, 13.0461, 1, 0, 1, 1),
(44011, 52363, 0.05, 1, 0, 1, 1),
(44011, 52364, 0.05, 1, 0, 1, 1),
(44011, 52365, 0.05, 1, 0, 1, 1),
(44011, 52366, 0.05, 1, 0, 1, 1),
(44011, 52367, 0.05, 1, 0, 1, 1),
(44011, 52368, 0.05, 1, 0, 1, 1),
(44011, 52369, 0.05, 1, 0, 1, 1),
(44011, 52370, 0.05, 1, 0, 1, 1),
(44011, 52371, 0.05, 1, 0, 1, 1),
(44011, 52373, 0.05, 1, 0, 1, 1),
(44011, 52374, 0.05, 1, 0, 1, 1),
(44011, 52375, 0.05, 1, 0, 1, 1),
(44011, 52376, 0.05, 1, 0, 1, 1),
(44011, 52377, 0.05, 1, 0, 1, 1),
(44011, 52378, 0.05, 1, 0, 1, 1),
(44011, 52379, 0.05, 1, 0, 1, 1),
(44011, 52382, 0.05, 1, 0, 1, 1),
(44011, 52383, 0.05, 1, 0, 1, 1),
(44011, 52385, 0.05, 1, 0, 1, 1),
(44011, 52386, 0.05, 1, 0, 1, 1),
(44011, 52388, 0.05, 1, 0, 1, 1),
(44011, 52494, 0.05, 1, 0, 1, 1),
(44011, 52495, 0.05, 1, 0, 1, 1),
(44011, 52496, 0.05, 1, 0, 1, 1),
(44011, 52506, -14.949, 1, 0, 1, 1),
(44011, 52719, 0.0002, 1, 0, 1, 1),
(44011, 53062, 0.0001, 1, 0, 1, 1),
(44011, 53071, 0.0001, 1, 0, 1, 1),
(44011, 55285, 0.0069, 1, 0, 1, 1),
(44011, 55286, 0.05, 1, 0, 1, 1),
(44011, 55287, 0.05, 1, 0, 1, 1),
(44011, 55294, 0.0065, 1, 0, 1, 1),
(44011, 55295, 0.05, 1, 0, 1, 1),
(44011, 55296, 0.05, 1, 0, 1, 1),
(44011, 55303, 0.0022, 1, 0, 1, 1),
(44011, 55304, 0.05, 1, 0, 1, 1),
(44011, 55305, 0.05, 1, 0, 1, 1),
(44011, 55312, 0.0098, 1, 0, 1, 1),
(44011, 55313, 0.05, 1, 0, 1, 1),
(44011, 55314, 0.05, 1, 0, 1, 1),
(44011, 55321, 0.001, 1, 0, 1, 1),
(44011, 55322, 0.0041, 1, 0, 1, 1),
(44011, 55323, 0.05, 1, 0, 1, 1),
(44011, 55330, 0.0078, 1, 0, 1, 1),
(44011, 55331, 0.05, 1, 0, 1, 1),
(44011, 55332, 0.05, 1, 0, 1, 1),
(44011, 55339, 0.0041, 1, 0, 1, 1),
(44011, 55340, 0.05, 1, 0, 1, 1),
(44011, 55341, 0.05, 1, 0, 1, 1),
(44011, 55348, 0.008, 1, 0, 1, 1),
(44011, 55349, 0.05, 1, 0, 1, 1),
(44011, 55350, 0.05, 1, 0, 1, 1),
(44011, 55357, 0.0016, 1, 0, 1, 1),
(44011, 55358, 0.05, 1, 0, 1, 1),
(44011, 55359, 0.05, 1, 0, 1, 1),
(44011, 55366, 0.012, 1, 0, 1, 1),
(44011, 55367, 0.05, 1, 0, 1, 1),
(44011, 55368, 0.05, 1, 0, 1, 1),
(44011, 55375, 0.009, 1, 0, 1, 1),
(44011, 55376, 0.05, 1, 0, 1, 1),
(44011, 55377, 0.05, 1, 0, 1, 1),
(44011, 55384, 0.0075, 1, 0, 1, 1),
(44011, 55385, 0.05, 1, 0, 1, 1),
(44011, 55386, 0.05, 1, 0, 1, 1),
(44011, 55393, 0.004, 1, 0, 1, 1),
(44011, 55394, 0.05, 1, 0, 1, 1),
(44011, 55395, 0.05, 1, 0, 1, 1),
(44011, 55402, 0.0163, 1, 0, 1, 1),
(44011, 55403, 0.05, 1, 0, 1, 1),
(44011, 55404, 0.05, 1, 0, 1, 1),
(44011, 55411, 0.0063, 1, 0, 1, 1),
(44011, 55412, 0.05, 1, 0, 1, 1),
(44011, 55413, 0.05, 1, 0, 1, 1),
(44011, 55420, 0.0376, 1, 0, 1, 1),
(44011, 55421, 0.05, 1, 0, 1, 1),
(44011, 55422, 0.05, 1, 0, 1, 1),
(44011, 55429, 0.0084, 1, 0, 1, 1),
(44011, 55430, 0.05, 1, 0, 1, 1),
(44011, 55431, 0.05, 1, 0, 1, 1),
(44011, 55438, 0.0301, 1, 0, 1, 1),
(44011, 55439, 0.05, 1, 0, 1, 1),
(44011, 55440, 0.05, 1, 0, 1, 1),
(44011, 55447, 0.0049, 1, 0, 1, 1),
(44011, 55448, 0.05, 1, 0, 1, 1),
(44011, 55449, 0.05, 1, 0, 1, 1),
(44011, 55456, 0.0081, 1, 0, 1, 1),
(44011, 55457, 0.05, 1, 0, 1, 1),
(44011, 55458, 0.05, 1, 0, 1, 1),
(44011, 55465, 0.0047, 1, 0, 1, 1),
(44011, 55466, 0.05, 1, 0, 1, 1),
(44011, 55467, 0.05, 1, 0, 1, 1),
(44011, 55474, 0.0019, 1, 0, 1, 1),
(44011, 55475, 0.05, 1, 0, 1, 1),
(44011, 55476, 0.05, 1, 0, 1, 1),
(44011, 55483, 0.0153, 1, 0, 1, 1),
(44011, 55484, 0.05, 1, 0, 1, 1),
(44011, 55485, 0.05, 1, 0, 1, 1),
(44011, 55492, 0.0158, 1, 0, 1, 1),
(44011, 55493, 0.05, 1, 0, 1, 1),
(44011, 55494, 0.05, 1, 0, 1, 1),
(44011, 55501, 0.0123, 1, 0, 1, 1),
(44011, 55502, 0.05, 1, 0, 1, 1),
(44011, 55503, 0.05, 1, 0, 1, 1),
(44011, 55510, 0.0114, 1, 0, 1, 1),
(44011, 55511, 0.05, 1, 0, 1, 1),
(44011, 55512, 0.05, 1, 0, 1, 1),
(44011, 55519, 0.0114, 1, 0, 1, 1),
(44011, 55520, 0.05, 1, 0, 1, 1),
(44011, 55521, 0.05, 1, 0, 1, 1),
(44011, 55528, 0.0153, 1, 0, 1, 1),
(44011, 55529, 0.05, 1, 0, 1, 1),
(44011, 55530, 0.05, 1, 0, 1, 1),
(44011, 55537, 0.0121, 1, 0, 1, 1),
(44011, 55538, 0.05, 1, 0, 1, 1),
(44011, 55539, 0.05, 1, 0, 1, 1),
(44011, 55546, 0.0125, 1, 0, 1, 1),
(44011, 55547, 0.05, 1, 0, 1, 1),
(44011, 55548, 0.05, 1, 0, 1, 1),
(44011, 55555, 0.0148, 1, 0, 1, 1),
(44011, 55556, 0.05, 1, 0, 1, 1),
(44011, 55557, 0.05, 1, 0, 1, 1),
(44011, 55564, 0.0115, 1, 0, 1, 1),
(44011, 55565, 0.05, 1, 0, 1, 1),
(44011, 55566, 0.05, 1, 0, 1, 1),
(44011, 55573, 0.0116, 1, 0, 1, 1),
(44011, 55574, 0.05, 1, 0, 1, 1),
(44011, 55575, 0.05, 1, 0, 1, 1),
(44011, 55582, 0.0161, 1, 0, 1, 1),
(44011, 55583, 0.05, 1, 0, 1, 1),
(44011, 55584, 0.05, 1, 0, 1, 1),
(44011, 55591, 0.0121, 1, 0, 1, 1),
(44011, 55592, 0.05, 1, 0, 1, 1),
(44011, 55593, 0.05, 1, 0, 1, 1),
(44011, 55600, 0.0118, 1, 0, 1, 1),
(44011, 55601, 0.05, 1, 0, 1, 1),
(44011, 55602, 0.05, 1, 0, 1, 1),
(44011, 55609, 0.0132, 1, 0, 1, 1),
(44011, 55610, 0.05, 1, 0, 1, 1),
(44011, 55611, 0.05, 1, 0, 1, 1),
(44011, 55618, 0.0148, 1, 0, 1, 1),
(44011, 55619, 0.05, 1, 0, 1, 1),
(44011, 55620, 0.05, 1, 0, 1, 1),
(44011, 55627, 0.0139, 1, 0, 1, 1),
(44011, 55628, 0.05, 1, 0, 1, 1),
(44011, 55629, 0.05, 1, 0, 1, 1),
(44011, 55636, 0.0134, 1, 0, 1, 1),
(44011, 55637, 0.05, 1, 0, 1, 1),
(44011, 55638, 0.05, 1, 0, 1, 1),
(44011, 55645, 0.0121, 1, 0, 1, 1),
(44011, 55646, 0.05, 1, 0, 1, 1),
(44011, 55647, 0.05, 1, 0, 1, 1),
(44011, 55654, 0.0136, 1, 0, 1, 1),
(44011, 55655, 0.05, 1, 0, 1, 1),
(44011, 55656, 0.05, 1, 0, 1, 1),
(44011, 55663, 0.0127, 1, 0, 1, 1),
(44011, 55664, 0.05, 1, 0, 1, 1),
(44011, 55665, 0.05, 1, 0, 1, 1),
(44011, 55672, 0.0142, 1, 0, 1, 1),
(44011, 55673, 0.05, 1, 0, 1, 1),
(44011, 55674, 0.05, 1, 0, 1, 1),
(44011, 55681, 0.0153, 1, 0, 1, 1),
(44011, 55682, 0.05, 1, 0, 1, 1),
(44011, 55683, 0.05, 1, 0, 1, 1),
(44011, 55690, 0.0136, 1, 0, 1, 1),
(44011, 55691, 0.05, 1, 0, 1, 1),
(44011, 55692, 0.05, 1, 0, 1, 1),
(44011, 55699, 0.0147, 1, 0, 1, 1),
(44011, 55700, 0.05, 1, 0, 1, 1),
(44011, 55701, 0.05, 1, 0, 1, 1),
(44011, 55708, 0.0204, 1, 0, 1, 1),
(44011, 55709, 0.05, 1, 0, 1, 1),
(44011, 55710, 0.05, 1, 0, 1, 1),
(44011, 55717, 0.0187, 1, 0, 1, 1),
(44011, 55718, 0.05, 1, 0, 1, 1),
(44011, 55719, 0.05, 1, 0, 1, 1),
(44011, 55726, 0.0173, 1, 0, 1, 1),
(44011, 55727, 0.05, 1, 0, 1, 1),
(44011, 55728, 0.05, 1, 0, 1, 1),
(44011, 55735, 0.019, 1, 0, 1, 1),
(44011, 55736, 0.05, 1, 0, 1, 1),
(44011, 55737, 0.05, 1, 0, 1, 1),
(44011, 55744, 0.0206, 1, 0, 1, 1),
(44011, 55745, 0.05, 1, 0, 1, 1),
(44011, 55746, 0.05, 1, 0, 1, 1),
(44011, 55753, 0.0179, 1, 0, 1, 1),
(44011, 55754, 0.05, 1, 0, 1, 1),
(44011, 55755, 0.05, 1, 0, 1, 1),
(44011, 55762, 0.0187, 1, 0, 1, 1),
(44011, 55763, 0.05, 1, 0, 1, 1),
(44011, 55764, 0.0194, 1, 0, 1, 1),
(44011, 55771, 0.0219, 1, 0, 1, 1),
(44011, 55772, 0.05, 1, 0, 1, 1),
(44011, 55773, 0.05, 1, 0, 1, 1),
(44011, 60333, -27.6892, 1, 0, 1, 1),
(44011, 60337, -0.0177, 1, 0, 1, 1),
(44011, 60485, 80.0456, 1, 0, 1, 1),
(44011, 60486, 19.0824, 1, 0, 1, 1),
(44011, 62065, 0.1, 1, 0, 1, 1),
(44011, 62071, 0.1, 1, 0, 1, 1),
(44011, 62101, 0.05, 1, 0, 1, 1),
(44011, 62111, 0.05, 1, 0, 1, 1),
(44011, 62136, 0.05, 1, 0, 1, 1),
(44011, 65894, 0.0167, 1, 0, 1, 1),
(44011, 65895, 0.0141, 1, 0, 1, 1),
(44011, 65896, 0.0208, 1, 0, 1, 1),
(44011, 65897, 0.0171, 1, 0, 1, 1),
(44011, 66919, 0.0003, 1, 0, 1, 1),
(44011, 66920, 0.0017, 1, 0, 1, 1),
(44011, 66924, 0.0009, 1, 0, 1, 1),
(44011, 66931, 0.0029, 1, 0, 1, 1),
(44011, 66932, 0.05, 1, 0, 1, 1),
(44011, 66941, 0.001, 1, 0, 1, 1),
(44011, 66942, 0.0012, 1, 0, 1, 1),
(44011, 66964, 0.0007, 1, 0, 1, 1),
(44011, 66965, 0.0015, 1, 0, 1, 1),
(44011, 66966, 0.0012, 1, 0, 1, 1),
(44011, 66967, 0.0005, 1, 0, 1, 1),
(44011, 66968, 0.0012, 1, 0, 1, 1),
(44011, 66969, 0.05, 1, 0, 1, 1),
(44011, 66970, 0.05, 1, 0, 1, 1),
(44011, 66972, 0.05, 1, 0, 1, 1),
(44011, 66973, 0.0016, 1, 0, 1, 1),
(44011, 66974, 0.05, 1, 0, 1, 1),
(44011, 66975, 0.05, 1, 0, 1, 1),
(44011, 66976, 0.05, 1, 0, 1, 1),
(44011, 66986, 0.0013, 1, 0, 1, 1),
(44011, 66987, 0.0004, 1, 0, 1, 1),
(44011, 66988, 0.0007, 1, 0, 1, 1),
(44011, 66989, 0.05, 1, 0, 1, 1),
(44011, 66990, 0.0018, 1, 0, 1, 1),
(44011, 66991, 0.05, 1, 0, 1, 1),
(44011, 66992, 0.05, 1, 0, 1, 1),
(44011, 66993, 0.05, 1, 0, 1, 1),
(44011, 67050, 0.0009, 1, 0, 1, 1),
(44011, 67051, 0.0012, 1, 0, 1, 1),
(44011, 67052, 0.0004, 1, 0, 1, 1),
(44011, 67057, 0.05, 1, 0, 1, 1),
(44011, 67059, 0.002, 1, 0, 1, 1),
(44011, 67061, 0.05, 1, 0, 1, 1),
(44011, 67067, 0.05, 1, 0, 1, 1),
(44011, 67069, 0.05, 1, 0, 1, 1),
(44011, 67071, 0.05, 1, 0, 1, 1),
(44011, 67115, 0.0002, 1, 0, 1, 1),
(44011, 67116, 0.0014, 1, 0, 1, 1),
(44011, 67117, 0.0009, 1, 0, 1, 1),
(44011, 67118, 0.0003, 1, 0, 1, 1),
(44011, 67119, 0.05, 1, 0, 1, 1),
(44011, 67120, 0.05, 1, 0, 1, 1),
(44011, 67121, 0.05, 1, 0, 1, 1),
(44011, 67122, 0.05, 1, 0, 1, 1),
(44011, 67123, 0.05, 1, 0, 1, 1),
(44011, 67124, 0.05, 1, 0, 1, 1),
(44011, 67125, 0.001, 1, 0, 1, 1),
(44011, 67126, 0.0006, 1, 0, 1, 1),
(44011, 67132, 0.0002, 1, 0, 1, 1),
(44011, 67133, 0.0002, 1, 0, 1, 1),
(44011, 67135, 0.0008, 1, 0, 1, 1),
(44011, 67137, 0.0008, 1, 0, 1, 1),
(44011, 67139, 0.0006, 1, 0, 1, 1),
(44011, 67140, 0.0004, 1, 0, 1, 1),
(44011, 67141, 0.0002, 1, 0, 1, 1),
(44011, 67144, 0.0002, 1, 0, 1, 1),
(44011, 67145, 0.0002, 1, 0, 1, 1),
(44011, 67539, 0.2144, 1, 0, 1, 1),
(44011, 69820, 0.0003, 1, 0, 1, 1);

-- Muddied Water Elemental
SET @ENTRY := 44011;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,500,500,3000,3000,11,32011,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Water Bolt"),
(@ENTRY,@SOURCETYPE,1,0,4,0,100,0,0,0,0,0,11,39207,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Water Spout"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,5500,8500,5500,8500,11,32011,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Water Spout");

-- Highbank Shaman
SET @ENTRY := 45869;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,6000,20000,18500,35500,11,82405,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Cast Chain Lightning");

DELETE FROM `creature_text` WHERE `entry`=45173;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(45173,0,0,'By wind and wave, by earth and fire... To Stormwind we go, $n!',12,0,100,0,0,0,'Comment');

-- Talaa
SET @ENTRY := 45173;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,20,0,100,0,27537,0,0,0,1,0,5000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0," On Quest Rewarded - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,20,0,100,0,27537,0,0,0,66,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0," On Quest Rewarded - Set Orientation"),
(@ENTRY,@SOURCETYPE,2,0,20,0,100,0,27537,0,0,0,5,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0," On Quest Rewarded - Play Emote"),
(@ENTRY,@SOURCETYPE,3,0,20,0,100,0,27537,0,0,0,11,85322,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0," On Quest Rewarded - Summon Portal");

-- Portal to Stormwind
SET @ENTRY := 31640;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,37,0,100,0,0,0,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"AI Init - Set Unselectable");

DELETE FROM `creature` WHERE `guid` = '841875';
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(841875, 31640, 0, 1, 1, 0, 0, -4892.15, -6624.18, 10.8373, 2.30035, 300, 0, 0, 42, 0, 0, 0, 0, 0);

DELETE FROM `creature_addon` WHERE `guid` = '841875';
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES
(841875, '60921');

DELETE FROM `spell_area` WHERE `spell` = '60922' AND `quest_start` = '27537';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_end_status`) VALUES
(60922, 5140, 27537, 1, 0);

UPDATE `creature` SET `position_z`=10.6373 WHERE `guid`=841875;
UPDATE `creature` SET `id`=45526 WHERE `id`=45527;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '45527';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(45527, 46598, 0);

-- Siege Tank Commander
SET @ENTRY := 45524;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,1,3000,3000,3000,3000,11,46598,0,0,0,0,0,11,45527,15,0,0.0,0.0,0.0,0.0,"OOC - Enter Vehicle");

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '45527';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(45527, 45526, 0, 0, 'Highbank Siege Engine -> On Siege Controller', 8, 0),
(45527, 45524, 1, 0, 'Siege Tank Commander -> On Siege Controller', 8, 0);

UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE `menu_id`=12042 AND `id`=0;

DELETE FROM `creature_text` WHERE `entry`=45524;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(45524,0,0,'Aye, protect the tank while the boys make repairs! I\'ll try to get her moving again...',12,0,100,0,0,0,'Comment'),
(45524,1,0,'Defend the Siege Tank!',42,0,100,0,0,0,'Comment'),
(45524,2,0,'Ahh, blast it. C\'mon, c\'mon already!',12,0,100,0,0,0,'Comment'),
(45524,3,0,'There! We got it! Let\'s get \'er outta here.',12,0,100,0,0,0,'Comment'),
(45524,4,0,'Success! The Siege Tank is able to retreat.',42,0,100,0,0,0,'Comment');

DELETE FROM `conditions` WHERE `SourceGroup`=12042 AND `SourceEntry` = '0';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 12042, 0, 0, 0, 9, 0, 27468, 0, 0, 0, 0, 0, '', 'Siege Tank Commander - Show gossip only if quest 27468 is active');

UPDATE `creature_template` SET `ScriptName`='npc_th_siege_tank_commander' WHERE `entry`=45524;

-- Axebite Grunt
SET @ENTRY := 45187;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Set Run"),
(@ENTRY,@SOURCETYPE,1,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,18,50,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Attack Players"),
(@ENTRY,@SOURCETYPE,2,0,4,0,100,0,0,0,0,0,11,63227,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Enrage"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,3500,7500,7500,12500,11,79881,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Slam");

UPDATE `creature_template` SET `unit_flags`=0, `unit_flags2`=0 WHERE `entry`=45523;

-- Beleagurered Engineer
SET @ENTRY := 45523;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,2000,2000,2000,2000,49,0,0,0,0,0,0,11,45187,10,0,0.0,0.0,0.0,0.0,"OOC - Attack Axebiters");

UPDATE `creature_template` SET `DamageModifier`=1 WHERE `entry` IN (45523, 45187);
UPDATE `creature` SET `spawndist`=15, `MovementType`=1 WHERE `id`=48688;

-- Diamond-Blade Shredder
SET @ENTRY := 45185;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,3500,4000,6000,11,32735,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Saw Blade");

-- Dragonmaw Hold
SET @ENTRY := 45388;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,8,0,100,0,84864,4,0,0,28,84841,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Remove Marker");

UPDATE `creature_template` SET `ScriptName`='npc_th_cannon_beach_triggering' WHERE `entry`=45396;
UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry`=45388;

-- Dragonmaw Hold
SET @ENTRY := 45388;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,8,0,100,0,84864,4,0,0,28,84841,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Remove Marker"),
(@ENTRY,@SOURCETYPE,1,0,37,0,100,0,84864,4,0,0,42,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"AI Init - Set Invincible"),
(@ENTRY,@SOURCETYPE,2,0,37,0,100,0,84864,4,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"AI Init - Set Unselectable");

DELETE FROM `areatrigger_scripts` WHERE `entry` = '6294';
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(6294, 'th_areatrigger_teleport_sw');

UPDATE `quest_template` SET `PrevQuestId`='27621' WHERE `Id`=27803;
UPDATE `quest_template` SET `PrevQuestId`='27621' WHERE `Id`=27804;
UPDATE `quest_template` SET `PrevQuestId`='27817' WHERE `Id`=27640;
UPDATE `quest_template` SET `PrevQuestId`='27817' WHERE `Id`=28001;
UPDATE `quest_template` SET `PrevQuestId`='27806' WHERE `Id`=27807;
UPDATE `quest_template` SET `PrevQuestId`='27806' WHERE `Id`=27808;
UPDATE `quest_template` SET `PrevQuestId`='27806' WHERE `Id`=27809;
UPDATE `quest_template` SET `PrevQuestId`='27621' WHERE `Id`=27805;
UPDATE `quest_template` SET `PrevQuestId`='27807' WHERE `Id`=27811;
UPDATE `quest_template` SET `PrevQuestId`='27808' WHERE `Id`=27999;
UPDATE `quest_template` SET `PrevQuestId`='28171' WHERE `Id`=28173;
UPDATE `quest_template` SET `PrevQuestId`='28171' WHERE `Id`=28191;
UPDATE `quest_template` SET `PrevQuestId`='28171' WHERE `Id`=28175;
UPDATE `quest_template` SET `PrevQuestId`='28247' WHERE `Id`=28248;
UPDATE `quest_template` SET `PrevQuestId`='27809' WHERE `Id`=28233;
UPDATE `quest_template` SET `PrevQuestId`='27809' WHERE `Id`=27814;

/* FIREBEARD'S PATROL PHASING */

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '5';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 5, 4, 0, 'Twilight Highlands [A]: Add Phase 4 On Quest Complete: Firebeard Patrol [27621]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '5' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '27621';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 5, 0, 0, 28, 0, 27621, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '6';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 6, 4, 0, 'Twilight Highlands [A]: Add Phase 4 On Quest Rewarded: Firebeard Patrol [27621]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '6' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '27621';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 6, 0, 0, 8, 0, 27621, 0, 0, 0, 0, 0, '', '');

UPDATE `creature` SET `phaseMask`=4 WHERE `id` IN (46838, 46831, 46849);
UPDATE `gameobject` SET `phaseMask`=4 WHERE `id` IN (206408, 206411, 206410, 206387);
UPDATE `creature` SET `phaseMask`=32768 WHERE `guid` IN (758444, 758443);
UPDATE `gameobject` SET `spawntimesecs`=5 WHERE `id`=206387;

-- Firebeard's Patrol Fire Bunny
SET @ENTRY := 46849;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,8,0,100,0,87250,1,0,0,33,46849,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Quest Credit"),
(@ENTRY,@SOURCETYPE,1,0,8,0,100,0,87250,1,0,0,41,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Despawn");

UPDATE `creature_template` SET `unit_flags`=0, `ScriptName`='npc_th_firebeard_militia' WHERE `entry`=46831;
UPDATE `creature_template` SET `unit_flags`=0, `ScriptName`='npc_th_subjugated_firestarter' WHERE `entry`=46838;

UPDATE `creature` SET `spawntimesecs`=30 WHERE `id`=46849;

SET @CGUID := 841876;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+8;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@CGUID+0, 46807, 0, 1, 4, 0, 1, -4173.08, -5567.18, 28.0896, 6.10795, 30, 0, 0, 85239, 0, 0, 0, 0, 0),
(@CGUID+1, 46807, 0, 1, 4, 0, 1, -4142.35, -5584.47, 34.0168, 5.71683, 30, 0, 0, 85239, 0, 0, 0, 0, 0),
(@CGUID+2, 46807, 0, 1, 4, 0, 1, -4129.18, -5570.26, 37.1586, 5.41759, 30, 0, 0, 85239, 0, 0, 0, 0, 0),
(@CGUID+3, 46807, 0, 1, 4, 0, 1, -4137.52, -5560.68, 36.1364, 0.599956, 30, 0, 0, 85239, 0, 0, 0, 0, 0),
(@CGUID+4, 46807, 0, 1, 4, 0, 1, -4160.34, -5587.1, 30.1261, 0.528485, 30, 0, 0, 85239, 0, 0, 0, 0, 0);

SET @CGUID := 841876;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+8;
INSERT INTO `creature_addon` (`guid`, `bytes2`, `auras`) VALUES
(@CGUID+0, 0, '87270'),
(@CGUID+1, 0, '87270'),
(@CGUID+2, 0, '87270'),
(@CGUID+3, 0, '87270'),
(@CGUID+4, 0, '87270');

UPDATE `creature_template` SET `ScriptName`='npc_th_firebeard_citizen', `speed_run`=1.14714 WHERE `entry`=46807;
UPDATE `creature` SET `spawndist`=15, `MovementType`=1 WHERE `id`=48692;

-- Firebeard Gryphon Rider
SET @ENTRY := 47312;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,2000,2000,2000,2000,49,0,0,0,0,0,0,11,46851,20,0,0.0,0.0,0.0,0.0,"OOC - Attack Start Dragonmaw");

-- Dragonmaw Straggler
SET @ENTRY := 46851;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,22120,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Charge"),
(@ENTRY,@SOURCETYPE,1,0,4,0,100,0,0,0,0,0,11,32064,32,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Battle Shout");

-- Position update for Bahrum Forgehammer (id: 48053) in zone: 4922, area: 5488
UPDATE `creature` SET `position_x` = -3829.733, `position_y` = -5765.567, `position_z` = 24.279, `orientation`= 4.980 WHERE `guid` = 758813;

DELETE FROM `spell_area` WHERE `spell` = '89536' AND `quest_start` = '28233';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(89536, 5488, 28233, 28234, 1, 66, 11);

UPDATE `quest_template` SET `RewardSpellCast`=0 WHERE `Id`=28234;
UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE `menu_id`=12247 AND `id`=0;

DELETE FROM `creature_text` WHERE `entry`=46813;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46813,0,0,'Them\'s DEFINITELY fightin\' words!',12,0,100,0,0,0,'Comment'),
(46813,1,0,'The duel will begin in...',42,0,100,0,0,0,'Comment'),
(46813,2,0,'3...',42,0,100,0,0,0,'Comment'),
(46813,3,0,'2...',42,0,100,0,0,0,'Comment'),
(46813,4,0,'1...',42,0,100,0,0,0,'Comment'),
(46813,5,0,'Fine! Fine. You win this one.',12,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `ScriptName`='npc_th_mullan_gryphon_rider' WHERE `entry`=46813;
UPDATE `creature` SET `spawndist`=8, `MovementType`=1 WHERE `id`=46153;

-- Twilight Trapper
SET @ENTRY := 46984;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,3500,7500,4500,9500,11,78578,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Immolation Trap"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,100,100,18000,18000,11,80009,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Serpent Sting"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,2500,2500,6000,6000,11,6660,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Shoot");

-- Highland Worg
SET @ENTRY := 46153;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,3500,7000,4000,9000,11,48287,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Powerful Bite");

DELETE FROM `conditions` WHERE  `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=27815 AND `SourceId`=0 AND `ElseGroup`=1 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=27813 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
DELETE FROM `conditions` WHERE  `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=27815 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=27810 AND `ConditionValue2`=0 AND `ConditionValue3`=0;

UPDATE `quest_template` SET `PrevQuestId`='27814' WHERE `Id`=27815;

DELETE FROM `conditions` WHERE `SourceEntry` = '27812' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27812, 27810, 0),
(20, 8, 27812, 27811, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27812' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27812, 27810, 0),
(19, 8, 27812, 27811, 0);

DELETE FROM `conditions` WHERE  `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=27816 AND `SourceId`=0 AND `ElseGroup`=1 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=27815 AND `ConditionValue2`=0 AND `ConditionValue3`=0;

UPDATE `quest_template` SET `NextQuestIdChain`=27810 WHERE `Id`=27807;
UPDATE `quest_template` SET `NextQuestIdChain`=0 WHERE `Id` IN (27810, 27812, 27815);
UPDATE `quest_template` SET `PrevQuestId`='27813' WHERE `Id`=27815;

DELETE FROM `conditions` WHERE `SourceEntry` = '27816' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27816, 27999, 0),
(20, 8, 27816, 27815, 0),
(20, 8, 27816, 27812, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27816' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27816, 27999, 0),
(19, 8, 27816, 27815, 0),
(19, 8, 27816, 27812, 0);

DELETE FROM `creature_text` WHERE `entry`=46969;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46969,0,0,'The gryphon muscles tense and eyes tighten as soon as the bark is extended towards it.',16,0,100,0,0,0,'Comment'),
(46969,1,0,'The gryphon screams with glee as you break it free.',16,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `ScriptName`='npc_th_mullan_gryphon_trapped', `InhabitType`=5 WHERE `entry`=46969;
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry` IN (46975, 46969);
UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE `menu_id`=12165 AND `id`=0;
UPDATE `creature_template` SET `ScriptName`='npc_th_mullan_gryphon_injuried', `InhabitType`=5 WHERE `entry`=46968;

-- Position update for Dave's Industrial Light and Magic Bunny (Medium)(Sessile)(Large AOI) (id: 45396) in zone: 4922, area: 5425
UPDATE `creature` SET `position_x` = -4502.937, `position_y` = -6528.389, `position_z` = 44.547, `orientation`= 0.261 WHERE `guid` = 759305;

-- Position update for Dave's Industrial Light and Magic Bunny (Medium)(Sessile)(Large AOI) (id: 45396) in zone: 4922, area: 5425
UPDATE `creature` SET `position_x` = -4413.350, `position_y` = -6578.925, `position_z` = 30.503, `orientation`= 2.410 WHERE `guid` = 755219;

-- Position update for Dave's Industrial Light and Magic Bunny (Medium)(Sessile)(Large AOI) (id: 45396) in zone: 4922, area: 5425
UPDATE `creature` SET `position_x` = -4453.734, `position_y` = -6442.361, `position_z` = 61.397, `orientation`= 3.679 WHERE `guid` = 755217;

-- Position update for Dave's Industrial Light and Magic Bunny (Medium)(Sessile)(Large AOI) (id: 45396) in zone: 4922, area: 5425
UPDATE `creature` SET `position_x` = -4432.864, `position_y` = -6467.949, `position_z` = 31.921, `orientation`= 3.410 WHERE `guid` = 755218;

-- Position update for Dave's Industrial Light and Magic Bunny (Medium)(Sessile)(Large AOI) (id: 45396) in zone: 4922, area: 5425
UPDATE `creature` SET `position_x` = -4345.532, `position_y` = -6541.357, `position_z` = 54.951, `orientation`= 3.004 WHERE `guid` = 755215;

-- Position update for Dave's Industrial Light and Magic Bunny (Medium)(Sessile)(Large AOI) (id: 45396) in zone: 4922, area: 5425
UPDATE `creature` SET `position_x` = -4434.693, `position_y` = -6440.230, `position_z` = 28.733, `orientation`= 3.927 WHERE `guid` = 755216;

-- Highbank
SET @ENTRY := 45406;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,8,0,100,0,84864,4,0,0,28,84841,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Remove Marker"),
(@ENTRY,@SOURCETYPE,1,0,37,0,100,0,84864,4,0,0,42,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"AI Init - Set Invincible"),
(@ENTRY,@SOURCETYPE,2,0,37,0,100,0,84864,4,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"AI Init - Set Unselectable");

UPDATE `creature` SET `spawndist`=50, `MovementType`=1 WHERE `id`=47186;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '47186';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(47186, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '47186';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `description`) VALUES
(47186, 46321, 0, 'Thundermr Gryphon Rider on his Gryphon');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '7';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 7, 8, 0, 'Twilight Highlands [A]: Add Phase 8 On Quest Complete: Personal Request [27816]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '7' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '27816';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 7, 0, 0, 28, 0, 27816, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '8';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 8, 8, 0, 'Twilight Highlands [A]: Add Phase 8 On Quest Rewarded: Personal Request [27816]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '8' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '27816';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 8, 0, 0, 8, 0, 27816, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '9';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 9, 4, 4, 'Twilight Highlands [A]: Negate Phase 4 On Quest Complete: Personal Request [27816]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '9' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '27816';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 9, 0, 0, 28, 0, 27816, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '10';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 10, 4, 4, 'Twilight Highlands [A]: Negate Phase 4 On Quest Rewarded: Personal Request [27816]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '10' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '27816';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 10, 0, 0, 8, 0, 27816, 0, 0, 0, 0, 0, '', '');

UPDATE `creature` SET `phaseMask`=8 WHERE `id` IN (47316, 50426, 47241, 47199, 46839);
UPDATE `creature` SET `phaseMask`=8 WHERE `guid` IN (758440, 758427, 772462);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '47241';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(47241, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '47241';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(47241, 47229, 1, 'Mullan Gryphon Rider on their Gryphon', 8, 0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '47241';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(47241, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '47241';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(47241, 47229, 1, 'Mullan Gryphon Rider on their Gryphon', 8, 0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '50426';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(50426, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '50426';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(50426, 50428, 1, 'Moore Gryphon Rider on their Gryphon', 8, 0);

-- Position update for Firebeard Citizen (id: 46807) in zone: 4922, area: 5141
UPDATE `creature` SET `position_x` = -4168.196, `position_y` = -5597.498, `position_z` = 28.028, `orientation`= 2.386 WHERE `guid` = 758673;

UPDATE `creature_template` SET `minlevel`=88, `maxlevel`=88, `exp`=3, `faction`=2339, `speed_run`=1.27286, `VehicleId`=1261, `InhabitType`=4 WHERE `entry`=47315;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '47315';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(47315, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '47315';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(47315, 47313, 1, 'Firebeard Gryphon Rider on their Gryphon', 8, 0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '47316';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(47316, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '47316';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(47316, 47313, 1, 'Firebeard Gryphon Rider on their Gryphon', 8, 0);

UPDATE `creature_template` SET `npcflag`=1, `ScriptName`='npc_th_firebeard_gryphon_mount' WHERE `entry`=47316;
UPDATE `creature_template` SET `ScriptName`='npc_th_firebeard_gryphon_summoned' WHERE `entry`=47315;

DELETE FROM `creature_text` WHERE `entry`=47315;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47315,0,0,'Use your Storm Shield before the Static Charge finishes! |TInterface\\Icons\\spell_nature_lightningshield.blp:32|t',42,0,100,0,0,0,'Comment'),
(47315,1,0,'Good work, $n! Now to attack their leader!',12,0,100,0,0,0,'Comment');

DELETE FROM `script_waypoint` WHERE `entry` = '47315';
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES
(47315, 1, -4176.39, -5577.44, 37.56, 'Firebeard Gryphon Mount WP'),
(47315, 2, -4203.09, -5562.53, 42.20, 'Firebeard Gryphon Mount WP'),
(47315, 3, -4221.88, -5496.36, 67.25, 'Firebeard Gryphon Mount WP'),
(47315, 4, -4087.76, -5475.71, 103.94, 'Firebeard Gryphon Mount WP'),
(47315, 5, -3970.96, -5469.29, 131.56, 'Firebeard Gryphon Mount WP'),
(47315, 6, -3946.59, -5467.98, 129.40, 'Firebeard Gryphon Mount WP'),
(47315, 7, -3909.54, -5434.34, 104.02, 'Firebeard Gryphon Mount WP'),
(47315, 8, -3865.14, -5586.50, 110.28, 'Firebeard Gryphon Mount WP'),
(47315, 9, -3949.85, -5698.53, 104.11, 'Firebeard Gryphon Mount WP'),
(47315, 10, -4050.49, -5673.99, 100.73, 'Firebeard Gryphon Mount WP'),
(47315, 11, -4023.13, -5618.05, 134.94, 'Firebeard Gryphon Mount WP'),
(47315, 12, -4031.84, -5504.07, 138.72, 'Firebeard Gryphon Mount WP'),
(47315, 13, -3937.95, -5475.39, 258.35, 'Firebeard Gryphon Mount WP'),
(47315, 14, -3931.96, -5556.97, 258.35, 'Firebeard Gryphon Mount WP'),
(47315, 15, -3947.68, -5514.53, 258.35, 'Firebeard Gryphon Mount WP'),
(47315, 16, -3981.75, -5497.03, 258.35, 'Firebeard Gryphon Mount WP'),
(47315, 17, -4004.43, -5513.37, 258.35, 'Firebeard Gryphon Mount WP'),
(47315, 18, -3992.17, -5547.33, 258.35, 'Firebeard Gryphon Mount WP'),
(47315, 19, -3959.18, -5563.43, 258.35, 'Firebeard Gryphon Mount WP'),
(47315, 20, -3970.97, -5532.88, 245.35, 'Firebeard Gryphon Mount WP');

UPDATE `creature_template` SET `InhabitType`=7, `movementId`=140 WHERE `entry`=47315;

-- Twilight Stormbender
SET @ENTRY := 47199;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,25,0,100,0,0,0,0,0,11,88113,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Reset - Cast Twilight Channeling"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,3000,3000,3000,3000,49,0,0,0,0,0,0,18,60,0,0,0.0,0.0,0.0,0.0,"OOC - Attack Nearest Player"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,500,500,18000,18000,11,88043,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Static Charge"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,3100,3100,3500,3500,11,88106,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Twilight Lightning Bolt");

UPDATE `creature_template` SET `ScriptName`='npc_th_twilight_stormbender' WHERE `entry`=47199;
UPDATE `creature` SET `phaseMask`=8 WHERE `guid`=772505;
UPDATE `creature_template` SET `ScriptName`='npc_th_servias_windterror' WHERE `entry`=46839;
UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry`=47298;
UPDATE `creature_template` SET `RegenHealth`=0 WHERE `entry`=46839;
UPDATE `creature` SET `spawntimesecs`=15 WHERE `guid`=772502;

DELETE FROM `spell_area` WHERE `spell` = '98433' AND `quest_start` = '27640';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(98433, 5484, 27640, 27650, 1, 66, 11);

UPDATE `quest_template` SET `PrevQuestId`='27640' WHERE `Id` IN (27643, 27644, 27645, 27641, 27642);
UPDATE `creature` SET `spawndist`=50, `MovementType`=1 WHERE `id`=48683;

-- Twilight Scavenger
SET @ENTRY := 46183;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,100,100,3000,4500,11,6660,2,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Shoot");

-- Twilight Pillager
SET @ENTRY := 46144;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,5000,6000,19000,20000,11,84442,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On OCC do emote (radom time)"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,2000,2500,3500,3500,11,14873,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Sinister Strike");

-- Bloodgorged Ettin
SET @ENTRY := 46145;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,3000,3000,8000,15000,11,88421,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Log Smash");

DELETE FROM `spell_area` WHERE `spell` = '84481' AND `quest_start` = '27644';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(84481, 5483, 27644, 27647, 1, 66, 11);

#IMPOSTARE QUESTEND
DELETE FROM `spell_area` WHERE `spell` = '86875' AND `quest_start` = '27643';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(86875, 5485, 27643, 1, 66, 0);

DELETE FROM `creature_text` WHERE `entry`=46175;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46175,0,0,'Bah! Dere\'s got to be some here somewhere...',12,0,100,0,0,0,'Comment'),
(46175,1,0,'water?! Are you daft?! I need some ALE!',12,0,100,0,0,0,'Comment');

-- Eoin Dunwald
SET @ENTRY := 46175;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,30000,60000,45000,60000,65,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,62,0,100,0,12139,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Close Gossip"),
(@ENTRY,@SOURCETYPE,2,0,62,0,100,0,12139,0,0,0,1,1,5000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Talk 1"),
(@ENTRY,@SOURCETYPE,3,0,1,0,100,0,30000,30000,30000,30000,24,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Reset");

-- Adds Waypoint Movement to Eoin Dunwald (guid: 758048, entry: 46175)
SET @GUID  := 758048;
SET @WP_ID := 7580480;
UPDATE `creature` SET `MovementType` = 2, `spawndist` = 0 WHERE `guid` = @GUID;
DELETE FROM `creature_addon` WHERE `guid` = 758048;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(758048, 7580480, 0, 65536, 1, 0, '0 80852');
DELETE FROM `waypoint_data` WHERE `id` = @WP_ID;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`) VALUES
(@WP_ID, 1, -4761.810, -5238.010, 116.467, 2),
(@WP_ID, 2, -4763.860, -5230.340, 116.932, 2),
(@WP_ID, 3, -4765.890, -5217.550, 117.107, 2),
(@WP_ID, 4, -4765.060, -5216.380, 117.129, 2),
(@WP_ID, 5, -4760.450, -5214.780, 117.891, 2),
(@WP_ID, 6, -4765.580, -5216.730, 117.103, 2),
(@WP_ID, 7, -4770.290, -5221.920, 117.101, 2),
(@WP_ID, 8, -4772.420, -5220.960, 117.096, 2),
(@WP_ID, 9, -4773.690, -5225.700, 117.099, 2),
(@WP_ID, 10, -4779.160, -5228.830, 117.099, 2),
(@WP_ID, 11, -4772.060, -5230.760, 117.053, 2),
(@WP_ID, 12, -4766.250, -5228.480, 117.101, 2),
(@WP_ID, 13, -4763.270, -5241.670, 116.446, 2),
(@WP_ID, 14, -4760.400, -5242.650, 116.460, 2);

UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE `menu_id`=12139 AND `id`=0;

-- Position update for Cayden Dunwald (id: 46174) in zone: 4922, area: 5487
UPDATE `creature` SET `position_x` = -4677.288, `position_y` = -4850.363, `position_z` = 162.517, `orientation`= 3.821 WHERE `guid` = 757842;
UPDATE `gameobject` SET `phaseMask`=1 WHERE `id`=206203;

DELETE FROM `gameobject_loot_template` WHERE `item` = '62317';
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`) VALUES
(35326, 62317, -100);

UPDATE `gameobject_template` SET `ScriptName`='go_th_sacred_ale_tap' WHERE `entry`=206203;
UPDATE `quest_template` SET `NextQuestIdChain`=0 WHERE `Id`=27646;
UPDATE `quest_template` SET `NextQuestIdChain`=0 WHERE `Id`=27648;
UPDATE `quest_template` SET `NextQuestIdChain`=27646 WHERE `Id`=27643;

DELETE FROM `conditions` WHERE `SourceEntry` = '27650' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27650, 27646, 0),
(20, 8, 27650, 27648, 0),
(20, 8, 27650, 27647, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27650' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27650, 27646, 0),
(19, 8, 27650, 27648, 0),
(19, 8, 27650, 27647, 0);

DELETE FROM `conditions` WHERE  `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=27648 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=27643 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
DELETE FROM `conditions` WHERE  `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=27648 AND `SourceId`=0 AND `ElseGroup`=1 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=27645 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
DELETE FROM `conditions` WHERE  `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=27646 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=27643 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
DELETE FROM `conditions` WHERE  `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=27646 AND `SourceId`=0 AND `ElseGroup`=1 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=27645 AND `ConditionValue2`=0 AND `ConditionValue3`=0;

UPDATE `quest_template` SET `PrevQuestId`='27643' WHERE `Id`=27646;
UPDATE `quest_template` SET `PrevQuestId`='27645' WHERE `Id`=27648;

DELETE FROM `creature` WHERE `guid` = '841881';
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(841881, 46585, 0, 1, 9, 0, 1, -4462.9, -4859.79, 123.178, 5.36492, 300, 0, 0, 619920, 0, 0, 0, 0, 0);

DELETE FROM `creature_addon` WHERE `guid` = '841881';
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES
(841881, '49414');

#IMPOSTARE QUESTEND
DELETE FROM `spell_area` WHERE `spell` = '49416' AND `quest_start` = '27647';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_end_status`) VALUES
(49416, 5484, 27647, 1, 0);

DELETE FROM `creature_text` WHERE `entry`=46583;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46583,0,0,'An\' where you think you\'re goin\', sonny?!',14,0,100,0,0,0,'Comment'),
(46583,1,0,'Keep your hands off me ale, ya unclean pint-hatin\' mongels!',14,0,100,0,0,0,'Comment');

-- Eoin Dunwald
SET @ENTRY := 46583;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,1,0,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,52,0,100,0,0,46583,0,0,1,1,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 0 - Talk 1");

-- Twilight Ambusher
SET @ENTRY := 46527;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,1000,1000,5000,5000,49,0,0,0,0,0,0,18,50,0,0,0.0,0.0,0.0,0.0,"OOC - Attack Nearest Player"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,2000,2000,5000,8000,11,84836,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Multi-Shot"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,3000,3000,4000,6000,11,80015,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Steady Shot");

-- Twilight Shadeprowler
SET @ENTRY := 46526;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,1000,1000,5000,5000,49,0,0,0,0,0,0,18,50,0,0,0.0,0.0,0.0,0.0,"OOC - Attack Nearest Player"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,0,0,0,0,11,14873,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Sinister Strike");

UPDATE `gameobject` SET `spawntimesecs`=60 WHERE `id`=206199;
UPDATE `creature_template` SET `unit_flags`=0, `unit_flags2`=2048, `dynamicflags`=0 WHERE `entry`=46526;
UPDATE `gameobject` SET `spawntimesecs`=30 WHERE `id`=206203;

DELETE FROM `creature_addon` WHERE `guid` = '757842';
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES
(757842, '49415');

DELETE FROM `spell_area` WHERE `spell` = '49417' AND `quest_start` = '27647';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49417, 5487, 27647, 27650, 1, 66, 11);

UPDATE `creature` SET `phaseMask`=32768 WHERE `guid` IN (757840, 757812, 757811);

DELETE FROM `script_waypoint` WHERE `entry` = '46174';
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES
(46174, 1, -4677.28, -4850.36, 162.51, 'Cayen WP'),
(46174, 2, -4702.18, -4872.38, 158.20, 'Cayen WP'),
(46174, 3, -4707.90, -4881.18, 156.69, 'Cayen WP'),
(46174, 4, -4717.83, -4901.66, 155.84, 'Cayen WP'),
(46174, 5, -4726.70, -4910.71, 156.05, 'Cayen WP'),
(46174, 6, -4742.00, -4928.64, 156.35, 'Cayen WP'),
(46174, 7, -4753.85, -4936.36, 158.05, 'Cayen WP'),
(46174, 8, -4765.76, -4948.66, 159.08, 'Cayen WP'),
(46174, 9, -4776.37, -4961.04, 160.37, 'Cayen WP');

DELETE FROM `creature_text` WHERE `entry`=46174;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46174,0,0,'That\'s tha spirit!',12,0,100,1,0,0,'Comment'),
(46174,1,0,'That all ya got?!',14,0,100,1,0,0,'Comment'),
(46174,2,0,'Cayden\'s got an axe with your name on it!',14,0,100,1,0,0,'Comment'),
(46174,3,0,'Come\'n get it!',14,0,100,1,0,0,'Comment');

-- Twilight Pillager
SET @ENTRY := 46144;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,5000,6000,19000,20000,11,84442,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On OCC do emote (radom time)"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,2000,2500,3500,3500,11,14873,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Sinister Strike"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,0,100,100,5000,5000,49,0,0,0,0,0,0,11,46174,35,0,0.0,0.0,0.0,0.0,"OOC - Attack Cayden");

UPDATE `creature_template` SET `type_flags`=4096, `speed_run`=1.07, `ScriptName`='npc_th_cayden_dunwald_escort' WHERE `entry`=46174;
UPDATE `creature` SET `spawntimesecs`=15 WHERE `guid`=757842;

DELETE FROM `areatrigger_scripts` WHERE `entry` IN (6334, 6335, 6336);
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(6334, 'th_south_dunwald_hovel'),
(6335, 'th_north_dunwald_hovel'),
(6336, 'th_east_dunwald_hovel');

UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=46607;

DELETE FROM `creature_text` WHERE `entry`=46607;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46607,0,0,'You seem to have gained a companion. You should bring him back to Donnelly',42,0,100,0,0,0,'Comment');

-- Beak
SET @ENTRY := 46607;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,29,2,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Follow Owner"),
(@ENTRY,@SOURCETYPE,1,0,54,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Set Run"),
(@ENTRY,@SOURCETYPE,2,0,54,0,100,0,0,0,0,0,1,0,5000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Talk to Owner"),
(@ENTRY,@SOURCETYPE,3,0,38,0,100,0,0,1,0,0,41,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Force Despawn");

DELETE FROM `creature_text` WHERE `entry`=46176;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46176,0,0,'Go home to Keely, She keep you safe til Donnelly come back.',12,0,100,0,0,0,'Comment');

-- Donnelly Dunwald
SET @ENTRY := 46176;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,20,0,100,0,27646,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Quest Rewarded - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,20,0,100,0,27646,0,0,0,45,0,1,0,0,0,0,11,46607,30,0,0.0,0.0,0.0,0.0,"On Quest Rewarded - Remove Beak");

UPDATE `creature` SET `phaseMask`=1 WHERE `guid` IN (772506, 776580);

#IMPOSTARE QUESTEND (NON ANCORA)
DELETE FROM `spell_area` WHERE `spell` = '81742' AND `quest_start` = '27650';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(81742, 5484, 27650, 1, 66, 0);
#IMPOSTARE QUESTEND (NON ANCORA)
DELETE FROM `spell_area` WHERE `spell` = '98392' AND `quest_start` = '27650';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(98392, 5484, 27650, 1, 66, 0);

UPDATE `quest_template` SET `PrevQuestId`='28655' WHERE `Id` IN (28863, 28860, 28864, 28861, 28862);
UPDATE `quest_template` SET `PrevQuestId`='28001' WHERE `Id` IN (27754, 28369, 27752);
UPDATE `quest_template` SET `PrevQuestId`='28377' WHERE `Id` IN (28378, 28379);

DELETE FROM `conditions` WHERE `SourceEntry` = '28216' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 28216, 27752, 0),
(20, 8, 28216, 27754, 0),
(20, 8, 28216, 27753, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '28216' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 28216, 27752, 0),
(19, 8, 28216, 27754, 0),
(19, 8, 28216, 27753, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '28211' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 28211, 27752, 0),
(20, 8, 28211, 27754, 0),
(20, 8, 28211, 27753, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '28211' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 28211, 27752, 0),
(19, 8, 28211, 27754, 0),
(19, 8, 28211, 27753, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '28212' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 28212, 27752, 0),
(20, 8, 28212, 27754, 0),
(20, 8, 28212, 27753, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '28212' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 28212, 27752, 0),
(19, 8, 28212, 27754, 0),
(19, 8, 28212, 27753, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '28215' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 28215, 27752, 0),
(20, 8, 28215, 27754, 0),
(20, 8, 28215, 27753, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '28215' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 28215, 27752, 0),
(19, 8, 28215, 27754, 0),
(19, 8, 28215, 27753, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '28241' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 28241, 28216, 0),
(20, 8, 28241, 28211, 0),
(20, 8, 28241, 28212, 0),
(20, 8, 28241, 28215, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '28241' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 28241, 28216, 0),
(19, 8, 28241, 28211, 0),
(19, 8, 28241, 28212, 0),
(19, 8, 28241, 28215, 0);

DELETE FROM `spell_area` WHERE `spell` = '49417' AND `quest_start` = '28369';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49417, 5142, 28369, 28244, 1, 66, 11);

-- Dragonmaw Marauder
SET @ENTRY := 46310;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,32064,32,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Battle Shout");

UPDATE `creature` SET `phaseMask`=1 WHERE `guid`=770466;
UPDATE `gameobject_template` SET `data0`=86855, `data1`=1 WHERE `entry`=206195;
UPDATE `gameobject` SET `spawntimesecs`=60 WHERE `id`=206195;

-- Obsidian Stoneslave
SET @ENTRY := 47226;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,1000,6000,9000,11,89932,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Rupture Line");

UPDATE `gameobject` SET `phaseMask`=16 WHERE `guid`=727693;

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '11';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 11, 16, 0, 'Twilight Highlands [A]: Add Phase 16 On Quest Complete: A Vision of Twilight [28241]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '11' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28241';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 11, 0, 0, 28, 0, 28241, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '12';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 12, 16, 0, 'Twilight Highlands [A]: Add Phase 16 On Quest Rewarded: A Vision of Twilight [28241]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '12' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28241';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 12, 0, 0, 8, 0, 28241, 0, 0, 0, 0, 0, '', '');

-- Unbound Emberfiend
SET @ENTRY := 48016;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,1000,3500,7000,11,35377,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Scorch"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,9000,9000,9000,9000,11,11970,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Fire Nova");

UPDATE `creature_template` SET `lootid`=48016 WHERE `entry`=48016;

DELETE FROM `creature_loot_template` WHERE `entry` = '48016';
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(48016, 33363, 0.05, 1, 0, 1, 1),
(48016, 33366, 0.05, 1, 0, 1, 1),
(48016, 33383, 0.05, 1, 0, 1, 1),
(48016, 33399, 0.05, 1, 0, 1, 1),
(48016, 33417, 0.05, 1, 0, 1, 1),
(48016, 33419, 0.05, 1, 0, 1, 1),
(48016, 33425, 0.05, 1, 0, 1, 1),
(48016, 33426, 0.05, 1, 0, 1, 1),
(48016, 33429, 0.05, 1, 0, 1, 1),
(48016, 52197, 0.05, 1, 0, 1, 1),
(48016, 52325, 12.9225, 1, 0, 1, 1),
(48016, 52363, 0.05, 1, 0, 1, 1),
(48016, 52364, 0.05, 1, 0, 1, 1),
(48016, 52365, 0.05, 1, 0, 1, 1),
(48016, 52366, 0.05, 1, 0, 1, 1),
(48016, 52367, 0.05, 1, 0, 1, 1),
(48016, 52368, 0.05, 1, 0, 1, 1),
(48016, 52369, 0.05, 1, 0, 1, 1),
(48016, 52370, 0.05, 1, 0, 1, 1),
(48016, 52372, 0.05, 1, 0, 1, 1),
(48016, 52373, 0.05, 1, 0, 1, 1),
(48016, 52375, 0.0082, 1, 0, 1, 1),
(48016, 52376, 0.05, 1, 0, 1, 1),
(48016, 52377, 0.05, 1, 0, 1, 1),
(48016, 52378, 0.05, 1, 0, 1, 1),
(48016, 52382, 0.05, 1, 0, 1, 1),
(48016, 52383, 0.05, 1, 0, 1, 1),
(48016, 52385, 0.05, 1, 0, 1, 1),
(48016, 52386, 0.05, 1, 0, 1, 1),
(48016, 52388, 0.05, 1, 0, 1, 1),
(48016, 52494, 0.05, 1, 0, 1, 1),
(48016, 52495, 0.05, 1, 0, 1, 1),
(48016, 52496, 0.05, 1, 0, 1, 1),
(48016, 52506, -2.3563, 1, 0, 1, 1),
(48016, 52843, -0.0013, 1, 0, 1, 1),
(48016, 55285, 0.0057, 1, 0, 1, 1),
(48016, 55286, 0.05, 1, 0, 1, 1),
(48016, 55287, 0.05, 1, 0, 1, 1),
(48016, 55294, 0.0076, 1, 0, 1, 1),
(48016, 55295, 0.05, 1, 0, 1, 1),
(48016, 55296, 0.05, 1, 0, 1, 1),
(48016, 55303, 0.0015, 1, 0, 1, 1),
(48016, 55305, 0.0023, 1, 0, 1, 1),
(48016, 55312, 0.0117, 1, 0, 1, 1),
(48016, 55313, 0.05, 1, 0, 1, 1),
(48016, 55314, 0.05, 1, 0, 1, 1),
(48016, 55321, 0.0006, 1, 0, 1, 1),
(48016, 55322, 0.05, 1, 0, 1, 1),
(48016, 55323, 0.05, 1, 0, 1, 1),
(48016, 55330, 0.0088, 1, 0, 1, 1),
(48016, 55331, 0.05, 1, 0, 1, 1),
(48016, 55332, 0.05, 1, 0, 1, 1),
(48016, 55339, 0.0057, 1, 0, 1, 1),
(48016, 55340, 0.05, 1, 0, 1, 1),
(48016, 55341, 0.05, 1, 0, 1, 1),
(48016, 55348, 0.0033, 1, 0, 1, 1),
(48016, 55349, 0.05, 1, 0, 1, 1),
(48016, 55350, 0.05, 1, 0, 1, 1),
(48016, 55357, 0.0014, 1, 0, 1, 1),
(48016, 55358, 0.0056, 1, 0, 1, 1),
(48016, 55359, 0.003, 1, 0, 1, 1),
(48016, 55366, 0.0173, 1, 0, 1, 1),
(48016, 55367, 0.05, 1, 0, 1, 1),
(48016, 55368, 0.05, 1, 0, 1, 1),
(48016, 55375, 0.009, 1, 0, 1, 1),
(48016, 55376, 0.05, 1, 0, 1, 1),
(48016, 55377, 0.05, 1, 0, 1, 1),
(48016, 55384, 0.006, 1, 0, 1, 1),
(48016, 55385, 0.05, 1, 0, 1, 1),
(48016, 55386, 0.05, 1, 0, 1, 1),
(48016, 55393, 0.009, 1, 0, 1, 1),
(48016, 55394, 0.05, 1, 0, 1, 1),
(48016, 55395, 0.05, 1, 0, 1, 1),
(48016, 55402, 0.0213, 1, 0, 1, 1),
(48016, 55403, 0.05, 1, 0, 1, 1),
(48016, 55404, 0.05, 1, 0, 1, 1),
(48016, 55411, 0.0046, 1, 0, 1, 1),
(48016, 55412, 0.05, 1, 0, 1, 1),
(48016, 55413, 0.05, 1, 0, 1, 1),
(48016, 55420, 0.0369, 1, 0, 1, 1),
(48016, 55421, 0.05, 1, 0, 1, 1),
(48016, 55422, 0.05, 1, 0, 1, 1),
(48016, 55429, 0.0073, 1, 0, 1, 1),
(48016, 55430, 0.05, 1, 0, 1, 1),
(48016, 55431, 0.05, 1, 0, 1, 1),
(48016, 55438, 0.0202, 1, 0, 1, 1),
(48016, 55439, 0.05, 1, 0, 1, 1),
(48016, 55440, 0.05, 1, 0, 1, 1),
(48016, 55447, 0.0043, 1, 0, 1, 1),
(48016, 55448, 0.05, 1, 0, 1, 1),
(48016, 55449, 0.05, 1, 0, 1, 1),
(48016, 55456, 0.0076, 1, 0, 1, 1),
(48016, 55457, 0.05, 1, 0, 1, 1),
(48016, 55458, 0.05, 1, 0, 1, 1),
(48016, 55465, 0.0043, 1, 0, 1, 1),
(48016, 55466, 0.05, 1, 0, 1, 1),
(48016, 55467, 0.05, 1, 0, 1, 1),
(48016, 55474, 0.0026, 1, 0, 1, 1),
(48016, 55475, 0.0023, 1, 0, 1, 1),
(48016, 55476, 0.05, 1, 0, 1, 1),
(48016, 55483, 0.0185, 1, 0, 1, 1),
(48016, 55484, 0.05, 1, 0, 1, 1),
(48016, 55485, 0.05, 1, 0, 1, 1),
(48016, 55492, 0.0105, 1, 0, 1, 1),
(48016, 55493, 0.05, 1, 0, 1, 1),
(48016, 55494, 0.05, 1, 0, 1, 1),
(48016, 55501, 0.0153, 1, 0, 1, 1),
(48016, 55502, 0.05, 1, 0, 1, 1),
(48016, 55503, 0.05, 1, 0, 1, 1),
(48016, 55510, 0.0133, 1, 0, 1, 1),
(48016, 55511, 0.05, 1, 0, 1, 1),
(48016, 55512, 0.05, 1, 0, 1, 1),
(48016, 55519, 0.0128, 1, 0, 1, 1),
(48016, 55520, 0.05, 1, 0, 1, 1),
(48016, 55521, 0.05, 1, 0, 1, 1),
(48016, 55528, 0.05, 1, 0, 1, 1),
(48016, 55529, 0.05, 1, 0, 1, 1),
(48016, 55530, 0.05, 1, 0, 1, 1),
(48016, 55537, 0.0145, 1, 0, 1, 1),
(48016, 55538, 0.05, 1, 0, 1, 1),
(48016, 55539, 0.05, 1, 0, 1, 1),
(48016, 55546, 0.0148, 1, 0, 1, 1),
(48016, 55547, 0.05, 1, 0, 1, 1),
(48016, 55548, 0.05, 1, 0, 1, 1),
(48016, 55555, 0.0093, 1, 0, 1, 1),
(48016, 55556, 0.05, 1, 0, 1, 1),
(48016, 55557, 0.05, 1, 0, 1, 1),
(48016, 55564, 0.0148, 1, 0, 1, 1),
(48016, 55565, 0.05, 1, 0, 1, 1),
(48016, 55566, 0.05, 1, 0, 1, 1),
(48016, 55573, 0.0116, 1, 0, 1, 1),
(48016, 55574, 0.05, 1, 0, 1, 1),
(48016, 55575, 0.05, 1, 0, 1, 1),
(48016, 55582, 0.0252, 1, 0, 1, 1),
(48016, 55583, 0.05, 1, 0, 1, 1),
(48016, 55584, 0.05, 1, 0, 1, 1),
(48016, 55591, 0.0122, 1, 0, 1, 1),
(48016, 55592, 0.05, 1, 0, 1, 1),
(48016, 55593, 0.05, 1, 0, 1, 1),
(48016, 55600, 0.0202, 1, 0, 1, 1),
(48016, 55601, 0.05, 1, 0, 1, 1),
(48016, 55602, 0.05, 1, 0, 1, 1),
(48016, 55609, 0.011, 1, 0, 1, 1),
(48016, 55610, 0.05, 1, 0, 1, 1),
(48016, 55611, 0.05, 1, 0, 1, 1),
(48016, 55618, 0.0219, 1, 0, 1, 1),
(48016, 55619, 0.05, 1, 0, 1, 1),
(48016, 55620, 0.05, 1, 0, 1, 1),
(48016, 55627, 0.0136, 1, 0, 1, 1),
(48016, 55628, 0.05, 1, 0, 1, 1),
(48016, 55629, 0.05, 1, 0, 1, 1),
(48016, 55636, 0.0112, 1, 0, 1, 1),
(48016, 55637, 0.05, 1, 0, 1, 1),
(48016, 55638, 0.05, 1, 0, 1, 1),
(48016, 55645, 0.0131, 1, 0, 1, 1),
(48016, 55646, 0.05, 1, 0, 1, 1),
(48016, 55647, 0.05, 1, 0, 1, 1),
(48016, 55654, 0.013, 1, 0, 1, 1),
(48016, 55655, 0.05, 1, 0, 1, 1),
(48016, 55656, 0.05, 1, 0, 1, 1),
(48016, 55663, 0.0119, 1, 0, 1, 1),
(48016, 55664, 0.05, 1, 0, 1, 1),
(48016, 55665, 0.05, 1, 0, 1, 1),
(48016, 55672, 0.013, 1, 0, 1, 1),
(48016, 55673, 0.05, 1, 0, 1, 1),
(48016, 55674, 0.05, 1, 0, 1, 1),
(48016, 55681, 0.0131, 1, 0, 1, 1),
(48016, 55682, 0.05, 1, 0, 1, 1),
(48016, 55683, 0.05, 1, 0, 1, 1),
(48016, 55690, 0.0134, 1, 0, 1, 1),
(48016, 55691, 0.05, 1, 0, 1, 1),
(48016, 55692, 0.05, 1, 0, 1, 1),
(48016, 55699, 0.0142, 1, 0, 1, 1),
(48016, 55700, 0.05, 1, 0, 1, 1),
(48016, 55701, 0.05, 1, 0, 1, 1),
(48016, 55708, 0.0159, 1, 0, 1, 1),
(48016, 55709, 0.05, 1, 0, 1, 1),
(48016, 55710, 0.05, 1, 0, 1, 1),
(48016, 55717, 0.0198, 1, 0, 1, 1),
(48016, 55718, 0.05, 1, 0, 1, 1),
(48016, 55719, 0.05, 1, 0, 1, 1),
(48016, 55726, 0.0169, 1, 0, 1, 1),
(48016, 55727, 0.05, 1, 0, 1, 1),
(48016, 55728, 0.05, 1, 0, 1, 1),
(48016, 55735, 0.0171, 1, 0, 1, 1),
(48016, 55736, 0.05, 1, 0, 1, 1),
(48016, 55737, 0.05, 1, 0, 1, 1),
(48016, 55744, 0.0222, 1, 0, 1, 1),
(48016, 55745, 0.05, 1, 0, 1, 1),
(48016, 55746, 0.05, 1, 0, 1, 1),
(48016, 55753, 0.0213, 1, 0, 1, 1),
(48016, 55754, 0.05, 1, 0, 1, 1),
(48016, 55755, 0.05, 1, 0, 1, 1),
(48016, 55762, 0.0167, 1, 0, 1, 1),
(48016, 55763, 0.05, 1, 0, 1, 1),
(48016, 55771, 0.0181, 1, 0, 1, 1),
(48016, 55772, 0.05, 1, 0, 1, 1),
(48016, 55773, 0.05, 1, 0, 1, 1),
(48016, 60485, 80.3556, 1, 0, 1, 1),
(48016, 60486, 19.1412, 1, 0, 1, 1),
(48016, 62065, 0.1, 1, 0, 1, 1),
(48016, 62071, 0.1, 1, 0, 1, 1),
(48016, 62101, 0.05, 1, 0, 1, 1),
(48016, 62111, 0.05, 1, 0, 1, 1),
(48016, 62136, 0.05, 1, 0, 1, 1),
(48016, 63122, 0.0005, 1, 0, 1, 1),
(48016, 63283, -60.006, 1, 0, 1, 1),
(48016, 65894, 0.05, 1, 0, 1, 1),
(48016, 65895, 0.0116, 1, 0, 1, 1),
(48016, 65896, 0.05, 1, 0, 1, 1),
(48016, 65897, 0.05, 1, 0, 1, 1),
(48016, 66919, 0.0005, 1, 0, 1, 1),
(48016, 66920, 0.0011, 1, 0, 1, 1),
(48016, 66924, 0.0005, 1, 0, 1, 1),
(48016, 66931, 0.05, 1, 0, 1, 1),
(48016, 66932, 0.05, 1, 0, 1, 1),
(48016, 66940, 0.05, 1, 0, 1, 1),
(48016, 66941, 0.05, 1, 0, 1, 1),
(48016, 66964, 0.0014, 1, 0, 1, 1),
(48016, 66965, 0.0009, 1, 0, 1, 1),
(48016, 66966, 0.0002, 1, 0, 1, 1),
(48016, 66967, 0.0009, 1, 0, 1, 1),
(48016, 66969, 0.05, 1, 0, 1, 1),
(48016, 66971, 0.05, 1, 0, 1, 1),
(48016, 66972, 0.05, 1, 0, 1, 1),
(48016, 66974, 0.0017, 1, 0, 1, 1),
(48016, 66975, 0.05, 1, 0, 1, 1),
(48016, 66976, 0.05, 1, 0, 1, 1),
(48016, 66986, 0.0014, 1, 0, 1, 1),
(48016, 66987, 0.0009, 1, 0, 1, 1),
(48016, 66988, 0.0005, 1, 0, 1, 1),
(48016, 66989, 0.05, 1, 0, 1, 1),
(48016, 66991, 0.0127, 1, 0, 1, 1),
(48016, 66993, 0.05, 1, 0, 1, 1),
(48016, 66994, 0.0017, 1, 0, 1, 1),
(48016, 67050, 0.0009, 1, 0, 1, 1),
(48016, 67052, 0.0009, 1, 0, 1, 1),
(48016, 67057, 0.05, 1, 0, 1, 1),
(48016, 67059, 0.05, 1, 0, 1, 1),
(48016, 67061, 0.05, 1, 0, 1, 1),
(48016, 67069, 0.05, 1, 0, 1, 1),
(48016, 67071, 0.05, 1, 0, 1, 1),
(48016, 67116, 0.0011, 1, 0, 1, 1),
(48016, 67117, 0.0011, 1, 0, 1, 1),
(48016, 67118, 0.0006, 1, 0, 1, 1),
(48016, 67119, 0.05, 1, 0, 1, 1),
(48016, 67120, 0.05, 1, 0, 1, 1),
(48016, 67121, 0.05, 1, 0, 1, 1),
(48016, 67122, 0.05, 1, 0, 1, 1),
(48016, 67123, 0.05, 1, 0, 1, 1),
(48016, 67127, 0.05, 1, 0, 1, 1),
(48016, 67130, 0.0013, 1, 0, 1, 1),
(48016, 67135, 0.0003, 1, 0, 1, 1),
(48016, 67136, 0.0009, 1, 0, 1, 1),
(48016, 67137, 0.0003, 1, 0, 1, 1),
(48016, 67141, 0.0003, 1, 0, 1, 1),
(48016, 67145, 0.0007, 1, 0, 1, 1),
(48016, 67149, 0.0003, 1, 0, 1, 1),
(48016, 67539, 0.0883, 1, 0, 1, 1),
(48016, 68782, 0.004, 1, 0, 1, 1),
(48016, 68789, 0.0008, 1, 0, 1, 1);

-- Shaman of the Black
SET @ENTRY := 46322;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,1000,4000,4000,11,78129,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Twilight Bolt"),
(@ENTRY,@SOURCETYPE,1,0,4,0,100,0,0,0,0,0,11,32063,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Corruption"),
(@ENTRY,@SOURCETYPE,2,0,4,0,100,0,0,0,0,0,1,0,5000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Talk 0");

DELETE FROM `creature_text` WHERE `entry`=46322;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46322,0,0,'Behold the powers of the master!',12,0,100,0,0,0,'Comment'),
(46322,0,1,'But a pebble against the avalanche...',12,0,100,0,0,0,'Comment'),
(46322,0,2,'Excellent, another stone to grind!',12,0,100,0,0,0,'Comment'),
(46322,0,3,'I bask in the twilight.',12,0,100,0,0,0,'Comment'),
(46322,0,4,'I will crush your bones to dust.',12,0,100,0,0,0,'Comment'),
(46322,0,5,'Stones of the earth, obey the call of the Twilight\'s Hammer!',12,0,100,0,0,0,'Comment'),
(46322,0,6,'The end of all things is upon us!',12,0,100,0,0,0,'Comment'),
(46322,0,7,'Your life is meaningless.',12,0,100,0,0,0,'Comment');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '13';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 13, 16, 4, 'Twilight Highlands [A]: Negate Phase 16 On Quest Complete: The Eyes Have It [28243]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '13' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28243';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 13, 0, 0, 28, 0, 28243, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '14';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 14, 16, 4, 'Twilight Highlands [A]: Negate Phase 16 On Quest Rewarded: The Eyes Have It [28243]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '14' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28243';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 14, 0, 0, 8, 0, 28243, 0, 0, 0, 0, 0, '', '');

UPDATE `creature` SET `phaseMask`=8 WHERE `guid`=770465;

#IMPOSTARE QUESTEND
DELETE FROM `spell_area` WHERE `spell` = '49416' AND `quest_start` = '28243';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49416, 5142, 28243, 1, 64, 0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=48116 AND `spell_id`=88237;

DELETE FROM `spell_area` WHERE `spell` = '88237' AND `quest_start` = '28243';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`) VALUES
(88237, 4922, 28243, 28243, 1, 2);

UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-64.362 WHERE `entry`=47226 AND `item`=63285;

-- Magmalord Falthazar
SET @ENTRY := 48015;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,87487,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Flame Blast"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,2000,2000,8000,8000,11,11962,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Immolate"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,4500,4500,12500,12500,11,83018,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Magma Wave"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,14000,14000,14000,14000,11,87481,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Hellfire");

UPDATE `creature` SET `spawndist`=15, `MovementType`=1 WHERE `id`='48016';

DELETE FROM `creature_loot_template` WHERE `entry` = '48015';
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(48015, 52197, 0.0053, 1, 0, 1, 1),
(48015, 52325, 12.7886, 1, 0, 1, 1),
(48015, 52366, 0.0053, 1, 0, 1, 1),
(48015, 52367, 0.0053, 1, 0, 1, 1),
(48015, 52369, 0.0053, 1, 0, 1, 1),
(48015, 52371, 0.0053, 1, 0, 1, 1),
(48015, 52375, 0.0053, 1, 0, 1, 1),
(48015, 52377, 0.0053, 1, 0, 1, 1),
(48015, 52382, 0.0053, 1, 0, 1, 1),
(48015, 52496, 0.0077, 1, 0, 1, 1),
(48015, 52506, -0.9931, 1, 0, 1, 1),
(48015, 55285, 0.0077, 1, 0, 1, 1),
(48015, 55286, 0.05, 1, 0, 1, 1),
(48015, 55287, 0.0159, 1, 0, 1, 1),
(48015, 55294, 0.0232, 1, 0, 1, 1),
(48015, 55296, 0.05, 1, 0, 1, 1),
(48015, 55304, 0.0053, 1, 0, 1, 1),
(48015, 55312, 0.0077, 1, 0, 1, 1),
(48015, 55314, 0.05, 1, 0, 1, 1),
(48015, 55323, 0.0053, 1, 0, 1, 1),
(48015, 55330, 0.0155, 1, 0, 1, 1),
(48015, 55331, 0.05, 1, 0, 1, 1),
(48015, 55332, 0.05, 1, 0, 1, 1),
(48015, 55340, 0.05, 1, 0, 1, 1),
(48015, 55348, 0.0106, 1, 0, 1, 1),
(48015, 55357, 0.0052, 1, 0, 1, 1),
(48015, 55359, 0.0053, 1, 0, 1, 1),
(48015, 55367, 0.05, 1, 0, 1, 1),
(48015, 55368, 0.05, 1, 0, 1, 1),
(48015, 55376, 0.05, 1, 0, 1, 1),
(48015, 55384, 0.0077, 1, 0, 1, 1),
(48015, 55385, 0.0264, 1, 0, 1, 1),
(48015, 55402, 0.0258, 1, 0, 1, 1),
(48015, 55403, 0.05, 1, 0, 1, 1),
(48015, 55404, 0.05, 1, 0, 1, 1),
(48015, 55411, 0.0053, 1, 0, 1, 1),
(48015, 55412, 0.05, 1, 0, 1, 1),
(48015, 55413, 0.05, 1, 0, 1, 1),
(48015, 55422, 0.05, 1, 0, 1, 1),
(48015, 55429, 0.0077, 1, 0, 1, 1),
(48015, 55431, 0.05, 1, 0, 1, 1),
(48015, 55438, 0.0387, 1, 0, 1, 1),
(48015, 55439, 0.0952, 1, 0, 1, 1),
(48015, 55440, 0.1, 1, 0, 1, 1),
(48015, 55447, 0.0026, 1, 0, 1, 1),
(48015, 55456, 0.0155, 1, 0, 1, 1),
(48015, 55457, 0.05, 1, 0, 1, 1),
(48015, 55466, 0.0317, 1, 0, 1, 1),
(48015, 55474, 0.0026, 1, 0, 1, 1),
(48015, 55483, 0.0335, 1, 0, 1, 1),
(48015, 55485, 0.05, 1, 0, 1, 1),
(48015, 55492, 0.0159, 1, 0, 1, 1),
(48015, 55494, 0.05, 1, 0, 1, 1),
(48015, 55501, 0.0155, 1, 0, 1, 1),
(48015, 55502, 0.05, 1, 0, 1, 1),
(48015, 55510, 0.0181, 1, 0, 1, 1),
(48015, 55519, 0.0155, 1, 0, 1, 1),
(48015, 55520, 0.05, 1, 0, 1, 1),
(48015, 55521, 0.05, 1, 0, 1, 1),
(48015, 55528, 0.05, 1, 0, 1, 1),
(48015, 55529, 0.0423, 1, 0, 1, 1),
(48015, 55530, 0.05, 1, 0, 1, 1),
(48015, 55537, 0.0206, 1, 0, 1, 1),
(48015, 55538, 0.0423, 1, 0, 1, 1),
(48015, 55539, 0.05, 1, 0, 1, 1),
(48015, 55546, 0.0129, 1, 0, 1, 1),
(48015, 55555, 0.0284, 1, 0, 1, 1),
(48015, 55556, 0.05, 1, 0, 1, 1),
(48015, 55557, 0.05, 1, 0, 1, 1),
(48015, 55564, 0.0106, 1, 0, 1, 1),
(48015, 55565, 0.05, 1, 0, 1, 1),
(48015, 55566, 0.05, 1, 0, 1, 1),
(48015, 55573, 0.0106, 1, 0, 1, 1),
(48015, 55574, 0.05, 1, 0, 1, 1),
(48015, 55575, 0.05, 1, 0, 1, 1),
(48015, 55593, 0.05, 1, 0, 1, 1),
(48015, 55602, 0.05, 1, 0, 1, 1),
(48015, 55609, 0.0206, 1, 0, 1, 1),
(48015, 55610, 0.05, 1, 0, 1, 1),
(48015, 55620, 0.05, 1, 0, 1, 1),
(48015, 55628, 0.05, 1, 0, 1, 1),
(48015, 55636, 0.0129, 1, 0, 1, 1),
(48015, 55637, 0.05, 1, 0, 1, 1),
(48015, 55645, 0.0258, 1, 0, 1, 1),
(48015, 55647, 0.05, 1, 0, 1, 1),
(48015, 55654, 0.0155, 1, 0, 1, 1),
(48015, 55655, 0.05, 1, 0, 1, 1),
(48015, 55663, 0.0335, 1, 0, 1, 1),
(48015, 55664, 0.05, 1, 0, 1, 1),
(48015, 55672, 0.0159, 1, 0, 1, 1),
(48015, 55673, 0.05, 1, 0, 1, 1),
(48015, 55681, 0.0258, 1, 0, 1, 1),
(48015, 55690, 0.0206, 1, 0, 1, 1),
(48015, 55691, 0.05, 1, 0, 1, 1),
(48015, 55692, 0.05, 1, 0, 1, 1),
(48015, 55699, 0.05, 1, 0, 1, 1),
(48015, 55700, 0.05, 1, 0, 1, 1),
(48015, 55709, 0.05, 1, 0, 1, 1),
(48015, 55710, 0.05, 1, 0, 1, 1),
(48015, 55717, 0.05, 1, 0, 1, 1),
(48015, 55718, 0.05, 1, 0, 1, 1),
(48015, 55719, 0.05, 1, 0, 1, 1),
(48015, 55726, 0.0159, 1, 0, 1, 1),
(48015, 55728, 0.05, 1, 0, 1, 1),
(48015, 55736, 0.05, 1, 0, 1, 1),
(48015, 55737, 0.05, 1, 0, 1, 1),
(48015, 55744, 0.0159, 1, 0, 1, 1),
(48015, 55745, 0.05, 1, 0, 1, 1),
(48015, 55746, 0.05, 1, 0, 1, 1),
(48015, 55753, 0.0206, 1, 0, 1, 1),
(48015, 55754, 0.05, 1, 0, 1, 1),
(48015, 55755, 0.05, 1, 0, 1, 1),
(48015, 55762, 0.05, 1, 0, 1, 1),
(48015, 55763, 0.05, 1, 0, 1, 1),
(48015, 55771, 0.0181, 1, 0, 1, 1),
(48015, 55772, 0.05, 1, 0, 1, 1),
(48015, 55773, 0.05, 1, 0, 1, 1),
(48015, 60485, 78.7665, 1, 0, 1, 1),
(48015, 60486, 18.9946, 1, 0, 1, 1),
(48015, 62065, 0.1, 1, 0, 1, 1),
(48015, 62101, 0.05, 1, 0, 1, 1),
(48015, 62111, 0.05, 1, 0, 1, 1),
(48015, 62132, 0.1419, 1, 0, 1, 1),
(48015, 63286, -100, 1, 0, 1, 1),
(48015, 66931, 0.0181, 1, 0, 1, 1),
(48015, 66974, 0.0053, 1, 0, 1, 1),
(48015, 67059, 0.0053, 1, 0, 1, 1),
(48015, 67115, 0.0026, 1, 0, 1, 1),
(48015, 67121, 0.0129, 1, 0, 1, 1),
(48015, 67123, 0.0053, 1, 0, 1, 1),
(48015, 67539, 0.05, 1, 0, 1, 1),
(48015, 69820, 0.0026, 1, 0, 1, 1);

UPDATE `quest_template` SET `PrevQuestId`='28346' WHERE `Id`=28377;
UPDATE `quest_template` SET `PrevQuestId`='28407' WHERE `Id` IN (28408, 28409, 28410, 28411, 28413);
UPDATE `creature_template` SET `minlevel`=80, `maxlevel`=80, `exp`=3, `VehicleId`=1528 WHERE `entry`=48117;
UPDATE `creature_template` SET `minlevel`=80, `maxlevel`=80, `exp`=3, `VehicleId`=1257, `ScriptName`='npc_th_eye_of_twilight_veh', `InhabitType`=4 WHERE `entry`=47273;
UPDATE `creature_template` SET `npcflag`=1, `ScriptName`='npc_th_eye_of_twilight_spy', `IconName`='openhandglow' WHERE `entry`=48116;

DELETE FROM `creature_text` WHERE `entry`=48142;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48142,0,0,'This changes nothing. (Nothing nothing changes. Crush them, crush.)',12,0,100,1,0,22102,'Comment'),
(48142,1,0,'What of our agents in Stormwind? (Stormwind! The eye, the eye sees into the city heart.) Bring me the eye.',12,0,100,1,0,22103,'Comment'),
(48142,2,0,'(Blaspheme! Blaspheme disgust hate hate...) No matter. Where one eye closes, another opens. (The Master sees all! The Master knows all!) We will know our enemy\'s hearts, for they are weak. The eye. Now.',12,0,100,1,0,22105,'Comment'),
(48142,3,0,'The shadow of the Master covers this world... (Darkness, all darkness.) Our enemies fight one another, across the Highland. Fools. (Blood, blood.) WAIT! There is another!',12,0,100,1,0,22106,'Comment'),
(48142,4,0,'A mortal dares peer into the eye! (Brave little plaything.) I see you, little one! You want to see what the Eye sees, do you? (Show it! Show it all!)',12,0,100,1,0,22107,'Comment'),
(48142,5,0,'Behold the chaos to come. (Madness, madness, bliss!) Do you like what you see mortal?',12,0,100,1,0,22108,'Comment'),
(48142,6,0,'What of our agents in Orgrimmar? (City engulfed in stone and sand, we see it! The Eye sees into its heart.) Bring me the eye.',12,0,100,1,0,22104,'Comment');

DELETE FROM `creature_text` WHERE `entry`=48145;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48145,0,0,'The Alliance has made landfall master, and in great numbers upon the shore.',12,0,100,0,0,21073,'Comment'),
(48145,1,0,'Our agents have been outed and killed, master.',12,0,100,0,0,21075,'Comment');

UPDATE `creature_template` SET `ScriptName`='npc_th_eye_spy_twilight_servant' WHERE `entry`=48145;
UPDATE `creature_template` SET `modelid1`=27823 WHERE `entry`=47273;
UPDATE `creature` SET `phaseMask`=1 WHERE `guid`=770463;

-- Position update for Cinematic Camera Target 01 (id: 51039) in zone: 4922, area: 5503
UPDATE `creature` SET `position_x` = -5113.526, `position_y` = -4585.395, `position_z` = 369.698, `orientation`= 4.698 WHERE `guid` = 770463;

DELETE FROM `creature_template_addon` WHERE `entry` = '48142';
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES
(48142, '60191');

DELETE FROM `creature_template_addon` WHERE `entry` = '47273';
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES
(47273, '60191');

DELETE FROM `creature_text` WHERE `entry`=48010;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48010,0,0,'Quit lookin\' at me, ya big purple eye-face! Ah, blast it all, $n.',12,0,100,0,0,0,'Comment');

-- Low Shaman Blundy
SET @ENTRY := 48010;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,20,0,100,0,28244,0,0,0,11,35426,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Quest Rewarded - Arcane Explosion"),
(@ENTRY,@SOURCETYPE,1,0,20,0,100,0,28244,0,0,0,1,0,6000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Quest Rewarded - Talk 0");

DELETE FROM `creature_text` WHERE `entry`=47380;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47380,0,0,'(The master sees you! He sees! He sees! He wants! Wants wants...)',15,0,100,0,0,22109,'Comment');

-- Deletes creature Voice of Cho'gall (id: 47380, guid: 755573) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 755573; DELETE FROM creature_addon WHERE guid = 755573;

DELETE FROM `creature_addon` WHERE `guid` IN (755572, 755569);
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES
(755572, '60921'),
(755569, '60921');

DELETE FROM `spell_area` WHERE `spell` = '60922' AND `quest_start` = '28001';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`) VALUES
(60922, 5142, 28001, 28244, 1);

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '15';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 15, 32, 0, 'Twilight Highlands [A]: Add Phase 32 On Quest Rewarded: Eye Spy [28244]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '15' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28244';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 15, 0, 0, 8, 0, 28244, 0, 0, 0, 0, 0, '', '');

UPDATE `creature` SET `phaseMask`=32 WHERE `id` IN (48194, 52035, 48173, 48174, 48197, 47623);
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry` IN (48173, 48174);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '48197';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(48197, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '48197';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(48197, 48194, 1, 'Dragonmaw Skyclaw on Drakes', 8, 0);

UPDATE `creature_template` SET `ScriptName`='npc_th_dragonmaw_skyclaw' WHERE `entry`=48194;
UPDATE `creature_template` SET `ScriptName`='npc_th_thundermar_defender' WHERE `entry`=52035;
UPDATE `creature` SET `spawndist`=65, `MovementType`=1 WHERE `id`=48197;

-- Dragonmaw Black Drake
SET @ENTRY := 48197;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,37,0,100,0,0,0,0,0,75,89643,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"AI Init - Add Flame Aura");

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771161) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771161; DELETE FROM creature_addon WHERE guid = 771161;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771198) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771198; DELETE FROM creature_addon WHERE guid = 771198;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771165) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771165; DELETE FROM creature_addon WHERE guid = 771165;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771166) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771166; DELETE FROM creature_addon WHERE guid = 771166;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771167) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771167; DELETE FROM creature_addon WHERE guid = 771167;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771122) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771122; DELETE FROM creature_addon WHERE guid = 771122;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771178) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771178; DELETE FROM creature_addon WHERE guid = 771178;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771121) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771121; DELETE FROM creature_addon WHERE guid = 771121;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771160) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771160; DELETE FROM creature_addon WHERE guid = 771160;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771164) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771164; DELETE FROM creature_addon WHERE guid = 771164;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771197) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771197; DELETE FROM creature_addon WHERE guid = 771197;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771163) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771163; DELETE FROM creature_addon WHERE guid = 771163;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771185) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771185; DELETE FROM creature_addon WHERE guid = 771185;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771117) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771117; DELETE FROM creature_addon WHERE guid = 771117;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771130) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771130; DELETE FROM creature_addon WHERE guid = 771130;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771181) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771181; DELETE FROM creature_addon WHERE guid = 771181;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771173) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771173; DELETE FROM creature_addon WHERE guid = 771173;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771171) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771171; DELETE FROM creature_addon WHERE guid = 771171;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771136) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771136; DELETE FROM creature_addon WHERE guid = 771136;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771154) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771154; DELETE FROM creature_addon WHERE guid = 771154;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771132) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771132; DELETE FROM creature_addon WHERE guid = 771132;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771156) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771156; DELETE FROM creature_addon WHERE guid = 771156;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771184) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771184; DELETE FROM creature_addon WHERE guid = 771184;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771190) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771190; DELETE FROM creature_addon WHERE guid = 771190;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771134) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771134; DELETE FROM creature_addon WHERE guid = 771134;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771115) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771115; DELETE FROM creature_addon WHERE guid = 771115;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771137) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771137; DELETE FROM creature_addon WHERE guid = 771137;

-- Deletes creature Dragonmaw Skyclaw (id: 48194, guid: 771120) in zone: 4922, area: 5142
DELETE FROM `creature` WHERE `guid` = 771120; DELETE FROM creature_addon WHERE guid = 771120;

UPDATE `quest_template` SET `PrevQuestId`='28280' WHERE `Id`=28281;
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=48197;
UPDATE `creature` SET `spawntimesecs`=60 WHERE `id`=48197;

DELETE FROM `spell_script_names` WHERE `spell_id` = '89557';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(89557, 'spell_th_drake_dropper');

DELETE FROM `creature_text` WHERE `entry`=48173;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48173,0,0,'Here he comes, $n! Flying in from the west. Get your weapons ready!',12,0,100,0,0,0,'Comment'),
(48173,1,0,'Oh, that\'s just like a Firebeard, can\'t see anything past yer own fat nose. We were up to arses and elbows in Dragonmaw. But did you send a single bird to help? NO!',12,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=52025;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '52025';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(52025, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '52025';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `description`, `summontype`, `summontimer`) VALUES
(52025, 48257, 'Narkral on his Drake', 8, 0);

UPDATE `creature_template` SET `ScriptName`='npc_th_colin_thundermar' WHERE `entry`=48173;
UPDATE `creature_template` SET `ScriptName`='npc_th_narkral_drake' WHERE `entry`=52025;
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=48257;

-- Narkrall Rakeclaw
SET @ENTRY := 48257;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,13730,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Demoralizing Shout"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,1500,1500,3500,7000,11,9080,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Hamstring"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,3000,3000,4500,5500,11,57846,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Heroic Strike"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,6000,6000,6000,6000,11,32736,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Mortal Strike"),
(@ENTRY,@SOURCETYPE,4,0,0,0,100,0,10000,10000,25000,25000,11,79871,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Recklessness"),
(@ENTRY,@SOURCETYPE,5,0,1,0,100,0,1000,1000,1000,1000,49,0,0,0,0,0,0,10,771111,48173,0,0.0,0.0,0.0,0.0,"OOC - Attack Colin"),
(@ENTRY,@SOURCETYPE,6,0,6,0,100,0,0,0,0,0,33,48257,0,0,0,0,0,18,150,0,0,0.0,0.0,0.0,0.0,"On Death - Quest Credit AoE"),
(@ENTRY,@SOURCETYPE,7,0,4,0,100,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Remove Flags");

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '16';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 16, 32, 4, 'Twilight Highlands [A]: Negate Phase 32 On Quest Rewarded: The Kirthaven Summit [28294]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '16' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28294';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 16, 0, 0, 8, 0, 28294, 0, 0, 0, 0, 0, '', '');

#IMPOSTARE QUESTEND
DELETE FROM `spell_area` WHERE `spell` = '60922' AND `quest_start` = '28294';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(60922, 5143, 28294, 1, 66, 0);

UPDATE `creature` SET `phaseMask`=1 WHERE `guid`=770467;

DELETE FROM `conditions` WHERE `SourceEntry` = '28655' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 28655, 28411, 0),
(20, 8, 28655, 28410, 0),
(20, 8, 28655, 28409, 0),
(20, 8, 28655, 28408, 0),
(20, 8, 28655, 28413, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '28655' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 28655, 28411, 0),
(19, 8, 28655, 28410, 0),
(19, 8, 28655, 28409, 0),
(19, 8, 28655, 28408, 0),
(19, 8, 28655, 28413, 0);

DELETE FROM `creature_text` WHERE `entry`=48364;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48364,0,0,'Here, what\'s this?',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=48410;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48410,0,0,'Haaaaaalp!',14,0,100,0,0,0,'Comment'),
(48410,1,0,'The Glopgut ogres stormed Thundermar while Colin was here at the summit. They kidnapped Fanny and ran for the hills!',12,0,100,0,0,0,'Comment'),
(48410,2,0,'Colin is massing the Thundermar for a full-on assault of Glopgut\'s Hollow.',12,0,100,0,0,0,'Comment');

-- Keegan Firebeard
SET @ENTRY := 48364;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,20,0,100,0,28346,0,0,0,1,0,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Quest Rewarded - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,20,0,100,0,28346,0,0,0,12,48410,3,60000,0,0,0,8,0,0,0,-2758.3,-5319.09,173.71,0.88,"On Quest Rewarded - Summon Creature");

-- Cliff Thundermar
SET @ENTRY := 48410;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,100,100,60000,60000,69,0,0,0,0,0,0,8,0,0,0,-2746.59,-5303.7,174.07,0.87,"OOC - Move To Pos"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,50,50,60000,60000,59,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Set Run"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,0,50,50,60000,60000,1,0,4000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Talk 0"),
(@ENTRY,@SOURCETYPE,3,0,52,0,100,0,0,48410,0,0,1,1,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 0 - Talk 1"),
(@ENTRY,@SOURCETYPE,4,0,52,0,100,0,1,48410,0,0,1,2,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 1 - Talk 2"),
(@ENTRY,@SOURCETYPE,5,0,52,0,100,0,2,48410,0,0,41,30000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 2 - Force Despawn ");

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '17';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 17, 64, 0, 'Twilight Highlands [A]: Add Phase 64 On Quest Complete: Rescue at Glopgut\'s Hollow [28377]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '17' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28377';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 17, 0, 0, 28, 0, 28377, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '18';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 18, 64, 0, 'Twilight Highlands [A]: Add Phase 64 On Quest Rewarded: Rescue at Glopgut\'s Hollow [28377]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '18' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28377';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 18, 0, 0, 8, 0, 28377, 0, 0, 0, 0, 0, '', '');

UPDATE `creature` SET `phaseMask`=64 WHERE `id` IN (48472, 48473, 48476, 48474, 48479, 48498, 48480);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '48476';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(48476, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '48476';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(48476, 48477, 1, 'Firebeard Gryphon Rider on Gryphon', 8, 0);

UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=48476;
UPDATE `creature` SET `spawndist`=65, `MovementType`=1 WHERE `id`=48476;
UPDATE `creature` SET `spawndist`=6, `MovementType`=1 WHERE `id` IN (48474, 48479, 47768, 48498);

-- Position update for Glopgut Warhound (id: 48479) in zone: 4922, area: 5639
UPDATE `creature` SET `position_x` = -3344.542, `position_y` = -4423.891, `position_z` = 173.200, `orientation`= 3.657 WHERE `guid` = 771215;

-- Position update for Glopgut Pounder (id: 48474) in zone: 4922, area: 5639
UPDATE `creature` SET `position_x` = -3385.469, `position_y` = -4477.419, `position_z` = 171.233, `orientation`= 2.276 WHERE `guid` = 771108;

-- Position update for Thundermar Defender (id: 48473) in zone: 4922, area: 5639
UPDATE `creature` SET `position_x` = -3363.154, `position_y` = -4445.811, `position_z` = 171.606, `orientation`= 5.527 WHERE `guid` = 771045;

-- Position update for Thundermar Defender (id: 48473) in zone: 4922, area: 5639
UPDATE `creature` SET `position_x` = -3356.785, `position_y` = -4436.316, `position_z` = 174.702, `orientation`= 5.979 WHERE `guid` = 771057;

-- Position update for Thundermar Defender (id: 48473) in zone: 4922, area: 5639
UPDATE `creature` SET `position_x` = -3364.867, `position_y` = -4453.516, `position_z` = 170.202, `orientation`= 5.720 WHERE `guid` = 771053;

UPDATE `gameobject` SET `phaseMask`=64 WHERE `guid` IN (728556, 728555);

DELETE FROM `conditions` WHERE `SourceEntry` = '28407' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 28407, 28378, 0),
(20, 8, 28407, 28379, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '28407' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 28407, 28378, 0),
(19, 8, 28407, 28379, 0);

-- Brogg Glopgut
SET @ENTRY := 48480;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,2000,2000,4500,7500,11,8374,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Arcing Smash"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,8500,8500,20000,20000,11,75967,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Whirlwind");

DELETE FROM `creature_text` WHERE `entry`=48013;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48013,0,0,'$n? What are you doing here? And is that Keegan Firebeard behind you?',12,0,100,1,0,0,'Comment'),
(48013,1,0,'Took yer sweet time, didn\'tcha?',12,0,100,1,0,0,'Comment'),
(48013,2,0,'Aye, they was getting\' a wee handsy, so I took care of it. C\'mon then, I\'m done here.',12,0,100,1,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=48500;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48500,0,0,'Aye! We\'re here to rescue you!',12,0,100,1,0,0,'Comment'),
(48500,1,0,'The ogres - ya kilt \'em',12,0,100,1,0,0,'Comment'),
(48500,2,0,'Did you see that, $n? What a woman!',12,0,100,1,0,0,'Comment');

-- Fanny Thundermar
SET @ENTRY := 48013;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,1,0,7000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,52,0,100,0,0,48013,0,0,1,0,7000,0,0,0,0,11,48500,80,0,0.0,0.0,0.0,0.0,"After Talk 0 - Talk 0 (Keegan)"),
(@ENTRY,@SOURCETYPE,2,0,52,0,100,0,0,48500,0,0,1,1,7000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 0 (Keegan) - Talk 1 (Self)"),
(@ENTRY,@SOURCETYPE,3,0,52,0,100,0,1,48013,0,0,1,1,7000,0,0,0,0,11,48500,80,0,0.0,0.0,0.0,0.0,"After Talk 1 (Self) - Talk 1 (Keegan)"),
(@ENTRY,@SOURCETYPE,4,5,52,0,100,0,1,48500,0,0,1,2,7000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 1 (Keegan) - Talk 2 (Self)"),
(@ENTRY,@SOURCETYPE,5,0,61,0,100,0,0,0,0,0,33,48489,0,0,0,0,0,18,80,0,0,0.0,0.0,0.0,0.0,"Link - Quest Complete"),
(@ENTRY,@SOURCETYPE,6,0,52,0,100,0,2,48013,0,0,1,2,7000,0,0,0,0,11,48500,80,0,0.0,0.0,0.0,0.0,"After Talk 2 (Self) - Talk 2 (Keegan)"),
(@ENTRY,@SOURCETYPE,7,0,52,0,100,0,2,48013,0,0,75,62011,0,0,0,0,0,11,48500,80,0,0.0,0.0,0.0,0.0,"After Talk 2 (Self) - Add Love"),
(@ENTRY,@SOURCETYPE,8,0,52,0,100,0,2,48013,0,0,69,0,0,0,0,0,0,8,0,0,0,-3301.07,-4327.34,164.37,3.64,"After Talk 2 (Self) - Move Away"),
(@ENTRY,@SOURCETYPE,9,0,52,0,100,0,2,48013,0,0,41,10000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 2 (Self) - Despawn");

DELETE FROM `areatrigger_scripts` WHERE `entry` = '6513';
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(6513, 'th_glopgut_hollow');

-- Keegan Firebeard
SET @ENTRY := 48500;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,41,60000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Force Despawn");

UPDATE `creature` SET `phaseMask`=1 WHERE `guid`=771008;

DELETE FROM `spell_area` WHERE `spell` = '49417' AND `quest_start` = '28407';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49417, 5143, 28407, 1, 66, 0);

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '19';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 19, 64, 4, 'Twilight Highlands [A]: Negate Phase 64 On Quest Rewarded: The Bachelorette [28407]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '19' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28407';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 19, 0, 0, 8, 0, 28407, 0, 0, 0, 0, 0, '', '');

DELETE FROM `creature_text` WHERE `entry`=48530;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48530,0,0,'Be sure to talk to the MacGriffs, inside the sanctuary. They\'ll be orchestratin\' the ceremonies.',12,0,100,1,0,0,'Comment');

-- Fanny Thundermar
SET @ENTRY := 48530;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,20,0,100,0,28407,0,0,0,1,0,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Quest Rewarded - Talk 0");

UPDATE `quest_template` SET `Method`=0 WHERE `Id`=28410;
UPDATE `creature_template` SET `ScriptName`='npc_th_russel_brower' WHERE `entry`=48366;

DELETE FROM `creature_text` WHERE `entry`=48366;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48366,0,0,'In Thundermar the tales proclaimed',12,0,100,0,0,0,'Comment'),
(48366,1,0,'Of a beauty destined for fame',12,0,100,0,0,0,'Comment'),
(48366,2,0,'Soft emerald green eyes framed a countenance, wise',12,0,100,0,0,0,'Comment'),
(48366,3,0,'The people cried "Fanny," her name.',12,0,100,0,0,0,'Comment'),
(48366,4,0,'She came from Thundermar, they say',12,0,100,0,0,0,'Comment'),
(48366,5,0,'Ballyhoo hip hip hooray!',12,0,100,0,0,0,'Comment'),
(48366,6,0,'Guys sighed and plied eyes on this pint-sized prize',12,0,100,0,0,0,'Comment'),
(48366,7,0,'\'Twas Fanny fo Fanny hey hey.',12,0,100,0,0,0,'Comment'),
(48366,8,0,'In Thundermar the tales proclaimed',12,0,100,0,0,0,'Comment'),
(48366,9,0,'Of a bold lass destined for fame',12,0,100,0,0,0,'Comment'),
(48366,10,0,'With emerald green eyes and big man-crushing thighs',12,0,100,0,0,0,'Comment'),
(48366,11,0,'And "Fanny," a most fitting name.',12,0,100,0,0,0,'Comment'),
(48366,12,0,'Of her suitors she was unimpressed',12,0,100,0,0,0,'Comment'),
(48366,13,0,'Til Mighty Firebeard crossed heart and professed',12,0,100,0,0,0,'Comment'),
(48366,14,0,'To the heavens above our hero claimed love',12,0,100,0,0,0,'Comment'),
(48366,15,0,'Of a depth like the few can be blessed.',12,0,100,0,0,0,'Comment'),
(48366,16,0,'Then Firebeard decreed his plea',12,0,100,0,0,0,'Comment'),
(48366,17,0,'Ho diddly who diddly dee',12,0,100,0,0,0,'Comment'),
(48366,18,0,'His goal he professed was marital arrest',12,0,100,0,0,0,'Comment'),
(48366,19,0,'Oh Fanny! No Fanny, don\'t flee!',12,0,100,0,0,0,'Comment'),
(48366,20,0,'Ol\' Firebeard he made her his quest',12,0,100,0,0,0,'Comment'),
(48366,21,0,'On one knee his love he professed:',12,0,100,0,0,0,'Comment'),
(48366,22,0,'"Oh Fanny me Fanny, do marry me can ye?',12,0,100,0,0,0,'Comment'),
(48366,23,0,'I loves ya and I loves yer chest."',12,0,100,0,0,0,'Comment'),
(48366,24,0,'Now let cheering dispel the twilight',12,0,100,0,0,0,'Comment'),
(48366,25,0,'And let the Wildhammers unite!',12,0,100,0,0,0,'Comment'),
(48366,26,0,'Answer the call, know that love conquers all',12,0,100,0,0,0,'Comment'),
(48366,27,0,'And let\'s see these whole Highlands alight!',12,0,100,0,0,0,'Comment'),
(48366,28,0,'Now the Wildhammers are one!',12,0,100,0,0,0,'Comment'),
(48366,29,0,'Whoa doggy hot diggity dun',12,0,100,0,0,0,'Comment'),
(48366,30,0,'Unite and take flight, it\'s a Twilight knifefight',12,0,100,0,0,0,'Comment'),
(48366,31,0,'For Fanny! For Firebeard! For fun!',12,0,100,0,0,0,'Comment'),
(48366,32,0,'Now let cheering dispel the twilight',12,0,100,0,0,0,'Comment'),
(48366,33,0,'And let the Wildhammers unite!',12,0,100,0,0,0,'Comment'),
(48366,34,0,'They\'re short and they\'re stout, but no man can doubt:',12,0,100,0,0,0,'Comment'),
(48366,35,0,'Firebeard and his Fanny are tight.',12,0,100,0,0,0,'Comment');

UPDATE `quest_template` SET `RequiredItemId1`=0, `RequiredItemCount1`=0 WHERE `Id`=28410;
UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE `menu_id`=12459 AND `id`=0;

DELETE FROM `conditions` WHERE `SourceGroup`=12459 AND `SourceEntry` = '0';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 12459, 0, 0, 0, 9, 0, 28409, 0, 0, 0, 0, 0, '', 'Hammelhand - Show gossip only if quest 28409 is active');

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '46706';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(46706, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '46706';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(46706, 48759, 1, 'Kirkhaven Courier -> Wheelbarrow', 8, 0);

DELETE FROM `gossip_menu` WHERE `entry` = '12459';
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(12459, 17521);

UPDATE `creature_template` SET `ScriptName`='npc_th_hammelhand' WHERE `entry`=48758;

-- Wildhammer Wheelbarrow
SET @ENTRY := 46706;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,53,0,46706,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Start WP"),
(@ENTRY,@SOURCETYPE,1,0,40,0,100,0,1,0,0,0,33,48762,0,0,0,0,0,18,60,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Quest Credit"),
(@ENTRY,@SOURCETYPE,2,0,54,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Set Walk");

DELETE FROM `creature_text` WHERE `entry`=48917;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48917,0,0,'Woohoo! We god us a convoy!',12,0,100,0,0,0,'Comment');

-- Wildhammer Lookout
SET @ENTRY := 48917;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,1,0,2500,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,54,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Set Walk"),
(@ENTRY,@SOURCETYPE,2,0,52,0,100,0,0,48917,0,0,53,0,48917,0,0,0,2,8,0,0,0,0.0,0.0,0.0,0.0,"After Talk 0 - WP Start"),
(@ENTRY,@SOURCETYPE,3,0,40,0,100,0,1,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Force Despawn");

DELETE FROM `creature_text` WHERE `entry`=48758;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48758,0,0,'Keep yer eyes open, $n! That road is crawling with Dragonmaw.',12,0,100,0,0,0,'Comment');

DELETE FROM `waypoints` WHERE `entry`='46706';
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(46706, 1, -2948.75, -5805.44, 146.70, 'Escort WP - Lookout'),
(46706, 2, -2940.16, -5740.16, 160.84, 'Escort WP - Lookout'),
(46706, 3, -2951.91, -5702.33, 166.98, 'Escort WP - Lookout'),
(46706, 4, -2958.85, -5636.33, 170.57, 'Escort WP - Lookout'),
(46706, 5, -2923.77, -5595.69, 170.68, 'Escort WP - Lookout'),
(46706, 6, -2888.23, -5567.28, 170.50, 'Escort WP - Lookout'),
(46706, 7, -2877.79, -5541.30, 170.91, 'Escort WP - Lookout'),
(46706, 8, -2871.50, -5496.24, 170.96, 'Escort WP - Lookout'),
(46706, 9, -2885.03, -5412.24, 168.96, 'Escort WP - Lookout'),
(46706, 10, -2864.45, -5374.90, 168.38, 'Escort WP - Lookout');

DELETE FROM `waypoints` WHERE `entry`='48917';
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(48917, 1, -2948.75, -5805.44, 146.70, 'Escort WP - Lookout'),
(48917, 2, -2940.16, -5740.16, 160.84, 'Escort WP - Lookout'),
(48917, 3, -2951.91, -5702.33, 166.98, 'Escort WP - Lookout'),
(48917, 4, -2958.85, -5636.33, 170.57, 'Escort WP - Lookout'),
(48917, 5, -2923.77, -5595.69, 170.68, 'Escort WP - Lookout'),
(48917, 6, -2888.23, -5567.28, 170.50, 'Escort WP - Lookout'),
(48917, 7, -2877.79, -5541.30, 170.91, 'Escort WP - Lookout'),
(48917, 8, -2871.50, -5496.24, 170.96, 'Escort WP - Lookout'),
(48917, 9, -2885.03, -5412.24, 168.96, 'Escort WP - Lookout'),
(48917, 10, -2864.45, -5374.90, 168.38, 'Escort WP - Lookout');

-- Wildhammer Lookout
SET @ENTRY := 48917;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,1,0,1500,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,54,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Set Walk"),
(@ENTRY,@SOURCETYPE,2,0,52,0,100,0,0,48917,0,0,53,0,48917,0,0,0,2,8,0,0,0,0.0,0.0,0.0,0.0,"After Talk 0 - WP Start"),
(@ENTRY,@SOURCETYPE,3,0,40,0,100,0,10,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Force Despawn"),
(@ENTRY,@SOURCETYPE,4,0,40,0,100,0,4,0,0,0,12,48799,4,30000,0,1,0,8,0,0,0,-2960.85,-5619.74,172.28,4.76,"On WP Reached - Summon Skirmisher"),
(@ENTRY,@SOURCETYPE,5,0,40,0,100,0,8,0,0,0,12,48799,4,30000,0,1,0,8,0,0,0,-2882.31,-5479.6,170.84,4.96,"On WP Reached - Summon Skirmisher"),
(@ENTRY,@SOURCETYPE,6,0,1,0,100,0,4000,4000,4000,4000,59,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Set Walk");

-- Wildhammer Wheelbarrow
SET @ENTRY := 46706;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,53,0,46706,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Start WP"),
(@ENTRY,@SOURCETYPE,1,0,40,0,100,0,10,0,0,0,33,48762,0,0,0,0,0,18,60,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Quest Credit"),
(@ENTRY,@SOURCETYPE,2,0,54,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Set Walk"),
(@ENTRY,@SOURCETYPE,3,0,1,0,100,0,2000,2000,2000,2000,59,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Set Walk"),
(@ENTRY,@SOURCETYPE,4,0,38,0,100,0,0,1,0,0,54,120000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Wp Pause"),
(@ENTRY,@SOURCETYPE,5,0,38,0,100,0,0,1,0,0,65,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 2 - Wp Resume"),
(@ENTRY,@SOURCETYPE,6,0,40,0,100,0,10,0,0,0,41,1000,0,0,0,0,0,1,60,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Despawn");

UPDATE `creature_template` SET `modelid1`=35312 WHERE `entry`=46706;
UPDATE `creature` SET `spawndist`=20, `MovementType`=1 WHERE `id`=46162;
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `InhabitType`=4, `modelid1`=27823, `ScriptName`='npc_th_wedding_veh', `VehicleId`=1257 WHERE `entry`=49163;

DELETE FROM `gossip_menu_option` WHERE `menu_id` = '12480';
INSERT INTO `gossip_menu_option` (`menu_id`, `option_text`, `option_id`, `npc_option_npcflag`) VALUES
(12480, 'I\'ll keep my eyes open, Grundy. Let the wedding commence!', 1, 1);

DELETE FROM `conditions` WHERE `SourceGroup`=12480 AND `SourceEntry` = '0';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 12480, 0, 0, 0, 9, 0, 28655, 0, 0, 0, 0, 0, '', 'Grundy - Show gossip only if quest 28655 is active');

UPDATE `creature_template` SET `ScriptName`='npc_th_grundy_mcgraff' WHERE `entry`=48368;

DELETE FROM `creature_template_addon` WHERE `entry` = '49032';
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES
(49032, '91852');

UPDATE `gameobject` SET `phaseMask`=128 WHERE `id` IN (207247, 207234, 207233, 207248, 207249);
UPDATE `creature_template` SET `InhabitType`=7 WHERE `entry`=49371;

DELETE FROM `creature` WHERE `guid` = '841880';
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(841882, 57758, 0, 1, 128, 0, 0, -2784.15, -5349.15, 173.934, 0.751899, 300, 0, 0, 21, 0, 0, 0, 33554432, 0);

DELETE FROM `creature_text` WHERE `entry`=49026;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(49026,0,0,'A big day, Firebeard. The Wildhammer united can never be stopped!',12,0,100,5,0,0,'Comment'),
(49026,1,0,'Never doubt it. Here, allow me to give you my wedding gift.',12,0,100,1,0,0,'Comment'),
(49026,2,0,'The only surviving egg of my late gryphon, Sky\'ree. Honor it and care for it; her child is yours.',12,0,100,1,0,0,'Comment'),
(49026,3,0,'I\'ll not hear a word of it. The egg is yours. I want you to see how committed I am to this union.',12,0,100,1,0,0,'Comment'),
(49026,4,0,'And how committed the Alliance is to the Wildhammer cause',12,0,100,1,0,0,'Comment'),
(49026,5,0,'Ah, look. Here comes $n, escorting your bride!',12,0,100,1,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=49027;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(49027,0,0,'I hope you\'re right, Kurdran old friend.',12,0,100,1,0,0,'Comment'),
(49027,1,0,'Kurdran - no, I couldn\'t! Sky\'ree was a legend, I can\'t -',12,0,100,1,0,0,'Comment'),
(49027,2,0,'Aye. Thank you, Kurdran.',12,0,100,1,0,0,'Comment'),
(49027,3,0,'I do.',12,0,100,0,0,0,'Comment');

DELETE FROM `conditions` WHERE `SourceEntry` = '86784';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 86784, 0, 0, 31, 0, 3, 46554, 0, 0, 0, '', 'Targeting -> Mirror Image (Uldum)'),
(13, 1, 86784, 0, 1, 31, 0, 3, 51337, 0, 0, 0, '', 'Targeting -> Mirror Image (Wedding)');

UPDATE `creature_template` SET `ScriptName`='npc_th_wedding_fanny' WHERE `entry`=49032;
UPDATE `creature_template` SET `ScriptName`='npc_th_wedding_mirror' WHERE `entry`=51337;

DELETE FROM `creature_text` WHERE `entry`=49032;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(49032,0,0,'I do.',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=49032;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(49032,0,0,'I do.',12,0,100,0,0,0,'Comment'),
(49032,1,0,'SAVE THE WEDDING!',42,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=49034;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(49034,0,0,'Ladies and gentledwarves, we gather here in the shadow of Thunderstrike to honor the union of Fanny Thundermar and Keegan Firebeard.',12,0,100,1,0,0,'Comment'),
(49034,1,0,'May their bond be as eternal as the wind, waves, stone and fire.',12,0,100,1,0,0,'Comment'),
(49034,2,0,'Do you, Keegan and Fanny, accept one another into your lives, that two become as one, in union everlasting?',12,0,100,1,0,0,'Comment'),
(49034,3,0,'Then, by the powers vested in me... the powers vested in me...',12,0,100,1,0,0,'Comment'),
(49034,4,0,'...BY BLOOD AND SHADOW!',12,0,100,15,0,0,'Comment'),
(49034,5,0,'I shall consume your lifeblood in the name of the master!!',12,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=2339, `unit_flags`=0 WHERE `entry` IN
(49026,49371,49027,49034,49032,49013,49012,49011,49015,49010,49014,49021,49017,49026);

UPDATE `creature_template` SET `scriptname`='npc_th_wedding_guests' WHERE `entry` IN
(49026,49027,49013,49012,49011,49015,49010,49014,49021,49017,49026);

DELETE FROM `creature_text` WHERE `entry`=49016;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(49016,0,0,'Russel Brower begins to play a wedding hymn! Stand near him to receive its regenerative effects!',42,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `ScriptName`='npc_th_wedding_beast' WHERE `entry`=49234;

DELETE FROM `creature_text` WHERE `entry`=49234;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(49234,0,0,'Uulwi gag erh\'ongg w\'ssh.',14,0,100,0,0,0,'Comment'),
(49234,1,0,'|TInterface\\Icons\\spell_frost_frostnova.blp:20|t The wedding party is afflicted with |cFFFF0000|Hspell:91978|h[Cold Feet]|h|r!',42,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=49014;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(49014,0,0,'It\'s one of them!',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=49012;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(49012,0,0,'Get it! Kill it!',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=49015;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(49015,0,0,'Stop that thing!',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=49017;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(49017,0,0,'Waaaaahhhhh!!',12,0,100,0,0,0,'Comment');

DELETE FROM `conditions` WHERE `SourceEntry` = '93708';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 93708, 0, 0, 31, 0, 3, 49013, 0, 0, 0, '', 'Targeting -> Guests'),
(13, 1, 93708, 0, 1, 31, 0, 3, 49012, 0, 0, 0, '', 'Targeting -> Guests'),
(13, 1, 93708, 0, 2, 31, 0, 3, 49011, 0, 0, 0, '', 'Targeting -> Guests'),
(13, 1, 93708, 0, 3, 31, 0, 3, 49015, 0, 0, 0, '', 'Targeting -> Guests'),
(13, 1, 93708, 0, 4, 31, 0, 3, 49010, 0, 0, 0, '', 'Targeting -> Guests'),
(13, 1, 93708, 0, 5, 31, 0, 3, 49014, 0, 0, 0, '', 'Targeting -> Guests'),
(13, 1, 93708, 0, 6, 31, 0, 3, 49021, 0, 0, 0, '', 'Targeting -> Guests'),
(13, 1, 93708, 0, 7, 31, 0, 3, 49017, 0, 0, 0, '', 'Targeting -> Guests'),
(13, 1, 93708, 0, 8, 31, 0, 3, 49026, 0, 0, 0, '', 'Targeting -> Guests');

DELETE FROM `conditions` WHERE `SourceEntry` = '91978';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 91978, 0, 0, 31, 0, 3, 49013, 0, 0, 0, '', 'Targeting -> Guests'),
(13, 1, 91978, 0, 1, 31, 0, 3, 49012, 0, 0, 0, '', 'Targeting -> Guests'),
(13, 1, 91978, 0, 2, 31, 0, 3, 49011, 0, 0, 0, '', 'Targeting -> Guests'),
(13, 1, 91978, 0, 3, 31, 0, 3, 49015, 0, 0, 0, '', 'Targeting -> Guests'),
(13, 1, 91978, 0, 4, 31, 0, 3, 49010, 0, 0, 0, '', 'Targeting -> Guests'),
(13, 1, 91978, 0, 5, 31, 0, 3, 49014, 0, 0, 0, '', 'Targeting -> Guests'),
(13, 1, 91978, 0, 6, 31, 0, 3, 49021, 0, 0, 0, '', 'Targeting -> Guests'),
(13, 1, 91978, 0, 7, 31, 0, 3, 49017, 0, 0, 0, '', 'Targeting -> Guests'),
(13, 1, 91978, 0, 8, 31, 0, 3, 49026, 0, 0, 0, '', 'Targeting -> Guests');

-- Position update for Kurdran Wildhammer (id: 48365) in zone: 4922, area: 5143
UPDATE `creature` SET `position_x` = -2766.550, `position_y` = -5347.820, `position_z` = 173.920, `orientation`= 1.616 WHERE `guid` = 770468;

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '20';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 20, 128, 4, 'Twilight Highlands [A]: Negate Phase 128 On Quest Rewarded: Wild, Wild, Wildhammer Wedding [28655]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '20' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28655';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 20, 0, 0, 8, 0, 28655, 0, 0, 0, 0, 0, '', '');

UPDATE `creature_template` SET `ScriptName`='npc_th_wedding_kurdran' WHERE `entry`=49358;

-- Twilight Shadowshifter
SET @ENTRY := 50593;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,37,0,100,0,0,0,0,0,11,93747,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"AI Init - Cast Dark Empowerment");

DELETE FROM `conditions` WHERE `SourceEntry` = '93747';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 93747, 0, 0, 31, 0, 3, 46624, 0, 0, 0, '', 'Targeting -> Darunga');

UPDATE `creature_template` SET `ScriptName`='npc_th_twilight_shadowshifter' WHERE `entry`=50593;
UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE `menu_id`=12143 AND `id`=0;

DELETE FROM `conditions` WHERE `SourceGroup`=12143 AND `SourceEntry` = '0';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 12143, 0, 0, 0, 9, 0, 27651, 0, 0, 0, 0, 0, '', 'Flynn - Show gossip only if quest 27651 is active');

DELETE FROM `creature_text` WHERE `entry`=46628;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46628,0,0,'Let\'s give\'m a proper Dunwald welcome, brothers!',14,0,100,0,0,0,'Comment'),
(46628,1,0,'FOR CLAN WILDHAMMER!',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=46624;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46624,0,0,'Daruna roars wildly, initiating a masive stomp attack!',41,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=46627;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46627,0,0,'I\'ve had about enough of this aleless inbreed!',12,0,100,0,0,0,'Comment'),
(46627,1,0,'How\'s about a nice, refreshing ale?!',12,0,100,0,0,0,'Comment'),
(46627,2,0,'Use Eoin\'s mug to replenish your health!',41,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=46624;
UPDATE `creature_template` SET `ScriptName`='npc_th_darunga' WHERE `entry`=46624;

DELETE FROM `creature_text` WHERE `entry`=46626;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46626,0,0,'When I\'m done with ye, ye won\'t have a toe to stand on!',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=46625;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46625,0,0,'Say goodbye to yer kneecaps, baddie!',12,0,100,0,0,0,'Comment'),
(46625,1,0,'Take that, ye beardless coward!',12,0,100,0,0,0,'Comment');

UPDATE `npc_spellclick_spells` SET `spell_id`=93794 WHERE `npc_entry`=50610 AND `spell_id`=93785;
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=46627;

-- Eoin's Imbued Mug
SET @ENTRY := 50610;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,41,60000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Despawn in 60 seconds"),
(@ENTRY,@SOURCETYPE,1,0,64,0,100,0,0,0,0,0,85,93794,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Heal"),
(@ENTRY,@SOURCETYPE,2,0,64,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Close Gossip"),
(@ENTRY,@SOURCETYPE,3,0,64,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Despawn");

UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `npcflag`=1 WHERE `entry`=50610;

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '21';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 21, 256, 0, 'Twilight Highlands [A]: Add Phase 256 On Quest Accepted: Doing it Like a Dunwald [27651]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '21' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '27651';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 21, 0, 0, 9, 0, 27651, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '22';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 22, 256, 0, 'Twilight Highlands [A]: Add Phase 256 On Quest Complete: Doing it Like a Dunwald [27651]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '22' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '27651';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 22, 0, 0, 28, 0, 27651, 0, 0, 0, 0, 0, '', '');

UPDATE `creature` SET `phaseMask`=256 WHERE `id` IN (46624, 50593, 46625, 46628, 46626, 46627);
UPDATE `creature_template` SET `DamageModifier`=1.5 WHERE `entry`=46624;
UPDATE `creature_template` SET `ScriptName`='npc_th_flynn_dunwald_darunga' WHERE `entry`=46628;

-- Deletes creature Twilight Pillager (id: 46144, guid: 758024) in zone: 4922, area: 5486
DELETE FROM `creature` WHERE `guid` = 758024; DELETE FROM creature_addon WHERE guid = 758024;

-- Deletes creature Twilight Pillager (id: 46144, guid: 758030) in zone: 4922, area: 5486
DELETE FROM `creature` WHERE `guid` = 758030; DELETE FROM creature_addon WHERE guid = 758030;

UPDATE `creature_template` SET `unit_flags`=33024 WHERE `entry`=46625;
UPDATE `creature` SET `spawntimesecs`=120 WHERE `id` IN (46624, 50593, 46625, 46628, 46626, 46627);

DELETE FROM `spell_area` WHERE `spell` IN (81742, 98392, 98433) AND `quest_start` = '27651';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_end_status`) VALUES
(81742, 5484, 27651, 1, 0),
(98392, 5484, 27651, 1, 0),
(98433, 5484, 27651, 1, 0);

UPDATE `quest_template` SET `PrevQuestId`='28655' WHERE `Id`=27374;
UPDATE `creature_template_addon` SET `auras`='85633 84957' WHERE `entry` IN (45694, 45511, 45510);

DELETE FROM `spell_area` WHERE `spell` = '98920' AND `quest_start` = '27374';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(98920, 4922, 27374, 27380, 1, 66, 9);

UPDATE `quest_template` SET `PrevQuestId`='27299' WHERE `Id`=27302;

-- Tentacle of Iso'rath
SET @ENTRY := 45394;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,1000,6000,6000,11,89918,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Thwomp");

UPDATE `creature_template` SET `unit_flags`=4 WHERE `entry`=45394;

-- Faceless Soulclaimer
SET @ENTRY := 45395;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,6000,6000,7000,7000,11,32712,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Shadow Nova"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,500,500,8000,8000,11,79094,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Drain Soul");

UPDATE `creature_template` SET `modelid2`=34432 WHERE `entry`=45394;

-- Faceless Soulclaimer
SET @ENTRY := 45395;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,6000,6000,7000,7000,11,32712,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Shadow Nova"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,500,500,8000,8000,11,79094,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Drain Soul"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,0,0,0,0,0,49,0,0,0,0,0,0,11,0,15,0,0.0,0.0,0.0,0.0,"OOC - Attack");

-- Greater Earth Elemental
SET @ENTRY := 45414;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Aggro - Set Invincible");

-- Greater Fire Elemental
SET @ENTRY := 45413;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Aggro - Set Invincible"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,3000,3000,15000,15000,11,82886,2,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Living Bomb");

-- Hargoth Dimblaze
SET @ENTRY := 45392;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,42,464000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Set Invincible"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,3000,3000,4000,7000,11,78144,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Stormstrike");

UPDATE `creature_template` SET `DamageModifier`=0.1 WHERE `entry` IN (45414, 45392, 45413);
UPDATE `creature` SET `spawndist`=15 WHERE `id`=45395;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '50473';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(50473, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '50473';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(50473, 50472, 1, 'Earthen Ring Shaman on Gryphon', 8, 0);

UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=50473;
UPDATE `creature_template_addon` SET `auras`='98920 84957' WHERE `entry`=50473;
UPDATE `creature` SET `phaseMask`=1 WHERE `guid` IN (764008, 764009);

DELETE FROM `spell_area` WHERE `spell` = '49417' AND `quest_start` = '27299';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49417, 5437, 27299, 1, 66, 0);

-- Twilight Bonebreaker
SET @ENTRY := 45334;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,38557,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Throw"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,2000,2000,4500,4500,11,79881,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Slam"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,15500,15500,15500,15500,11,63227,32,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Enrage");

-- Omak'Tul
SET @ENTRY := 45360;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,3000,3000,7500,7500,11,9672,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Frostbolt"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,5000,5000,5000,5000,11,9672,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Blast Wave");

-- Bound Fleshburner
SET @ENTRY := 45358;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,75025,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Rush of Flame (Charge)"),
(@ENTRY,@SOURCETYPE,1,0,4,0,100,0,0,0,0,0,11,75024,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Rush of Flame (Flames)"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,2500,2500,4500,4500,11,13729,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Flame Shock");

DELETE FROM `spell_area` WHERE `spell` = '49416' AND `quest_start` IN (27301, 27303);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49416, 5439, 27301, 27303, 1, 66, 9),
(49416, 5437, 27303, 0, 1, 66, 0);

UPDATE `creature` SET `phaseMask`=1 WHERE `guid`=764037;

DELETE FROM `conditions` WHERE `SourceEntry` = '27376' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27376, 27303, 0),
(20, 8, 27376, 27302, 0),
(20, 8, 27376, 27300, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27376' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27376, 27303, 0),
(19, 8, 27376, 27302, 0),
(19, 8, 27376, 27300, 0);

-- Adds Waypoint Movement to Earthen Ring Gryphon (guid: 764027, entry: 50473)
SET @GUID  := 764027;
SET @WP_ID := 7640270;
UPDATE `creature` SET `MovementType` = 2, `spawndist` = 0 WHERE `guid` = @GUID;
UPDATE `creature_addon` SET `path_id` = 7640270 WHERE `guid` = 764027;
DELETE FROM `waypoint_data` WHERE `id` = @WP_ID;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`) VALUES
(@WP_ID, 1, -2600.460, -4900.180, 167.501, 0),
(@WP_ID, 2, -2676.880, -4891.450, 156.403, 0),
(@WP_ID, 3, -2592.260, -4901.170, 170.185, 0),
(@WP_ID, 4, -2572.200, -4935.470, 162.200, 0);

-- Adds Waypoint Movement to Earthen Ring Gryphon (guid: 764021, entry: 50473)
SET @GUID  := 764021;
SET @WP_ID := 7640210;
UPDATE `creature` SET `MovementType` = 2, `spawndist` = 0 WHERE `guid` = @GUID;
UPDATE `creature_addon` SET `path_id` = 7640210 WHERE `guid` = 764021;
DELETE FROM `waypoint_data` WHERE `id` = @WP_ID;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`) VALUES
(@WP_ID, 1, -2581.680, -4929.550, 153.809, 0),
(@WP_ID, 2, -2655.410, -4890.180, 152.010, 0),
(@WP_ID, 3, -2576.550, -4933.570, 155.520, 0),
(@WP_ID, 4, -2557.790, -4952.090, 150.680, 0);

-- Adds Waypoint Movement to Earthen Ring Gryphon (guid: 764033, entry: 50473)
SET @GUID  := 764033;
SET @WP_ID := 7640330;
UPDATE `creature` SET `MovementType` = 2, `spawndist` = 0 WHERE `guid` = @GUID;
UPDATE `creature_addon` SET `path_id` = 7640330 WHERE `guid` = 764033;
DELETE FROM `waypoint_data` WHERE `id` = @WP_ID;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`) VALUES
(@WP_ID, 1, -2593.330, -4915.150, 142.241, 0),
(@WP_ID, 2, -2643.130, -4896.820, 145.970, 0),
(@WP_ID, 3, -2710.260, -4915.730, 145.320, 0),
(@WP_ID, 4, -2639.640, -4895.850, 146.669, 0),
(@WP_ID, 5, -2572.690, -4935.410, 137.888, 0);

-- Adds Waypoint Movement to Earthen Ring Gryphon (guid: 764035, entry: 50473)
SET @GUID  := 764035;
SET @WP_ID := 7640350;
UPDATE `creature` SET `MovementType` = 2, `spawndist` = 0 WHERE `guid` = @GUID;
UPDATE `creature_addon` SET `path_id` = 7640350 WHERE `guid` = 764035;
DELETE FROM `waypoint_data` WHERE `id` = @WP_ID;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`) VALUES
(@WP_ID, 1, -2564.520, -4988.680, 168.262, 0),
(@WP_ID, 2, -2572.660, -4947.520, 166.393, 0),
(@WP_ID, 3, -2562.590, -4992.690, 167.735, 0),
(@WP_ID, 4, -2593.440, -5086.720, 175.671, 0);

-- Adds Waypoint Movement to Earthen Ring Gryphon (guid: 764031, entry: 50473)
SET @GUID  := 764031;
SET @WP_ID := 7640310;
UPDATE `creature` SET `MovementType` = 2, `spawndist` = 0 WHERE `guid` = @GUID;
UPDATE `creature_addon` SET `path_id` = 7640310 WHERE `guid` = 764031;
DELETE FROM `waypoint_data` WHERE `id` = @WP_ID;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`) VALUES
(@WP_ID, 1, -2678.920, -5005.940, 162.053, 0),
(@WP_ID, 2, -2684.620, -4968.100, 157.828, 0),
(@WP_ID, 3, -2642.660, -4949.990, 158.228, 0),
(@WP_ID, 4, -2622.280, -4993.740, 159.288, 0),
(@WP_ID, 5, -2658.220, -5012.260, 165.237, 0);

-- Adds Waypoint Movement to Earthen Ring Gryphon (guid: 764023, entry: 50473)
SET @GUID  := 764023;
SET @WP_ID := 7640230;
UPDATE `creature` SET `MovementType` = 2, `spawndist` = 0 WHERE `guid` = @GUID;
UPDATE `creature_addon` SET `path_id` = 7640230 WHERE `guid` = 764023;
DELETE FROM `waypoint_data` WHERE `id` = @WP_ID;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`) VALUES
(@WP_ID, 1, -2659.420, -4894.610, 189.478, 0),
(@WP_ID, 2, -2586.300, -4928.020, 184.173, 0),
(@WP_ID, 3, -2579.130, -4961.970, 178.229, 0),
(@WP_ID, 4, -2615.990, -4993.220, 177.637, 0),
(@WP_ID, 5, -2649.350, -4962.830, 201.014, 0),
(@WP_ID, 6, -2680.840, -4889.030, 186.718, 0);

-- Adds Waypoint Movement to Earthen Ring Gryphon (guid: 764025, entry: 50473)
SET @GUID  := 764025;
SET @WP_ID := 7640250;
UPDATE `creature` SET `MovementType` = 2, `spawndist` = 0 WHERE `guid` = @GUID;
UPDATE `creature_addon` SET `path_id` = 7640250 WHERE `guid` = 764025;
DELETE FROM `waypoint_data` WHERE `id` = @WP_ID;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`) VALUES
(@WP_ID, 1, -2704.950, -4876.010, 179.669, 0),
(@WP_ID, 2, -2648.930, -4879.380, 169.836, 0),
(@WP_ID, 3, -2606.770, -4901.840, 161.411, 0),
(@WP_ID, 4, -2640.790, -4896.270, 155.394, 0),
(@WP_ID, 5, -2654.280, -4876.730, 171.156, 0),
(@WP_ID, 6, -2719.040, -4886.430, 177.110, 0);

-- Adds Waypoint Movement to Earthen Ring Gryphon (guid: 764029, entry: 50473)
SET @GUID  := 764029;
SET @WP_ID := 7640290;
UPDATE `creature` SET `MovementType` = 2, `spawndist` = 0 WHERE `guid` = @GUID;
UPDATE `creature_addon` SET `path_id` = 7640290 WHERE `guid` = 764029;
DELETE FROM `waypoint_data` WHERE `id` = @WP_ID;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`) VALUES
(@WP_ID, 1, -2752.160, -4978.160, 167.422, 0),
(@WP_ID, 2, -2724.720, -5047.960, 165.772, 0),
(@WP_ID, 3, -2687.400, -5078.000, 164.488, 0),
(@WP_ID, 4, -2728.810, -5044.240, 166.147, 0),
(@WP_ID, 5, -2755.800, -4973.820, 168.429, 0),
(@WP_ID, 6, -2752.390, -4956.470, 162.736, 0);

UPDATE `creature` SET `phaseMask`=1 WHERE `id`=50473;

DELETE FROM `conditions` WHERE `SourceEntry` = '49762';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 49762, 0, 0, 31, 0, 3, 45694, 0, 0, 0, '', 'Targeting -> Tentacles');

-- Earthen Ring Shaman
SET @ENTRY := 50472;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,1000,5000,6000,12000,11,49762,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Cast Lightning Bolt");

UPDATE `creature_template` SET `VehicleId`=1106, `InhabitType`=4 WHERE `entry`=47973;

-- Position update for Earthen Ring Gryphon (id: 45435) in zone: 4922, area: 5437
UPDATE `creature` SET `position_x` = -2534.691, `position_y` = -4781.999, `position_z` = 180.060, `orientation`= 4.713 WHERE `guid` = 756088;
UPDATE `creature_template` SET `npcflag`=1, `ScriptName`='npc_th_earthen_ring_gryphon' WHERE `entry`=45435;
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `unit_flags`=768 WHERE `entry`=47973;

DELETE FROM `script_waypoint` WHERE `entry` = '47973';
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES
(47973, 1, -2532.39, -4792.62, 190.74, 'Earthen Ring Gryphon WP'),
(47973, 2, -2555.45, -4904.64, 160.05, 'Earthen Ring Gryphon WP'),
(47973, 3, -2556.34, -5062.82, 146.00, 'Earthen Ring Gryphon WP'),
(47973, 4, -2634.46, -5110.56, 153.91, 'Earthen Ring Gryphon WP'),
(47973, 5, -2735.91, -5105.00, 184.22, 'Earthen Ring Gryphon WP'),
(47973, 6, -2794.08, -4996.93, 200.47, 'Earthen Ring Gryphon WP'),
(47973, 7, -2761.23, -4908.41, 200.82, 'Earthen Ring Gryphon WP'),
(47973, 8, -2725.82, -4923.01, 175.05, 'Earthen Ring Gryphon WP'),
(47973, 9, -2696.33, -4946.70, 153.69, 'Earthen Ring Gryphon WP'),
(47973, 10, -2693.84, -4973.47, 145.26, 'Earthen Ring Gryphon WP');

UPDATE `creature_template` SET `ScriptName`='npc_th_earthen_ring_gryphon_summoned' WHERE `entry`=47973;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '47973';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(47973, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '47973';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(47973, 47996, 1, 1, 'Mylra on Gryphon', 8, 0);

DELETE FROM `creature_text` WHERE `entry`=47996;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47996,0,0,'Here we go. Hold on tight!',12,0,100,0,0,0,'Comment'),
(47996,1,0,'Watch those tentacles! Their reach is frightening.',12,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `ScriptName`='npc_th_tentacle_of_iso_rath_veh' WHERE `entry`=45693;
UPDATE `creature` SET `phaseMask`=512 WHERE `id` IN (47991, 47992, 47993, 47999, 48000, 48816, 47976);

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '23';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 23, 512, 0, 'Twilight Highlands [A]: Add Phase 512 On Quest Complete: The Maw of Iso\'Rath [27376]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '23' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '27376';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 23, 0, 0, 28, 0, 27376, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '24';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 24, 512, 0, 'Twilight Highlands [A]: Add Phase 512 On Quest Rewarded: The Maw of Iso\'Rath [27376]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '24' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '27376';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 24, 0, 0, 8, 0, 27376, 0, 0, 0, 0, 0, '', '');

DELETE FROM `spell_target_position` WHERE `id` = '94499';
INSERT INTO `spell_target_position` (`id`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(94499, -2662.47, -4980.87, 149.34, 4.41);

UPDATE `creature_template` SET `modelid2`=35942 WHERE `entry`=48000;
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=45426;

-- Position update for Earthen Ring Channeler (id: 45426) in zone: 4922, area: 5664
UPDATE `creature` SET `position_x` = -2661.978, `position_y` = -4999.721, `position_z` = -129.114, `orientation`= 2.280 WHERE `guid` = 756175;

-- Position update for Earthen Ring Channeler (id: 45426) in zone: 4922, area: 5664
UPDATE `creature` SET `position_x` = -2682.427, `position_y` = -4994.415, `position_z` = -128.796, `orientation`= 0.866 WHERE `guid` = 756168;

-- Position update for Earthen Ring Channeler (id: 45426) in zone: 4922, area: 5664
UPDATE `creature` SET `position_x` = -2670.596, `position_y` = -5007.173, `position_z` = -128.805, `orientation`= 1.888 WHERE `guid` = 756180;

-- Position update for Earthen Ring Channeler (id: 45426) in zone: 4922, area: 5664
UPDATE `creature` SET `position_x` = -2673.782, `position_y` = -4989.031, `position_z` = -128.801, `orientation`= 0.625 WHERE `guid` = 756160;

-- Position update for Earthcaller Yevaa (id: 47991) in zone: 4922, area: 5664
UPDATE `creature` SET `position_x` = -2665.101, `position_y` = -4990.995, `position_z` = -128.847, `orientation`= 3.850 WHERE `guid` = 764064;

-- Earthen Ring Channeler
SET @ENTRY := 45426;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,1000,1000,60000,60000,11,90736,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Cast Field of Restoration");

UPDATE `creature` SET `spawndist`=20, `MovementType`=1 WHERE `id`=48816;
UPDATE `creature` SET `spawndist`=10, `MovementType`=1 WHERE `id` IN (47993, 47992, 47976);

-- DamageModifier update for Greater Earth Elemental (id: 47993)
UPDATE `creature_template` SET `DamageModifier`= 1 WHERE `entry`= 47993;

-- DamageModifier update for Greater Fire Elemental (id: 47992)
UPDATE `creature_template` SET `DamageModifier`= 1 WHERE `entry`= 47992;

-- DamageModifier update for Blood of Iso'rath (id: 48816)
UPDATE `creature_template` SET `DamageModifier`= 1 WHERE `entry`= 48816;

UPDATE `quest_template` SET `SourceSpellId`=89679 WHERE `Id`=27377;

DELETE FROM `spell_script_names` WHERE `spell_id` = '89679';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(89679, 'spell_th_iso_rath_blood');

-- Blood of Iso'rath
SET @ENTRY := 48243;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Attack Invoker"),
(@ENTRY,@SOURCETYPE,1,0,4,0,100,0,0,0,0,0,11,9459,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Corrosive Ooze"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,8000,8000,30000,30000,11,54580,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Coagulate");

-- Earthcaller Yevaa
SET @ENTRY := 47991;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,19,0,100,0,27377,0,0,0,75,89680,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Quest Accept - Add Aura"),
(@ENTRY,@SOURCETYPE,1,0,19,0,100,0,27377,0,0,0,75,89681,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Quest Accept - Add Aura"),
(@ENTRY,@SOURCETYPE,2,0,19,0,100,0,27377,0,0,0,75,89682,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Quest Accept - Add Aura"),
(@ENTRY,@SOURCETYPE,3,0,4,0,100,0,0,0,0,0,42,464000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Set Invincible");

DELETE FROM `creature_text` WHERE `entry`=48051;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48051,0,0,'I bring you back from the brink of death. We are in need of your aid!',12,0,100,0,0,0,'Comment');

DELETE FROM `conditions` WHERE `SourceEntry` = '89473';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 89473, 0, 0, 31, 0, 3, 48051, 0, 0, 0, '', 'Targeting -> Thrall');

DELETE FROM `creature_involvedrelation` WHERE `id` = '45042' AND `quest` = '27377';
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES
(45042, 27377);

DELETE FROM `spell_area` WHERE `spell` = '60922' AND `quest_start` = '28655';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_end_status`) VALUES
(60922, 5142, 28655, 1, 0);

UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `scale`=1 WHERE `entry`=48051;
UPDATE `creature_template` SET `minlevel`=88, `maxlevel`=88, `exp`=3, `faction`=16, `InhabitType`=4, `unit_flags`=256 WHERE `entry`=48005;

DELETE FROM `creature` WHERE `guid` = '841883';
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(841883, 48051, 730, 1, 2, 0, 0, 852.337, 1039.22, -5.46947, 4.73931, 300, 0, 0, 21000, 0, 0, 0, 0, 0);

DELETE FROM `phase_definitions` WHERE `zoneId` = '5416' AND `entry` = '1';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(5416, 1, 2, 0, 'The Maelstrom [A]: Add Phase 2 On Quest Complete: Devoured [27377]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '5416' AND `SourceEntry` = '1' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '27377';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 5416, 1, 0, 0, 28, 0, 27377, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '5416' AND `entry` = '2';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(5416, 2, 1, 4, 'The Maelstrom [A]: Negate Phase 1 On Quest Complete: Devoured [27377]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '5416' AND `SourceEntry` = '2' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '27377';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 5416, 2, 0, 0, 28, 0, 27377, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '5416' AND `entry` = '3';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(5416, 3, 2, 0, 'The Maelstrom [A]: Add Phase 2 On Quest Rewarded: Devoured [27377]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '5416' AND `SourceEntry` = '3' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '27377';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 5416, 3, 0, 0, 8, 0, 27377, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '5416' AND `entry` = '4';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(5416, 4, 1, 4, 'The Maelstrom [A]: Negate Phase 1 On Quest Rewarded: Devoured [27377]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '5416' AND `SourceEntry` = '4' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '27377';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 5416, 4, 0, 0, 8, 0, 27377, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '5416' AND `entry` = '5';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(5416, 5, 1, 0, 'The Maelstrom [A]: Add Phase 1 On Quest Rewarded: The Worldbreaker [27378]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '5416' AND `SourceEntry` = '5' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '27378';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 5416, 5, 0, 0, 8, 0, 27378, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '5416' AND `entry` = '6';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(5416, 6, 2, 4, 'The Maelstrom [A]: Negate Phase 2 On Quest Rewarded: The Worldbreaker [27378]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '5416' AND `SourceEntry` = '6' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '27378';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 5416, 6, 0, 0, 8, 0, 27378, 0, 0, 0, 0, 0, '', '');

UPDATE `creature_template` SET `ScriptName`='npc_th_thrall_maelstrom' WHERE `entry`=48051;

DELETE FROM `creature_text` WHERE `entry`=48051;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48051,0,0,'I bring you back from the brink of death, $Gbrother:sister;. We are in need of your aid!',12,0,100,0,0,0,'Comment'),
(48051,1,0,'NOBUNDO! NOOO!',12,0,100,0,0,0,'Comment'),
(48051,2,0,'You will die this day, Earthwarder! $n will see to it!',14,0,100,0,0,0,'Comment'),
(48051,3,0,'Aggra... this can\'t be... this has gone too far...',12,0,100,0,0,0,'Comment'),
(48051,4,0,'Do something you useless $r. My allies are giving their lives for you!',12,0,100,0,0,0,'Comment'),
(48051,5,0,'Muln falls! And the Earthen Ring dies with him.',12,0,100,0,0,0,'Comment'),
(48051,6,0,'You\'ve failed us all, $n. Deathwing has won. The world is doomed.',12,0,100,0,0,0,'Comment'),
(48051,7,0,'We\'re surrounded! Its defenses are too great. $n! Wake up!',12,0,100,0,0,0,'Comment');

-- Farseer Nobundo
SET @ENTRY := 48079;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,11,89629,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Cast Call of Water");

-- Muln Earthfury
SET @ENTRY := 48084;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,11,89630,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Cast Call of Air");

-- Aggra
SET @ENTRY := 48076;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,11,28892,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Cast Nature");

UPDATE `creature_template` SET `speed_run`=3.14286, `ScriptName`='npc_th_deathwing_maelstrom' WHERE `entry`=48005;

DELETE FROM `creature_text` WHERE `entry`=48059;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48059,0,0,'Wake up! We need you, $n!',12,0,100,0,0,0,'Comment');

-- Maelstrom Fire Target Bunny
SET @ENTRY := 48202;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,1000,5000,4500,10000,11,93763,0,0,0,0,0,11,48005,1000,0,0.0,0.0,0.0,0.0,"OOC - Cast Rocks");

UPDATE `creature` SET `phaseMask`=4 WHERE `id` IN (48202, 48157);

DELETE FROM `conditions` WHERE `SourceEntry` = '89660';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 89660, 0, 0, 31, 0, 3, 48059, 0, 0, 0, '', 'Targeting -> Yevaa');

UPDATE `creature` SET `spawndist`=15 WHERE `id` IN (48202, 48157);

DELETE FROM `spell_area` WHERE `spell` = '90782' AND `quest_start` = '27379';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`) VALUES
(90782, 5664, 27379, 27380, 1, 10);

DELETE FROM `spell_area` WHERE `spell` = '90782' AND `quest_start` = '27380';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`) VALUES
(90782, 5664, 27380, 27380, 1, 8);

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '25';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 25, 512, 4, 'Twilight Highlands [A]: Negate Phase 512 On Quest Complete: The Worldbreaker [27378]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '25' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '27378';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 25, 0, 0, 28, 0, 27378, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '26';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 26, 512, 4, 'Twilight Highlands [A]: Negate Phase 512 On Quest Rewarded: The Worldbreaker [27378]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '26' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '27378';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 26, 0, 0, 8, 0, 27378, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '27';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 27, 1024, 0, 'Twilight Highlands [A]: Add Phase 1024 On Quest Rewarded: The Worldbreaker [27378]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '27' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '27378';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 27, 0, 0, 8, 0, 27378, 0, 0, 0, 0, 0, '', '');

UPDATE `creature` SET `phaseMask`=512 WHERE `id`=45426;
UPDATE `creature` SET `phaseMask`=1024 WHERE `guid`=756169;
UPDATE `creature_template` SET `modelid2`=36451 WHERE `entry`=48739;
UPDATE `creature_template` SET `modelid2`=34432 WHERE `entry`=48790;
UPDATE `creature_template` SET `modelid2`=34528 WHERE `entry`=48796;
UPDATE `creature_template` SET `modelid2`=34432 WHERE `entry`=48794;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (48739, 48790, 48794, 48796);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(48739, 46598, 0),
(48790, 46598, 0),
(48794, 46598, 0),
(48796, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (48739, 48790, 48794, 48796);
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(48739, 48743, 1, 'Tentacle -> Dimblaze ', 8, 0),
(48790, 48789, 1, 'Tentacle -> Jalara ', 8, 0),
(48794, 48793, 1, 'Tentacle -> Duarn ', 8, 0),
(48796, 47996, 1, 'Tentacle -> Mylra ', 8, 0);

UPDATE `creature` SET `phaseMask`=1024 WHERE `id` IN (48739, 48790, 48794, 48796);

DELETE FROM `spell_area` WHERE `spell` = '76630' AND `quest_start` = '27379';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`) VALUES
(76630, 5664, 27379, 27379, 1, 10);

DELETE FROM `spell_area` WHERE `spell` = '80672' AND `quest_start` = '27379';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`) VALUES
(80672, 5664, 27379, 27379, 1, 10);

DELETE FROM `spell_area` WHERE `spell` = '80817' AND `quest_start` = '27379';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`) VALUES
(80817, 5664, 27379, 27379, 1, 10);

DELETE FROM `spell_area` WHERE `spell` = '80818' AND `quest_start` = '27379';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`) VALUES
(80818, 5664, 27379, 27379, 1, 10);

UPDATE `creature_template` SET `faction`=16 WHERE `entry` IN (48739, 48790, 48794, 48796);
UPDATE `creature` SET `phaseMask`=1024 WHERE `id`=47994;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764163) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764163; DELETE FROM creature_addon WHERE guid = 764163;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764168) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764168; DELETE FROM creature_addon WHERE guid = 764168;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764174) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764174; DELETE FROM creature_addon WHERE guid = 764174;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764157) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764157; DELETE FROM creature_addon WHERE guid = 764157;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764180) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764180; DELETE FROM creature_addon WHERE guid = 764180;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764170) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764170; DELETE FROM creature_addon WHERE guid = 764170;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764161) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764161; DELETE FROM creature_addon WHERE guid = 764161;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764166) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764166; DELETE FROM creature_addon WHERE guid = 764166;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764229) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764229; DELETE FROM creature_addon WHERE guid = 764229;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764225) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764225; DELETE FROM creature_addon WHERE guid = 764225;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764215) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764215; DELETE FROM creature_addon WHERE guid = 764215;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764187) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764187; DELETE FROM creature_addon WHERE guid = 764187;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764186) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764186; DELETE FROM creature_addon WHERE guid = 764186;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764189) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764189; DELETE FROM creature_addon WHERE guid = 764189;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764238) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764238; DELETE FROM creature_addon WHERE guid = 764238;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764191) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764191; DELETE FROM creature_addon WHERE guid = 764191;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764204) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764204; DELETE FROM creature_addon WHERE guid = 764204;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764207) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764207; DELETE FROM creature_addon WHERE guid = 764207;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764167) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764167; DELETE FROM creature_addon WHERE guid = 764167;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764171) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764171; DELETE FROM creature_addon WHERE guid = 764171;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764181) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764181; DELETE FROM creature_addon WHERE guid = 764181;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764175) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764175; DELETE FROM creature_addon WHERE guid = 764175;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764172) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764172; DELETE FROM creature_addon WHERE guid = 764172;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764162) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764162; DELETE FROM creature_addon WHERE guid = 764162;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764159) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764159; DELETE FROM creature_addon WHERE guid = 764159;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764165) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764165; DELETE FROM creature_addon WHERE guid = 764165;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764212) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764212; DELETE FROM creature_addon WHERE guid = 764212;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764223) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764223; DELETE FROM creature_addon WHERE guid = 764223;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764222) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764222; DELETE FROM creature_addon WHERE guid = 764222;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764220) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764220; DELETE FROM creature_addon WHERE guid = 764220;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764197) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764197; DELETE FROM creature_addon WHERE guid = 764197;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764210) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764210; DELETE FROM creature_addon WHERE guid = 764210;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764217) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764217; DELETE FROM creature_addon WHERE guid = 764217;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764183) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764183; DELETE FROM creature_addon WHERE guid = 764183;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764194) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764194; DELETE FROM creature_addon WHERE guid = 764194;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764214) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764214; DELETE FROM creature_addon WHERE guid = 764214;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764182) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764182; DELETE FROM creature_addon WHERE guid = 764182;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764206) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764206; DELETE FROM creature_addon WHERE guid = 764206;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764213) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764213; DELETE FROM creature_addon WHERE guid = 764213;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764198) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764198; DELETE FROM creature_addon WHERE guid = 764198;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764190) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764190; DELETE FROM creature_addon WHERE guid = 764190;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764211) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764211; DELETE FROM creature_addon WHERE guid = 764211;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764199) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764199; DELETE FROM creature_addon WHERE guid = 764199;

-- Deletes creature Blood of Iso'rath (id: 47994, guid: 764160) in zone: 4922, area: 5664
DELETE FROM `creature` WHERE `guid` = 764160; DELETE FROM creature_addon WHERE guid = 764160;

UPDATE `creature` SET `spawndist`=15, `MovementType`=1 WHERE `id`=47994;

SET @CGUID := 841884;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+3;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@CGUID+0, 45426, 0, 1, 1024, 0, 0, -2648.27, -4932.95, -128.401, 0.973125, 300, 0, 0, 85239, 0, 0, 0, 0, 0),
(@CGUID+1, 45426, 0, 1, 1024, 0, 0, -2707.05, -5020.43, -129.443, 1.44436, 300, 0, 0, 85239, 0, 0, 0, 0, 0),
(@CGUID+2, 45426, 0, 1, 1024, 0, 0, -2659.2, -5027.74, -127.375, 3.67019, 300, 0, 0, 85239, 0, 0, 0, 0, 0),
(@CGUID+3, 45426, 0, 1, 1024, 0, 0, -2602.76, -4971.19, -126.695, 5.87559, 300, 0, 0, 85239, 0, 0, 0, 0, 0);

-- Tentacle of Iso'rath
SET @ENTRY := 48794;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,1000,4000,4000,11,89918,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Thwomp"),
(@ENTRY,@SOURCETYPE,1,0,6,0,100,0,0,0,0,0,85,90822,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Death - Summon Duarn");

-- Tentacle of Iso'rath
SET @ENTRY := 48739;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,1000,4000,4000,11,89918,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Thwomp"),
(@ENTRY,@SOURCETYPE,1,0,6,0,100,0,0,0,0,0,85,90813,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Death - Summon Dimblaze");

-- Tentacle of Iso'rath
SET @ENTRY := 48790;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,1000,4000,4000,11,89918,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Thwomp"),
(@ENTRY,@SOURCETYPE,1,0,6,0,100,0,0,0,0,0,85,90820,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Death - Summon Jalara");

-- Tentacle of Iso'rath
SET @ENTRY := 48796;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,1000,4000,4000,11,89918,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Thwomp"),
(@ENTRY,@SOURCETYPE,1,0,6,0,100,0,0,0,0,0,85,90823,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Death - Summon Mylra");

UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry` IN (48743, 48789, 48793, 47996);
UPDATE `creature_template` SET `scriptname`='npc_th_tentacle_of_iso_rath_stomach' WHERE `entry` IN (48739, 48790, 48794, 48796);
UPDATE `creature` SET `spawntimesecs`=60 WHERE `id` IN (48739, 48790, 48794, 48796);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (90820, 90813, 90822, 90823);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(90820, 'spell_summon_generic_controller'),
(90813, 'spell_summon_generic_controller'),
(90822, 'spell_summon_generic_controller'),
(90823, 'spell_summon_generic_controller');

UPDATE `creature_template` SET `scriptname`='npc_th_iso_rath_rescued', `faction`=35, `minlevel`=87, `maxlevel`=88, `exp`=3, `DamageModifier`=6, `unit_class`=8, `npcflag`=0 WHERE `entry` IN (48731, 48732, 48733, 48734);

-- Position update for Earthen Ring Channeler (id: 45426) in zone: 4922, area: 5664
UPDATE `creature` SET `position_x` = -2743.477, `position_y` = -4994.534, `position_z` = -127.554, `orientation`= 3.838 WHERE `guid` = 841885;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = '-90782';
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(-90782, -90803, 0, 'Digestive Corrosion -> Screen Effects'),
(-90782, -90804, 0, 'Digestive Corrosion -> Screen Effects'),
(-90782, -90805, 0, 'Digestive Corrosion -> Screen Effects');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = '90782';
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(90782, -90803, 0, 'Digestive Corrosion -> Screen Effects'),
(90782, -90804, 0, 'Digestive Corrosion -> Screen Effects'),
(90782, -90805, 0, 'Digestive Corrosion -> Screen Effects');

DELETE FROM `creature_text` WHERE `entry`=48731;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48731,0,0,'Thanks fer saving me, laddie. I had a horrible vision. I was trapped in a cave of flame, forced to drop totems and heal irate warriors for years on end without seeing a single piece of shaman gear.',12,0,100,0,0,0,'Comment'),
(48731,0,1,'Other shaman used to say, "Only yer offhand should be flaming." What were they going on about?',12,0,100,0,0,0,'Comment'),
(48731,0,2,'Do ye know how hard it was to find a set of weapons that matched me armor?',12,0,100,0,0,0,'Comment'),
(48731,0,3,'I can\'t wait to smash that old god brain between me fists!',12,0,100,0,0,0,'Comment'),
(48731,1,0,'I thought for sure I was going to be this smelly beast\'s dinner!',14,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=48733;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48733,0,0,'Few truly understand the shamanistic connection to the earth. It binds wounds, protects us from harm.',12,0,100,0,0,0,'Comment'),
(48733,0,1,'To restore life is to restore the natural order of the elements.',12,0,100,0,0,0,'Comment'),
(48733,0,2,'Shamanistic healing is a complex art. You can\'t just chain heal all day.',12,0,100,0,0,0,'Comment'),
(48733,0,3,'I fail to understand why they banned totemic cleansing. No one was ever in range, anyways.',12,0,100,0,0,0,'Comment'),
(48733,1,0,'I\'m... so... dizzy.',14,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=48732;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48732,0,0,'We command the power of the elements. Storm, Earth and Fire! I\'d never dress like an oversized chicken and shoot moon beams from the sky.',12,0,100,0,0,0,'Comment'),
(48732,0,1,'I think I saw something like this on the Exodar once...',12,0,100,0,0,0,'Comment'),
(48732,0,2,'Shaman and druid ways are very different. When was the last time you saw one of us turn into a wild beast? ... nevermind.',12,0,100,0,0,0,'Comment'),
(48732,0,3,'Many confuse the Earthen Ring with the Cenarion Circle. ...I TOLD Thrall we should rename ourselves the "Earthen Square".',12,0,100,0,0,0,'Comment'),
(48732,0,4,'I command the power of the storm. It sounds impressive, but you wake up with static cling every morning.',12,0,100,0,0,0,'Comment'),
(48732,1,0,'That foul thing got stains all over my new robes!',14,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=48734;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48734,0,0,'It\'s about time we returned to the Highlands! "Twilight" be damned.',12,0,100,0,0,0,'Comment'),
(48734,0,1,'When I said we should strike at the heart of the beast, going through it\'s stomach isn\'t what I had in mind...',12,0,100,0,0,0,'Comment'),
(48734,0,2,'I had a terrible vision - the sky was blotted out and there was dirt everywhere. ...I thought I\'d gone back to Deepholm.',12,0,100,0,0,0,'Comment'),
(48734,0,3,'The power of the elements is strong here. Little wonder this is where they chose to summon a servant of the old gods.',12,0,100,0,0,0,'Comment'),
(48734,1,0,'Thanks fer savin\' me! When you passed out, I thought we were done fer!',14,0,100,0,0,0,'Comment');

UPDATE `creature` SET `phaseMask`=3072 WHERE `id`=45426 AND `phaseMask`=1024;

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '28';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 28, 1024, 4, 'Twilight Highlands [A]: Negate Phase 1024 On Quest Accepted: Nightmare [27380]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '28' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '27380';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 28, 0, 0, 9, 0, 27380, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '29';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 29, 1024, 4, 'Twilight Highlands [A]: Negate Phase 1024 On Quest Complete: Nightmare [27380]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '29' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '27380';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 29, 0, 0, 28, 0, 27380, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '30';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 30, 1024, 4, 'Twilight Highlands [A]: Negate Phase 1024 On Quest Rewarded: Nightmare [27380]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '30' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '27380';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 30, 0, 0, 8, 0, 27380, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '31';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 31, 2048, 0, 'Twilight Highlands [A]: Add Phase 2048 On Quest Accepted: Nightmare [27380]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '31' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '27380';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 31, 0, 0, 9, 0, 27380, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '32';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 32, 2048, 0, 'Twilight Highlands [A]: Add Phase 2048 On Quest Complete: Nightmare [27380]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '32' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '27380';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 32, 0, 0, 28, 0, 27380, 0, 0, 0, 0, 0, '', '');

UPDATE `creature_template` SET `minlevel`=88, `maxlevel`=88, `exp`=3, `faction`=16, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_class`=8, `DamageModifier`=3, `ScriptName`='npc_th_brain_of_iso_rath' WHERE `entry`=47960;
UPDATE `creature_template` SET `ScriptName`='npc_th_earthcaller_yevaa' WHERE `entry`=48059;

-- Position update for Earthen Ring Channeler (id: 45426) in zone: 4922, area: 5664
UPDATE `creature` SET `position_x` = -2737.729, `position_y` = -5003.117, `position_z` = -127.372, `orientation`= 0.381 WHERE `guid` = 841885;

DELETE FROM `creature_text` WHERE `entry`=47960;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47960,0,0,'Iso\'rath\'s stomach begins to churn as the brain is attacked!',42,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `minlevel`=88, `maxlevel`=88, `exp`=3, `InhabitType`=4, `VehicleId`=1106, `ScriptName`='npc_th_earthen_ring_gryphon_exit' WHERE `entry`=48327;

DELETE FROM `spell_target_position` WHERE `id` = '89823';
INSERT INTO `spell_target_position` (`id`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(89823, -2688.36, -4980.61, -114.74, 5.69);

DELETE FROM `script_waypoint` WHERE `entry` = '48327';
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES
(48327, 1, -2661.89, -4982.12, -1.26, 'Iso\'Rath Exit WP'),
(48327, 2, -2661.89, -4982.12, 229.80, 'Iso\'Rath Exit WP'),
(48327, 3, -2534.06, -4762.31, 184.43, 'Iso\'Rath Exit WP');

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '48327';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(48327, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '48327';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(48327, 48059, 1, 1, 'Yevaa on Gryphon', 8, 0);

DELETE FROM `creature` WHERE `guid` = '841888';
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(841888, 48265, 0, 1, 1, 0, 1, -2526.47, -4761.31, 180.852, 1.70914, 300, 0, 0, 85239, 0, 0, 0, 0, 0);

DELETE FROM `creature_addon` WHERE `guid` = '841888';
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES
(841888, '85096');

DELETE FROM `spell_area` WHERE `spell` = '94568' AND `quest_start` = '27380';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `racemask`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(94568, 5437, 27380, 1101, 1, 66, 0);

DELETE FROM `creature_addon` WHERE `guid` = '756099';
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES
(756099, '78718');

DELETE FROM `spell_area` WHERE `spell` = '94569' AND `quest_start` = '27380';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `racemask`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(94569, 5437, 27380, 690, 1, 66, 0);

UPDATE `quest_template` SET `PrevQuestId`='27380' WHERE `Id`=27485;
UPDATE `creature_template` SET `InhabitType`=4, `ScriptName`='npc_th_vermillion_sentinel' WHERE `entry`=45706;

DELETE FROM `script_waypoint` WHERE `entry` = '45706';
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES
(45706, 1, -2834.55, -4210.26, 464.23, 'Vermillion Sentinel WP'),
(45706, 2, -2995.89, -4082.44, 351.82, 'Vermillion Sentinel WP'),
(45706, 3, -3111.04, -3993.08, 292.93, 'Vermillion Sentinel WP'),
(45706, 4, -3073.96, -3839.31, 280.70, 'Vermillion Sentinel WP'),
(45706, 5, -2976.04, -3848.76, 279.81, 'Vermillion Sentinel WP'),
(45706, 6, -2903.48, -3889.22, 271.68, 'Vermillion Sentinel WP');

DELETE FROM `spell_area` WHERE `spell` = '85295' AND `quest_start` = '27485';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`) VALUES
(85295, 5155, 27485, 27485, 1, 8);

UPDATE `creature_template` SET `speed_walk`=6, `speed_run`=6 WHERE `entry`=47506;

DELETE FROM `spell_target_position` WHERE `id` = '85270';
INSERT INTO `spell_target_position` (`id`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(85270, -2874.83, -3900.04, 288.55, 2.71);

DELETE FROM `creature_text` WHERE `entry`=45708;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(45708,0,0,'You\'ve crossed into the domain of red dragons, $r.',12,0,100,0,0,0,'Comment'),
(45708,1,0,'You and your allies have struck against my kind at the gates to Grim Batol in the past. You\'ve shown no respect for the sacred oath we would die to keep. You\'ll find no trust with me.',12,0,100,0,0,0,'Comment'),
(45708,2,0,'Fortunately for you, your fate is not mine to decide.',12,0,100,0,0,0,'Comment'),
(45708,3,0,'My drakes shall be watching you. Choose your words and your actions carefully, $r.',12,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `minlevel`=88, `maxlevel`=88, `exp`=3, `InhabitType`=4 WHERE `entry`=45708;
UPDATE `creature_template` SET `ScriptName`='npc_th_lirastrasza_summoned' WHERE `entry`=45708;

#INSERIRE QUESTEND
DELETE FROM `spell_area` WHERE `spell` = '94567' AND `quest_start` = '27485';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(94567, 5155, 27485, 1, 66, 0);

UPDATE `creature` SET `phaseMask`=1 WHERE `guid` IN (764004, 764007, 764005, 764006);
UPDATE `quest_template` SET `PrevQuestId`='27564' WHERE `Id` IN (27509, 27507);

DELETE FROM `conditions` WHERE `SourceEntry` = '28101' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 28101, 27509, 0),
(20, 8, 28101, 27507, 0),
(20, 8, 28101, 27508, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '28101' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 28101, 27509, 0),
(19, 8, 28101, 27507, 0),
(19, 8, 28101, 27508, 0);

UPDATE `quest_template` SET `PrevQuestId`='27564' WHERE `Id`=27508;
UPDATE `quest_template` SET `PrevQuestId`='27504' WHERE `Id`=27506;

UPDATE `creature_template` SET `ScriptName`='npc_th_vermillion_mender' WHERE `entry` IN (45746, 45748);

-- Deletes creature Twilight Wyrmkiller (id: 45788, guid: 754350) in zone: 4922, area: 5155
DELETE FROM `creature` WHERE `guid` = 754350; DELETE FROM creature_addon WHERE guid = 754350;

DELETE FROM `spell_script_names` WHERE `spell_id` = '85389';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(85389, 'spell_th_ruby_seeds');

UPDATE `creature` SET `spawndist`=45, `MovementType`=1 WHERE `id`=45503;
UPDATE `creature` SET `spawndist`=12, `MovementType`=1 WHERE `id`=45788;
UPDATE `creature_template_addon` SET `bytes1`=0 WHERE `entry`=45788;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=45788;

-- Position update for Twilight Wyrmkiller (id: 45788) in zone: 4922, area: 5155
UPDATE `creature` SET `position_x` = -3219.556, `position_y` = -3991.018, `position_z` = 215.288, `orientation`= 5.901 WHERE `guid` = 754779;

-- Position update for Twilight Wyrmkiller (id: 45788) in zone: 4922, area: 5155
UPDATE `creature` SET `position_x` = -3201.335, `position_y` = -3989.646, `position_z` = 217.943, `orientation`= 0.339 WHERE `guid` = 754781;

-- Position update for Twilight Wyrmkiller (id: 45788) in zone: 4922, area: 5155
UPDATE `creature` SET `position_x` = -3226.491, `position_y` = -3958.334, `position_z` = 207.688, `orientation`= 6.213 WHERE `guid` = 754328;

UPDATE `creature_template` SET `ScriptName`='npc_th_vermillion_mender' WHERE `entry` IN (45788, 45568, 45618, 45569);
UPDATE `creature` SET `spawndist`=7, `MovementType`=1 WHERE `guid`=754329;
UPDATE `creature_template` SET `InhabitType`=3, `HoverHeight`=1 WHERE `entry`=45788;
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry` IN (45560, 45857);

-- Twilight Flamequencher
SET @ENTRY := 45618;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,39207,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Water Spout"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,8000,8000,8000,8000,11,39207,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Water Spout"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,3000,3000,3500,3500,11,32011,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Water Bolt");

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (45649, 45642, 45648);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(45649, 46598, 0),
(45642, 46598, 0),
(45648, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (45649, 45642, 45648);
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(45649, 45682, 0, 0, 'Vermillion Egg on Abductor ', 8, 60000),
(45642, 45682, 0, 0, 'Vermillion Egg on Abductor ', 8, 60000),
(45648, 45682, 0, 0, 'Vermillion Egg on Abductor ', 8, 60000);

UPDATE `creature_template` SET `IconName`='LootAll', `npcflag`=1 WHERE `entry`=45682;

-- Vermillion Egg
SET @ENTRY := 45682;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,64,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Close Gossip"),
(@ENTRY,@SOURCETYPE,1,0,64,0,100,0,0,0,0,0,85,85491,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Add Vermillion Egg"),
(@ENTRY,@SOURCETYPE,2,0,64,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Despawn");

UPDATE `creature` SET `spawndist`=15, `MovementType`=1 WHERE `id` IN (45649, 45642);

-- Twilight Abductor
SET @ENTRY := 45642;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,25,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Reset - Set Run"),
(@ENTRY,@SOURCETYPE,1,0,25,0,100,0,0,0,0,0,89,65,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Reset - Random Move");

-- Twilight Abductor
SET @ENTRY := 45648;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,25,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Reset - Set Run"),
(@ENTRY,@SOURCETYPE,1,0,25,0,100,0,0,0,0,0,89,65,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Reset - Random Move");

-- Twilight Abductor
SET @ENTRY := 45649;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,25,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Reset - Set Run"),
(@ENTRY,@SOURCETYPE,1,0,25,0,100,0,0,0,0,0,89,65,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Reset - Random Move");

UPDATE `creature_template` SET `ScriptName`='npc_th_dragonmaw_pass_fighter' WHERE `entry` IN (47489, 47490, 47596);
UPDATE `creature` SET `phaseMask`=8192 WHERE `id` IN (47489, 47490);

SET @CGUID := 841889;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+53;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@CGUID+0, 47596, 0, 1, 4096, 0, 1, -3473.04, -3824.81, 81.588, 2.48156, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+1, 47596, 0, 1, 4096, 0, 1, -3526.84, -3789.51, 86.1373, 0.861318, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+2, 47596, 0, 1, 4096, 0, 1, -3461.77, -3778.82, 81.0312, 1.64214, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+3, 47596, 0, 1, 4096, 0, 1, -3467.36, -3785.24, 80.7669, 4.60708, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+4, 47596, 0, 1, 4096, 0, 1, -3517.48, -3807.48, 91.5876, 1.66578, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+5, 47596, 0, 1, 4096, 0, 1, -3519.75, -3802.99, 91.7342, 1.58037, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+6, 47596, 0, 1, 4096, 0, 1, -3445.9, -3749.21, 77.9628, 2.57143, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+7, 47596, 0, 1, 4096, 0, 1, -3536.24, -3786.26, 89.7172, 0.506145, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+8, 47596, 0, 1, 4096, 0, 1, -3466.32, -3788.31, 80.8606, 3.23522, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+9, 47596, 0, 1, 4096, 0, 1, -3465.41, -3801.26, 77.4363, 2.77562, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+10, 47596, 0, 1, 4096, 0, 1, -3455.14, -3767.49, 73.7567, 1.95419, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+11, 47596, 0, 1, 4096, 0, 1, -3503.55, -3820.65, 79.2049, 1.22315, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+12, 47596, 0, 1, 4096, 0, 1, -3446.3, -3747.08, 77.435, 2.69841, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+13, 47596, 0, 1, 4096, 0, 1, -3517.81, -3804.74, 91.4764, 1.66284, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+14, 47596, 0, 1, 4096, 0, 1, -3490.9, -3842.97, 87.5039, 1.55871, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+15, 47596, 0, 1, 4096, 0, 1, -3465.37, -3779.16, 80.919, 1.42988, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+16, 47596, 0, 1, 4096, 0, 1, -3522.44, -3801.18, 91.6949, 1.44528, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+17, 47490, 0, 1, 4096, 0, 1, -3496.65, -3827.74, 79.9594, -1.62084, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+18, 47490, 0, 1, 4096, 0, 1, -3520.02, -3762.63, 79.1388, 3.42085, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+19, 47490, 0, 1, 4096, 0, 1, -3496.4, -3753.02, 68.5377, 3.49066, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+20, 47490, 0, 1, 4096, 0, 1, -3492.05, -3739.5, 66.3661, 3.83972, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+21, 47490, 0, 1, 4096, 0, 1, -3520.8, -3777.94, 81.997, 3.83972, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+22, 47490, 0, 1, 4096, 0, 1, -3499.23, -3774.31, 71.5587, 3.49066, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+23, 47490, 0, 1, 4096, 0, 1, -3495.61, -3786.13, 73.179, 3.87463, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+24, 47490, 0, 1, 4096, 0, 1, -3469.09, -3745.22, 68.4434, 5.68977, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+25, 47490, 0, 1, 4096, 0, 1, -3457.55, -3741.74, 69.0344, 0.174533, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+26, 47490, 0, 1, 4096, 0, 1, -3484.02, -3747.23, 67.1546, 3.7001, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+27, 47490, 0, 1, 4096, 0, 1, -3473.02, -3751.15, 68.3616, 5.41052, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+28, 47490, 0, 1, 4096, 0, 1, -3481.48, -3769.99, 70.1219, 5.8294, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+29, 47490, 0, 1, 4096, 0, 1, -3462.96, -3762.17, 72.1071, 5.84685, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+30, 47490, 0, 1, 4096, 0, 1, -3457.9, -3760.64, 72.6234, -2.18286, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+31, 47490, 0, 1, 4096, 0, 1, -3500.84, -3803.23, 77.5079, 4.27606, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+32, 47490, 0, 1, 4096, 0, 1, -3519.96, -3781.49, 81.9846, 2.5554, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+33, 47490, 0, 1, 4096, 0, 1, -3468.99, -3800.64, 76.929, -0.172355, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+34, 47490, 0, 1, 4096, 0, 1, -3485.35, -3816.09, 77.5938, 4.81711, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+35, 47490, 0, 1, 4096, 0, 1, -3483.36, -3816.8, 77.8457, 4.59022, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+36, 47490, 0, 1, 4096, 0, 1, -3476.04, -3809.45, 78.7949, 5.39307, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+37, 47490, 0, 1, 4096, 0, 1, -3490.63, -3820.62, 78.6023, 4.67748, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+38, 47490, 0, 1, 4096, 0, 1, -3468.69, -3799.75, 76.7927, -0.431798, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+39, 47490, 0, 1, 4096, 0, 1, -3486.43, -3789.33, 73.4574, -2.42791, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+40, 47490, 0, 1, 4096, 0, 1, -3484.83, -3781.24, 71.8823, 5.77704, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+41, 47490, 0, 1, 4096, 0, 1, -3473.9, -3799.77, 76.7098, 6.10865, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+42, 47490, 0, 1, 4096, 0, 1, -3472.23, -3798.12, 76.1987, 5.72468, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+43, 47490, 0, 1, 4096, 0, 1, -3483.82, -3787.07, 73.0167, 5.3058, 300, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+44, 47592, 0, 1, 4096, 0, 1, -3521.12, -3805.33, 91.906, 0.5035, 300, 0, 0, 774900, 0, 0, 0, 0, 0),
(@CGUID+45, 47596, 0, 1, 4096, 0, 1, -3479.37, -3770.55, 70.5448, 2.82677, 300, 0, 0, 85239, 0, 0, 0, 0, 0),
(@CGUID+46, 47596, 0, 1, 4096, 0, 1, -3501.16, -3805.25, 77.3728, 1.34883, 300, 0, 0, 85239, 0, 0, 0, 0, 0),
(@CGUID+47, 47596, 0, 1, 4096, 0, 1, -3470.87, -3753.06, 69.3005, 2.39734, 300, 0, 0, 85239, 0, 0, 0, 0, 0),
(@CGUID+48, 47596, 0, 1, 4096, 0, 1, -3494.08, -3741.69, 66.5655, 0.939644, 300, 0, 0, 85239, 0, 0, 0, 0, 0),
(@CGUID+49, 47596, 0, 1, 4096, 0, 1, -3485.53, -3748.1, 67.1615, 0.542227, 300, 0, 0, 85239, 0, 0, 0, 0, 0),
(@CGUID+50, 47596, 0, 1, 4096, 0, 1, -3499.79, -3755.05, 70.1765, 0.526519, 300, 0, 0, 85239, 0, 0, 0, 0, 0),
(@CGUID+51, 47596, 0, 1, 4096, 0, 1, -3513.92, -3782.91, 78.4337, 6.20769, 300, 0, 0, 85239, 0, 0, 0, 0, 0),
(@CGUID+52, 47596, 0, 1, 4096, 0, 1, -3508.25, -3761.97, 74.2152, 3.75646, 300, 0, 0, 85239, 0, 0, 0, 0, 0),
(@CGUID+53, 47596, 0, 1, 4096, 0, 1, -3501.05, -3775.44, 72.4394, 0.690669, 300, 0, 0, 85239, 0, 0, 0, 0, 0);

UPDATE `quest_template` SET `PrevQuestId`='28101' WHERE `Id` IN (28104, 28103);

DELETE FROM `creature_addon` WHERE `guid` IN (754228, 185265, 185226);
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES
(754228, '71598'),
(185265, '71598'),
(185226, '71598');

-- Position update for SI:7 Marksman (id: 47596) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3517.634, `position_y` = -3807.703, `position_z` = 91.488, `orientation`= 0.098 WHERE `guid` = 841893;

-- Position update for SI:7 Marksman (id: 47596) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3518.202, `position_y` = -3804.847, `position_z` = 91.498, `orientation`= 0.196 WHERE `guid` = 841902;

-- Position update for SI:7 Marksman (id: 47596) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3519.817, `position_y` = -3802.997, `position_z` = 91.662, `orientation`= 0.196 WHERE `guid` = 841894;

-- Position update for SI:7 Marksman (id: 47596) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3522.665, `position_y` = -3801.006, `position_z` = 91.593, `orientation`= 0.196 WHERE `guid` = 841905;

DELETE FROM `creature_addon` WHERE `guid` IN (754228, 185265, 754242);
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES
(754228, '29266'),
(185265, '29266'),
(754242, '29266');

-- Deletes creature Twilight's Hammer Horse (id: 47457, guid: 185244) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 185244; DELETE FROM creature_addon WHERE guid = 185244;

-- Deletes creature Twilight's Hammer Horse (id: 47457, guid: 754247) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 754247; DELETE FROM creature_addon WHERE guid = 754247;

-- Deletes creature Twilight's Hammer Horse (id: 47457, guid: 754241) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 754241; DELETE FROM creature_addon WHERE guid = 754241;

-- Deletes creature Twilight's Hammer Horse (id: 47457, guid: 185269) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 185269; DELETE FROM creature_addon WHERE guid = 185269;

-- Deletes creature Twilight's Hammer Horse (id: 47457, guid: 185267) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 185267; DELETE FROM creature_addon WHERE guid = 185267;

-- Deletes creature Twilight's Hammer Horse (id: 47457, guid: 185266) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 185266; DELETE FROM creature_addon WHERE guid = 185266;

-- Deletes creature Twilight's Hammer Horse (id: 47457, guid: 754244) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 754244; DELETE FROM creature_addon WHERE guid = 754244;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 841906) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 841906; DELETE FROM creature_addon WHERE guid = 841906;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 841923) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 841923; DELETE FROM creature_addon WHERE guid = 841923;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 841927) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 841927; DELETE FROM creature_addon WHERE guid = 841927;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 841924) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 841924; DELETE FROM creature_addon WHERE guid = 841924;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 841930) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 841930; DELETE FROM creature_addon WHERE guid = 841930;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 841931) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 841931; DELETE FROM creature_addon WHERE guid = 841931;

-- Deletes creature Twilight's Hammer Horse (id: 47457, guid: 754246) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 754246; DELETE FROM creature_addon WHERE guid = 754246;

-- Position update for SI:7 Marksman (id: 47596) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3491.305, `position_y` = -3822.969, `position_z` = 78.968, `orientation`= 1.153 WHERE `guid` = 841900;

-- Position update for SI:7 Marksman (id: 47596) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3482.392, `position_y` = -3790.472, `position_z` = 73.933, `orientation`= 2.056 WHERE `guid` = 841889;

-- Position update for SI:7 Marksman (id: 47596) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3482.392, `position_y` = -3790.472, `position_z` = 73.933, `orientation`= 2.056 WHERE `guid` = 841889;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 841912) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 841912; DELETE FROM creature_addon WHERE guid = 841912;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 841929) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 841929; DELETE FROM creature_addon WHERE guid = 841929;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 841928) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 841928; DELETE FROM creature_addon WHERE guid = 841928;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 841914) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 841914; DELETE FROM creature_addon WHERE guid = 841914;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 841916) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 841916; DELETE FROM creature_addon WHERE guid = 841916;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 841918) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 841918; DELETE FROM creature_addon WHERE guid = 841918;

-- Position update for Twilight Spearwarder (id: 47490) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3510.039, `position_y` = -3763.539, `position_z` = 75.158, `orientation`= 2.969 WHERE `guid` = 841907;

-- Position update for SI:7 Marksman (id: 47596) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3510.039, `position_y` = -3763.539, `position_z` = 75.158, `orientation`= 3.390 WHERE `guid` = 842669;

-- Position update for SI:7 Marksman (id: 47596) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3508.255, `position_y` = -3761.973, `position_z` = 74.215, `orientation`= 3.756 WHERE `guid` = 842669;

-- Position update for Twilight Spearwarder (id: 47490) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3510.769, `position_y` = -3764.062, `position_z` = 75.557, `orientation`= 0.344 WHERE `guid` = 841907;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 841921) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 841921; DELETE FROM creature_addon WHERE guid = 841921;

-- Position update for Twilight Spearwarder (id: 47490) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3509.773, `position_y` = -3785.044, `position_z` = 76.997, `orientation`= 2.658 WHERE `guid` = 841910;

-- Position update for SI:7 Marksman (id: 47596) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3513.916, `position_y` = -3782.905, `position_z` = 78.434, `orientation`= 6.208 WHERE `guid` = 842670;

UPDATE `creature` SET `spawntimesecs`=60 WHERE `id`=47490;
UPDATE `gameobject` SET `phaseMask`=12288, `spawntimesecs`=3 WHERE `guid`=727478;

DELETE FROM `gameobject_loot_template` WHERE `item` = '62927';
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`) VALUES
(35565, 62927, -100);

DELETE FROM `creature_text` WHERE `entry`=47592;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47592,0,0,'They\'ve already assembled. I\'m trusting you to secure the route to Grim Batol. Don\'t let me down.',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=47611;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47611,0,0,'Squad reporting.',12,0,100,0,0,0,'Comment'),
(47611,1,0,'Find some flanking positions.',12,0,100,0,0,0,'Comment'),
(47611,2,0,'Get in positions.',12,0,100,0,0,0,'Comment'),
(47611,3,0,'Break out the gatestone. Open this thing up.',12,0,100,0,0,0,'Comment'),
(47611,4,0,'It\'s never easy, is it? That\'s alright, we came prepared.',12,0,100,0,0,0,'Comment'),
(47611,5,0,'Blow it open. There isn\'t a problem that some explosives can\'t solve.',12,0,100,0,0,0,'Comment'),
(47611,6,0,'Highbank Lieutenant looks confused.',16,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=47612;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47612,0,0,'On it.',12,0,100,0,0,0,'Comment'),
(47612,1,0,'Almost done.',12,0,100,0,0,0,'Comment'),
(47612,2,0,'Charges are set. Might want to get clear!',12,0,100,0,0,0,'Comment'),
(47612,3,0,'What did you just call my mother?',12,0,100,0,0,0,'Comment'),
(47612,3,1,'Now that\'s just rude...',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=47613;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47613,0,0,'Right away sir. Er... I don\'t see a slot to put it in?',12,0,100,0,0,0,'Comment'),
(47613,1,0,'Was that... Yoga?',12,0,100,0,0,0,'Comment'),
(47613,1,1,'You want me to steal third?',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=47614;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47614,0,0,'Enemy down.',12,0,100,0,0,0,'Comment'),
(47614,1,0,'I don\'t think that\'s physically possible, sir.',12,0,100,0,0,0,'Comment'),
(47614,1,1,'Sir, I think the explosions and gunfire gave us away. You don\'t have to use hand signals.',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=47615;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47615,0,0,'What the heck was that?',12,0,100,0,0,0,'Comment'),
(47615,0,1,'Leading under the influence...',12,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `npcflag`=3 WHERE `entry`=47611;
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `npcflag`=1 WHERE `entry` IN (47612, 47613, 47614, 47615);
UPDATE `creature_template` SET `gossip_menu_id`=60001, `scriptName`='npc_th_mathias_squadron' WHERE `entry` IN (47611, 47612, 47613, 47614, 47615);

UPDATE `creature_template` SET `ScriptName`='npc_th_master_mathias_shaw' WHERE `entry`=47592;

-- Position update for SI:7 Marksman (id: 47596) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3513.916, `position_y` = -3782.905, `position_z` = 78.434, `orientation`= 6.208 WHERE `guid` = 842670;

-- Position update for SI:7 Marksman (id: 47596) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3517.193, `position_y` = -3807.550, `position_z` = 91.419, `orientation`= 5.916 WHERE `guid` = 841893;

-- Position update for SI:7 Marksman (id: 47596) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3517.969, `position_y` = -3804.839, `position_z` = 91.444, `orientation`= 0.388 WHERE `guid` = 841902;

-- Position update for SI:7 Marksman (id: 47596) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3518.896, `position_y` = -3802.571, `position_z` = 91.424, `orientation`= 0.388 WHERE `guid` = 841894;

-- Position update for SI:7 Marksman (id: 47596) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3521.459, `position_y` = -3800.847, `position_z` = 91.462, `orientation`= 0.888 WHERE `guid` = 841905;

DELETE FROM `gameobject` WHERE `guid` = '781644';
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(781644, 202460, 0, 1, 4096, -3525.4, -3812.47, 91.5048, 0.360132, 0, 0, 0.179094, 0.983832, 300, 0, 1);

UPDATE `creature` SET `phaseMask`=8192 WHERE `guid`=754185;
UPDATE `creature` SET `phaseMask`=8192 WHERE `id` IN (47494, 47506);

SET @CGUID := 841943;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+33;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@CGUID+0, 45174, 0, 1, 4096, 0, 1, -4003.13, -3979.94, 178.522, 1.69297, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+1, 45174, 0, 1, 4096, 0, 1, -4003.29, -3986.51, 178.078, 6.16101, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+2, 45174, 0, 1, 4096, 0, 1, -3627.28, -3986.53, 115.96, 3.63029, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+3, 45174, 0, 1, 4096, 0, 1, -3623.97, -3987.39, 115.433, 3.75246, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+4, 45174, 0, 1, 4096, 0, 1, -3611.3, -4018.15, 114.963, 3.19395, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+5, 45174, 0, 1, 4096, 0, 1, -3614.31, -3979.82, 113.222, 3.92699, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+6, 45174, 0, 1, 4096, 0, 1, -3609.47, -4016.09, 114.358, 3.15905, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+7, 45174, 0, 1, 4096, 0, 1, -3614.72, -3973.89, 113.281, 3.94444, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+8, 45174, 0, 1, 4096, 0, 1, -3613.87, -3976.62, 113.175, 3.87463, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+9, 45174, 0, 1, 4096, 0, 1, -3609.09, -4020.38, 114.803, 3.29867, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+10, 45174, 0, 1, 4096, 0, 1, -3612.38, -3980.42, 112.677, 3.82227, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+11, 45174, 0, 1, 4096, 0, 1, -3599.61, -4000.29, 111.973, 0.349066, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+12, 45174, 0, 1, 4096, 0, 1, -3597.84, -4000.99, 111.937, 0.907571, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+13, 47686, 0, 1, 4096, 0, 1, -3762, -4021.48, 143.417, 1.40428, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+14, 47686, 0, 1, 4096, 0, 1, -3754.02, -4030.24, 141.53, 1.3228, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+15, 47686, 0, 1, 4096, 0, 1, -3742.28, -4025, 139.168, 3.46644, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+16, 47686, 0, 1, 4096, 0, 1, -3611.28, -4044.74, 117.336, 3.10669, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+17, 47686, 0, 1, 4096, 0, 1, -3610.31, -4042.2, 116.76, 3.05433, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+18, 47686, 0, 1, 4096, 0, 1, -3609.12, -4039.71, 116.141, 3.19395, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+19, 47686, 0, 1, 4096, 0, 1, -3607.91, -4041.34, 116.351, 2.9147, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+20, 47686, 0, 1, 4096, 0, 1, -3609.22, -3976.61, 112.168, 3.92699, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+21, 47686, 0, 1, 4096, 0, 1, -3602.84, -4013.22, 112.897, 3.24631, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+22, 47686, 0, 1, 4096, 0, 1, -3612.26, -3958.35, 113.258, 3.85718, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+23, 47686, 0, 1, 4096, 0, 1, -3602.14, -4011.29, 112.859, 3.19395, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+24, 47686, 0, 1, 4096, 0, 1, -3606.39, -3976.85, 111.632, 3.89208, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+25, 47686, 0, 1, 4096, 0, 1, -3601.09, -4015.02, 112.695, 3.28122, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+26, 47686, 0, 1, 4096, 0, 1, -3600.93, -4017.71, 112.722, 3.24631, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+27, 47686, 0, 1, 4096, 0, 1, -3586.63, -4018.13, 117.445, 3.64774, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+28, 47686, 0, 1, 4096, 0, 1, -3585.9, -4016.19, 117.303, 3.38594, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+29, 47686, 0, 1, 4096, 0, 1, -3584.51, -4019.17, 117.462, 3.59538, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+30, 47686, 0, 1, 4096, 0, 1, -3745.43, -4038.14, 140.143, 4.68787, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+31, 47686, 0, 1, 4096, 0, 1, -3756.89, -4044.52, 143.033, 3.68197, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+32, 47686, 0, 1, 4096, 0, 1, -3763.95, -4045.54, 144.615, 3.65856, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+33, 47686, 0, 1, 4096, 0, 1, -3770.67, -4017.77, 145.839, 3.22115, 120, 0, 0, 1, 0, 0, 0, 0, 0);

UPDATE `creature` SET `phaseMask`=32768 WHERE `id`=47505;
UPDATE `creature` SET `phaseMask`=8192 WHERE `id` IN (47409, 47406, 47394, 47407, 47401);

SET @CGUID := 841977;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+106;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@CGUID+0, 47394, 0, 1, 4096, 0, 1, -4136.52, -3588.98, 216.708, 1.27409, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+1, 47394, 0, 1, 4096, 0, 1, -4138.84, -3586.44, 217.166, 2.14675, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+2, 47394, 0, 1, 4096, 0, 1, -4120.51, -3576.69, 221.672, 1.71042, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+3, 47394, 0, 1, 4096, 0, 1, -4131.58, -3562.62, 226.179, 1.11701, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+4, 47394, 0, 1, 4096, 0, 1, -4104.6, -3710.9, 200.011, 4.45059, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+5, 47394, 0, 1, 4096, 0, 1, -4111.97, -3716.12, 199.547, 5.044, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+6, 47394, 0, 1, 4096, 0, 1, -4112.42, -3721.92, 198.919, 5.39307, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+7, 47394, 0, 1, 4096, 0, 1, -4091.75, -3802.5, 192.328, 4.9442, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+8, 47394, 0, 1, 4096, 0, 1, -4099.17, -3822.5, 190.773, 5.39307, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+9, 47394, 0, 1, 4096, 0, 1, -4099.65, -3826.34, 190.454, 5.51524, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+10, 47394, 0, 1, 4096, 0, 1, -4106.59, -3837.91, 189.74, 5.61996, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+11, 47394, 0, 1, 4096, 0, 1, -4108.99, -3839.19, 189.741, 5.61996, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+12, 47394, 0, 1, 4096, 0, 1, -4081.03, -3847.93, 188.467, 5.00041, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+13, 47394, 0, 1, 4096, 0, 1, -4075.02, -3867.73, 186.857, 6.01882, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+14, 47394, 0, 1, 4096, 0, 1, -4085.87, -3875.64, 186.495, 0.654373, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+15, 47394, 0, 1, 4096, 0, 1, -4062.22, -3933.77, 182.625, 5.13127, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+16, 47394, 0, 1, 4096, 0, 1, -4063.78, -3936.35, 182.631, 5.21853, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+17, 47394, 0, 1, 4096, 0, 1, -4074.93, -3943.45, 183.19, 5.8294, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+18, 47394, 0, 1, 4096, 0, 1, -4077.29, -3945.24, 183.482, 5.81195, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+19, 47394, 0, 1, 4096, 0, 1, -3889.31, -4055.24, 167.711, 0.455739, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+20, 47394, 0, 1, 4096, 0, 1, -3904.72, -4061.68, 170.155, 0.395674, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+21, 47394, 0, 1, 4096, 0, 1, -3884.56, -4016.38, 164.65, 5.83741, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+22, 47394, 0, 1, 4096, 0, 1, -3886.13, -4014.8, 165.155, 2.76761, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+23, 47394, 0, 1, 4096, 0, 1, -3762.76, -4025.04, 143.839, 1.36162, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+24, 47394, 0, 1, 4096, 0, 1, -3751.33, -4018.71, 141.016, 1.24915, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+25, 47394, 0, 1, 4096, 0, 1, -3750.97, -4019.46, 141.043, 1.7672, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+26, 47394, 0, 1, 4096, 0, 1, -3749.1, -4020.24, 140.726, 6.03039, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+27, 47394, 0, 1, 4096, 0, 1, -3739.57, -4020.21, 138.527, 0.0349066, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+28, 47394, 0, 1, 4096, 0, 1, -3732.38, -4031.93, 137.562, 0.750492, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+29, 47401, 0, 1, 4096, 0, 1, -4111.57, -3712.25, 199.974, 5.14872, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+30, 47401, 0, 1, 4096, 0, 1, -4102.69, -3713.14, 199.963, 4.20624, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+31, 47401, 0, 1, 4096, 0, 1, -4141.59, -3789.98, 198.125, 5.37561, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+32, 47401, 0, 1, 4096, 0, 1, -4142.2, -3791.71, 197.989, 5.91667, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+33, 47401, 0, 1, 4096, 0, 1, -4088.59, -3811.63, 191.483, 4.91764, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+34, 47401, 0, 1, 4096, 0, 1, -4090.17, -3872.48, 187.241, 0.773942, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+35, 47401, 0, 1, 4096, 0, 1, -4009.55, -3899.99, 185.913, 5.37561, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+36, 47401, 0, 1, 4096, 0, 1, -4010.16, -3901.71, 185.73, 5.91667, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+37, 47401, 0, 1, 4096, 0, 1, -3902.15, -4062.09, 170.06, 0.490163, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+38, 47401, 0, 1, 4096, 0, 1, -3880.14, -4015.73, 164.234, 2.80896, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+39, 47401, 0, 1, 4096, 0, 1, -3757.38, -4068.4, 147.367, 3.68265, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+40, 47401, 0, 1, 4096, 0, 1, -3749.92, -4019.48, 140.999, 1.29505, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+41, 47406, 0, 1, 4096, 0, 1, -4143.47, -3620.68, 210.726, 5.3058, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+42, 47406, 0, 1, 4096, 0, 1, -4142.89, -3632.29, 209.105, 5.42797, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+43, 47406, 0, 1, 4096, 0, 1, -4159.99, -3643.5, 208.746, 0, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+44, 47406, 0, 1, 4096, 0, 1, -4111.04, -3675.76, 203.457, 4.11898, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+45, 47406, 0, 1, 4096, 0, 1, -4105.43, -3680.94, 203.052, 4.5204, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+46, 47406, 0, 1, 4096, 0, 1, -4089.34, -3672.49, 210.867, 3.97935, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+47, 47406, 0, 1, 4096, 0, 1, -4068.85, -3786.29, 195.043, 4.2237, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+48, 47406, 0, 1, 4096, 0, 1, -4064.95, -3788.97, 194.302, 4.06662, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+49, 47406, 0, 1, 4096, 0, 1, -4087.57, -3805.96, 191.941, 4.86704, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+50, 47406, 0, 1, 4096, 0, 1, -4062.49, -3832.1, 189.842, 4.17134, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+51, 47406, 0, 1, 4096, 0, 1, -4084.88, -3871.61, 186.626, 0.734165, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+52, 47406, 0, 1, 4096, 0, 1, -4060.82, -3887.77, 188.047, 4.32842, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+53, 47406, 0, 1, 4096, 0, 1, -4058.29, -3890.51, 188.105, 4.2237, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+54, 47406, 0, 1, 4096, 0, 1, -4113.56, -3886.54, 185.351, 5.8294, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+55, 47406, 0, 1, 4096, 0, 1, -4031.98, -3939.18, 186.472, 5.0091, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+56, 47406, 0, 1, 4096, 0, 1, -4028.15, -3938.48, 186.091, 5.21853, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+57, 47406, 0, 1, 4096, 0, 1, -4095.64, -3933.74, 186.595, 5.84685, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+58, 47406, 0, 1, 4096, 0, 1, -4094.53, -3936.55, 185.735, 5.8294, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+59, 47406, 0, 1, 4096, 0, 1, -4019.53, -3939.07, 188.696, 4.97419, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+60, 47406, 0, 1, 4096, 0, 1, -3942.25, -4044.43, 173.518, 0.10472, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+61, 47406, 0, 1, 4096, 0, 1, -3943.82, -4042.12, 173.506, 0.191986, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+62, 47406, 0, 1, 4096, 0, 1, -3907.49, -4060.4, 169.973, 0.276832, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+63, 47406, 0, 1, 4096, 0, 1, -3860.5, -4089.69, 183.136, 0.890118, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+64, 47406, 0, 1, 4096, 0, 1, -3873.71, -4041.28, 168.085, 0.226893, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+65, 47406, 0, 1, 4096, 0, 1, -3875.2, -4038.64, 168.053, 0.279253, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+66, 47406, 0, 1, 4096, 0, 1, -3865.52, -4076.2, 172.624, 0.558505, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+67, 47406, 0, 1, 4096, 0, 1, -3843.34, -4078.93, 171.564, 1.18682, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+68, 47406, 0, 1, 4096, 0, 1, -3892.61, -4012.61, 166.305, 5.84519, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+69, 47406, 0, 1, 4096, 0, 1, -3826.95, -4080.09, 173.269, 1.25664, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+70, 47406, 0, 1, 4096, 0, 1, -3825.51, -4059.76, 159.684, 0.418879, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+71, 47406, 0, 1, 4096, 0, 1, -3784.8, -4021.68, 151.868, 5.63741, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+72, 47406, 0, 1, 4096, 0, 1, -3780.49, -4018.23, 151.274, 5.95157, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+73, 47406, 0, 1, 4096, 0, 1, -3762.21, -4028.26, 144.182, 0.822809, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+74, 47406, 0, 1, 4096, 0, 1, -3761.4, -4017.86, 143.481, 0.224442, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+75, 47406, 0, 1, 4096, 0, 1, -3774.13, -3983.85, 150.452, 5.53269, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+76, 47406, 0, 1, 4096, 0, 1, -3754.65, -4015.6, 141.754, 0.0653555, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+77, 47406, 0, 1, 4096, 0, 1, -3719.99, -4036.23, 144.624, 1.15192, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+78, 47406, 0, 1, 4096, 0, 1, -3704.75, -4034.9, 144.241, 1.23918, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+79, 47406, 0, 1, 4096, 0, 1, -3693.24, -3993.59, 142.523, 5.09636, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+80, 47406, 0, 1, 4096, 0, 1, -3694.08, -4030.35, 143.617, 1.3439, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+81, 47406, 0, 1, 4096, 0, 1, -3685.15, -4030.25, 143.867, 1.13446, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+82, 47406, 0, 1, 4096, 0, 1, -3915.59, -3988.04, 173.367, 5.37561, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+83, 47406, 0, 1, 4096, 0, 1, -3917.01, -3989.7, 173.255, 5.39307, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+84, 47406, 0, 1, 4096, 0, 1, -3919.86, -3989.42, 173.392, 5.21853, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+85, 47407, 0, 1, 4096, 0, 1, -4118.75, -3646.2, 206.393, 4.41568, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+86, 47407, 0, 1, 4096, 0, 1, -4070.88, -3829.66, 190.387, 4.0166, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+87, 47407, 0, 1, 4096, 0, 1, -3752.17, -4018.39, 141.149, 1.00015, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+88, 47409, 0, 1, 4096, 0, 1, -4162.15, -3644.51, 209.286, 5.65487, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+89, 47409, 0, 1, 4096, 0, 1, -4142.64, -3670.04, 207.695, 6.19592, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+90, 47409, 0, 1, 4096, 0, 1, -4139.91, -3675.38, 207.24, 0.436332, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+91, 47409, 0, 1, 4096, 0, 1, -4139.31, -3678.69, 206.672, 0.750492, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+92, 47409, 0, 1, 4096, 0, 1, -4112.36, -3765.73, 197.727, 5.58505, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+93, 47409, 0, 1, 4096, 0, 1, -4128.41, -3754.38, 201.017, 5.53269, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+94, 47409, 0, 1, 4096, 0, 1, -4114.11, -3767, 197.793, 5.65487, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+95, 47409, 0, 1, 4096, 0, 1, -4128.21, -3757.26, 201.008, 5.58505, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+96, 47409, 0, 1, 4096, 0, 1, -4129.96, -3758.54, 201.066, 5.65487, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+97, 47409, 0, 1, 4096, 0, 1, -4139.45, -3792.74, 197.449, 2.54818, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+98, 47409, 0, 1, 4096, 0, 1, -4044.31, -3815.27, 200.939, 3.80482, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+99, 47409, 0, 1, 4096, 0, 1, -4112.26, -3824.3, 198.122, 5.32325, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+100, 47409, 0, 1, 4096, 0, 1, -4042.79, -3816.83, 200.6, 3.76991, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+101, 47409, 0, 1, 4096, 0, 1, -4114.02, -3828.9, 197.704, 5.41052, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+102, 47409, 0, 1, 4096, 0, 1, -4118.83, -3829.74, 197.511, 5.48033, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+103, 47409, 0, 1, 4096, 0, 1, -4007.41, -3902.75, 185.746, 2.54818, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+104, 47409, 0, 1, 4096, 0, 1, -3816.76, -4023.05, 159.268, 5.77704, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+105, 47409, 0, 1, 4096, 0, 1, -3814.87, -4022.09, 158.995, 5.68977, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(@CGUID+106, 47409, 0, 1, 4096, 0, 1, -3815.27, -4019.97, 159.069, 5.61996, 120, 0, 0, 1, 0, 0, 0, 0, 0);

UPDATE `creature_template_addon` SET `auras`='' WHERE `entry` IN (47409, 47406, 47394, 47407, 47401);
UPDATE `creature_template` SET `unit_flags`=0, `unit_flags2`=0, `dynamicflags`=0, `scriptName`='npc_th_wyrms_bend_fighter' WHERE `entry` IN (47409, 47406, 47394, 47407, 47401, 47686);
UPDATE `creature_template` SET `flags_extra`=0 WHERE `entry`=47401;

UPDATE `gameobject` SET `phaseMask`=16384 WHERE `guid` IN (727497, 727498);
UPDATE `gameobject` SET `phaseMask`=1 WHERE `guid` IN (720510, 720511);

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '37';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 37, 1, 4, 'Twilight Highlands [A]: Negate Phase 1 On Quest Accepted: If The Key Fits [28108]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '37' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '28108';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 37, 0, 0, 9, 0, 28108, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '38';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 38, 16384, 0, 'Twilight Highlands [A]: Add Phase 16384 On Quest Accept: If The Key Fits [28108]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '38' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '28108';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 38, 0, 0, 9, 0, 28108, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '39';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 39, 16384, 4, 'Twilight Highlands [A]: Negate Phase 16384 On Quest Complete: If The Key Fits [28108]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '39' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28108';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 39, 0, 0, 28, 0, 28108, 0, 0, 0, 0, 0, '', '');

DELETE FROM `creature_equip_template` WHERE `entry` IN (47611, 47612, 47613, 47614, 47615);
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(47611, 1, 12892, 0, 62249),
(47612, 1, 0, 0, 52355),
(47613, 1, 2813, 0, 52052),
(47614, 1, 49617, 0, 28581),
(47615, 1, 21551, 21551, 15460);

UPDATE `creature_template` SET `InhabitType`=3 WHERE `entry`=47401;
UPDATE `creature` SET `phaseMask`=12288 WHERE `id` IN (47457, 47491);

DELETE FROM `areatrigger_scripts` WHERE `entry` = '6461';
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(6461, 'at_th_grim_batol');

UPDATE `creature` SET `phaseMask`=1 WHERE `guid`=764308;

DELETE FROM `spell_area` WHERE `spell` = '49416' AND `quest_start` = '28108';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49416, 1037, 28108, 28712, 1, 66, 11);

DELETE FROM `spell_area` WHERE `spell` = '94568' AND `quest_start` = '28108';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(94568, 1037, 28108, 0, 1, 66, 0);

-- Position update for Calen (id: 47605) in zone: 4922, area: 1037
UPDATE `creature` SET `position_x` = -4144.525, `position_y` = -3603.562, `position_z` = 213.809, `orientation`= 5.219 WHERE `guid` = 753933;

DELETE FROM `creature_text` WHERE `entry`=47605;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47605,0,0,'$n, I\'m glad you made it.',12,0,100,0,0,0,'Comment');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '40';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 40, 4096, 4, 'Twilight Highlands [A]: Negate Phase 4096 On Quest Complete: Pressing Forward [28109]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '40' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28109';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 40, 0, 0, 28, 0, 28109, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '41';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 41, 4096, 4, 'Twilight Highlands [A]: Negate Phase 4096 On Quest Rewarded: Pressing Forward [28109]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '41' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28109';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 41, 0, 0, 8, 0, 28109, 0, 0, 0, 0, 0, '', '');

DELETE FROM `gossip_menu_option` WHERE `menu_id` = '60001';
INSERT INTO `gossip_menu_option` (`menu_id`, `option_text`, `option_id`, `npc_option_npcflag`) VALUES
(60001, 'Make a series of complicated hand gestures.', 1, 1);

UPDATE `quest_template` SET `PrevQuestId`='28109' WHERE `Id`=28712;
UPDATE `creature` SET `phaseMask`=1 WHERE `guid`=764276;

DELETE FROM `spell_area` WHERE `spell` = '90161' AND `quest_start` = '28712';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(90161, 5699, 28712, 28712, 1, 2, 11);

UPDATE `creature_template` SET `InhabitType`=7, `VehicleId`=1257 WHERE `entry` IN (51041, 51038, 51039);
UPDATE `creature_template` SET `ScriptName`='npc_th_lirastrasza_dq_event' WHERE `entry`=49417;
UPDATE `creature_template` SET `ScriptName`='npc_th_dq_first_camera' WHERE `entry`=51041;
UPDATE `creature_template` SET `InhabitType`=5, `ScriptName`='npc_th_alexstrasza_dq_first_event' WHERE `entry`=51354;
UPDATE `creature_template` SET `InhabitType`=5, `ScriptName`='npc_th_calen_dq_first_event' WHERE `entry`=51356;

UPDATE `spell_target_position` SET `target_position_x`=-2646.80, `target_position_y`=-3171.19, `target_position_z`=209.34, `target_orientation`=3.61 WHERE `id`=95196 AND `effIndex`=0;

DELETE FROM `conditions` WHERE `SourceEntry` = '94551';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 94551, 0, 0, 31, 0, 3, 51357, 0, 0, 0, '', 'Targeting -> Mirror');

UPDATE `creature_template` SET `ScriptName`='npc_th_dq_first_mirror' WHERE `entry`=51357;

DELETE FROM `creature_text` WHERE `entry`=51354;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(51354,0,0,'Mortal, I want you to bear witness to this, but for your own safety stay back. Calen, you too.',12,0,100,1,0,21045,'Comment'),
(51354,1,0,'Your life isn\'t yours to throw away, Calen. Should I fail, the fate of this world may rest on your shoulders.',12,0,100,5,0,21046,'Comment'),
(51354,2,0,'It pains me, Neltharion - but I must end you as I have ended Malygos.',12,0,100,1,0,21047,'Comment'),
(51354,3,0,'I see the hollow metal shell of a once great ally, and the precious gift of the Titans wasted.',12,0,100,5,0,21048,'Comment');

DELETE FROM `creature_text` WHERE `entry`=51356;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(51356,0,0,'I will not leave your side.',12,0,100,1,0,21510,'Comment'),
(51356,1,0,'Yes, mother.',12,0,100,2,0,21512,'Comment');

UPDATE `creature_template` SET `minlevel`=88, `maxlevel`=88, `exp`=3, `InhabitType`=5, `ScriptName`='npc_th_deathwing_dq_event' WHERE `entry`=51355;

DELETE FROM `creature_text` WHERE `entry`=51355;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(51355,0,0,'Lifebinder! Do you presume that I am at your beck and call? I have a world to unmake.',12,0,100,1,0,20275,'Comment'),
(51355,1,0,'"End" me? Lifebinder, you think life is yours to take away?',12,0,100,1,0,20276,'Comment'),
(51355,2,0,'Life is weak, mortal, fleeting... fragile.',12,0,100,1,0,0,'Comment'),
(51355,3,0,'Death is final. Death is eternal. Death is... my realm.',12,0,100,1,0,0,'Comment'),
(51355,4,0,'Look upon me and you see death incarnate, the unmaker of worlds.',12,0,100,1,0,0,'Comment'),
(51355,5,0,'Then witness my new gifts, bestowed by this world\'s true masters.',12,0,100,1,0,20277,'Comment');

UPDATE `creature_template` SET `modelid2`=33791 WHERE `entry`=51355;
UPDATE `creature` SET `phaseMask`=1 WHERE `guid`=764273;

#IMPOSTARE QUESTEND
DELETE FROM `spell_area` WHERE `spell` = '49417' AND `quest_start` = '28712';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_end_status`) VALUES
(49417, 5699, 28712, 1, 0);

UPDATE `quest_template` SET `PrevQuestId`='28712' WHERE `Id`=28758;
UPDATE `creature_template_addon` SET `auras`='49415' WHERE `entry`=49810;
UPDATE `creature_template` SET `minlevel`=88, `maxlevel`=88, `exp`=3, `VehicleId`=1410, `InhabitType`=4, `ScriptName`='npc_th_vermillion_summoner' WHERE `entry`=49914;

-- Deletes creature Vermillion Vanguard (id: 49910, guid: 754663) in zone: 4922, area: 5699
DELETE FROM `creature` WHERE `guid` = 754663; DELETE FROM creature_addon WHERE guid = 754663;

-- Deletes creature Vermillion Vanguard (id: 49910, guid: 754664) in zone: 4922, area: 5699
DELETE FROM `creature` WHERE `guid` = 754664; DELETE FROM creature_addon WHERE guid = 754664;

-- Deletes creature Vermillion Vanguard (id: 49910, guid: 185201) in zone: 4922, area: 5699
DELETE FROM `creature` WHERE `guid` = 185201; DELETE FROM creature_addon WHERE guid = 185201;

-- Deletes creature Vermillion Vanguard (id: 49910, guid: 754625) in zone: 4922, area: 5699
DELETE FROM `creature` WHERE `guid` = 754625; DELETE FROM creature_addon WHERE guid = 754625;

UPDATE `creature_template` SET `minlevel`=88, `maxlevel`=88, `exp`=3, `VehicleId`=1410, `InhabitType`=4, `npcflag`=0 WHERE `entry`=49914;
UPDATE `creature_template` SET `npcflag`=1, `ScriptName`='npc_th_vermillion_summoner' WHERE `entry`=49910;
UPDATE `creature_template` SET `unit_class`=8 WHERE `entry`=49914;

DELETE FROM `creature_template_addon` WHERE `entry` = '52111';
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES
(52111, '88550 60921');

UPDATE `creature_template` SET `scale`=2.4, `flags_extra`=128 WHERE `entry`=52111;

#INSERIRE QUESTEND
DELETE FROM `spell_area` WHERE `spell` = '60922' AND `quest_start` = '28712';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_end_status`) VALUES
(60922, 5699, 28712, 1, 0);

UPDATE `creature_template` SET `ScriptName`='npc_th_vermillion_escort' WHERE `entry`=49914;

DELETE FROM `script_waypoint` WHERE `entry` = '49914';
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES
(49914, 1, -2703.77, -3207.61, 191.83, 'Vermillion WP'),
(49914, 2, -2779.02, -3134.96, 218.30, 'Vermillion WP'),
(49914, 3, -2919.73, -3094.52, 197.97, 'Vermillion WP'),
(49914, 4, -3222.82, -3216.42, 213.21, 'Vermillion WP'),
(49914, 5, -3564.75, -3523.71, 404.58, 'Vermillion WP'),
(49914, 6, -3711.04, -3648.06, 506.26, 'Vermillion WP'),
(49914, 7, -3871.85, -3685.56, 560.17, 'Vermillion WP'),
(49914, 8, -3991.80, -3654.82, 629.29, 'Vermillion WP'),
(49914, 9, -3973.70, -3602.99, 638.41, 'Vermillion WP');

DELETE FROM `creature_text` WHERE `entry`=49914;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(49914,0,0,'The battle is about to begin!',42,0,100,0,0,0,'Comment'),
(49914,1,0,'|TInterface\\Icons\\spell_fire_flamebolt.blp:32|t  Use Your Fire Blast to incinerate Twilight Shadowdrakes.',42,0,100,0,0,0,'Comment'),
(49914,2,0,'|TInterface\\Icons\\ability_druid_ravage.blp:32|t  When your enemies are weak, tear them from the sky with your Finishing Strike!',42,0,100,0,0,0,'Comment'),
(49914,3,0,'|TInterface\\Icons\\spell_nature_healingway.blp:32|t  Your Lifebinder Boon will heal others while restoring your health and mana.',42,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `InhabitType`=4, `HoverHeight`=1 WHERE `entry` IN (49872, 49873);
UPDATE `creature` SET `phaseMask`=16384, `spawntimesecs`=60, `spawndist`=45, `MovementType`=1 WHERE `id` IN (49873, 49872, 49820, 49818);

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '42';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 42, 16384, 0, 'Twilight Highlands [A]: Add Phase 16384 On Quest Accepted: Battle of Life and Death [28758]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '42' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '28758';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 42, 0, 0, 9, 0, 28758, 0, 0, 0, 0, 0, '', '');

UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `guid` IN (764272, 764271);

-- Deathwing
SET @ENTRY := 49820;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,5000,10000,8000,8000,11,87455,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Cast Breath");

-- Alexstrasza the Life-Binder
SET @ENTRY := 49818;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,7000,13500,11000,14000,11,87455,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Cast Breath");

-- Position update for Alexstrasza the Life-Binder (id: 49818) in zone: 4922, area: 4922
UPDATE `creature` SET `position_x` = -3927.089, `position_y` = -3493.575, `position_z` = 712.639, `orientation`= 2.429 WHERE `guid` = 764271;

-- Position update for Deathwing (id: 49820) in zone: 4922, area: 1037
UPDATE `creature` SET `position_x` = -3974.087, `position_y` = -3459.316, `position_z` = 714.360, `orientation`= 5.657 WHERE `guid` = 764272;

UPDATE `creature_template` SET `modelid1`=23830, `InhabitType`=4 WHERE `entry`=49841;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (49841, 51148);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(49841, 46598, 0),
(51148, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '49841';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(49841, 49818, 2, 1, 'Alexstrasza -> Fight Vehicle', 8, 0),
(49841, 49820, 1, 1, 'Deathwing -> Fight Vehicle', 8, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '51148';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(51148, 49818, 3, 1, 'Alexstrasza -> Fight Vehicle', 8, 0),
(51148, 49820, 1, 1, 'Deathwing -> Fight Vehicle', 8, 0);

UPDATE `creature_template` SET `ScriptName`='npc_th_battle_vehicle_event' WHERE `entry`=49841;
UPDATE `creature_template` SET `minlevel`=88, `maxlevel`=88, `exp`=3, `unit_flags`=768, `VehicleId`=1451 WHERE `entry`=51148;
UPDATE `creature_template` SET `modelid1`=23830, `InhabitType`=4, `ScriptName`='npc_th_battle_vehicle_event' WHERE `entry`=51148;
UPDATE `creature_template` SET `ScriptName`='npc_th_battle_camera_event' WHERE `entry`=51038;
UPDATE `creature_template` SET `modelid2`=11686 WHERE `entry`=51038;
UPDATE `creature_template` SET `minlevel`=88, `maxlevel`=88, `exp`=3, `InhabitType`=4 WHERE `entry`=51173;

UPDATE `creature_template` SET `minlevel`=88, `maxlevel`=88, `exp`=3, `InhabitType`=4 WHERE  `entry`=51159;

DELETE FROM `creature_text` WHERE `entry`=51159;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(51159,0,0,'There - they\'ve fallen!',12,0,100,0,0,21514,'Comment'),
(51159,1,0,'Mother, stay still. Your wounds are great.',12,0,100,1,0,21515,'Comment'),
(51159,2,0,'Deathwing - he lives!',12,25,100,0,0,21520,'Comment'),
(51159,3,0,'Mortal, take the dragon queen. Carry her to safety. Now! RUN! Get her away from here!',12,0,100,25,0,21521,'Comment'),
(51159,4,0,'I will delay the Aspect of Death. Take her to safety. GO!',12,0,100,1,0,21522,'Comment');

UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=51186;

DELETE FROM `creature_text` WHERE `entry`=51186;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(51186,0,0,'The Earth Warder... he is dead.',12,0,100,0,0,21050,'Comment'),
(51186,1,0,'The black aspect\'s blood is cursed. Wherever it was shed - nothing will grow for ten thousand years.',12,0,100,1,0,21051,'Comment'),
(51186,2,0,'But it is over. We can work now to bottle up the horrors he has unleashed.',12,0,100,0,0,0,'Comment'),
(51186,3,0,'Impossible!',12,0,100,0,0,21052,'Comment'),
(51186,4,0,'Calen, no!',12,0,100,0,0,21053,'Comment');

UPDATE `spell_target_position` SET `target_orientation`=4.64 WHERE `id`=94344 AND `effIndex`=0;
UPDATE `creature_template` SET `ScriptName`='npc_th_battle_calen_event' WHERE `entry`=51159;
UPDATE `creature_template` SET `modelid1`=38112, `modelid2`=38112 WHERE `entry`=52951;
UPDATE `creature_template` SET `ScriptName`='npc_th_battle_deathwing_event' WHERE `entry`=52869;
UPDATE `spell_target_position` SET `target_position_x`=-4202.10, `target_position_y`=-3259.40, `target_position_z`=275.44, `target_orientation`=4.61 WHERE `id`=94350 AND `effIndex`=0;
UPDATE `creature_template` SET `ScriptName`='npc_th_battle_alexstrasza_event' WHERE `entry`=51171;
UPDATE `creature_template` SET `ScriptName`='npc_th_battle_drake_double_event' WHERE `entry`=51173;

DELETE FROM `conditions` WHERE `SourceEntry` = '94348';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 94348, 0, 0, 31, 0, 3, 51172, 0, 0, 0, '', 'Targeting -> Mirror');

UPDATE `creature_template` SET `ScriptName`='npc_th_battle_mirror_event' WHERE `entry`=51172;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=52869;
UPDATE `creature_template` SET `VehicleId`=1509 WHERE `entry`=51173;

DELETE FROM `creature_text` WHERE `entry`=52869;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(52869,0,0,'The sun has set on this mortal world, fools. Make peace with your end, for the hour of Twilight falls.',12,0,100,20279,0,0,'Comment');

UPDATE `creature_template` SET `ScriptName`='npc_th_vermillion_skyscreamer', `minlevel`=85, `maxlevel`=85, `exp`=3, `unit_flags`=768, `VehicleId`=1280, `InhabitType`=4 WHERE `entry`=47711;

DELETE FROM `script_waypoint` WHERE `entry` = '47711';
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES
(47711, 1, -4101.66, -3741.46, 244.96, 'Vermillion Skyscreamer WP'),
(47711, 2, -3943.76, -4030.01, 233.00, 'Vermillion Skyscreamer WP'),
(47711, 3, -3910.38, -4271.91, 207.63, 'Vermillion Skyscreamer WP'),
(47711, 4, -3915.36, -4355.76, 205.94, 'Vermillion Skyscreamer WP'),
(47711, 5, -3987.18, -4445.79, 219.85, 'Vermillion Skyscreamer WP'),
(47711, 6, -4349.16, -4833.25, 175.07, 'Vermillion Skyscreamer WP'),
(47711, 7, -4591.77, -4996.48, 177.65, 'Vermillion Skyscreamer WP'),
(47711, 8, -4967.38, -5729.92, 128.90, 'Vermillion Skyscreamer WP'),
(47711, 9, -4919.95, -5890.36, 94.50, 'Vermillion Skyscreamer WP'),
(47711, 10, -4775.28, -5780.13, 97.07, 'Vermillion Skyscreamer WP'),
(47711, 11, -4673.01, -5673.74, 94.12, 'Vermillion Skyscreamer WP'),
(47711, 12, -4618.62, -5563.99, 74.76, 'Vermillion Skyscreamer WP');

-- Calen
SET @ENTRY := 47605;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,19,0,100,0,28171,0,0,0,85,88829,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Quest Accept - Summon Skyscreamer"),
(@ENTRY,@SOURCETYPE,1,0,19,0,100,0,28171,0,0,0,33,47605,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Quest Accept - Quest Credit");

UPDATE `creature_template` SET `unit_flags`=768, `HoverHeight`=1 WHERE `entry`=47780;
UPDATE `creature_template_addon` SET `bytes1`=0 WHERE `entry`=47780;
UPDATE `creature_template` SET `unit_flags2`=2048, `dynamicflags`=0 WHERE `entry`=47780;

UPDATE `creature` SET `spawndist`=30, `MovementType`=1, `spawntimesecs`=60 WHERE `id` IN (47797, 47796);
UPDATE `creature` SET `spawndist`=5, `MovementType`=1, `spawntimesecs`=60 WHERE `id`=47798;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `guid` IN (758181, 758195, 758182, 758193, 758342, 759508);

-- Obsidian Viletongue
SET @ENTRY := 47796;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,10452,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Flame Buffet"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,2000,2000,3000,3000,11,13878,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Scorch");

-- Obsidian Charscale
SET @ENTRY := 47797;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,22120,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Charge"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,2000,2000,8000,12000,11,80549,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Gout of Flame");

-- Scarderis
SET @ENTRY := 47835;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,16244,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Demoralizing Shout"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,3000,5000,6000,6000,11,15284,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Cleave");

UPDATE `creature_template` SET `ScriptName`='npc_th_obsidian_pyrewing' WHERE `entry`=46141;

DELETE FROM `creature_text` WHERE `entry`=46141;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46141,0,0,'The drake under you is mortally wounded and about to fall! Move to another drake, quickly!
|TInterface\\Icons\\inv_misc_hook_01.blp:32|t',42,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `ScriptName`='npc_th_obsidian_pyrewing' WHERE `entry`=46141;

DELETE FROM `spell_script_names` WHERE `spell_id` = '88914';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(88914, 'spell_th_wyrmhunter_hooks');

DELETE FROM `spell_script_names` WHERE `spell_id` = '89008';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(89008, 'spell_th_mother_flame');

DELETE FROM `waypoints` WHERE `entry` = '47853';
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(47853, 1, -5150.98, -5479.27, 29.28, 'Obsidian Whelp WP'),
(47853, 2, -5134.14, -5433.23, 26.27, 'Obsidian Whelp WP'),
(47853, 3, -5088.56, -5353.18, 23.78, 'Obsidian Whelp WP'),
(47853, 4, -5068.63, -5301.58, 27.98, 'Obsidian Whelp WP'),
(47853, 5, -5054.99, -5144.70, 45.10, 'Obsidian Whelp WP'),
(47853, 6, -5214.26, -5027.90, 75.91, 'Obsidian Whelp WP');

UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=47853;

-- Obsidian Hatchling
SET @ENTRY := 47853;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,1,3000,3000,120000,120000,53,1,47853,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - WP Start"),
(@ENTRY,@SOURCETYPE,1,0,40,0,100,0,6,0,0,0,33,47874,0,0,0,0,0,18,45,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Quest Credit"),
(@ENTRY,@SOURCETYPE,2,0,40,0,100,0,6,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Despawn");

UPDATE `creature_template` SET `DamageModifier`=4, `ScriptName`='npc_th_baleflame' WHERE `entry`=47905;
UPDATE `creature_template` SET `InhabitType`=5, `DamageModifier`=6, `ScriptName`='npc_th_obsidia', `unit_flags`=768, `unit_flags2`=2048 WHERE `entry`=47929;

DELETE FROM `creature_text` WHERE `entry`=47929;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47929,0,0,'Baleflame! Your tender flesh shall be an appropriate meal for my whelps!',14,0,100,0,0,0,'Comment'),
(47929,1,0,'Come, my children! Awaken and feast upon their flesh!',14,0,100,0,0,0,'Comment'),
(47929,2,0,'No! My clutch is the last...! Father... I\'ve failed you...',14,0,100,0,0,0,'Comment');

UPDATE `quest_template` SET `SpecialFlags`=2 WHERE `Id`=28247;

DELETE FROM `event_scripts` WHERE `id` = '27818';
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(27818, 1, 10, 50540, 60000, 0, -5411.18, -4802.97, 37.03, 5.66),
(27818, 1, 10, 50540, 60000, 0, -5378.91, -4841.04, 57.80, 0.43),
(27818, 2, 10, 50540, 60000, 0, -5390.72, -4844.00, 68.07, 0.05),
(27818, 2, 10, 50540, 60000, 0, -5421.14, -4803.87, 104.05, 4.80),
(27818, 2, 10, 50540, 60000, 0, -5394.97, -4843.14, 67.25, 0.04),
(27818, 3, 10, 50540, 60000, 0, -5371.50, -4847.54, 56.80, 0.43);

-- Obsidian Hatchling
SET @ENTRY := 50540;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,1000,1000,5000,5000,49,0,0,0,0,0,0,18,100,0,0,0.0,0.0,0.0,0.0,"OOC - Attack Players in Room");

UPDATE `creature_template` SET `DamageModifier`=4.5 WHERE `entry`=50540;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=47799;

UPDATE `quest_template` SET `PrevQuestId`='27494' WHERE `Id`=27588;
UPDATE `quest_template` SET `PrevQuestId`='28248' WHERE `Id`=27496;
UPDATE `quest_template` SET `PrevQuestId`='27588' WHERE `Id`=27608;

DELETE FROM `conditions` WHERE `SourceEntry` = '27490' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27490, 27492, 0),
(20, 8, 27490, 27496, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27490' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27490, 27492, 0),
(19, 8, 27490, 27496, 0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '46088';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(46088, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '46088';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(46088, 46084, 1, 'Victor Point Gryphon -> Wildhammer', 8, 0);

UPDATE `creature` SET `phaseMask`=32768 WHERE `id`=46084;
UPDATE `creature_template` SET `ScriptName`='npc_th_twilight_gate_fighter' WHERE `entry` IN (45787, 46088, 45798, 46084);
UPDATE `creature_template` SET `unit_flags`=256, `unit_flags2`=2048 WHERE `entry`=45798;
UPDATE `creature_template` SET `unit_flags2`=2048 WHERE `entry`=46088;
UPDATE `creature_template` SET `unit_flags`=256, `unit_flags2`=2048 WHERE `entry`=46084;

DELETE FROM `conditions` WHERE `SourceEntry` = '85478';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 85478, 0, 0, 31, 0, 3, 45864, 0, 0, 0, '', 'Targeting -> Building'),
(13, 1, 85478, 0, 1, 31, 0, 3, 45863, 0, 0, 0, '', 'Targeting -> Building'),
(13, 1, 85478, 0, 2, 31, 0, 3, 45862, 0, 0, 0, '', 'Targeting -> Building'),
(13, 1, 85478, 0, 3, 31, 0, 3, 45865, 0, 0, 0, '', 'Targeting -> Building');

DELETE FROM `conditions` WHERE `SourceEntry` = '85481';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 85481, 0, 0, 31, 0, 3, 45864, 0, 0, 0, '', 'Targeting -> Building'),
(13, 1, 85481, 0, 1, 31, 0, 3, 45863, 0, 0, 0, '', 'Targeting -> Building'),
(13, 1, 85481, 0, 2, 31, 0, 3, 45862, 0, 0, 0, '', 'Targeting -> Building'),
(13, 1, 85481, 0, 3, 31, 0, 3, 45865, 0, 0, 0, '', 'Targeting -> Building');

-- "Call in the Artillery" Southern Building Bunny
SET @ENTRY := 45862;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,8,0,100,0,85478,1,0,0,33,45862,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Quest Credit"),
(@ENTRY,@SOURCETYPE,1,0,8,0,100,0,85481,1,0,0,33,45862,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Quest Credit");

-- "Call in the Artillery" Southwestern Building Bunny
SET @ENTRY := 45863;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,8,0,100,0,85478,1,0,0,33,45863,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Quest Credit"),
(@ENTRY,@SOURCETYPE,1,0,8,0,100,0,85481,1,0,0,33,45863,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Quest Credit");

-- "Call in the Artillery" Northeastern Building Bunny
SET @ENTRY := 45864;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,8,0,100,0,85478,1,0,0,33,45864,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Quest Credit"),
(@ENTRY,@SOURCETYPE,1,0,8,0,100,0,85481,1,0,0,33,45864,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Quest Credit");

-- "Call in the Artillery" Northern Building Bunny
SET @ENTRY := 45865;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,8,0,100,0,85478,1,0,0,33,45865,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Quest Credit"),
(@ENTRY,@SOURCETYPE,1,0,8,0,100,0,85481,1,0,0,33,45865,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Quest Credit");

UPDATE `creature_template` SET `ScriptName`='npc_th_angus_stillmountain' WHERE `entry`=45904;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '45881';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(45881, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '45881';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(45881, 50602, 1, 'Victor Point Soldier on Gryphon SI:7', 8, 0);

UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=45881;
UPDATE `creature_template` SET `ScriptName`='npc_th_si7_korkron_trigger' WHERE `entry`=45877;
UPDATE `creature_template` SET `VehicleId`=1166 WHERE `entry`=45881;

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '43';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 43, 65536, 0, 'Twilight Highlands [A]: Add Phase 65536 On Quest Accepted: 27494');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '43' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '27494';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 43, 0, 0, 9, 0, 27494, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '44';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 44, 65536, 0, 'Twilight Highlands [A]: Add Phase 65536 On Quest Complete: 27494');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '44' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '27494';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 44, 0, 0, 28, 0, 27494, 0, 0, 0, 0, 0, '', '');

UPDATE `creature` SET `phaseMask`=65536 WHERE `guid`=756909;
UPDATE `gameobject` SET `phaseMask`=65536 WHERE `guid`=727496;

DELETE FROM `creature_text` WHERE `entry`=45644;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(45644,0,0,'3...',42,0,100,0,0,0,'Comment'),
(45644,1,0,'2...',42,0,100,0,0,0,'Comment'),
(45644,2,0,'1...',42,0,100,0,0,0,'Comment'),
(45644,3,0,'WHAT WAS THAT?!',14,0,100,0,0,0,'Comment'),
(45644,4,0,'THERE\'S NOTHING HERE EXCEPT FOR THIS FOG!',14,0,100,0,0,0,'Comment'),
(45644,5,0,'KEEP FIGHTING! I\'M GOING UP TOP TO SPEAK WITH CHO\'GALL!',14,0,100,0,0,0,'Comment');

UPDATE `gameobject_template` SET `ScriptName`='go_th_hidden_explosives' WHERE `entry`=205590;

-- "Move the Mountain" Hidden Explosives Bunny
SET @ENTRY := 45968;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,1,3500,3500,300000,300000,75,92792,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Add Shadow Fog"),
(@ENTRY,@SOURCETYPE,1,0,54,0,100,1,0,0,0,0,75,60191,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Add Invisib");

UPDATE `quest_template` SET `NextQuestIdChain`='27588' WHERE `Id`=27494;
UPDATE `quest_template` SET `NextQuestIdChain`='27590' WHERE `Id`=27495;
UPDATE `quest_template` SET `NextQuestIdChain`='27608' WHERE `Id`=27588;
UPDATE `quest_template` SET `NextQuestIdChain`='27609' WHERE `Id`=27590;
UPDATE `quest_template` SET `Flags`=589952 WHERE `Id` IN (27499, 27588, 27590);
UPDATE `quest_template` SET `Flags`=524416 WHERE `Id` IN (27608, 27609);
UPDATE `quest_template` SET `PrevQuestId`='0' WHERE `Id`=27499;
UPDATE `quest_template` SET `PrevQuestId`='27495' WHERE `Id`=27590;

DELETE FROM `spell_script_names` WHERE `spell_id` = '85720';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(85720, 'spell_th_attack_signal');

UPDATE `creature` SET `phaseMask`=1 WHERE `guid`=764440;

-- Za'brox
SET @ENTRY := 46017;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,1000,4000,4000,11,9053,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Fireball"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,9000,9000,9000,9000,11,38033,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Frost Nova");

-- Beeble'phod
SET @ENTRY := 46018;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,1000,7000,7000,11,9613,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Shadow Bolt"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,4000,4000,12500,12500,11,84533,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Drain Life"),
(@ENTRY,@SOURCETYPE,2,0,4,0,100,0,0,0,0,0,11,18266,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Curse of Agony");

UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `unit_flags`=768 WHERE `entry`=46113;
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `unit_flags`=768 WHERE `entry`=46118;

DELETE FROM `creature_template_addon` WHERE `entry` IN (46113, 46117, 45900, 46114, 46119, 46118);
INSERT INTO `creature_template_addon` (`entry`, `bytes2`, `auras`) VALUES
(46113, 1, '86603 91194 60191'),
(46117, 1, '86603 91194 60191'),
(45900, 1, '86603 91194 60191'),
(46114, 1, '86603 91194 60191'),
(46119, 1, '86603 91194 60191'),
(46118, 1, '86603 91194 60191');

UPDATE `creature_template` SET `ScriptName`='npc_th_cassius_the_white' WHERE `entry`=45669;
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=46113;
UPDATE `creature_template` SET `ScriptName`='npc_th_si7_commander' WHERE `entry`=46114;
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `npcflag`=1, `unit_flags`=768 WHERE `entry` IN (46114, 46119);

DELETE FROM `creature_text` WHERE `entry`=46114;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46114,0,0,'We should move out, $n. Up the ramp and then straight to Master Shaw.',12,0,100,0,0,0,'Comment'),
(46114,1,0,'Wait! Do you hear something?',12,0,100,0,0,0,'Comment'),
(46114,2,0,'Cho\'gall!',12,0,100,0,0,0,'Comment'),
(46114,3,0,'Kill him!',14,0,100,0,0,0,'Comment');

DELETE FROM `script_waypoint` WHERE `entry` = '46114';
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`) VALUES
(46114, 1, -4446.84, -4471.16, 224.74),
(46114, 2, -4448.73, -4467.32, 227.76),
(46114, 3, -4455.69, -4459.31, 234.64),
(46114, 4, -4465.90, -4443.51, 248.40);

DELETE FROM `creature_text` WHERE `entry`=46137;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46137,0,0,'Alliance soldiers! So bold, so cavalier. (Scurry, scurry, scurry, mortals.) Your numbers are small, and you are too late. (Helpless and hopeless, helpless and hopeless.)',14,0,100,0,0,0,'Comment'),
(46137,1,0,'(Finish it! Finish them all!)',14,0,100,0,0,0,'Comment'),
(46137,2,0,'Pathetic flesh!',14,0,100,0,0,0,'Comment'),
(46137,3,0,'Horde scum! I was once like you. (Our old masters, small and hungry.) You cling to your mortal shells... (Bags of bone and bone and tears). ...trying to deny your insignificance.',14,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `InhabitType`=3 WHERE `entry` IN (46137, 46114, 46113);

DELETE FROM `creature` WHERE `guid` = '842819';
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(842819, 45796, 0, 1, 1, 0, 0, -4473.51, -4354.52, 322.33, 2.91757, 300, 0, 0, 774900, 0, 0, 0, 0, 0);

DELETE FROM `creature_addon` WHERE `guid` = '842819';
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES
(842819, '80797');

DELETE FROM `spell_area` WHERE `spell` = '94566' AND `quest_start` = '27636';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(94566, 5473, 27636, 1, 66, 0);

DELETE FROM `creature_text` WHERE `entry`=45796;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(45796,0,0,'Looks like it\'s just you, me and those two Earthen Ringers over at the mine. Let\'s work fast, $n, before we\'re discovered.',12,0,100,0,0,0,'Comment');

-- Master Mathias Shaw
SET @ENTRY := 45796;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,20,0,100,0,27636,0,0,0,1,0,5000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Quest Rewarded - Talk 0");

UPDATE `quest_template` SET `PrevQuestId`='27636' WHERE `Id` IN (27652, 27654, 27657);

DELETE FROM `conditions` WHERE `SourceEntry` = '27688' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27688, 27654, 0),
(20, 8, 27688, 27652, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27688' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27688, 27654, 0),
(19, 8, 27688, 27652, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27695' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27695, 27654, 0),
(20, 8, 27695, 27652, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27695' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27695, 27654, 0),
(19, 8, 27695, 27652, 0);

-- Enslaved Tempest
SET @ENTRY := 46328;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,83004,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Storm Cloud"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,3000,3000,4000,8000,11,57780,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Lightning Bolt"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,12500,12500,12500,12500,11,83004,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Storm Cloud");

-- Dark Assassin
SET @ENTRY := 46202;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,80576,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Shadowstep"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,3000,3000,18000,18000,11,32418,32,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Curse of Agony"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,500,500,4000,8000,11,37685,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Backstab");

-- Twilight Ettin
SET @ENTRY := 45838;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,36645,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Throw Rock"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,8000,8000,16000,16000,11,90063,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Overhead Smash");

UPDATE `creature` SET `spawndist`=10, `MovementType`=1 WHERE `id`=45838;
UPDATE `creature` SET `spawndist`=45, `MovementType`=1 WHERE `id`=46404;

UPDATE `creature_template` SET `unit_flags`=0, `unit_flags2`=2048, `dynamicflags`=0 WHERE `entry` IN (46203, 46204, 46205);
UPDATE `creature_template_addon` SET `auras`='' WHERE  `entry` IN (46203, 46204, 46205);

-- Twilight Vindicator
SET @ENTRY := 46203;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,79976,32,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Retribution Aura"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,2000,2000,10000,10000,11,79970,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Divine Storm"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,12000,12000,12000,12000,11,79971,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Hammer of Wrath");

-- Corrupted Elementalist
SET @ENTRY := 46204;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,79849,32,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Molten Armor"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,1000,1000,4000,4000,11,79564,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Twilight Fireball");

-- Citadel Veteran
SET @ENTRY := 46205;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,13730,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Demoralizing Shout"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,8000,8000,12000,16000,11,32736,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Mortal Strike"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,2000,2000,4000,5500,11,57846,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Heroic Strike");

DELETE FROM `creature_addon` WHERE `guid` IN (757082,757083,757085);
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES
(757082, '29266'),
(757083, '29266'),
(757085, '29266');

UPDATE `creature` SET `unit_flags`=768, `dynamicflags`=32 WHERE `guid` IN (757082,757083,757085);
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=46416;
UPDATE `creature` SET `spawndist`=25, `MovementType`=1 WHERE `id`=46416;
UPDATE `quest_template` SET `PrevQuestId`='27657' WHERE `Id` IN (27659, 27660, 27662);
UPDATE `quest_template` SET `PrevQuestId`='27745' WHERE `Id`=27782;

-- Blindeye the Guardian
SET @ENTRY := 46399;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,10000,10000,10000,10000,11,79878,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Bloodthirst"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,2000,2000,4000,6000,11,81502,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Cleave"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,3000,3000,5000,9000,11,11977,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Rend"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,8000,8000,20000,20000,11,36645,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Throw Rock");

-- Position update for Twilight Ettin (id: 45838) in zone: 4922, area: 5472
UPDATE `creature` SET `position_x` = -4529.712, `position_y` = -4480.284, `position_z` = 208.288, `orientation`= 4.761 WHERE `guid` = 756900;

-- Position update for Bloodeye Brute (id: 45787) in zone: 4922, area: 5472
UPDATE `creature` SET `position_x` = -4493.597, `position_y` = -4437.875, `position_z` = 254.363, `orientation`= 5.824 WHERE `guid` = 756914;

DELETE FROM `creature_text` WHERE `entry`=46785;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46785,0,0,'She\'s sent you to do her dirty work, has she? I\'ll deal with the countess after I\'ve killed you, fleshling!',14,0,100,463,0,0,'');

-- Lord Cannon
SET @ENTRY := 46785;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,83018,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Magma Wave"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,3000,3000,4000,7000,11,9053,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Fireball"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,5000,5000,5000,5000,11,12743,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Immolation"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,11000,11000,11000,11000,11,11970,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Fire Nova"),
(@ENTRY,@SOURCETYPE,4,0,4,0,100,0,0,0,0,0,1,0,5000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Talk 0");

UPDATE `quest_template` SET `PrevQuestId`='27661' WHERE `Id` IN (27719, 27798);
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=46848;

DELETE FROM `creature_text` WHERE `entry`=46819;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46819,0,0,'Wh... what is this?',12,0,100,0,3419,0,'Comment'),
(46819,1,0,'I\'m dead! Murdered by the Twilight\'s Hammer.',12,0,100,0,0,3419,'Comment'),
(46819,2,0,'The Spirit of the Loch sent you here. You seek information.',12,0,100,0,0,3419,'Comment'),
(46819,3,0,'They captured and enslaved us. Put us to work on a weapon.',12,0,100,0,0,3419,'Comment'),
(46819,4,0,'A special project... an artifact for Cho\'gall.',12,0,100,0,0,3420,'Comment'),
(46819,5,0,'We were to be rewarded for the best work we\'d ever done, and we were... with this.',12,0,100,0,0,3420,'Comment'),
(46819,6,0,'They imbued it with the power of an Old God.',12,0,100,0,0,3420,'Comment'),
(46819,7,0,'The weapon which you seek is called the Hammer of Twilight.',12,0,100,0,0,3420,'Comment'),
(46819,8,0,'Now leave me be. I see the Light....',12,0,100,0,0,3419,'Comment');

DELETE FROM `spell_script_names` WHERE `spell_id` = '86499';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(86499, 'spell_th_water_of_life');

UPDATE `creature_template` SET `ScriptName`='npc_th_finlay_controller' WHERE `entry`=46848;
UPDATE `gameobject_template` SET `ScriptName`='go_th_earth_portal_controller' WHERE `entry`=206018;
UPDATE `gameobject_template` SET `ScriptName`='go_th_air_portal_controller' WHERE `entry`=206019;
UPDATE `gameobject_template` SET `ScriptName`='go_th_water_portal_controller' WHERE `entry`=206017;
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `unit_flags`=0, `dynamicflags`=0, `DamageModifier`=3 WHERE `entry` IN (46273, 46270, 46272);
UPDATE `creature_template` SET `ScriptName`='npc_th_debilitated_apexar' WHERE `entry`=46258;
UPDATE `creature_template` SET `ScriptName`='npc_th_debilitated_aetharon' WHERE `entry`=46259;
UPDATE `creature_template` SET `ScriptName`='npc_th_debilitated_edemantus' WHERE `entry`=46256;

UPDATE `creature` SET `phaseMask`=1 WHERE `guid`=764473;

DELETE FROM `creature_text` WHERE `entry`=46341;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46341,0,0,'We could have been civil about this, but no!',14,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `ScriptName`='npc_th_dame_alys_finnsson' WHERE `entry`=46341;
UPDATE `creature_template_addon` SET `auras`='86603' WHERE `entry`=46385;

DELETE FROM `creature_text` WHERE `entry`=46386;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46386,0,0,'Not bad, I guess.',12,0,100,0,0,0,'Comment'),
(46386,1,0,'That was great fun.',12,0,100,0,0,0,'Comment'),
(46386,2,0,'You\'re telegraphing your moves.',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=46385;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46385,0,0,'Not bad, I guess.',12,0,100,0,0,0,'Comment'),
(46385,1,0,'That was great fun.',12,0,100,0,0,0,'Comment'),
(46385,2,0,'You\'re telegraphing your moves.',12,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `unit_flags`=0, `type_flags`=0, `DamageModifier`=4 WHERE `entry`=46341;

DELETE FROM `creature_text` WHERE `entry`=46342;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46342,0,0,'You\'ve come for training. Good!',14,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `unit_flags`=0, `type_flags`=0, `DamageModifier`=3, `ScriptName`='npc_th_master_klem' WHERE `entry`=46342;
UPDATE `creature_template` SET `unit_flags`=0, `type_flags`=0, `DamageModifier`=3, `ScriptName`='npc_th_mia_the_rose' WHERE `entry`=46343;

DELETE FROM `creature_text` WHERE `entry`=46343;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46343,0,0,'I knew you were coming. No one can resist me, not even you!',14,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `ScriptName`='npc_th_mr_goldmine' WHERE `entry`=46243;

DELETE FROM `spell_target_position` WHERE `id` = '86625';
INSERT INTO `spell_target_position` (`id`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(86625, -5276.82, -4412.60, 402.88, 2.52);

DELETE FROM `conditions` WHERE `SourceEntry` = '27711' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27711, 27702, 0),
(20, 8, 27711, 27719, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27711' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27711, 27702, 0),
(19, 8, 27711, 27719, 0);

UPDATE `quest_template` SET `NextQuestIdChain`=27702 WHERE `Id`=27700;

DELETE FROM `creature_addon` WHERE `guid` = '757176';
INSERT INTO `creature_addon` (`guid`, `bytes1`, `auras`) VALUES
(757176, '65539','49414');

-- ELM General Purpose Bunny
SET @ENTRY := 23837;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,54,0,100,0,0,0,0,0,11,52388,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"ELM General Purpose Bunny - Just summoned - Spellcast Ritual Bunny Channel"),
(@ENTRY,@SOURCETYPE,1,0,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,28671,30,0,0.0,0.0,0.0,0.0,"ELM General Purpose Bunny - Just summoned - Set data 0 1 Prophet of Quetz'lun"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,0,1000,1000,120000,120000,11,84990,0,0,0,0,0,10,757176,46456,0,0.0,0.0,0.0,0.0,"OOC - Cast Chains");

DELETE FROM `creature_addon` WHERE `guid` IN (757182,757181,757183,757172,757177,757178);
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES
(757181, '49414'),
(757182, '49414'),
(757183, '49414'),
(757172, '49414'),
(757177, '49414'),
(757178, '49414');

DELETE FROM `spell_area` WHERE `spell` = '49416' AND `quest_start` = '27700';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49416, 5473, 27700, 27700, 1, 8, 11);

DELETE FROM `spell_area` WHERE `spell` = '49416' AND `quest_start` = '27701';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49416, 5473, 27701, 27701, 1, 8, 11);

UPDATE `quest_template` SET `NextQuestIdChain`=0 WHERE `Id` IN (27703, 27798);

DELETE FROM `conditions` WHERE `SourceEntry` = '27712' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27712, 27798, 0),
(20, 8, 27712, 27703, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27712' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27712, 27798, 0),
(19, 8, 27712, 27703, 0);

DELETE FROM `item_script_names` WHERE `Id` = '62230';
INSERT INTO `item_script_names` (`Id`, `ScriptName`) VALUES
(62230, 'item_th_the_elementium_axe');

UPDATE `creature_template` SET `minlevel`=88, `maxlevel`=88, `exp`=3, `unit_flags`=768 WHERE `entry`=46452;

DELETE FROM `creature_text` WHERE `entry`=46456;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46456,0,0,'$n, is that you? Please free me from these chains.',12,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `ScriptName`='npc_th_lirastrasza_unchained' WHERE `entry`=46452;

DELETE FROM `creature_text` WHERE `entry`=46452;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46452,0,0,'I am eternally grateful to you, $n.',12,0,100,0,0,0,'Comment'),
(46452,1,0,'I\'ll take care of the drakes. You worry about the rest of the Twilight rubbish.',12,0,100,0,0,0,'Comment');

DELETE FROM `spell_script_names` WHERE `spell_id` = '86466';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(86466, 'spell_th_the_elementium_axe');

UPDATE `creature_template` SET `InhabitType`=5 WHERE `entry`=46452;
UPDATE `creature_template_addon` SET `bytes1`=7, `auras`='' WHERE `entry`=46416;
UPDATE `creature_template` SET `faction`=31, `npcflag`=1, `unit_flags`=0, `InhabitType`=3, `dynamicflags`=32 WHERE `entry`=46416;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `spawntimesecs`=60 WHERE `id`=46416;
UPDATE `creature_template` SET `IconName`='openhandglow', `ScriptName`='npc_th_twilight_skyterror' WHERE `entry`=46416;

-- Twilight Skyterror
SET @ENTRY := 46416;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="" WHERE entry=@ENTRY LIMIT 1;

-- Position update for Twilight Skyterror (id: 46416) in zone: 4922, area: 5473
UPDATE `creature` SET `position_x` = -4915.369, `position_y` = -4436.282, `position_z` = 322.035, `orientation`= 2.359 WHERE `guid` = 757425;

-- Position update for Twilight Skyterror (id: 46416) in zone: 4922, area: 5473
UPDATE `creature` SET `position_x` = -4947.450, `position_y` = -4445.920, `position_z` = 332.196, `orientation`= 2.498 WHERE `guid` = 757481;

-- Position update for Twilight Skyterror (id: 46416) in zone: 4922, area: 5473
UPDATE `creature` SET `position_x` = -4977.116, `position_y` = -4483.822, `position_z` = 337.812, `orientation`= 0.933 WHERE `guid` = 757482;

-- Position update for Twilight Skyterror (id: 46416) in zone: 4922, area: 5473
UPDATE `creature` SET `position_x` = -5127.998, `position_y` = -4672.853, `position_z` = 355.983, `orientation`= 2.909 WHERE `guid` = 757485;

-- Position update for Twilight Skyterror (id: 46416) in zone: 4922, area: 5473
UPDATE `creature` SET `position_x` = -5054.226, `position_y` = -4381.831, `position_z` = 362.231, `orientation`= 6.089 WHERE `guid` = 757391;

-- Position update for Twilight Skyterror (id: 46416) in zone: 4922, area: 5473
UPDATE `creature` SET `position_x` = -5070.100, `position_y` = -4394.432, `position_z` = 358.030, `orientation`= 2.565 WHERE `guid` = 757391;

-- Position update for Twilight Skyterror (id: 46416) in zone: 4922, area: 5473
UPDATE `creature` SET `position_x` = -4728.099, `position_y` = -4319.762, `position_z` = 316.351, `orientation`= 0.274 WHERE `guid` = 757280;

-- Position update for Twilight Skyterror (id: 46416) in zone: 4922, area: 5503
UPDATE `creature` SET `position_x` = -5152.784, `position_y` = -4515.242, `position_z` = 355.799, `orientation`= 6.237 WHERE `guid` = 757490;

-- Position update for Twilight Skyterror (id: 46416) in zone: 4922, area: 5473
UPDATE `creature` SET `position_x` = -5158.905, `position_y` = -4464.852, `position_z` = 366.348, `orientation`= 0.059 WHERE `guid` = 757483;

-- Position update for Twilight Skyterror (id: 46416) in zone: 4922, area: 5473
UPDATE `creature` SET `position_x` = -5127.998, `position_y` = -4672.853, `position_z` = 355.983, `orientation`= 2.909 WHERE `guid` = 757485;

-- Position update for Twilight Skyterror (id: 46416) in zone: 4922, area: 5473
UPDATE `creature` SET `position_x` = -4692.462, `position_y` = -4156.111, `position_z` = 347.601, `orientation`= 0.038 WHERE `guid` = 160900;

UPDATE `quest_template` SET `PrevQuestId`='27720' WHERE `Id` IN (27742, 27743);
UPDATE `creature_template` SET `VehicleId`=1193 WHERE `entry`=46485;
UPDATE `creature_template` SET `ScriptName`='npc_th_goldmine_cart' WHERE `entry`=46485;

DELETE FROM `script_waypoint` WHERE `entry` = '46485';
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES
(46485, 1, -5275.89, -4413.07, 402.87, 'Goldmine Minecart WP'),
(46485, 2, -5305.24, -4393.17, 403.44, 'Goldmine Minecart WP'),
(46485, 3, -5316.06, -4387.74, 404.93, 'Goldmine Minecart WP'),
(46485, 4, -5325.66, -4384.84, 404.85, 'Goldmine Minecart WP'),
(46485, 5, -5335.68, -4384.96, 403.65, 'Goldmine Minecart WP'),
(46485, 6, -5346.22, -4388.00, 403.90, 'Goldmine Minecart WP'),
(46485, 7, -5357.22, -4393.89, 404.84, 'Goldmine Minecart WP'),
(46485, 8, -5366.16, -4401.39, 405.11, 'Goldmine Minecart WP'),
(46485, 9, -5370.59, -4407.97, 404.07, 'Goldmine Minecart WP'),
(46485, 10, -5372.99, -4419.39, 403.38, 'Goldmine Minecart WP'),
(46485, 11, -5372.11, -4433.13, 400.81, 'Goldmine Minecart WP'),
(46485, 12, -5375.50, -4455.85, 392.54, 'Goldmine Minecart WP'),
(46485, 13, -5384.29, -4474.79, 382.34, 'Goldmine Minecart WP'),
(46485, 14, -5391.25, -4482.82, 377.02, 'Goldmine Minecart WP'),
(46485, 15, -5408.18, -4494.45, 367.93, 'Goldmine Minecart WP'),
(46485, 16, -5421.70, -4500.32, 363.12, 'Goldmine Minecart WP'),
(46485, 17, -5435.97, -4502.91, 362.23, 'Goldmine Minecart WP'),
(46485, 18, -5446.46, -4504.80, 331.78, 'Goldmine Minecart WP'),
(46485, 19, -5452.11, -4476.55, 329.00, 'Goldmine Minecart WP'),
(46485, 20, -5454.05, -4464.82, 328.64, 'Goldmine Minecart WP'),
(46485, 21, -5457.14, -4452.32, 328.28, 'Goldmine Minecart WP'),
(46485, 22, -5459.50, -4441.22, 335.08, 'Goldmine Minecart WP');

DELETE FROM `spell_area` WHERE `spell` = '86739' AND `quest_start` = '27720';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(86739, 5474, 27720, 27745, 1, 66, 11);

UPDATE `quest_template` SET `PrevQuestId`='27720' WHERE `Id`=27744;
UPDATE `creature_template` SET `unit_flags`=0, `unit_flags2`=2048, `dynamicflags`=0 WHERE `entry` IN (46579, 46578, 46610);
DELETE FROM `creature_template_addon` WHERE `entry` IN (46579, 46578, 46610);

-- Position update for Depths Overseer (id: 46579) in zone: 4922, area: 5474
UPDATE `creature` SET `position_x` = -5256.606, `position_y` = -4404.324, `position_z` = 398.658, `orientation`= 4.815 WHERE `guid` = 757400;

-- Position update for Twilight Miner (id: 46578) in zone: 4922, area: 5473
UPDATE `creature` SET `position_x` = -5261.999, `position_y` = -4436.429, `position_z` = 396.030, `orientation`= 5.837 WHERE `guid` = 757401;

UPDATE `creature` SET `unit_flags`=768, `dynamicflags`=32 WHERE `guid` IN
(757400, 757397, 757396, 757395, 757399, 757401, 160981, 757234, 757328);

-- Deletes creature Twilight Miner (id: 46610, guid: 161022) in zone: 4922, area: 5474
DELETE FROM `creature` WHERE `guid` = 161022; DELETE FROM creature_addon WHERE guid = 161022;

-- Deletes creature Elementium Spinner (id: 46580, guid: 757514) in zone: 4922, area: 5474
DELETE FROM `creature` WHERE `guid` = 757514; DELETE FROM creature_addon WHERE guid = 757514;

-- Deletes creature Twilight Miner (id: 46610, guid: 757513) in zone: 4922, area: 5474
DELETE FROM `creature` WHERE `guid` = 757513; DELETE FROM creature_addon WHERE guid = 757513;

-- Deletes creature Twilight Miner (id: 46578, guid: 161016) in zone: 4922, area: 5474
DELETE FROM `creature` WHERE `guid` = 161016; DELETE FROM creature_addon WHERE guid = 161016;

-- Deletes creature Twilight Miner (id: 46610, guid: 161012) in zone: 4922, area: 5474
DELETE FROM `creature` WHERE `guid` = 161012; DELETE FROM creature_addon WHERE guid = 161012;

-- Deletes creature Twilight Miner (id: 46578, guid: 160995) in zone: 4922, area: 5474
DELETE FROM `creature` WHERE `guid` = 160995; DELETE FROM creature_addon WHERE guid = 160995;

DELETE FROM `creature_addon` WHERE `guid` IN (757400, 757397, 757396, 757395, 757399, 757401, 160981, 757234, 757328);
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES
(757400, '29266'),
(757397, '29266'),
(757396, '29266'),
(757395, '29266'),
(757399, '29266'),
(757401, '29266'),
(160981, '29266'),
(757234, '29266'),
(757328, '29266');

DELETE FROM `creature_text` WHERE `entry`=46513;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46513,0,0,'Ooh, this is gonna be good!',12,0,100,0,0,0,'Comment'),
(46513,1,0,'Hang on!',12,0,100,0,0,0,'Comment'),
(46513,2,0,'OH NO!',14,0,100,0,0,0,'Comment'),
(46513,3,0,'JUMP!!!',14,0,100,0,0,0,'Comment'),
(46513,4,0,'You destroyed their Earth rune! I bet there are three others. And, I bet they\'re all linked to the fire portal in the back',12,0,100,0,0,0,'Comment'),
(46513,5,0,'We better destroy them all. But first, I need to get the shrapnel out of my backside.',12,0,100,0,0,0,'Comment'),
(46513,6,0,'Did you get wet? I\'m soaked! Okay, what do you want to bet the next rune is attuned to air?',12,0,100,0,0,0,'Comment'),
(46513,7,0,'That blast of air totally dried my hair. That gives me a great idea for a spare flying machine engine!',12,0,100,0,0,0,'Comment'),
(46513,8,0,'Ahahahaha, that\'s the last of their runes! Twilight Suckers, no more elemental power for you!',12,0,100,0,0,0,'Comment'),
(46513,9,0,'Magmatooth?! NOOOOOOOOO!',14,0,100,0,0,0,'Comment'),
(46513,10,0,'Oh yeah? Um... get him!',14,0,100,0,0,0,'Comment'),
(46513,11,0,'Take this, you ungrateful elemental. After all I\'ve done for you!',14,0,100,0,0,0,'Comment');

UPDATE `gameobject_template` SET `AIName`='', `ScriptName`='go_th_twilight_rune_of_fire' WHERE `entry`=206313;
UPDATE `gameobject_template` SET `AIName`='', `ScriptName`='go_th_twilight_rune_of_air' WHERE `entry`=206312;
UPDATE `gameobject_template` SET `AIName`='', `ScriptName`='go_th_twilight_rune_of_water' WHERE `entry`=206314;
UPDATE `creature_template` SET `ScriptName`='npc_th_twilight_rune_of_earth', `modelid1`=36783 WHERE `entry`=46671;

DELETE FROM `creature_text` WHERE `entry`=46611;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46611,0,0,'GOLDMINE! YOU THINK I\'VE FORGOTTEN?! I TOLD YOU THAT I\'D GET MY REVENGE!!!',14,0,100,0,0,0,'Comment'),
(46611,1,0,'YOU\'RE BOTH GOING TO BURN!',14,0,100,0,0,0,'Comment'),
(46611,2,0,'AHAHAHAHAHAHA, FIRE? REALLY?',14,0,100,0,0,0,'Comment'),
(46611,3,0,'YOU\'RE NEXT JUST AS SOON AS I FINISH OFF YOUR FRIEND HERE!',14,0,100,0,0,0,'Comment'),
(46611,4,0,'I\'LL GET YOU, GOLDMINE!',14,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `DamageModifier`=1 WHERE `entry`=46513;
UPDATE `creature_template` SET `ScriptName`='npc_th_magmatooth', `DamageModifier`=3.6 WHERE `entry`=46611;

DELETE FROM `spell_script_names` WHERE `spell_id` = '86873';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(86873, 'spell_th_fire_portal_controller');

UPDATE `creature_template` SET `ScriptName`='npc_th_gurgthock' WHERE `entry`=46935;

-- Deletes creature Pool of Lava (id: 48549, guid: 757949) in zone: 4922, area: 5527
DELETE FROM `creature` WHERE `guid` = 757949; DELETE FROM creature_addon WHERE guid = 757949;

-- Deletes creature Pool of Lava (id: 48549, guid: 757950) in zone: 4922, area: 5527
DELETE FROM `creature` WHERE `guid` = 757950; DELETE FROM creature_addon WHERE guid = 757950;

-- Deletes creature Pool of Lava (id: 48549, guid: 758256) in zone: 4922, area: 5527
DELETE FROM `creature` WHERE `guid` = 758256; DELETE FROM creature_addon WHERE guid = 758256;

-- Deletes creature Pool of Lava (id: 48549, guid: 758255) in zone: 4922, area: 5527
DELETE FROM `creature` WHERE `guid` = 758255; DELETE FROM creature_addon WHERE guid = 758255;

UPDATE `creature_template` SET `ScriptName`='npc_th_hurp_derp', `mechanic_immune_mask`=613097436, `DamageModifier`=16.5 WHERE `entry`=46944;
UPDATE `creature_template` SET `ScriptName`='npc_th_torg_drakeflayer', `mechanic_immune_mask`=613097436, `DamageModifier`=17.5 WHERE `entry`=46945;
UPDATE `creature_template` SET `ScriptName`='npc_th_sully_kneecapper', `mechanic_immune_mask`=613097436, `DamageModifier`=18.5 WHERE `entry`=46946;
UPDATE `creature_template` SET `ScriptName`='npc_th_cadaver_collage', `mechanic_immune_mask`=613097436, `DamageModifier`=19.5 WHERE `entry`=46947;
UPDATE `creature_template` SET `ScriptName`='npc_th_lord_geoffery_tulvan', `mechanic_immune_mask`=613097436, `DamageModifier`=20 WHERE `entry`=46948;
UPDATE `creature_template` SET `ScriptName`='npc_th_emberscar_the_devourer', `mechanic_immune_mask`=613097436, `DamageModifier`=21 WHERE `entry`=46949;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=47476;

DELETE FROM `creature_text` WHERE `entry`=46945;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46945,0,0,'All of the highlands belong to the Dragonmaw, even this pit!',14,0,100,0,0,0,'Comment'),
(46945,1,0,'Pitiful meat bags! Feel the full force of the Dragonmaw!',14,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=46946;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46946,0,0,'All of the highlands belong to the Wildhammer, even this pit!',14,0,100,0,0,0,'Comment'),
(46946,1,0,'Pitiful meat bags! Feel the full force of the Wildhammer!',14,0,100,0,0,0,'Comment');

UPDATE `quest_template` SET `RequiredNpcOrGo1`=46945, `RequiredNpcOrGoCount1`=1 WHERE `Id`=27864;
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry` IN (46945, 46946);
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=47482;

-- Gloomwing
SET @ENTRY := 47476;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,89,35,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Random Move"),
(@ENTRY,@SOURCETYPE,1,0,54,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Set Passive"),
(@ENTRY,@SOURCETYPE,2,0,54,0,100,0,0,0,0,0,18,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Set Not Attackable"),
(@ENTRY,@SOURCETYPE,3,0,1,0,100,0,2500,2500,3000,3000,11,88515,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Cast Fireball");

-- Jora "Nobbly" Wildwing
SET @ENTRY := 47482;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,89,35,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Random Move"),
(@ENTRY,@SOURCETYPE,1,0,54,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Set Passive"),
(@ENTRY,@SOURCETYPE,2,0,54,0,100,0,0,0,0,0,18,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Set Not Attackable"),
(@ENTRY,@SOURCETYPE,3,0,1,0,100,0,2500,2500,3000,3000,11,88530,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Cast Stormhammer");

UPDATE `quest_template` SET `RequiredNpcOrGo1`=46946, `RequiredNpcOrGoCount1`=1 WHERE `Id`=27865;

DELETE FROM `creature_text` WHERE `entry`=46935;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46935,0,0,'The grand Crucible of Carnage awaits, $n. Remember, once a battle starts you have to stay in the arena. WIN OR DIE!',12,0,100,0,0,0,'Comment'),
(46935,1,0,'Here we are once again, ladies and gentlemen. The epic struggle between life and death in the Crucible of Carnage! For this round we have $n versus... a really fat ogre? Wait, seriously?! That\'s all we could come up with on short notice? What am I paying you for?',14,0,100,0,0,0,'Comment'),
(46935,2,0,'Whatever, let the fight begin!',14,0,100,0,0,0,'Comment'),
(46935,3,0,'W-W-W-WINNER! We have a winner! Good job and stuff!',14,0,100,0,0,0,'Comment'),
(46935,4,0,'The battle is about to begin! $n vs. the vicious Dragonmaw Tork Drakeflayer! I THINK he\'s vicious anyway - hard to tell. I just let him because they let us take over their old arena here. Here\'s hoping for some blood!',14,0,100,0,0,0,'Comment'),
(46935,5,0,'Bah, couldn\'t you have dragged it out a bit! People don\'t pay me when you make it look that easy! Add some theatricts to it, will ya?!',14,0,100,0,0,0,'Comment'),
(46935,6,0,'The battle is about to begin! $n vs. the vicious Sully Kneecapper! I THINK he\'s vicious anyway - hard to tell. I just let him because they let us take over their old arena here. Here\'s hoping for some blood!',14,0,100,0,0,0,'Comment'),
(46935,7,0,'Imagine my surprise when I was approached by the genius forsaken, Calder Gray, and propositioned with a combatant made of all the best features of our previous champions... LITERALLY! Who could refuse a chance to challenge CALDER\'S CREATION?!',14,0,100,0,0,0,'Comment'),
(46935,8,0,'You know what they say... if you can\'t beat \'em, join \'em! And in this case, you won\'t have the choice! Crucible of Carnage, I adore you so.',14,0,100,0,0,0,'Comment'),
(46935,9,0,'OOOOOOOH! Check that mess out! Amazing win! Way to stick it through him!',14,0,100,0,0,0,'Comment'),
(46935,10,0,'All that\'s left of the challenger is a red stain on the floor!',14,0,100,0,0,0,'Comment'),
(46935,11,0,'Hailing from the semi-distant wreck of a landscape that was once Gilneas, our champion arises! Keep your pants up $n, you don\'t want to show this guy a full moon!',14,0,100,0,0,0,'Comment'),
(46935,12,0,'There\'s no denying it - they really put that dog down! So much for our former champion!',14,0,100,0,0,0,'Comment'),
(46935,13,0,'It looks like we have one more challenger yet to face though, so let\'s get those wagers in!',14,0,100,0,0,0,'Comment'),
(46935,14,0,'The Twilight\'s Hammer: happy to serve local nefarious schemes anytime, anyhwere. And today is no exception! Our final combatant hails from the not so distant Bastion of Twilight! Or is it the Twilight Bastion... bah, who acres!',14,0,100,0,0,0,'Comment'),
(46935,15,0,'You all love to hate him, and he\'s glad to shower his hate right back down on ya. LETS... GET... BLOODY!!!',14,0,100,0,0,0,'Comment'),
(46935,16,0,'I DON\'T BELIEVE IT! WE HAVE A NEW CHAMPION OF CARNAGE!!! Our big, bad beefly challenger has been defeated by a ragtag crew of nobodies! Incredible finish!',14,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=46947;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46947,0,0,'Calder said that if I kill you, I get to have your parts!',14,0,100,0,0,0,'Comment'),
(46947,1,0,'Eww! Get away from me, you nasty thing!',14,0,100,0,0,0,'Comment'),
(46947,2,0,'As you wish, Daddy!',14,0,100,0,0,0,'Comment'),
(46947,3,0,'Oh! Too full... oh no...',14,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=52266;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(52266,0,0,'Go forth, my beautiful angel! Ah, it is so very sad when one\'s children leave the nest, isn\'t it?',14,0,100,0,0,0,'Comment'),
(52266,1,0,'It\'s time for your ultimate attack, my darling!',14,0,100,0,0,0,'Comment'),
(52266,2,0,'What... my creation! It didn\'t even blot out the sky! I\'d better recheck my notes...',14,0,100,0,0,0,'Comment'),
(52266,3,0,'Your bodies are all magnificient! If you\'d be willing to take a small whiff of this chloroform, I promise that you will all wake up 10 times stronger and 100 timres more... unified in purpose.',14,0,100,0,0,0,'Comment'),
(52266,4,0,'No? Well... my offer stands. Just come by anytime and I\'ll be glad to give you the makeover you\'ve always dreamed of.',14,0,100,0,0,0,'Comment');

-- Calder Gray
SET @ENTRY := 52266;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,1,0,7000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Talk 0");

UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3 WHERE `entry`=48591;

-- Poison Cloud
SET @ENTRY := 48591;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Set Unselectable"),
(@ENTRY,@SOURCETYPE,1,0,54,0,100,0,0,0,0,0,75,90449,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Add Poison Aura");

UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=46947;
UPDATE `quest_template` SET `RequiredNpcOrGo1`=46947, `RequiredNpcOrGoCount1`=1 WHERE `Id`=27866;
UPDATE `creature_template` SET `ScriptName`='npc_th_lord_geoffery_tulvan', `mechanic_immune_mask`=613097436, `DamageModifier`=16.5 WHERE `entry`=46948;UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=14, `unit_flags`=768 WHERE `entry` IN (52266, 46948, 47517);
UPDATE `quest_template` SET `Flags`=137429122 WHERE `Id` IN (27866, 27867);
UPDATE `quest_template` SET `RequiredNpcOrGo1`=46948, `RequiredNpcOrGoCount1`=1 WHERE `Id`=27867;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '47521';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(47521, 46598, 0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '46948';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(46948, 46598, 0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '47523';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(47523, 46598, 0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '47517';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(47517, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '47521';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(47521, 47523, 2, 0, 'Carriage Harness -> Stagecoach Carriage', 8, 0),
(47521, 47522, 0, 0, 'Carriage Harness -> Stagecoach Horse', 8, 0),
(47521, 47522, 1, 0, 'Carriage Harness -> Stagecoach Horse', 8, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '47523';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(47523, 46948, 0, 0, 'Stagecoach Carriage -> Lord Geoffery Tulvan', 8, 0);

DELETE FROM `creature_text` WHERE `entry`=46948;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46948,0,0,'Why hello chaps, I have a not so surprising surprise for you this eve.',14,0,100,0,0,0,'Comment'),
(46948,1,0,'I dare say I\'ve had enough of this. Time to bring out... THE BEAST WITHIN!',14,0,100,0,0,0,'Comment'),
(46948,2,0,'Enough toying around! It\'s time to get my hands dirty!',14,0,100,0,0,0,'Comment'),
(46948,3,0,'Grab a seat, chaps. Let me coach you on some true carnage!',14,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `ScriptName`='npc_th_geoffery_harness' WHERE `entry`=47521;

-- Deletes creature Carriage Harness (id: 47521, guid: 764931) in zone: 4922, area: 5527
DELETE FROM `creature` WHERE `guid` = 764931; DELETE FROM creature_addon WHERE guid = 764931;

-- Deletes creature Hurp'derp (id: 46944, guid: 764924) in zone: 4922, area: 5527
DELETE FROM `creature` WHERE `guid` = 764924; DELETE FROM creature_addon WHERE guid = 764924;

-- Deletes creature Hurp'derp (id: 46944, guid: 764923) in zone: 4922, area: 5527
DELETE FROM `creature` WHERE `guid` = 764923; DELETE FROM creature_addon WHERE guid = 764923;

-- Deletes creature Lord Geoffery Tulvan (id: 46948, guid: 764935) in zone: 4922, area: 5527
DELETE FROM `creature` WHERE `guid` = 764935; DELETE FROM creature_addon WHERE guid = 764935;

-- Deletes creature Hurp'derp (id: 46944, guid: 764922) in zone: 4922, area: 5527
DELETE FROM `creature` WHERE `guid` = 764922; DELETE FROM creature_addon WHERE guid = 764922;

-- Deletes creature Gloomwing (id: 47476, guid: 771224) in zone: 4922, area: 5527
DELETE FROM `creature` WHERE `guid` = 771224; DELETE FROM creature_addon WHERE guid = 771224;

-- Deletes creature Jora "Nobbly" Wildwing (id: 47482, guid: 764926) in zone: 4922, area: 5527
DELETE FROM `creature` WHERE `guid` = 764926; DELETE FROM creature_addon WHERE guid = 764926;

-- Deletes creature Cadaver Collage (id: 46947, guid: 764928) in zone: 4922, area: 5527
DELETE FROM `creature` WHERE `guid` = 764928; DELETE FROM creature_addon WHERE guid = 764928;

-- Deletes creature Torg Drakeflayer (id: 46945, guid: 771223) in zone: 4922, area: 5527
DELETE FROM `creature` WHERE `guid` = 771223; DELETE FROM creature_addon WHERE guid = 771223;

-- Deletes creature Torg Drakeflayer (id: 48383, guid: 764070) in zone: 4922, area: 5527
DELETE FROM `creature` WHERE `guid` = 764070; DELETE FROM creature_addon WHERE guid = 764070;

-- Deletes creature Lord Geoffery Wildwolf (id: 47517, guid: 771222) in zone: 4922, area: 5527
DELETE FROM `creature` WHERE `guid` = 771222; DELETE FROM creature_addon WHERE guid = 771222;

UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=14 WHERE `entry`=47525;
UPDATE `quest_template` SET `Flags`=135331970 WHERE `Id`=27867;

DELETE FROM `creature_text` WHERE `entry`=46949;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46949,0,0,'This land shall be purged in the Twilight\'s Flame!',14,0,100,0,0,0,'Comment'),
(46949,1,0,'Burn in the liquid heat of the Firelands!',14,0,100,0,0,0,'Comment'),
(46949,2,0,'Even the skies burn with my fury!',14,0,100,0,0,0,'Comment');

UPDATE `quest_template` SET `Flags`=134283394, `RequiredNpcOrGo1`=46949, `RequiredNpcOrGoCount1`=1 WHERE `Id`=27868;
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=46949;

DELETE FROM `creature` WHERE `guid` IN (757949, 757950, 758255, 758256);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(757949, 48549, 0, 1, 1, 0, 0, -4200.7, -5113.98, -7.21252, 0, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(757950, 48549, 0, 1, 1, 0, 0, -4215.43, -5161.92, -7.41296, 0, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(758255, 48549, 0, 1, 1, 0, 0, -4191.13, -5185.39, -7.3212, 0, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(758256, 48549, 0, 1, 1, 0, 0, -4157.14, -5150.8, -7.52785, 0, 120, 0, 0, 1, 0, 0, 0, 0, 0);

UPDATE `creature_template` SET `unit_flags`=768, `unit_flags2`=4096, `DamageModifier`=1 WHERE `entry`=48549;

-- Deletes creature Emberscar the Devourer (id: 46949, guid: 764936) in zone: 4922, area: 5527
DELETE FROM `creature` WHERE `guid` = 764936; DELETE FROM creature_addon WHERE guid = 764936;

UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry` IN (48549, 48538);

UPDATE `creature_template` SET `ScriptName`='npc_th_lava_pool' WHERE `entry`=48549;
UPDATE `creature_template` SET `modelid2`=1126 WHERE `entry`=51445;
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `flags_extra`=128 WHERE `entry`=51445;
UPDATE `creature_template_addon` SET `auras`='87266 89476' WHERE `entry`=46717;
UPDATE `creature_template` SET `modelid1`=35324 WHERE `entry`=46717;

DELETE FROM `spell_area` WHERE `spell` = '94567' AND `quest_start` = '27784';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(94567, 5584, 27784, 27787, 0, 0, 2, 1, 66, 11);

UPDATE `creature_template` SET `modelid2`=22452, `minlevel`=85, `maxlevel`=85, `exp`=3, `VehicleId`=1228, `InhabitType`=4, `ScriptName`='npc_th_skullcrusher_camera' WHERE `entry`=46904;
UPDATE `creature_template` SET `ScriptName`='npc_th_the_hammer_of_twilight' WHERE `entry`=46717;
UPDATE `creature` SET `phaseMask`=8193 WHERE `guid`=89842;

DELETE FROM `spell_target_position` WHERE `id` IN (87362, 87363, 87357, 87358);
INSERT INTO `spell_target_position` (`id`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(87362, -5242.68, -4822.28, 444.42, 4.11),
(87363, -5242.36, -4821.71, 444.42, 4.07),
(87358, -5254.46, -4815.46, 444.42, 5.90),
(87357, -5229.95, -4815.68, 444.46, 4.11);

DELETE FROM `creature_text` WHERE `entry`=46900;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46900,0,0,'Back, vermin! (Insects! Weak and small!)',14,0,100,0,0,22110,'Comment'),
(46900,1,0,'Look, mortal, upon the instrument of your undoing. (The Hammer, hand of the Gods Below.) Forged of molten blood... (...gift of the master. His gift!) Shaped upon the Last Altar of Storm.',14,0,100,1,0,22111,'Comment'),
(46900,2,0,'The Hammer of Twilight. (The Hammer of Twilight!) Commissioned by the Aspect of Death. It is the breaker of worlds. It is not yours to wield. (Kill the intruders!) Kill them all!',14,0,100,1,0,22112,'Comment'),
(46900,3,0,'What Deathwing has set in motion... (...no man can stop.) No man! Least of all you wretches! (Show them. Show them their end!)',14,0,100,1,0,22117,'Comment');

DELETE FROM `conditions` WHERE `SourceEntry` = '91712';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 91712, 0, 0, 31, 0, 3, 46905, 0, 0, 0, '', 'Targeting -> Mirror');

UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry` IN (46895, 45669, 46892, 46732);
UPDATE `creature_template` SET `mechanic_immune_mask`=613097436, `ScriptName`='npc_th_skullcrusher_fight' WHERE `entry`=46732;
UPDATE `creature_template` SET `mechanic_immune_mask`=613097436, `ScriptName`='npc_th_skullcrusher_fighters', `DamageModifier`=7 WHERE `entry` IN (46895, 45669, 46892);
UPDATE `creature_template` SET `npcflag`=0, `ScriptName`='npc_th_elemental_altars' WHERE `entry` IN (50638, 50635, 50643, 50636, 50640);

DELETE FROM `creature_text` WHERE `entry`=45669;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(45669,0,0,'He\'s too powerful! You\'ve got to find a way to use those altars to give us an edge!',12,0,100,0,0,0,'Comment'),
(45669,1,0,'Revive your fallen companion by right-clicking on their unconscious body!',41,0,100,0,0,0,'Comment'),
(45669,2,0,'We cannot hold out against power of this magnitude! You must use the horn!',12,0,100,0,0,0,'Comment'),
(45669,3,0,'Blow into the Wildhammer horn to call for reinforcements!',41,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=50612;
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `InhabitType`=4 WHERE `entry`=50599;

DELETE FROM `creature_text` WHERE `entry`=46732;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46732,0,0,'I am the favored of the master Cho\'gall. I WILL NOT FALL TO YOU.',14,0,100,0,0,0,'Comment'),
(46732,1,0,'The Wildhammer horn falls from Kurdran\'s unconscious body!',41,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `ScriptName`='npc_th_horn_and_drums', `npcflag`=1 WHERE `entry` IN (50653, 50655);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (50599, 50612);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(50599, 46598, 0),
(50612, 46598, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '50599';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(50599, 50600, 1, 'Dragonmaw Skyclaw on Black Drake ', 8, 0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '50612';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(50612, 50603, 1, 'Wildhammer Hellion on Gryphon ', 8, 0);

DELETE FROM `creature_text` WHERE `entry`=50599;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(50599,0,0,'For the Wildhammer!',14,0,100,0,0,0,'Comment');

-- Dragonmaw Black Drake
SET @ENTRY := 50599;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,2000,2000,60000,60000,1,0,8000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,8000,8000,60000,60000,28,93835,0,0,0,0,0,11,46732,1000,0,0.0,0.0,0.0,0.0,"OOC - Remove Blessing of Chogall");

-- Wildhammer Gryphon
SET @ENTRY := 50612;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,2000,2000,60000,60000,1,0,8000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,8000,8000,60000,60000,28,93835,0,0,0,0,0,11,46732,1000,0,0.0,0.0,0.0,0.0,"OOC - Remove Blessing of Chogall");

UPDATE `creature_template` SET `IconName`='Interact' WHERE `entry`=50640;

DELETE FROM `creature_text` WHERE `entry`=50612;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(50612,0,0,'For the Wildhammer!',14,0,100,0,0,0,'Comment');

-- INTRO QUESTS FOR TWILIGHT HIGHLANDS (Horde)

DELETE FROM `creature_text` WHERE `entry`=42671;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(42671,0,0,'Ready for inspection, sir!',12,0,100,1,0,0,'Comment'),
(42671,1,0,'See that? Ironclad!',12,0,100,1,0,0,'Comment'),
(42671,2,0,'This baby is all mine! I call her, "The Throttler."',12,0,100,1,0,0,'Comment'),
(42671,3,0,'That\'s right. Takes a lickin\' but keeps on kickin\' butt!',12,0,100,1,0,0,'Comment'),
(42671,4,0,'Ready for inspection! ...Be gentle.',12,0,100,1,0,0,'Comment'),
(42671,5,0,'Uh oh. Um. Oops.',12,0,100,1,0,0,'Comment'),
(42671,6,0,'Look, look, it\'s okay! It\'s just a tiny little glitch. See?',12,0,100,1,0,0,'Comment'),
(42671,7,0,'A little paint and it\'ll be fine!',12,0,100,1,0,0,'Comment'),
(42671,8,0,'It\'s still good enough to ship. I can fix it with a patch!',12,0,100,1,0,0,'Comment'),
(42671,9,0,'I ... I never wanted to be an engineer anyways.',12,0,100,1,0,0,'Comment'),
(42671,10,0,'I always wanted to be... a dancer! Power tools frighten me.',12,0,100,1,0,0,'Comment'),
(42671,11,0,'I can float. On my toes. I\'m like a butterfly. Wanna see?',12,0,100,1,0,0,'Comment');

DELETE FROM `conditions` WHERE `SourceEntry` = '79568';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 79568, 0, 0, 31, 0, 3, 42671, 0, 0, 0, '', 'Targeting -> Chief');

DELETE FROM `conditions` WHERE `SourceEntry` = '79545';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 79545, 0, 0, 31, 0, 3, 42673, 0, 0, 0, '', 'Targeting -> Demolisher');

UPDATE `creature_template` SET `npcflag`=1, `ScriptName`='npc_th_hellscream_demolisher' WHERE `entry`=42673;
UPDATE `creature_template` SET `ScriptName`='npc_th_chief_engineer' WHERE `entry`=42671;
UPDATE `creature` SET `spawntimesecs`=60 WHERE `id` IN (42673, 42650);

DELETE FROM `creature_text` WHERE `entry`=42650;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(42650,0,0,'We\'ll get right on this, sir!',12,0,100,0,0,0,'Comment'),
(42650,0,1,'Yes sir! Right away, sir!',12,0,100,0,0,0,'Comment'),
(42650,0,2,'We\'re on it!',12,0,100,0,0,0,'Comment');

UPDATE `quest_template` SET `PrevQuestId`='26324' WHERE `Id` IN (26335, 26358);
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=42637;
UPDATE `creature` SET `phaseMask`=1 WHERE `guid`=734105;

DELETE FROM `spell_area` WHERE `spell` = '49416' AND `quest_start` = '28909';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49416, 5356, 28909, 1, 74, 0);

UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE `menu_id`=11654 AND `id`=0;

-- Herezegor Flametusk
SET @ENTRY := 42638;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,62,0,100,0,11654,0,0,0,56,58141,1,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Add Quest Item"),
(@ENTRY,@SOURCETYPE,1,0,62,0,100,0,11654,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Close Gossip"),
(@ENTRY,@SOURCETYPE,2,0,62,0,100,0,11654,0,0,0,1,0,2000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Talk 0"),
(@ENTRY,@SOURCETYPE,3,0,52,0,100,0,0,42638,0,0,1,1,5000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"After Talk 0 - Talk 1");

DELETE FROM `conditions` WHERE `SourceGroup`=11654 AND `SourceEntry` = '0';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 11654, 0, 0, 0, 9, 0, 26311, 0, 0, 0, 0, 0, '', 'Herezegor- Show gossip only if quest 26311 is active');

DELETE FROM `creature_text` WHERE `entry`=42638;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(42638,0,0,'Flametusk scrawls out a depiction of his home port on a torn parchment.',16,0,100,0,0,0,'Comment'),
(42638,1,0,'There you have it, $n, All the safe approaches to the Twilight Highlands. Unleash havoc on our foes!',12,0,100,0,0,0,'Comment');

DELETE FROM `conditions` WHERE `SourceEntry` = '80017';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 80017, 0, 0, 31, 0, 3, 42646, 0, 0, 0, '', 'Targeting -> AWOL Grunt');

DELETE FROM `creature_text` WHERE `entry`=42646;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(42646,0,0,'Please don\'t tell the Warlord...',12,0,100,0,0,0,'Comment'),
(42646,0,1,'Sir, yes sir!',12,0,100,0,0,0,'Comment'),
(42646,1,0,'Stupid $r thinks that is the boss of me.',12,0,100,0,0,0,'Comment'),
(42646,1,1,'You want some of this!?',12,0,100,0,0,0,'Comment'),
(42646,2,0,'That\'s the best brawl I\'ve had in weeks! I\'ll save the rest for our enemies.',12,0,100,0,0,0,'Comment'),
(42646,2,1,'You fight well! I hope to have you by my side in the highlands.',12,0,100,0,0,0,'Comment'),
(42646,2,2,'Enough! I shouldn\'t have questioned your orders...',12,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `ScriptName`='npc_th_awol_grunt', `IconName`='openhandglow', `npcflag`=1 WHERE `entry`=42646;
UPDATE `creature` SET `spawntimesecs`=30 WHERE `id`=42646;
UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE `menu_id`=11659 AND `id`=0;

DELETE FROM `conditions` WHERE `SourceGroup`=11659 AND `SourceEntry` = '0';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 11659, 0, 0, 0, 9, 0, 26337, 0, 0, 0, 0, 0, '', 'Bilgewater Foreman - Show gossip only if quest 26337 is active');

-- Bilgewater Foreman
SET @ENTRY := 42777;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="" WHERE entry=@ENTRY LIMIT 1;

DELETE FROM `creature_text` WHERE `entry`=42777;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(42777,0,0,'Nobody tells me how to run my business here.',12,0,100,0,0,0,'Comment'),
(42777,1,0,'It was just a couple of rivets. Thet ship had plenty!',12,0,100,0,0,0,'Comment'),
(42777,2,0,'I\'m sure it would\'ve been seaworthy in calm waters',12,0,100,0,0,0,'Comment'),
(42777,3,0,'Less rivets mean a cleaner environment!',12,0,100,0,0,0,'Comment'),
(42777,4,0,'...can we settle this with cash?',12,0,100,0,0,0,'Comment'),
(42777,5,0,'Okay okay, stop! Stop!. You make a compelling argument.',12,0,100,0,0,0,'Comment'),
(42777,6,0,'I\'ll double the worker shifts and put in my own money to get those ships seaworthy and back on schedule. Count on it!',12,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `ScriptName`='npc_th_bilgewater_foreman' WHERE `entry`=42777;

-- Position update for Bilgewater Foreman (id: 42777) in zone: 16, area: 4821
UPDATE `creature` SET `position_x` = 3471.117, `position_y` = -6475.240, `position_z` = 20.233, `orientation`= 5.619 WHERE `guid` = 166402;

UPDATE `creature_template` SET `DamageModifier`=2 WHERE `entry`=42777;
UPDATE `creature_template` SET `IconName`='Interact', `npcflag`=1 WHERE `entry`=42644;

-- Adds Waypoint Movement to Smoot (guid: 166244, entry: 42644)
SET @GUID  := 166244;
SET @WP_ID := 1662440;
UPDATE `creature` SET `MovementType` = 2, `spawndist` = 0 WHERE `guid` = @GUID;
DELETE FROM `creature_addon` WHERE `guid` = 166244;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(166244, 1662440, 0, 0, 257, 0, '0 79919');
DELETE FROM `waypoint_data` WHERE `id` = @WP_ID;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`) VALUES
(@WP_ID, 1, 3534.650, -6486.140, 41.085, 0),
(@WP_ID, 2, 3537.190, -6469.960, 34.065, 0),
(@WP_ID, 3, 3530.890, -6453.640, 28.716, 0),
(@WP_ID, 4, 3535.980, -6429.670, 21.062, 0),
(@WP_ID, 5, 3518.220, -6423.860, 20.583, 0),
(@WP_ID, 6, 3503.690, -6431.400, 20.234, 0),
(@WP_ID, 7, 3489.850, -6448.650, 20.231, 0),
(@WP_ID, 8, 3483.230, -6456.900, 20.787, 0),
(@WP_ID, 9, 3482.400, -6473.190, 20.233, 0),
(@WP_ID, 10, 3494.770, -6485.570, 27.633, 0),
(@WP_ID, 11, 3492.480, -6508.750, 30.488, 0),
(@WP_ID, 12, 3489.830, -6535.430, 38.523, 0),
(@WP_ID, 13, 3503.430, -6546.280, 40.847, 0),
(@WP_ID, 14, 3535.240, -6552.440, 41.723, 0),
(@WP_ID, 15, 3552.690, -6543.430, 38.777, 0),
(@WP_ID, 16, 3559.880, -6526.250, 38.614, 0),
(@WP_ID, 17, 3569.750, -6510.380, 38.462, 0),
(@WP_ID, 18, 3555.370, -6500.330, 38.779, 0),
(@WP_ID, 19, 3538.220, -6493.090, 41.099, 0),
(@WP_ID, 20, 3527.000, -6496.770, 40.768, 0);

-- Smoot
SET @ENTRY := 42644;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,64,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Close Gossip"),
(@ENTRY,@SOURCETYPE,1,0,64,0,100,0,0,0,0,0,56,58224,1,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Add QuestItem"),
(@ENTRY,@SOURCETYPE,2,0,64,0,100,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Despawn"),
(@ENTRY,@SOURCETYPE,3,0,64,0,100,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Remove Gossip"),
(@ENTRY,@SOURCETYPE,4,0,64,0,100,0,0,0,0,0,85,79936,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Cast Slam"),
(@ENTRY,@SOURCETYPE,5,0,1,0,100,0,1000,1000,1000,1000,59,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Set Run"),
(@ENTRY,@SOURCETYPE,6,0,64,0,100,0,0,0,0,0,28,79919,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Remove Samophlange"),
(@ENTRY,@SOURCETYPE,7,0,64,0,100,0,0,0,0,0,1,0,5000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Talk 0");

DELETE FROM `creature_text` WHERE `entry`=42644;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(42644,0,0,'Oh samophlange... I have failed you!',12,0,100,0,0,0,'Comment');

UPDATE `creature` SET `spawntimesecs`=30 WHERE `guid`=166244;

DELETE FROM `conditions` WHERE `SourceEntry` = '28849' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 28849, 26372, 0),
(20, 8, 28849, 26337, 0),
(20, 8, 28849, 26374, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '28849' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 28849, 26372, 0),
(19, 8, 28849, 26337, 0),
(19, 8, 28849, 26374, 0);

UPDATE `creature` SET `phaseMask`=1 WHERE `guid` IN (734108, 734107, 734106);
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (43683, 42320, 43583);

UPDATE `gameobject_template` SET `ScriptName`='go_th_rope_ladder' WHERE `entry`=204353;

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '45';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 45, 2, 0, 'Twilight Highlands [H]: Add Phase 2 On Quest Complete: Twilight Skies [26388]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '45' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '26388';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 45, 0, 0, 28, 0, 26388, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '46';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 46, 2, 0, 'Twilight Highlands [H]: Add Phase 2 On Quest Rewarded: Twilight Skies [26388]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '46' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '26388';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 46, 0, 0, 8, 0, 26388, 0, 0, 0, 0, 0, '', '');

UPDATE `creature` SET `phaseMask`=2 WHERE `guid` IN (763542, 763653, 763654, 763545, 763547, 763549, 763652, 763548);
UPDATE `gameobject` SET `phaseMask`=2 WHERE `guid`=727457;

UPDATE `creature_template` SET `ScriptName`='npc_th_frizz_groundspin' WHERE `entry`=50367;

UPDATE `quest_template` SET `PrevQuestId`='26388' WHERE `Id`=26538;
UPDATE `quest_template` SET `PrevQuestId`='26608' WHERE `Id`=26619;
UPDATE `phase_definitions` SET `terrainswapmap`=736 WHERE `zoneId`=4922 AND `entry` IN (45, 46);

UPDATE `creature` SET `phaseMask`=2 WHERE `guid` IN
(763544, 763651, 763655, 763554, 755268, 763913, 763811, 763939, 763742, 763739, 763713, 763665, 763558, 763562, 763667, 763664, 763755, 763635,
763556, 755277, 763707, 763709, 763940, 763769, 763907, 763753, 763768, 763694, 763555, 763734, 755186, 763595, 763711, 763729, 763629, 755249, 763776,
763931, 763777, 763733, 763708, 763756, 763694, 763736, 763754, 763735, 763738, 763594, 763888, 763737, 763732, 763553);

UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE `menu_id`=11707 AND `id`=0;

-- Gregor
SET @ENTRY := 43191;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,62,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Close Gossip"),
(@ENTRY,@SOURCETYPE,1,0,62,0,100,0,11707,0,0,0,33,43212,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Quest Complete");

DELETE FROM `conditions` WHERE `SourceGroup`=11707 AND `SourceEntry` = '0';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 11707, 0, 0, 0, 9, 0, 26538, 0, 0, 0, 0, 0, '', 'Medicine Man - Show gossip only if quest 26538 is active');

-- Position update for Dragonmaw Worker (id: 49567) in zone: 4922, area: 5136
UPDATE `creature` SET `position_x` = -4010.128, `position_y` = -6558.156, `position_z` = 11.331, `orientation`= 3.590 WHERE `guid` = 755268;

UPDATE `creature` SET `phaseMask`=2 WHERE `guid`=763636;
UPDATE `creature_template` SET `ScriptName`='npc_th_madness_trigger' WHERE `entry`=43483;

DELETE FROM `creature_text` WHERE `entry`=43238;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(43238,0,0,'I am ready, $n. Soon the Dragonmaw will join the Horde!',12,0,100,0,0,0,'Comment'),
(43238,1,0,'I hear a great Dragonmaw medicine man lives here, in the large hut to our right.',12,0,100,0,0,0,'Comment'),
(43238,2,0,'After these negotiations, I am looking forward to a long and prosperous life.',12,0,100,0,0,0,'Comment'),
(43238,3,0,'The Dragonmaw Warchief is in the largest building up on the hilltop here. I\'m sure he\'ll be reasonable.',12,0,100,0,0,0,'Comment'),
(43238,4,0,'This is it! Stay close and let me do the talking. I\'m an expert.',12,0,100,0,0,0,'Comment'),
(43238,5,0,'Most esteemed Warchief -',12,0,100,0,0,0,'Comment'),
(43238,6,0,'Warchief, you misunderstand. Garrosh Hellscream will have a beach head on these shores, with or without your help. What we ask -',12,0,100,0,0,0,'Comment'),
(43238,7,0,'But the Horde has assembled an enormous host! A vast fleet of war machines and hardened veterans. Hellscream would as soon crush you as-',12,0,100,0,0,0,'Comment'),
(43238,8,0,'This is madness!',12,0,100,0,0,0,'Comment');

UPDATE `gameobject` SET `phaseMask`=6 WHERE `guid` IN (727456, 727447, 727446, 727448, 727445, 727449, 727443);

DELETE FROM `waypoints` WHERE `entry` = '43238';
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(43238, 1, -4062.38, -6394.03, 37.95, 'Negotiator WP'),
(43238, 2, -4084.83, -6404.12, 38.65, 'Negotiator WP'),
(43238, 3, -4087.34, -6415.27, 38.64, 'Negotiator WP'),
(43238, 4, -4089.18, -6424.29, 38.64, 'Negotiator WP'),
(43238, 5, -4095.92, -6423.63, 38.64, 'Negotiator WP'),
(43238, 6, -4105.29, -6414.85, 37.70, 'Negotiator WP'),
(43238, 7, -4107.09, -6413.99, 37.70, 'Negotiator WP');

UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3 WHERE `entry`=43238;
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=43189;

DELETE FROM `creature_text` WHERE `entry`=43189;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(43189,0,0,'Quit wasting words, worm. If you want the aid of the Dragonmaw, you should\'ve come on bent knee and with offerings of gold.',12,0,100,0,0,0,'Comment'),
(43189,1,0,'Was that a THREAT? I knew Hellscream in Outland. A whimpering whelp. He is no Warchief.',12,0,100,0,0,0,'Comment'),
(43189,2,0,'Bring him on!',12,0,100,0,0,0,'Comment'),
(43189,3,0,'This is...',12,0,100,0,0,0,'Comment'),
(43189,4,0,'DRAGONMAW!!',14,0,100,0,0,0,'Comment'),
(43189,5,0,'Keep the escorter alive, will be our bargaining chip.',12,0,100,0,0,0,'Comment'),
(43189,6,0,'Call for the others. We will crush Hellscream\'s Horde and hurl their bodies to the sea...',12,0,100,0,0,0,'Comment'),
(43189,7,0,'This pathetic revolution ends here!',12,0,100,0,0,0,'Comment'),
(43189,8,0,'Prepare to be punished! Mor\'ghor Slam!',14,0,100,0,0,0,'Comment'),
(43189,9,0,'Rghaaaa! Face me fury of Mor\'ghor!',14,0,100,0,0,0,'Comment'),
(43189,10,0,'Zaela ... traitorous fool ... have you sold your soul to the Horde? Are you and I so different? Cast your lot with Hellscream, then. See where he takes you.',12,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `ScriptName`='npc_th_warchief_madness' WHERE `entry`=43189;

-- Horde Negotiator
SET @ENTRY := 43238;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,1,0,5000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,52,0,100,0,0,43238,0,0,1,1,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 0 - Talk 1"),
(@ENTRY,@SOURCETYPE,2,0,52,0,100,0,1,43238,0,0,1,2,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 1 - Talk 2"),
(@ENTRY,@SOURCETYPE,3,0,52,0,100,0,2,43238,0,0,1,3,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 2 - Talk 3"),
(@ENTRY,@SOURCETYPE,4,0,52,0,100,0,3,43238,0,0,1,4,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 3 - Talk 4"),
(@ENTRY,@SOURCETYPE,5,0,52,0,100,0,0,43238,0,0,53,0,43238,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 0 - WP Start"),
(@ENTRY,@SOURCETYPE,6,0,40,0,100,0,7,0,0,0,1,5,5000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Talk 5"),
(@ENTRY,@SOURCETYPE,7,0,40,0,100,0,7,0,0,0,18,131072,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Set Pacified"),
(@ENTRY,@SOURCETYPE,8,0,40,0,100,0,7,0,0,0,66,3,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Adjust Orientation");

-- Admiral Stonefist
SET @ENTRY := 42978;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,20,0,100,0,26608,0,0,0,1,0,8000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Quest Rewarded - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,52,0,100,0,0,42978,0,0,1,0,8000,0,0,0,0,10,763653,43193,0,0.0,0.0,0.0,0.0,"After Talk 0 - Talk 0 (Krogg)");

DELETE FROM `creature_text` WHERE `entry`=42978;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(42978,0,0,'What do we do now? Surely the Warchief would want us to storm the port in force!',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=43193;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(43193,0,0,'Perhaps. And perhaps we would win, but at what cost? Maybe there is a better plan...',12,0,100,0,0,0,'Comment');

UPDATE `creature` SET `phaseMask`=2 WHERE `guid` IN (763656, 763658, 763650, 763543, 763540);

-- Position update for Zaela (id: 43190) in zone: 4922, area: 5136
UPDATE `creature` SET `position_x` = -3898.831, `position_y` = -6472.802, `position_z` = 15.383, `orientation`= 0.064 WHERE `guid` = 763553;

-- Position update for Gregor (id: 43191) in zone: 4922, area: 5136
UPDATE `creature` SET `position_x` = -3892.226, `position_y` = -6475.891, `position_z` = 15.383, `orientation`= 1.705 WHERE `guid` = 763554;

DELETE FROM `creature_text` WHERE `entry`=43190;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(43190,0,0,'Hurry, Gorthul. Undo the bonds.',12,0,100,0,0,0,'Comment'),
(43190,1,0,'$n, I\'ve rescued your equipment for you. I think you\'ve seen all you need to see.',12,0,100,0,0,0,'Comment'),
(43190,2,0,'Mor\'ghor. You should\'ve stayed in Outland with the rest of your half-demon scum. There\'s now place for you here.',12,0,100,0,0,0,'Comment');

UPDATE `creature` SET `phaseMask`=6 WHERE `guid` IN (763545, 763654, 763653, 763542, 763656, 763548, 763549, 763547, 763652, 763658, 763650, 763543, 763540);
UPDATE `creature` SET `phaseMask`=4 WHERE `id` IN (43601, 43602, 44003);

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '47';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 47, 2, 736, 4, 'Twilight Highlands [H]: Negate Phase 2 On Quest Rewarded: Negotiations Terminated [26608]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '47' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '26608';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 47, 0, 0, 8, 0, 26608, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '48';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 48, 4, 736, 0, 'Twilight Highlands [H]: Add Phase 4 On Quest Rewarded: Negotiations Terminated [26608]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '48' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '26608';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 48, 0, 0, 8, 0, 26608, 0, 0, 0, 0, 0, '', '');

UPDATE `creature` SET `phaseMask`=4 WHERE `id` IN (43579, 43575, 43394);
UPDATE `creature` SET `phaseMask`=2 WHERE `id`=43390;

UPDATE `creature_template` SET `ScriptName`='npc_th_dragonmaw_fighters' WHERE `entry` IN (43579, 43575);

-- Dragonmaw Warlock
SET @ENTRY := 43394;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,18266,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Curse of Agony"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,1000,1000,6000,6000,11,9613,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Shadow Bolt"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,4000,4000,7500,7500,11,84533,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Drain Life");

-- Position update for Axebite Warrior (id: 43579) in zone: 4922, area: 5136
UPDATE `creature` SET `position_x` = -3998.948, `position_y` = -6542.684, `position_z` = 12.657, `orientation`= 2.283 WHERE `guid` = 763674;

UPDATE `creature` SET `phaseMask`=4 WHERE `guid` IN (763550, 763551, 763552);

DELETE FROM `creature_text` WHERE `entry`=43581;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(43581,0,0,'Abandon the port? Has Mor\'ghor beaten all the sense out of you? This attack is our best opportunity to take our destiny into our own - wait! Here comes $n from the Horde!',12,0,100,0,0,0,'Comment');

-- Zaela
SET @ENTRY := 43581;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,20,0,100,0,26619,0,0,0,1,0,8000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Quest Rewarded - Talk 0");

UPDATE `creature` SET `phaseMask`=4 WHERE `id`=43577;
UPDATE `creature` SET `phaseMask`=2 WHERE `id`=43387;
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry` IN (43577, 43578);
UPDATE `creature_template` SET `ScriptName`='npc_th_dragonmaw_civilian' WHERE `entry` IN (43578, 43577);
UPDATE `creature` SET `phaseMask`=4 WHERE `guid`=763797;

-- Position update for Warchief Mor'ghor (id: 43189) in zone: 4922, area: 5136
UPDATE `creature` SET `position_x` = -4113.668, `position_y` = -6416.886, `position_z` = 37.704, `orientation`= 0.404 WHERE `guid` = 763797;

-- Zaela
SET @ENTRY := 43190;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Attack Invoker"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,2000,2000,300000,300000,1,2,5000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Talk 2");

UPDATE `creature_template` SET `DamageModifier`=7 WHERE `entry`=43189;
UPDATE `creature` SET `phaseMask`=8 WHERE `id` IN (43941, 43951, 43958);
UPDATE `creature` SET `phaseMask`=8 WHERE `guid` IN (763619, 763614, 763617, 763615, 763618, 763616, 763591);

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '49';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 49, 4, 736, 4, 'Twilight Highlands [H]: Negate Phase 4 On Quest Complete: Death to Mor\'Ghor [26622]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '49' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '26622';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 49, 0, 0, 28, 0, 26622, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '50';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 50, 8, 736, 0, 'Twilight Highlands [H]: Add Phase 8 On Quest Complete: Death to Mor\'Ghor [26622]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '50' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '26622';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 50, 0, 0, 28, 0, 26622, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '51';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 51, 8, 736, 0, 'Twilight Highlands [H]: Add Phase 8 On Quest Rewarded: Death to Mor\'Ghor [26622]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '51' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '26622';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 51, 0, 0, 8, 0, 26622, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '52';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 52, 4, 736, 4, 'Twilight Highlands [H]: Negate Phase 4 On Quest Rewarded: Death to Mor\'Ghor [26622]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '52' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '26622';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 52, 0, 0, 8, 0, 26622, 0, 0, 0, 0, 0, '', '');

DELETE FROM `spell_area` WHERE `spell` = '49416' AND `quest_start` = '26622';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49416, 5136, 26622, 1, 74, 0);

UPDATE `creature` SET `phaseMask`=9 WHERE `id`=44011;

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '53';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 53, 16, 736, 0, 'Twilight Highlands [H]: Add Phase 16 On Quest Rewarded: Muddied Waters [26784]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '53' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '26784';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 53, 0, 0, 8, 0, 26784, 0, 0, 0, 0, 0, '', '');

UPDATE `creature` SET `phaseMask`=16 WHERE `guid`=763958;
UPDATE `creature_template` SET `ScriptName`='npc_th_dragonmaw_portal_to_orgrimmar' WHERE `entry`=44050;
UPDATE `creature_template` SET `modelid1`=21072, `minlevel`=85, `maxlevel`=85, `exp`=3 WHERE `entry`=44050;

DELETE FROM `spell_area` WHERE `spell` = '49417' AND `quest_start` = '26784';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_end_status`) VALUES
(49417, 5136, 26784, 1, 0);

UPDATE `creature` SET `spawntimesecs`=30 WHERE `guid`=763797;
UPDATE `gameobject` SET `phaseMask`=2 WHERE `guid`=727456;
UPDATE `creature` SET `phaseMask`=8 WHERE `guid`=763620;

UPDATE `gameobject` SET `phaseMask`=9 WHERE `id`=204880;

DELETE FROM `creature_text` WHERE `entry`=44120;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(44120,0,0,'Silence, idiot.',12,0,100,0,0,0,'Comment'),
(44120,1,0,'Hear anything interesting, $n? Your little revelation about me is about to cost your life.',12,0,100,0,0,0,'Comment'),
(44120,2,0,'The Twilight\'s Hammer has agents everywhere! Kill me and a dozen take my place!',12,0,100,0,0,0,'Comment'),
(44120,3,0,'My powers of sight... I beheld the future... I have seen what is to come...',12,0,100,0,0,0,'Comment'),
(44120,4,0,'This world unravels. If you could see the horrors I have seen...',12,0,100,0,0,0,'Comment'),
(44120,5,0,'To serve is madness, but defiance ... impossible!',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=44160;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(44160,0,0,'Wait, uh - you put words in my mouth! Not fair!',12,0,100,0,0,0,'Comment');

UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1, `action_menu_id`=11805 WHERE `menu_id`=11804 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1, `action_menu_id`=11806 WHERE `menu_id`=11805 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1, `action_menu_id`=11807 WHERE `menu_id`=11806 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE `menu_id`=11807 AND `id`=0;
UPDATE `creature_template` SET `gossip_menu_id`=11804 WHERE `entry`=44160;

DELETE FROM `conditions` WHERE `SourceGroup`=11804 AND `SourceEntry` = '0';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 11804, 0, 0, 0, 9, 0, 26830, 0, 0, 0, 0, 0, '', 'Suspicious Peon - Show gossip only if quest 26830 is active');

-- Suspicious Peon
SET @ENTRY := 44160;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,62,0,100,0,11807,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Close Gossip"),
(@ENTRY,@SOURCETYPE,1,0,62,0,100,0,11807,0,0,0,1,0,5000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Talk 0"),
(@ENTRY,@SOURCETYPE,2,0,62,0,100,0,11807,0,0,0,33,44132,0,0,0,0,0,18,80,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Quest Credit"),
(@ENTRY,@SOURCETYPE,3,0,62,0,100,0,11807,0,0,0,12,44120,4,20000,0,0,0,8,0,0,0,1744.29,-4275.38,101.8,0.85,"On Gossip Select - Summon Sauranok"),
(@ENTRY,@SOURCETYPE,4,0,62,0,100,0,11807,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Remove Gossip"),
(@ENTRY,@SOURCETYPE,5,0,11,0,100,0,0,0,0,0,81,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Respawn - Set Gossip"),
(@ENTRY,@SOURCETYPE,6,0,7,0,100,0,0,0,0,0,81,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Evade - Set Gossip");

DELETE FROM `conditions` WHERE `SourceEntry` = '82611';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 82611, 0, 0, 31, 0, 3, 44160, 0, 0, 0, '', 'Targeting -> Suspicious Peon');

UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=44120;

-- Sauranok the Mystic
SET @ENTRY := 44120;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,1,2000,2000,600000,600000,11,82611,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Kill Peon"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,1,2000,2000,600000,600000,1,0,3000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Talk 0"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,1,6000,6000,600000,600000,19,256,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Set Attackable"),
(@ENTRY,@SOURCETYPE,3,0,1,0,100,1,7000,7000,600000,600000,49,768,0,0,0,0,0,18,30,0,0,0.0,0.0,0.0,0.0,"OOC - Attack Player"),
(@ENTRY,@SOURCETYPE,4,0,4,0,100,0,0,0,0,0,11,82531,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Darkness"),
(@ENTRY,@SOURCETYPE,5,0,6,0,100,0,0,0,0,0,33,44120,0,0,0,0,0,18,80,0,0,0.0,0.0,0.0,0.0,"On Death - Quest Credit"),
(@ENTRY,@SOURCETYPE,6,0,52,0,100,1,0,44120,0,0,1,1,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 0 - Talk 1"),
(@ENTRY,@SOURCETYPE,7,0,52,0,100,1,1,44120,0,0,1,2,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 1 - Talk 2"),
(@ENTRY,@SOURCETYPE,8,0,52,0,100,1,2,44120,0,0,1,3,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 2 - Talk 3"),
(@ENTRY,@SOURCETYPE,9,0,52,0,100,1,3,44120,0,0,1,4,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 3 - Talk 4"),
(@ENTRY,@SOURCETYPE,10,0,52,0,100,1,4,44120,0,0,1,5,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 4 - Talk 5");

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '54';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 54, 16, 760, 4, 'Twilight Highlands [H]: Negate Phase 16 On Quest Rewarded: Traitor\'s Bait [26830]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '54' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '26830';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 54, 0, 0, 8, 0, 26830, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '55';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 55, 8, 760, 4, 'Twilight Highlands [H]: Negate Phase 8 On Quest Rewarded: Traitor\'s Bait [26830]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '55' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '26830';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 55, 0, 0, 8, 0, 26830, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '56';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 56, 2, 760, 4, 'Twilight Highlands [H]: Negate Phase 2 On Quest Rewarded: Traitor\'s Bait [26830]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '56' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '26830';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 56, 0, 0, 8, 0, 26830, 0, 0, 0, 0, 0, '', '');

UPDATE `quest_template` SET `PrevQuestId`='26840' WHERE `Id` IN (27583, 27607);
UPDATE `quest_template` SET `PrevQuestId`='27607' WHERE `Id` IN (27611, 27610);

DELETE FROM `conditions` WHERE `SourceEntry` = '27622' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27622, 27611, 0),
(20, 8, 27622, 27610, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27622' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27622, 27611, 0),
(19, 8, 27622, 27610, 0);

UPDATE `quest_template` SET `PrevQuestId`='27583' WHERE `Id` IN (27586, 27606);

DELETE FROM `conditions` WHERE `SourceEntry` = '27690' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27690, 27606, 0),
(20, 8, 27690, 27586, 0),
(20, 8, 27690, 27584, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27690' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27690, 27606, 0),
(19, 8, 27690, 27586, 0),
(19, 8, 27690, 27584, 0);

UPDATE `quest_template` SET `SpecialFlags`=2 WHERE `Id`=27610;

DELETE FROM `creature` WHERE `guid` = '842820';
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(842820, 44050, 0, 1, 1, 0, 0, -4038.8, -6314.47, 38.6973, 5.55792, 300, 0, 0, 77490, 0, 0, 0, 0, 0);

UPDATE `spell_target_position` SET `target_position_x`=2033.00, `target_position_y`=-4380.04, `target_position_z`=98.04, `target_orientation`=6.28 WHERE `id`=82450 AND `effIndex`=0;
UPDATE `creature_template` SET `npcflag`=1, `unit_flags`=768, `ScriptName`='npc_th_salvageable_shredder', `IconName`='EngineerSkin' WHERE `entry`=46100;
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `ScriptName`='npc_th_bilgewater_expert' WHERE `entry`=46112;

DELETE FROM `creature_text` WHERE `entry`=46100;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46100,0,0,'Deathblade ... activated! System integrity check: 57 percent nominal.',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=46112;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46112,0,0,'Whoohoo, sweet-thing! Step aside and watch the magic.',12,0,100,0,0,0,'Comment'),
(46112,1,0,'Cover my butt in case we\'re ambushed.',12,0,100,0,0,0,'Comment'),
(46112,2,0,'We did it! Let\'s fire this masterpiece up...',12,0,100,0,0,0,'Comment');

-- Highbank Skirmisher
SET @ENTRY := 45189;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Set Run"),
(@ENTRY,@SOURCETYPE,1,0,54,0,100,0,0,0,0,0,49,1,0,0,0,0,0,18,50,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Attack Player"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,4000,4000,4500,7000,11,57846,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Heroic Strike");

UPDATE `creature_template` SET `RegenHealth`=0 WHERE `entry`=46100;
UPDATE `creature` SET `spawntimesecs`=30 WHERE `id`=46100;

-- Axebite Defender
SET @ENTRY := 45178;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,1000,3000,4000,60000,11,33808,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Cast Shoot");

UPDATE `creature_template` SET `ScriptName`='npc_th_dragonmaw_fighters' WHERE `entry` IN (45987, 45985);
UPDATE `creature` SET `spawndist`=10, `MovementType`=1 WHERE `id`=45985;
UPDATE `creature_template` SET `ScriptName`='npc_th_mortar_beach_triggering' WHERE `entry`=46015;
UPDATE `creature` SET `phaseMask`=1 WHERE `id`=46015;

-- Blackscale Raider
SET @ENTRY := 45984;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,46,100,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Move Forward"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,0,0,0,0,49,100,0,0,0,0,0,18,15,0,0,0.0,0.0,0.0,0.0,"OOC - Attack");

-- Position update for Goblin Mortar Target Bunny (id: 46015) in zone: 4922, area: 5479
UPDATE `creature` SET `position_x` = -3602.731, `position_y` = -6252.986, `position_z` = -1.315, `orientation`= 1.793 WHERE `guid` = 763962;

-- Position update for Goblin Mortar Target Bunny (id: 46015) in zone: 4922, area: 5479
UPDATE `creature` SET `position_x` = -3621.952, `position_y` = -6264.879, `position_z` = -2.065, `orientation`= 2.009 WHERE `guid` = 763966;

-- Position update for Goblin Mortar Target Bunny (id: 46015) in zone: 4922, area: 5479
UPDATE `creature` SET `position_x` = -3638.944, `position_y` = -6272.792, `position_z` = -1.017, `orientation`= 2.113 WHERE `guid` = 763978;

-- Position update for Goblin Mortar Target Bunny (id: 46015) in zone: 4922, area: 5479
UPDATE `creature` SET `position_x` = -3575.336, `position_y` = -6238.837, `position_z` = -1.465, `orientation`= 2.160 WHERE `guid` = 763972;

UPDATE `quest_template` SET `PrevQuestId`='28589' WHERE `Id`=28590;
UPDATE `quest_template` SET `PrevQuestId`='28583' WHERE `Id` IN (28586, 28584);

-- Blackscale Raider
SET @ENTRY := 45984;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,46,100,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Move Forward"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,5000,5000,5000,5000,49,0,0,0,0,0,0,18,15,0,0,0.0,0.0,0.0,0.0,"OOC - Attack"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,0,8000,8000,8000,8000,89,10,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Move Random");

UPDATE `creature_template` SET `ScriptName`='npc_th_krazzwork_fighters' WHERE `entry` IN (49629, 49628);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '49683';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(49683, 49684, 1, 'Stormtalon Rider on Gryphon', 8, 0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '49683';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(49683, 46598, 0);

DELETE FROM `event_scripts` WHERE `id` = '26466';
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `x`, `y`, `z`, `o`) VALUES
(26466, 2, 10, 46009, 20000, -3608.46, -6221.00, 0.28, 2.13);

UPDATE `creature_template` SET `DamageModifier`=8, `unit_flags`=0 WHERE `entry`=46009;

-- Blackscale Raider
SET @ENTRY := 45984;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,46,100,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Move Forward"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,5000,5000,5000,5000,49,0,0,0,0,0,0,18,8,0,0,0.0,0.0,0.0,0.0,"OOC - Attack"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,0,8000,8000,8000,8000,89,10,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Move Random");

-- Position update for Goblin Mortar Target Bunny (id: 46015) in zone: 4922, area: 5479
UPDATE `creature` SET `position_x` = -3538.758, `position_y` = -6223.089, `position_z` = -0.559, `orientation`= 1.657 WHERE `guid` = 763972;

-- Position update for Goblin Mortar Target Bunny (id: 46015) in zone: 4922, area: 5479
UPDATE `creature` SET `position_x` = -3632.425, `position_y` = -6268.245, `position_z` = -1.136, `orientation`= 2.136 WHERE `guid` = 763962;

-- Position update for Goblin Mortar Target Bunny (id: 46015) in zone: 4922, area: 5479
UPDATE `creature` SET `position_x` = -3672.376, `position_y` = -6283.000, `position_z` = -0.968, `orientation`= 2.136 WHERE `guid` = 763966;

-- Position update for Goblin Mortar Target Bunny (id: 46015) in zone: 4922, area: 5479
UPDATE `creature` SET `position_x` = -3704.220, `position_y` = -6323.342, `position_z` = -1.573, `orientation`= 2.528 WHERE `guid` = 763978;

UPDATE `creature_template` SET `ScriptName`='npc_th_fathom_lotd_heth_jatar' WHERE `entry`=46009;

DELETE FROM `creature_text` WHERE `entry`=46009;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46009,0,0,'Incoming mortar barrage!',41,0,100,0,0,0,'Comment');

-- Deletes creature Fathom-Lord Heth'Jatar (id: 46009, guid: 763960) in zone: 4922, area: 5479
DELETE FROM `creature` WHERE `guid` = 763960; DELETE FROM creature_addon WHERE guid = 763960;

UPDATE `creature_template` SET `speed_walk`=0.0001, `speed_run`=0.0001 WHERE `entry`=49680;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '49680';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(49680, 46598, 1);

-- Krazz Cannon
SET @ENTRY := 49680;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,27,0,100,0,0,0,0,0,33,49831,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Passenger Boarded - Quest Credit");

UPDATE `creature` SET `id`=49680 WHERE `id`=49848;

DELETE FROM `conditions` WHERE `SourceEntry` = '92245';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 92245, 0, 0, 31, 0, 3, 49451, 0, 0, 0, '', 'Targeting -> Oil Leak Bunny');

UPDATE `creature_template` SET `modelid1`=11686 WHERE `entry`=49451;
UPDATE `quest_template` SET `PrevQuestId`='27690' WHERE `Id` IN (27751, 27929);

DELETE FROM `conditions` WHERE `SourceEntry` = '28041' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 28041, 27929, 0),
(20, 8, 28041, 27751, 0),
(20, 8, 28041, 27750, 0),
(20, 8, 28041, 27747, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '28041' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 28041, 27929, 0),
(19, 8, 28041, 27751, 0),
(19, 8, 28041, 27750, 0),
(19, 8, 28041, 27747, 0);

-- Oil Leak Bunny
SET @ENTRY := 49451;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,8,0,100,0,92245,1,15,15,33,49451,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Kill Credit"),
(@ENTRY,@SOURCETYPE,1,0,8,0,100,0,92245,1,15,15,41,1500,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Force Despawn");

UPDATE `creature` SET `spawntimesecs`=15 WHERE `id`=49451;
UPDATE `quest_template` SET `PrevQuestId`='27690' WHERE `Id` IN (27747, 28038);
UPDATE `quest_template` SET `PrevQuestId`='28133' WHERE `Id` IN (28872, 28874, 28875, 28871, 28873);
UPDATE `quest_template` SET `PrevQuestId`='27690' WHERE `Id`=27750;
UPDATE `quest_template` SET `PrevQuestId`='27947' WHERE `Id`=27945;

DELETE FROM `conditions` WHERE `SourceEntry` = '27947' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27947, 27750, 0),
(20, 8, 27947, 27747, 0),
(20, 8, 27947, 27929, 0),
(20, 8, 27947, 27751, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27947' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27947, 27750, 0),
(19, 8, 27947, 27747, 0),
(19, 8, 27947, 27929, 0),
(19, 8, 27947, 27751, 0);

UPDATE `creature` SET `phaseMask`=1 WHERE `guid` IN (763984, 763982, 770462, 763980);

DELETE FROM `spell_area` WHERE `spell` = '60922' AND `quest_start` = '27690';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(60922, 5138, 27690, 1, 74, 0);

-- IMPOSTARE QUESTEND
DELETE FROM `spell_area` WHERE `spell` = '49416' AND `quest_start` = '27690';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49416, 5138, 27690, 1, 74, 0);

-- IMPOSTARE QUESTEND
DELETE FROM `spell_area` WHERE `spell` = '49417' AND `quest_start` = '27954';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49417, 5138, 27954, 1, 64, 0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=47274 AND `spell_id`=88237;
UPDATE `creature_template` SET `npcflag`=1 WHERE `entry`=47274;
UPDATE `creature_template_addon` SET `bytes1`=0, `auras`='89662' WHERE `entry`=49548;
UPDATE `creature_template` SET `dynamicflags`=0, `unit_flags`=0, `unit_flags2`=2048, `dynamicflags`=0, `InhabitType`=7, `ScriptName`='npc_th_krazzworks_laborer' WHERE `entry`=49548;

DELETE FROM `creature_text` WHERE `entry`=49548;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(49548,0,0,'I\'m so tired....',14,0,100,0,0,0,'Comment'),
(49548,0,1,'Shark!!!',14,0,100,0,0,0,'Comment'),
(49548,1,0,'I was gonna drown for sure!',12,0,100,0,0,0,'Comment'),
(49548,1,1,'A pool pony in the nick of time!',12,0,100,0,0,0,'Comment'),
(49548,1,2,'You\'re a miracle worker, $n',12,0,100,0,0,0,'Comment'),
(49548,0,3,'If only I\'d remembered to wear my standard-issue emergency pool pony vest.',14,0,100,0,0,0,'Comment'),
(49548,1,3,'Thanks, $n!',12,0,100,0,0,0,'Comment');

DELETE FROM `conditions` WHERE `SourceEntry` = '92317';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 92317, 0, 0, 31, 0, 3, 49548, 0, 0, 0, '', 'Targeting -> Krazzwork Laborer');

UPDATE `creature` SET `spawntimesecs`=60 WHERE `id`=49548;

-- Position update for Krazzworks Laborer (id: 49548) in zone: 4922, area: 5137
UPDATE `creature` SET `position_x` = -2605.602, `position_y` = -6637.387, `position_z` = 0.002, `orientation`= 3.787 WHERE `guid` = 756772;

-- Position update for Krazzworks Laborer (id: 49548) in zone: 4922, area: 5137
UPDATE `creature` SET `position_x` = -2688.576, `position_y` = -6262.819, `position_z` = 0.000, `orientation`= 2.903 WHERE `guid` = 756671;

-- Position update for Krazzworks Laborer (id: 49548) in zone: 4922, area: 5137
UPDATE `creature` SET `position_x` = -2857.467, `position_y` = -6288.320, `position_z` = 0.001, `orientation`= 5.397 WHERE `guid` = 756672;

-- Position update for Krazzworks Laborer (id: 49548) in zone: 4922, area: 5137
UPDATE `creature` SET `position_x` = -2922.504, `position_y` = -6338.986, `position_z` = 0.004, `orientation`= 4.730 WHERE `guid` = 756575;

-- Position update for Krazzworks Laborer (id: 49548) in zone: 4922, area: 5137
UPDATE `creature` SET `position_x` = -2883.063, `position_y` = -6413.120, `position_z` = 0.004, `orientation`= 5.190 WHERE `guid` = 756736;

-- Position update for Krazzworks Laborer (id: 49548) in zone: 4922, area: 5137
UPDATE `creature` SET `position_x` = -2995.956, `position_y` = -6530.384, `position_z` = 0.000, `orientation`= 4.522 WHERE `guid` = 756734;

-- Position update for Krazzworks Laborer (id: 49548) in zone: 4922, area: 5137
UPDATE `creature` SET `position_x` = -2929.963, `position_y` = -6657.428, `position_z` = 0.000, `orientation`= 5.198 WHERE `guid` = 756778;

-- Position update for Krazzworks Laborer (id: 49548) in zone: 4922, area: 5137
UPDATE `creature` SET `position_x` = -2927.681, `position_y` = -6389.662, `position_z` = -1.587, `orientation`= 0.644 WHERE `guid` = 756514;

-- Position update for Krazzworks Laborer (id: 49548) in zone: 4922, area: 5137
UPDATE `creature` SET `position_x` = -2939.367, `position_y` = -6543.069, `position_z` = -1.587, `orientation`= 4.657 WHERE `guid` = 756778;

-- Position update for Krazzworks Laborer (id: 49548) in zone: 4922, area: 5137
UPDATE `creature` SET `position_x` = -2586.285, `position_y` = -6417.665, `position_z` = -1.540, `orientation`= 3.313 WHERE `guid` = 756681;

-- Deletes creature Krazzworks Laborer (id: 49548, guid: 756586) in zone: 4922, area: 5137
DELETE FROM `creature` WHERE `guid` = 756586; DELETE FROM creature_addon WHERE guid = 756586;

-- Deletes creature Krazzworks Laborer (id: 49548, guid: 756572) in zone: 4922, area: 5137
DELETE FROM `creature` WHERE `guid` = 756572; DELETE FROM creature_addon WHERE guid = 756572;

UPDATE `creature_template` SET `ScriptName`='npc_th_krazzwork_fighters' WHERE `entry` IN (46310, 46320);
UPDATE `creature` SET `spawndist`=8, `MovementType`=1 WHERE `id` IN (46310, 46320);

UPDATE `creature_template` SET `ScriptName`='npc_th_thundermar_war_gryphon' WHERE `entry`=47186;
UPDATE `creature_template` SET `unit_flags`=768, `unit_flags2`=2048 WHERE `entry`=46321;
UPDATE `creature_template_addon` SET `auras`='92143 12898' WHERE `entry`=49451;
UPDATE `creature` SET `spawntimesecs`=10 WHERE `id`=49451;
UPDATE `creature_template` SET `unit_flags2`=2048, `flags_extra`=2 WHERE `entry`=47031;
UPDATE `creature_template_addon` SET `bytes1`=0, `auras`='0' WHERE `entry`=46321;
UPDATE `creature_template` SET `RegenHealth`=0 WHERE `entry`=46948;
UPDATE `gameobject_template` SET `AIName`='', `ScriptName`='go_th_wildhammer_keg' WHERE `entry`=206195;

UPDATE `creature` SET `phaseMask`=1 WHERE `guid`=777095;

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '58';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 58, 16, 0, 0, 'Twilight Highlands [H]: Add Phase 16 On Quest Complete: A Vision of Twilight [27947]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '58' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '27947';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 58, 0, 0, 28, 0, 27947, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '59';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 59, 16, 0, 0, 'Twilight Highlands [H]: Add Phase 16 On Quest Rewarded: A Vision of Twilight [27947]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '59' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '27947';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 59, 0, 0, 8, 0, 27947, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '60';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 60, 16, 760, 4, 'Twilight Highlands [H]: Negate Phase 16 On Quest Complete: The Eyes Have It [27954]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '60' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '27954';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 60, 0, 0, 28, 0, 27954, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '61';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 61, 16, 0, 4, 'Twilight Highlands [H]: Negate Phase 16 On Quest Rewarded: The Eyes Have It [27954]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '61' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '27954';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 61, 0, 0, 8, 0, 27954, 0, 0, 0, 0, 0, '', '');

DELETE FROM `spell_area` WHERE `spell` = '88237' AND `quest_start` = '27954';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`) VALUES
(88237, 4922, 27954, 27954, 1, 2);

UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-60 WHERE `entry`=46158 AND `item`=62915;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-60 WHERE `entry`=47226 AND `item`=62796;

DELETE FROM `spell_area` WHERE `spell` = '98920' AND `quest_start` = '27375';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(98920, 4922, 27375, 27380, 1, 66, 9);

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` IN (45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61);
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `phaseId`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 61, 16, 0, 0, 4, 'Twilight Highlands [H]: Negate Phase 16 On Quest Rewarded: The Eyes Have It [27954]'),
(4922, 60, 16, 0, 0, 4, 'Twilight Highlands [H]: Negate Phase 16 On Quest Complete: The Eyes Have It [27954]'),
(4922, 59, 16, 0, 0, 0, 'Twilight Highlands [H]: Add Phase 16 On Quest Rewarded: A Vision of Twilight [27947]'),
(4922, 58, 16, 0, 0, 0, 'Twilight Highlands [H]: Add Phase 16 On Quest Complete: A Vision of Twilight [27947]'),
(4922, 57, 0, 0, 736, 0, 'Twilight Highlands - Default Terrainswap'),
(4922, 56, 2, 0, 0, 4, 'Twilight Highlands [H]: Negate Phase 2 On Quest Rewarded: Traitor\'s Bait [26830]'),
(4922, 55, 8, 0, 0, 4, 'Twilight Highlands [H]: Negate Phase 8 On Quest Rewarded: Traitor\'s Bait [26830]'),
(4922, 54, 16, 0, 0, 4, 'Twilight Highlands [H]: Negate Phase 16 On Quest Rewarded: Traitor\'s Bait [26830]'),
(4922, 53, 16, 0, 0, 0, 'Twilight Highlands [H]: Add Phase 16 On Quest Rewarded: Muddied Waters [26784]'),
(4922, 52, 4, 0, 0, 4, 'Twilight Highlands [H]: Negate Phase 4 On Quest Rewarded: Death to Mor\'Ghor [26622]'),
(4922, 51, 8, 0, 0, 0, 'Twilight Highlands [H]: Add Phase 8 On Quest Rewarded: Death to Mor\'Ghor [26622]'),
(4922, 50, 8, 0, 0, 0, 'Twilight Highlands [H]: Add Phase 8 On Quest Complete: Death to Mor\'Ghor [26622]'),
(4922, 49, 4, 0, 0, 4, 'Twilight Highlands [H]: Negate Phase 4 On Quest Complete: Death to Mor\'Ghor [26622]'),
(4922, 48, 4, 0, 0, 0, 'Twilight Highlands [H]: Add Phase 4 On Quest Rewarded: Negotiations Terminated [26608]'),
(4922, 47, 2, 0, 0, 4, 'Twilight Highlands [H]: Negate Phase 2 On Quest Rewarded: Negotiations Terminated [26608]'),
(4922, 46, 2, 0, 0, 0, 'Twilight Highlands [H]: Add Phase 2 On Quest Rewarded: Twilight Skies [26388]'),
(4922, 45, 2, 0, 0, 0, 'Twilight Highlands [H]: Add Phase 2 On Quest Complete: Twilight Skies [26388]');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '62';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 62, 1, 0, 0, 'Twilight Highlands [H]: Add Phase 1 On Quest Rewarded: Traitor\'s Bait [26830]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '62' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '26830';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 62, 0, 0, 8, 0, 26830, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '63';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 63, 1024, 0, 'Twilight Highlands [A]: Add Phase 1024 On Quest Complete: The Worldbreaker [27378]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '63' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '27378';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 63, 0, 0, 28, 0, 27378, 0, 0, 0, 0, 0, '', '');

UPDATE `quest_template` SET `PrevQuestId`='27380' WHERE `Id`=27486;

DELETE FROM `spell_area` WHERE `spell` = '85295' AND `quest_start` = '27486';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`) VALUES
(85295, 5155, 27486, 27486, 1, 8);

DELETE FROM `spell_area` WHERE `spell` = '94567' AND `quest_start` = '27486';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(94567, 5155, 27486, 1, 66, 0);

DELETE FROM `spell_script_names` WHERE `spell_id` = '85295';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(85295, 'spell_summon_generic_controller');

-- Grisly Gryphon Guts
SET @ENTRY := 47427;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="" WHERE entry=@ENTRY LIMIT 1;

UPDATE `creature_template` SET `ScriptName`='npc_th_grisly_gryphon_guts' WHERE `entry`=47427;

DELETE FROM `conditions` WHERE `SourceEntry` = '27576' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27576, 27509, 0),
(20, 8, 27576, 27507, 0),
(20, 8, 27576, 27508, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27576' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27576, 27509, 0),
(19, 8, 27576, 27507, 0),
(19, 8, 27576, 27508, 0);

-- Highland Black Drake
SET @ENTRY := 47391;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="" WHERE entry=@ENTRY LIMIT 1;

DELETE FROM `creature_text` WHERE `entry`=47391;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47391,0,0,'Attack and Weaken the Black Drake!',42,0,100,0,0,0,'Comment'),
(47391,1,0,'Hold On!',42,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `ScriptName`='npc_th_highland_black_drake' WHERE `entry`=47391;
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=47422;
UPDATE `creature_template` SET `HoverHeight`=1 WHERE `entry`=47391;

DELETE FROM `script_waypoint` WHERE `entry` = '47422';
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `point_comment`) VALUES
(47422, 1, -4444.89, -4950.87, 209.83, 'Highland Black Drake WP'),
(47422, 2, -4300.19, -5042.51, 96.50, 'Highland Black Drake WP'),
(47422, 3, -4114.29, -5199.93, 84.76, 'Highland Black Drake WP'),
(47422, 4, -3767.30, -5288.68, 79.82, 'Highland Black Drake WP'),
(47422, 5, -3626.09, -5264.17, 77.64, 'Highland Black Drake WP'),
(47422, 6, -3606.72, -5283.02, 70.36, 'Highland Black Drake WP'),
(47422, 7, -3637.92, -5319.75, 62.66, 'Highland Black Drake WP'),
(47422, 8, -3687.15, -5291.71, 62.66, 'Highland Black Drake WP');

UPDATE `creature_template` SET `faction`=35 WHERE `entry`=45682;

UPDATE `creature_template` SET `ScriptName`='npc_th_highland_black_drake_cinematic' WHERE `entry`=47422;
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=45682;

UPDATE `creature` SET `phaseMask`=8192 WHERE `guid` IN (764286, 764282, 764285, 764283, 764284);
UPDATE `gameobject` SET `phaseMask`=8192 WHERE `guid`=727499;
UPDATE `quest_template` SET `PrevQuestId`='27576' WHERE `Id` IN (28090, 28091);

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 764462) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 764462; DELETE FROM creature_addon WHERE guid = 764462;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 764463) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 764463; DELETE FROM creature_addon WHERE guid = 764463;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 764343) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 764343; DELETE FROM creature_addon WHERE guid = 764343;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 764422) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 764422; DELETE FROM creature_addon WHERE guid = 764422;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 764423) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 764423; DELETE FROM creature_addon WHERE guid = 764423;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 764408) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 764408; DELETE FROM creature_addon WHERE guid = 764408;

-- Position update for Twilight Spearwarder (id: 47490) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3510.241, `position_y` = -3784.571, `position_z` = 77.091, `orientation`= 2.616 WHERE `guid` = 764420;

-- Position update for Twilight Spearwarder (id: 47490) in zone: 4922, area: 5461
UPDATE `creature` SET `position_x` = -3510.053, `position_y` = -3763.755, `position_z` = 75.199, `orientation`= 0.845 WHERE `guid` = 764375;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 764412) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 764412; DELETE FROM creature_addon WHERE guid = 764412;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 764410) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 764410; DELETE FROM creature_addon WHERE guid = 764410;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 764415) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 764415; DELETE FROM creature_addon WHERE guid = 764415;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 764429) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 764429; DELETE FROM creature_addon WHERE guid = 764429;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 764428) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 764428; DELETE FROM creature_addon WHERE guid = 764428;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 764426) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 764426; DELETE FROM creature_addon WHERE guid = 764426;

-- Deletes creature Twilight Spearwarder (id: 47490, guid: 764381) in zone: 4922, area: 5461
DELETE FROM `creature` WHERE `guid` = 764381; DELETE FROM creature_addon WHERE guid = 764381;

SET @CGUID := 842821;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+10;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@CGUID+0, 47489, 0, 1, 8192, 0, 1, -3470.63, -3753.06, 69.3512, 2.37674, 300, 0, 0, 85239, 0, 0, 0, 34816, 0),
(@CGUID+1, 47489, 0, 1, 8192, 0, 1, -3501.1, -3805.05, 77.3843, 1.39813, 300, 0, 0, 85239, 0, 0, 0, 34816, 0),
(@CGUID+2, 47489, 0, 1, 8192, 0, 1, -3491.26, -3822.98, 78.9663, 1.201, 300, 0, 0, 85239, 0, 0, 0, 34816, 0),
(@CGUID+3, 47489, 0, 1, 8192, 0, 1, -3500.97, -3775.52, 72.3921, 0.612735, 300, 0, 0, 85239, 0, 0, 0, 34816, 0),
(@CGUID+4, 47489, 0, 1, 8192, 0, 1, -3513.87, -3782.89, 78.4089, 6.08382, 300, 0, 0, 85239, 0, 0, 0, 34816, 0),
(@CGUID+5, 47489, 0, 1, 8192, 0, 1, -3508.15, -3761.98, 74.1805, 3.67265, 300, 0, 0, 85239, 0, 0, 0, 34816, 0),
(@CGUID+6, 47489, 0, 1, 8192, 0, 1, -3499.86, -3754.94, 70.1854, 0.55305, 300, 0, 0, 85239, 0, 0, 0, 34816, 0),
(@CGUID+7, 47489, 0, 1, 8192, 0, 1, -3494.01, -3741.67, 66.5618, 0.862497, 300, 0, 0, 85239, 0, 0, 0, 34816, 0),
(@CGUID+8, 47489, 0, 1, 8192, 0, 1, -3485.86, -3748.23, 67.1782, 0.44545, 300, 0, 0, 85239, 0, 0, 0, 34816, 0),
(@CGUID+9, 47489, 0, 1, 8192, 0, 1, -3479.44, -3770.46, 70.5084, 2.78437, 300, 0, 0, 85239, 0, 0, 0, 34816, 0),
(@CGUID+10, 47489, 0, 1, 8192, 0, 1, -3482.42, -3790.55, 73.9451, 2.00839, 300, 0, 0, 85239, 0, 0, 0, 34816, 0);

DELETE FROM `creature_text` WHERE `entry`=47559;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47559,0,0,'That\'s right, beast. You belong to the Dragonmaw now.',12,0,100,1,0,0,'Comment'),
(47559,1,0,'And if you don\'t obey, we\'re cutting you up for parts.',12,0,100,1,0,0,'Comment'),
(47559,2,0,'The Demon Chain. It projects our will like a physical force.',12,0,100,1,0,0,'Comment'),
(47559,3,0,'The Horde? I SPIT on your Horde! Our enemies are weak and splintered, yet you bargain with Hellscream? Dragonmaw stand alone!',12,0,100,1,0,0,'Comment'),
(47559,4,0,'I will prove it to you. I will strike the Wildhammer at Thundermar.',12,0,100,1,0,0,'Comment'),
(47559,5,0,'When I return victorious, we will see who the Dragonmaw call "Warchief".',12,0,100,1,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=47557;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47557,0,0,'Complete domination of the animal while it\'s weakened.',12,0,100,1,0,0,'Comment'),
(47557,1,0,'Tell me, what is this charm you\'re using?',12,0,100,1,0,0,'Comment'),
(47557,2,0,'With your wing of drake riders and the support of the Horde, we can make an assault on the Bastion of Twilight.',12,0,100,1,0,0,'Comment'),
(47557,3,0,'Another treasonous word and I will put you in your place, Narkrall.',12,0,100,1,0,0,'Comment'),
(47557,4,0,'Narkrall! If you wish to challenge me, you do so here. Do NOT squander our forces on a fool crusade.',12,0,100,1,0,0,'Comment');

DELETE FROM `spell_area` WHERE `spell` = '90161' AND `quest_start` = '28043';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(90161, 5138, 28043, 28133, 1, 66, 11);

-- IMPOSTARE QUESTEND
DELETE FROM `spell_area` WHERE `spell` = '90161' AND `quest_start` = '28097';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(90161, 5462, 28097, 1, 66, 0);

UPDATE `creature` SET `phaseMask`=1 WHERE `guid`=764018;
UPDATE `creature_template_addon` SET `auras`='82343' WHERE `entry`=47618;

DELETE FROM `spell_area` WHERE `spell` = '90161' AND `quest_start` = '28123';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(90161, 5142, 28123, 28123, 1, 10, 11);

UPDATE `gameobject` SET `phaseMask`=1 WHERE `guid`=727475;

DELETE FROM `gameobject_loot_template` WHERE `entry` = '35625';
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`) VALUES
(35625, 63036, -100);

DELETE FROM `creature_text` WHERE `entry`=47618;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47618,0,0,'The Alliance ... they\'re defending the Wildhammer...',12,0,100,0,0,0,'Comment');

-- Narkrall Rakeclaw
SET @ENTRY := 47618;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,38,0,100,0,0,1,0,0,1,0,8000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Talk 0");

-- The Demon Chain
SET @ENTRY := 206724;
SET @SOURCETYPE := 1;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE gameobject_template SET AIName="SmartObjectAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,64,0,100,1,0,0,0,0,45,0,1,0,0,0,0,10,764018,47618,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Set Data 1 to Narkrall");

UPDATE `gameobject` SET `spawntimesecs`=10 WHERE `guid`=727475;

-- The Demon Chain
SET @ENTRY := 206724;
SET @SOURCETYPE := 1;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE gameobject_template SET AIName="SmartObjectAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,64,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,764018,47618,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Set Data 1 to Narkrall");

UPDATE `creature_template` SET `unit_flags`=768, `flags_extra`=2 WHERE `entry`=47154;
UPDATE `creature_template` SET `IconName`='openhandglow', `ScriptName`='npc_th_eye_of_twilight_spy', `npcflag`=1 WHERE `entry`=47274;
UPDATE `quest_template` SET `PrevQuestId`='28133' WHERE `Id` IN (28147, 28149);
UPDATE `creature_template` SET `unit_flags`=0, `flags_extra`=0 WHERE `entry`=47273;

DELETE FROM `creature_text` WHERE `entry`=48145;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(48145,0,0,'The Alliance has made landfall master, and in great numbers upon the shore.',12,0,100,0,0,21073,'Comment'),
(48145,1,0,'Our agents have been outed and killed, master.',12,0,100,0,0,21075,'Comment'),
(48145,2,0,'We have confirmed the Horde presence at Dragonmaw Port, master. They are now in league.',12,0,100,0,0,21074,'Comment');

-- Position update for Corrupted Elementalist (id: 46204) in zone: 4922, area: 5473
UPDATE `creature` SET `position_x` = -5102.901, `position_y` = -4640.657, `position_z` = 355.775, `orientation`= 2.036 WHERE `guid` = 757377;

DELETE FROM `creature_text` WHERE `entry`=47417;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47417,0,0,'Meet me in the Gullet, $n, Fly west, across the river, and look for a small cave along the ridgeline...',12,0,100,0,0,0,'Comment');

-- Zaela
SET @ENTRY := 47417;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,19,0,100,0,28133,0,0,0,1,0,8000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Quest Accept - Talk 0");

UPDATE `creature` SET `phaseMask`=32768 WHERE `guid`=764101;
UPDATE `creature` SET `phaseMask`=1 WHERE `guid`=764011;

-- IMPOSTARE QUESTEND
DELETE FROM `spell_area` WHERE `spell` = '49416' AND `quest_start` = '28133';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49416, 5139, 28133, 1, 66, 0);

DELETE FROM `creature_text` WHERE `entry`=47671;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47671,0,0,'Here he comes, $n! Beat him down while I dominate him with the Demon Chain.',12,0,100,1,0,0,'Comment'),
(47671,1,0,'Keep fighting! The Demon Chain will eventually win out.',12,0,100,0,0,0,'Comment'),
(47671,2,0,'Then you will die.',12,0,100,0,0,0,'Comment'),
(47671,3,0,'So be it. It is done.',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=47669;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47669,0,0,'My suffering is at an end. But yours has just begun!',12,0,100,0,0,0,'Comment'),
(47669,1,0,'I ... will not ... serve!',12,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `InhabitType`=5, `ScriptName`='npc_th_torth_zaela' WHERE  `entry`=47669;
UPDATE `creature_template` SET `ScriptName`='npc_th_zaela_at_cave' WHERE `entry`=47671;

UPDATE `creature_template_addon` SET `auras`='49414' WHERE `entry`=47671;
UPDATE `creature_template` SET `DamageModifier`=4 WHERE `entry`=47669;
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=47669;

-- Twilight Windwarper
SET @ENTRY := 47724;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,100,100,4000,6000,11,57780,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Lightning Bolt"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,8000,10000,10000,12500,11,89972,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Wind Blast"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,15000,15000,90000,90000,11,88845,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Storm Charge");

-- Storm Vortex
SET @ENTRY := 47728;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,90046,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Cast Storm Vortex"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,8000,8000,8000,8000,11,90046,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Storm Vortex");

-- Glopgut Hurler
SET @ENTRY := 47768;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,8000,8000,20000,20000,11,85257,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Heave"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,100,100,4000,5500,11,75934,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Spear Throw");

UPDATE `creature_template` SET `lootid`=47768 WHERE `entry`=47768;

DELETE FROM `creature_loot_template` WHERE `entry` = '47768';
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(47768, 33394, 0.05, 1, 0, 1, 1),
(47768, 33425, 0.05, 1, 0, 1, 1),
(47768, 33434, 0.05, 1, 0, 1, 1),
(47768, 37091, 0.05, 1, 0, 1, 1),
(47768, 52197, 0.05, 1, 0, 1, 1),
(47768, 52365, 0.0074, 1, 0, 1, 1),
(47768, 52366, 0.0099, 1, 0, 1, 1),
(47768, 52367, 0.05, 1, 0, 1, 1),
(47768, 52368, 0.0074, 1, 0, 1, 1),
(47768, 52370, 0.0074, 1, 0, 1, 1),
(47768, 52372, 0.0043, 1, 0, 1, 1),
(47768, 52373, 0.0099, 1, 0, 1, 1),
(47768, 52374, 0.05, 1, 0, 1, 1),
(47768, 52375, 0.0087, 1, 0, 1, 1),
(47768, 52376, 0.0074, 1, 0, 1, 1),
(47768, 52377, 0.0074, 1, 0, 1, 1),
(47768, 52379, 0.05, 1, 0, 1, 1),
(47768, 52382, 0.0074, 1, 0, 1, 1),
(47768, 52383, 0.05, 1, 0, 1, 1),
(47768, 52385, 0.0087, 1, 0, 1, 1),
(47768, 52495, 0.0043, 1, 0, 1, 1),
(47768, 52496, 0.0049, 1, 0, 1, 1),
(47768, 53010, 50.1567, 1, 0, 1, 1),
(47768, 55286, 0.05, 1, 0, 1, 1),
(47768, 55288, 0.0174, 1, 0, 1, 1),
(47768, 55295, 0.05, 1, 0, 1, 1),
(47768, 55296, 0.0217, 1, 0, 1, 1),
(47768, 55305, 0.0197, 1, 0, 1, 1),
(47768, 55313, 0.0478, 1, 0, 1, 1),
(47768, 55314, 0.05, 1, 0, 1, 1),
(47768, 55324, 0.0074, 1, 0, 1, 1),
(47768, 55332, 0.05, 1, 0, 1, 1),
(47768, 55333, 0.0217, 1, 0, 1, 1),
(47768, 55341, 0.05, 1, 0, 1, 1),
(47768, 55342, 0.0087, 1, 0, 1, 1),
(47768, 55349, 0.05, 1, 0, 1, 1),
(47768, 55350, 0.05, 1, 0, 1, 1),
(47768, 55351, 0.0434, 1, 0, 1, 1),
(47768, 55359, 0.0087, 1, 0, 1, 1),
(47768, 55360, 0.0043, 1, 0, 1, 1),
(47768, 55367, 0.05, 1, 0, 1, 1),
(47768, 55368, 0.0912, 1, 0, 1, 1),
(47768, 55376, 0.0261, 1, 0, 1, 1),
(47768, 55377, 0.0304, 1, 0, 1, 1),
(47768, 55378, 0.0261, 1, 0, 1, 1),
(47768, 55385, 0.05, 1, 0, 1, 1),
(47768, 55386, 0.0261, 1, 0, 1, 1),
(47768, 55387, 0.05, 1, 0, 1, 1),
(47768, 55394, 0.0174, 1, 0, 1, 1),
(47768, 55396, 0.0261, 1, 0, 1, 1),
(47768, 55403, 0.05, 1, 0, 1, 1),
(47768, 55404, 0.05, 1, 0, 1, 1),
(47768, 55405, 0.1, 1, 0, 1, 1),
(47768, 55412, 0.05, 1, 0, 1, 1),
(47768, 55413, 0.013, 1, 0, 1, 1),
(47768, 55414, 0.0217, 1, 0, 1, 1),
(47768, 55421, 0.1, 1, 0, 1, 1),
(47768, 55422, 0.1259, 1, 0, 1, 1),
(47768, 55423, 0.1, 1, 0, 1, 1),
(47768, 55430, 0.05, 1, 0, 1, 1),
(47768, 55431, 0.05, 1, 0, 1, 1),
(47768, 55439, 0.153, 1, 0, 1, 1),
(47768, 55440, 0.0955, 1, 0, 1, 1),
(47768, 55441, 0.0782, 1, 0, 1, 1),
(47768, 55448, 0.0217, 1, 0, 1, 1),
(47768, 55449, 0.05, 1, 0, 1, 1),
(47768, 55457, 0.0261, 1, 0, 1, 1),
(47768, 55458, 0.05, 1, 0, 1, 1),
(47768, 55459, 0.0469, 1, 0, 1, 1),
(47768, 55466, 0.0174, 1, 0, 1, 1),
(47768, 55467, 0.05, 1, 0, 1, 1),
(47768, 55477, 0.0043, 1, 0, 1, 1),
(47768, 55484, 0.05, 1, 0, 1, 1),
(47768, 55485, 0.0738, 1, 0, 1, 1),
(47768, 55486, 0.0608, 1, 0, 1, 1),
(47768, 55493, 0.0521, 1, 0, 1, 1),
(47768, 55494, 0.05, 1, 0, 1, 1),
(47768, 55502, 0.05, 1, 0, 1, 1),
(47768, 55503, 0.05, 1, 0, 1, 1),
(47768, 55504, 0.0391, 1, 0, 1, 1),
(47768, 55511, 0.05, 1, 0, 1, 1),
(47768, 55512, 0.1, 1, 0, 1, 1),
(47768, 55513, 0.0304, 1, 0, 1, 1),
(47768, 55520, 0.05, 1, 0, 1, 1),
(47768, 55521, 0.0391, 1, 0, 1, 1),
(47768, 55522, 0.0434, 1, 0, 1, 1),
(47768, 55529, 0.0434, 1, 0, 1, 1),
(47768, 55530, 0.0999, 1, 0, 1, 1),
(47768, 55531, 0.05, 1, 0, 1, 1),
(47768, 55538, 0.05, 1, 0, 1, 1),
(47768, 55539, 0.05, 1, 0, 1, 1),
(47768, 55540, 0.05, 1, 0, 1, 1),
(47768, 55547, 0.05, 1, 0, 1, 1),
(47768, 55548, 0.05, 1, 0, 1, 1),
(47768, 55549, 0.0434, 1, 0, 1, 1),
(47768, 55556, 0.05, 1, 0, 1, 1),
(47768, 55557, 0.0391, 1, 0, 1, 1),
(47768, 55558, 0.05, 1, 0, 1, 1),
(47768, 55565, 0.05, 1, 0, 1, 1),
(47768, 55566, 0.05, 1, 0, 1, 1),
(47768, 55567, 0.05, 1, 0, 1, 1),
(47768, 55574, 0.0564, 1, 0, 1, 1),
(47768, 55575, 0.0564, 1, 0, 1, 1),
(47768, 55576, 0.05, 1, 0, 1, 1),
(47768, 55583, 0.0608, 1, 0, 1, 1),
(47768, 55584, 0.05, 1, 0, 1, 1),
(47768, 55585, 0.05, 1, 0, 1, 1),
(47768, 55592, 0.05, 1, 0, 1, 1),
(47768, 55593, 0.05, 1, 0, 1, 1),
(47768, 55594, 0.0347, 1, 0, 1, 1),
(47768, 55601, 0.0478, 1, 0, 1, 1),
(47768, 55602, 0.05, 1, 0, 1, 1),
(47768, 55603, 0.0695, 1, 0, 1, 1),
(47768, 55610, 0.05, 1, 0, 1, 1),
(47768, 55611, 0.05, 1, 0, 1, 1),
(47768, 55612, 0.05, 1, 0, 1, 1),
(47768, 55619, 0.1, 1, 0, 1, 1),
(47768, 55620, 0.05, 1, 0, 1, 1),
(47768, 55621, 0.0521, 1, 0, 1, 1),
(47768, 55628, 0.05, 1, 0, 1, 1),
(47768, 55629, 0.05, 1, 0, 1, 1),
(47768, 55630, 0.0434, 1, 0, 1, 1),
(47768, 55637, 0.05, 1, 0, 1, 1),
(47768, 55638, 0.05, 1, 0, 1, 1),
(47768, 55639, 0.05, 1, 0, 1, 1),
(47768, 55646, 0.0592, 1, 0, 1, 1),
(47768, 55647, 0.05, 1, 0, 1, 1),
(47768, 55648, 0.05, 1, 0, 1, 1),
(47768, 55655, 0.0391, 1, 0, 1, 1),
(47768, 55656, 0.0738, 1, 0, 1, 1),
(47768, 55657, 0.05, 1, 0, 1, 1),
(47768, 55664, 0.0391, 1, 0, 1, 1),
(47768, 55665, 0.05, 1, 0, 1, 1),
(47768, 55666, 0.05, 1, 0, 1, 1),
(47768, 55673, 0.0434, 1, 0, 1, 1),
(47768, 55674, 0.05, 1, 0, 1, 1),
(47768, 55675, 0.0434, 1, 0, 1, 1),
(47768, 55682, 0.0434, 1, 0, 1, 1),
(47768, 55683, 0.0434, 1, 0, 1, 1),
(47768, 55684, 0.0868, 1, 0, 1, 1),
(47768, 55691, 0.05, 1, 0, 1, 1),
(47768, 55692, 0.0347, 1, 0, 1, 1),
(47768, 55693, 0.05, 1, 0, 1, 1),
(47768, 55700, 0.0608, 1, 0, 1, 1),
(47768, 55701, 0.1, 1, 0, 1, 1),
(47768, 55702, 0.0347, 1, 0, 1, 1),
(47768, 55709, 0.05, 1, 0, 1, 1),
(47768, 55710, 0.0608, 1, 0, 1, 1),
(47768, 55711, 0.0521, 1, 0, 1, 1),
(47768, 55718, 0.0564, 1, 0, 1, 1),
(47768, 55719, 0.05, 1, 0, 1, 1),
(47768, 55720, 0.05, 1, 0, 1, 1),
(47768, 55727, 0.1, 1, 0, 1, 1),
(47768, 55728, 0.05, 1, 0, 1, 1),
(47768, 55729, 0.1, 1, 0, 1, 1),
(47768, 55736, 0.1, 1, 0, 1, 1),
(47768, 55737, 0.0912, 1, 0, 1, 1),
(47768, 55738, 0.0651, 1, 0, 1, 1),
(47768, 55745, 0.05, 1, 0, 1, 1),
(47768, 55746, 0.05, 1, 0, 1, 1),
(47768, 55747, 0.05, 1, 0, 1, 1),
(47768, 55754, 0.0564, 1, 0, 1, 1),
(47768, 55755, 0.05, 1, 0, 1, 1),
(47768, 55756, 0.0521, 1, 0, 1, 1),
(47768, 55763, 0.05, 1, 0, 1, 1),
(47768, 55765, 0.1, 1, 0, 1, 1),
(47768, 55772, 0.1, 1, 0, 1, 1),
(47768, 55773, 0.05, 1, 0, 1, 1),
(47768, 55774, 0.0695, 1, 0, 1, 1),
(47768, 58256, 5.6602, 1, 0, 1, 1),
(47768, 58268, 10.4395, 1, 0, 1, 1),
(47768, 58269, 13.3197, 1, 0, 1, 1),
(47768, 62063, 0.2866, 1, 0, 1, 1),
(47768, 62064, 0.3308, 1, 0, 1, 1),
(47768, 62065, 0.2, 1, 0, 1, 1),
(47768, 62068, 0.2866, 1, 0, 1, 1),
(47768, 62069, 0.3343, 1, 0, 1, 1),
(47768, 62070, 0.2779, 1, 0, 1, 1),
(47768, 62082, 0.178, 1, 0, 1, 1),
(47768, 62093, 0.1777, 1, 0, 1, 1),
(47768, 62101, 0.05, 1, 0, 1, 1),
(47768, 62102, 0.1433, 1, 0, 1, 1),
(47768, 62105, 0.0651, 1, 0, 1, 1),
(47768, 62107, 0.0868, 1, 0, 1, 1),
(47768, 62108, 0.0825, 1, 0, 1, 1),
(47768, 62110, 0.1012, 1, 0, 1, 1),
(47768, 62111, 0.1, 1, 0, 1, 1),
(47768, 62113, 0.1085, 1, 0, 1, 1),
(47768, 62116, 0.0825, 1, 0, 1, 1),
(47768, 62121, 0.0963, 1, 0, 1, 1),
(47768, 62123, 0.0999, 1, 0, 1, 1),
(47768, 62124, 0.1135, 1, 0, 1, 1),
(47768, 62126, 0.0695, 1, 0, 1, 1),
(47768, 62127, 0.1085, 1, 0, 1, 1),
(47768, 62128, 0.0912, 1, 0, 1, 1),
(47768, 62129, 0.0868, 1, 0, 1, 1),
(47768, 62130, 0.1728, 1, 0, 1, 1),
(47768, 62132, 0.1129, 1, 0, 1, 1),
(47768, 62134, 0.1042, 1, 0, 1, 1),
(47768, 62135, 0.0955, 1, 0, 1, 1),
(47768, 62136, 0.1, 1, 0, 1, 1),
(47768, 63291, 21.5164, 1, 0, 1, 1),
(47768, 63300, 9.2213, 1, 0, 1, 1),
(47768, 63310, 7.582, 1, 0, 1, 1),
(47768, 63316, 2.0492, 1, 0, 1, 1),
(47768, 63317, 22.3361, 1, 0, 1, 1),
(47768, 63318, 0.4098, 1, 0, 1, 1),
(47768, 63348, 30.5328, 1, 0, 1, 1),
(47768, 63349, 20.082, 1, 0, 1, 1),
(47768, 65894, 0.0765, 1, 0, 1, 1),
(47768, 65895, 0.0148, 1, 0, 1, 1),
(47768, 65896, 0.0174, 1, 0, 1, 1),
(47768, 65897, 0.0642, 1, 0, 1, 1),
(47768, 66940, 0.0043, 1, 0, 1, 1),
(47768, 66942, 0.0074, 1, 0, 1, 1),
(47768, 66968, 0.0074, 1, 0, 1, 1),
(47768, 66970, 0.0074, 1, 0, 1, 1),
(47768, 66973, 0.0099, 1, 0, 1, 1),
(47768, 66974, 0.0049, 1, 0, 1, 1),
(47768, 66991, 0.0043, 1, 0, 1, 1),
(47768, 66994, 0.0043, 1, 0, 1, 1),
(47768, 67059, 0.0074, 1, 0, 1, 1),
(47768, 67061, 0.0043, 1, 0, 1, 1),
(47768, 67067, 0.0049, 1, 0, 1, 1),
(47768, 67119, 0.0049, 1, 0, 1, 1),
(47768, 67120, 0.0049, 1, 0, 1, 1),
(47768, 67124, 0.0087, 1, 0, 1, 1),
(47768, 67125, 0.0043, 1, 0, 1, 1),
(47768, 67127, 0.0043, 1, 0, 1, 1),
(47768, 67131, 0.0025, 1, 0, 1, 1),
(47768, 67132, 0.0025, 1, 0, 1, 1),
(47768, 67133, 0.0025, 1, 0, 1, 1),
(47768, 67140, 0.0049, 1, 0, 1, 1),
(47768, 67142, 0.0049, 1, 0, 1, 1),
(47768, 67539, 0.1753, 1, 0, 1, 1),
(47768, 68197, 7.8398, 1, 0, 1, 1),
(47768, 68198, 20.8437, 1, 0, 1, 1),
(47768, 68787, 0.0025, 1, 0, 1, 1);

-- Glopgut Hurler
SET @ENTRY := 47768;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,8000,8000,20000,20000,11,85257,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Heave"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,100,100,4000,5500,11,75934,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Spear Throw"),
(@ENTRY,@SOURCETYPE,2,0,4,0,100,0,0,0,0,0,1,0,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Talk 0");

-- Thog
SET @ENTRY := 47770;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,79892,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Aggro - Cast Water Shield"),
(@ENTRY,@SOURCETYPE,1,0,4,0,100,0,0,0,0,0,11,39591,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Aggro - Cast Searing Totem"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,1000,1000,4000,6000,11,79884,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Lightning Bolt"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,15000,15000,15000,15000,11,14900,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Chain Heal");

DELETE FROM `creature_text` WHERE `entry`=47768;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47768,0,0,'Me kill you with the truffle shuffle!',12,0,100,0,0,0,'Comment');

DELETE FROM `spell_area` WHERE `spell` = '88911' AND `quest_start` = '28151';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`) VALUES
(88911, 5639, 28151, 28151, 1, 10);

DELETE FROM `spell_area` WHERE `spell` = '88911' AND `quest_start` = '28166';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`) VALUES
(88911, 5639, 28166, 28166, 1, 10);

UPDATE `creature` SET `phaseMask`=2, `spawntimesecs`=30, `spawndist`=8, `MovementType`=1 WHERE `id` IN (47823, 47824);
UPDATE `creature_template` SET `ScriptName`='npc_th_uchek_in_cave' WHERE `entry`=47826;

DELETE FROM `areatrigger_scripts` WHERE `entry` IN (6654, 6655, 6656);
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(6654, 'at_th_first_shrine'),
(6655, 'at_th_second_shrine'),
(6656, 'at_th_third_shrine');

DELETE FROM `conditions` WHERE `SourceEntry` = '88983';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ScriptName`, `Comment`) VALUES
(13, 1, 88983, 0, 0, 31, 0, 3, 47823, 0, 0, 0, '', 'Targeting -> Spirits'),
(13, 1, 88983, 0, 1, 31, 0, 3, 47824, 0, 0, 0, '', 'Targeting -> Spirits');

UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `DamageModifier`=0.5 WHERE `entry`IN (47823, 47824);

ALTER TABLE `creature_transport`
	CHANGE COLUMN `emote` `emote` INT(11) NOT NULL DEFAULT '0' AFTER `TransOffsetO`;

UPDATE `creature_template` SET `speed_walk`=0.0001, `speed_run`=0.0001 WHERE `entry`=49135;

DELETE FROM `creature_transport` WHERE `transport_entry` = '207227';
INSERT INTO `creature_transport` (`guid`, `transport_entry`, `npc_entry`, `phasemask`, `TransOffsetX`, `TransOffsetY`, `TransOffsetZ`, `TransOffsetO`, `emote`) VALUES
(6, 207227, 49135, 16777215, -7.29968, 0.13921, -16.4926, 1.62579, 0),
(5, 207227, 49135, 16777215, -20.7015, -5.82127, -13.4536, 1.85748, 0),
(4, 207227, 49135, 16777215, -21.8678, -7.88221, -13.2579, 1.85356, 0),
(3, 207227, 49135, 16777215, -5.02447, 0.0168523, -17.8371, 1.6695, 0),
(2, 207227, 49379, 16777215, 3.72917, -9.23752, -17.9205, 5.27841, 0),
(1, 207227, 49378, 16777215, 4.7198, -10.8033, -17.8862, 1.90906, 0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '49135';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(49135, 46598, 1);

DELETE FROM `spell_area` WHERE `spell` = '98433' AND `quest_start` = '28590';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(98433, 4922, 28590, 1, 74, 0);

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '64';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 64, 1, 4, 'Twilight Highlands [H]: Negate Phase 1 On Quest Accepted: If The Key Fits [28092]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '64' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '28092';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 64, 0, 0, 9, 0, 28092, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '65';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 65, 16384, 0, 'Twilight Highlands [H]: Add Phase 16384 On Quest Accept: If The Key Fits [28092]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '65' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '28092';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 65, 0, 0, 9, 0, 28092, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '66';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 66, 16384, 4, 'Twilight Highlands [H]: Negate Phase 16384 On Quest Complete: If The Key Fits [28092]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '66' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28092';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 66, 0, 0, 28, 0, 28092, 0, 0, 0, 0, 0, '', '');

UPDATE `creature` SET `phaseMask`=8192 WHERE `id`=47505;
UPDATE `creature_template` SET `ScriptName`='npc_th_wyrms_bend_fighter' WHERE `entry` IN (47505, 47506);

DELETE FROM `creature_text` WHERE `entry`=47374;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47374,0,0,'Squad reporting.',12,0,100,0,0,0,'Comment'),
(47374,1,0,'Find some flanking positions.',12,0,100,0,0,0,'Comment'),
(47374,2,0,'Get in positions.',12,0,100,0,0,0,'Comment'),
(47374,3,0,'Break out the gatestone. Open this thing up.',12,0,100,0,0,0,'Comment'),
(47374,4,0,'It\'s never easy, is it? That\'s alright, we came prepared.',12,0,100,0,0,0,'Comment'),
(47374,5,0,'Blow it open. There isn\'t a problem that some explosives can\'t solve.',12,0,100,0,0,0,'Comment'),
(47374,6,0,'Highbank Lieutenant looks confused.',16,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=47375;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47375,0,0,'On it.',12,0,100,0,0,0,'Comment'),
(47375,1,0,'Almost done.',12,0,100,0,0,0,'Comment'),
(47375,2,0,'Charges are set. Might want to get clear!',12,0,100,0,0,0,'Comment'),
(47375,3,0,'What did you just call my mother?',12,0,100,0,0,0,'Comment'),
(47375,3,1,'Now that\'s just rude...',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=47376;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47376,0,0,'Right away sir. Er... I don\'t see a slot to put it in?',12,0,100,0,0,0,'Comment'),
(47376,1,0,'Was that... Yoga?',12,0,100,0,0,0,'Comment'),
(47376,1,1,'You want me to steal third?',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=47378;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47378,0,0,'Enemy down.',12,0,100,0,0,0,'Comment'),
(47378,1,0,'I don\'t think that\'s physically possible, sir.',12,0,100,0,0,0,'Comment'),
(47378,1,1,'Sir, I think the explosions and gunfire gave us away. You don\'t have to use hand signals.',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=47377;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47377,0,0,'What the heck was that?',12,0,100,0,0,0,'Comment'),
(47377,0,1,'Leading under the influence...',12,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `npcflag`=3 WHERE `entry`=47374;
UPDATE `creature_template` SET `npcflag`=1 WHERE `entry` IN (47377, 47375, 47376, 47378);
UPDATE `creature_template` SET `scriptname`='npc_th_mathias_squadron' WHERE `entry` IN (47377, 47375, 47376, 47378, 47374);
UPDATE `creature_template` SET `ScriptName`='npc_th_warlord_krogg_pass' WHERE `entry`=47493;
UPDATE `quest_template` SET `PrevQuestId`='28591' WHERE `Id` IN (28592, 28593, 28594);

DELETE FROM `creature_text` WHERE `entry`=47493;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47493,0,0,'They\'ve already assembled. I\'m trusting you to secure the route to Grim Batol. Don\'t let me down.',12,0,100,0,0,0,'Comment');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` IN (35, 36);
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `phaseId`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 36, 8192, 0, 0, 0, 'Twilight Highlands [A]: Add Phase 8192 On Quest Rewarded: Patchwork Command [27576]'),
(4922, 35, 8192, 0, 0, 0, 'Twilight Highlands [A]: Add Phase 8192 On Quest Complete: Patchwork Command [27576]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry`='35' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '27576';
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry`='36' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '27576';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 35, 0, 0, 28, 0, 27576, 0, 0, 0, 0, 0, '', ''),
(25, 4922, 36, 0, 0, 8, 0, 27576, 0, 0, 0, 0, 0, '', '');

-- Deletes creature Warlord Krogg (id: 47493, guid: 754031) in zone: 4922, area: 5462
DELETE FROM `creature` WHERE `guid` = 754031; DELETE FROM creature_addon WHERE guid = 754031;

UPDATE `quest_template` SET `PrevQuestId`='28097' WHERE `Id`=28094;

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '67';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 67, 8192, 4, 'Twilight Highlands [H]: Negate Phase 8192 On Quest Complete: Pressing Forward [28093]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '67' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28093';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 67, 0, 0, 28, 0, 28093, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '68';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 68, 8192, 4, 'Twilight Highlands [H]: Negate Phase 8192 On Quest Rewarded: Pressing Forward [28093]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '68' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28093';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 68, 0, 0, 8, 0, 28093, 0, 0, 0, 0, 0, '', '');

DELETE FROM `spell_area` WHERE `spell` = '49416' AND `quest_start` = '28092';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(49416, 1037, 28092, 28712, 1, 66, 11);

DELETE FROM `spell_area` WHERE `spell` = '94568' AND `quest_start` = '28092';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(94568, 1037, 28092, 0, 1, 66, 0);

UPDATE `quest_template` SET `PrevQuestId`='0' WHERE `Id`=28712;
UPDATE `quest_template` SET `PrevQuestId`='28247' WHERE `Id`=28249;
UPDATE `quest_template` SET `PrevQuestId`='28249' WHERE `Id` IN (27491, 27497);
UPDATE `quest_template` SET `PrevQuestId`='27590' WHERE `Id`=27609;

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '69';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 69, 65536, 0, 'Twilight Highlands [H]: Add Phase 65536 On Quest Accepted: 27495');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '69' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '27495';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 69, 0, 0, 9, 0, 27495, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '70';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 70, 65536, 0, 'Twilight Highlands [H]: Add Phase 65536 On Quest Complete: 27495');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '70' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '27495';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 70, 0, 0, 28, 0, 27495, 0, 0, 0, 0, 0, '', '');

UPDATE `creature_template` SET `ScriptName`='npc_th_lady_cozwynn' WHERE `entry`=45665;

DELETE FROM `vehicle_template_accessory` WHERE `entry` = '45942';
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(45942, 45944, 1, 'Kor\'Kron Assassin on Windrider', 8, 0);

UPDATE `creature_template` SET `ScriptName`='npc_th_jon_jon_jellyneck' WHERE `entry`=45947;
UPDATE `creature_template` SET `VehicleId`=1166, `InhabitType`=4 WHERE `entry`=45942;

DELETE FROM `creature_text` WHERE `entry`=46119;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(46119,0,0,'We should move out, $n. Up the ramp and then straight to Master Shaw.',12,0,100,0,0,0,'Comment'),
(46119,1,0,'Wait! Do you hear something?',12,0,100,0,0,0,'Comment'),
(46119,2,0,'Cho\'gall!',12,0,100,0,0,0,'Comment'),
(46119,3,0,'Kill him!',14,0,100,0,0,0,'Comment');

UPDATE `creature_template` SET `ScriptName`='npc_th_kor_kron_commander' WHERE `entry`=46119;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '45942';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(45942, 46598, 0);

UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3 WHERE `entry`=45944;

-- Kor'kron Assassin
SET @ENTRY := 45944;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="" WHERE entry=@ENTRY LIMIT 1;

UPDATE `creature` SET `phaseMask`=1 WHERE `guid`=764249;
UPDATE `creature_template_addon` SET `auras`='86603 10022 82343' WHERE `entry`=45675;

DELETE FROM `spell_area` WHERE `spell` = '90161' AND `quest_start` = '27638';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(90161, 5473, 27638, 1, 74, 0);

UPDATE `quest_template` SET `PrevQuestId`='27638' WHERE `Id` IN (27653, 27655, 27658);

DELETE FROM `conditions` WHERE `SourceEntry` = '27689' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27689, 27653, 0),
(20, 8, 27689, 27655, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27689' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27689, 27653, 0),
(19, 8, 27689, 27655, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27696' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27696, 27653, 0),
(20, 8, 27696, 27655, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27696' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27696, 27653, 0),
(19, 8, 27696, 27655, 0);

UPDATE `quest_template` SET `PrevQuestId`='27745' WHERE `Id`=27783;
UPDATE `quest_template` SET `PrevQuestId`='0' WHERE `Id` IN (27660, 27662, 27659);

DELETE FROM `conditions` WHERE `SourceEntry` = '27660' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27660, 27657, 0),
(20, 8, 27660, 27658, 1);

DELETE FROM `conditions` WHERE `SourceEntry` = '27660' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27660, 27657, 0),
(19, 8, 27660, 27658, 1);

DELETE FROM `conditions` WHERE `SourceEntry` = '27662' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27662, 27657, 0),
(20, 8, 27662, 27658, 1);

DELETE FROM `conditions` WHERE `SourceEntry` = '27662' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27662, 27657, 0),
(19, 8, 27662, 27658, 1);

DELETE FROM `conditions` WHERE `SourceEntry` = '27659' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27659, 27657, 0),
(20, 8, 27659, 27658, 1);

DELETE FROM `conditions` WHERE `SourceEntry` = '27659' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27659, 27657, 0),
(19, 8, 27659, 27658, 1);

UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=46386;

DELETE FROM `spell_area` WHERE `spell` = '86739' AND `quest_start` = '28885';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(86739, 5474, 28885, 27745, 1, 66, 11);

DELETE FROM `conditions` WHERE `SourceEntry` = '27659' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27659, 27657, 0),
(20, 8, 27659, 27658, 1);

DELETE FROM `conditions` WHERE `SourceEntry` = '27659' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27659, 27657, 0),
(19, 8, 27659, 27658, 1);

DELETE FROM `conditions` WHERE `SourceEntry` = '27742' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27742, 27720, 0),
(20, 8, 27742, 28885, 1);

DELETE FROM `conditions` WHERE `SourceEntry` = '27742' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27742, 27720, 0),
(19, 8, 27742, 28885, 1);

DELETE FROM `conditions` WHERE `SourceEntry` = '27743' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27743, 27720, 0),
(20, 8, 27743, 28885, 1);

DELETE FROM `conditions` WHERE `SourceEntry` = '27743' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27743, 27720, 0),
(19, 8, 27743, 28885, 1);

DELETE FROM `conditions` WHERE `SourceEntry` = '27744' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27744, 27720, 0),
(20, 8, 27744, 28885, 1);

DELETE FROM `conditions` WHERE `SourceEntry` = '27744' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27744, 27720, 0),
(19, 8, 27744, 28885, 1);

DELETE FROM `spell_area` WHERE `spell` = '94567' AND `quest_start` = '27786';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(94567, 5584, 27786, 27788, 0, 0, 2, 1, 66, 11);

UPDATE `creature_template` SET `npcflag`=1, `ScriptName`='npc_th_skyshredder_turret' WHERE `entry`=49135;

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '71';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 71, 16384, 0, 'Twilight Highlands [H]: Add Phase 16384 On Quest Accept: Off The Wall [28591]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '71' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '28591';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 71, 0, 0, 9, 0, 28591, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '72';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 72, 16384, 4, 'Twilight Highlands [H]: Negate Phase 16384 On Quest Complete: Off The Wall [28591]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '72' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28591';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 72, 0, 0, 28, 0, 28591, 0, 0, 0, 0, 0, '', '');

UPDATE `creature` SET `phaseMask`=16384, `spawntimesecs`=30 WHERE `id` IN (49060, 49025, 49124);

-- Highbank Marksman
SET @ENTRY := 49124;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,5,0,3500,5500,4500,8000,11,91571,2,0,0,0,0,11,49135,200,0,0.0,0.0,0.0,0.0,"OOC - Cast Shredder Round");

SET @CGUID := 842832;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+14;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@CGUID+0, 49025, 0, 1, 16384, 0, 1, -5000.07, -6761.9, 44.3878, 2.07119, 30, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+1, 49025, 0, 1, 16384, 0, 1, -4846.45, -6756.82, 11.5207, 3.32939, 30, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+2, 49025, 0, 1, 16384, 0, 1, -4900.89, -6650.8, 31.9159, 4.23574, 30, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+3, 49025, 0, 1, 16384, 0, 1, -4897.98, -6652.93, 31.9159, 3.68439, 30, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+4, 49025, 0, 1, 16384, 0, 1, -4912.72, -6636.66, 31.9143, 3.95692, 30, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+5, 49025, 0, 1, 16384, 0, 1, -4911.71, -6640.01, 31.9163, 3.43542, 30, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+6, 49025, 0, 1, 16384, 0, 1, -4913.9, -6609.16, 31.9136, 1.92352, 30, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+7, 49025, 0, 1, 16384, 0, 1, -4910.96, -6606.41, 31.9131, 2.32879, 30, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+8, 49025, 0, 1, 16384, 0, 1, -4905.88, -6601.6, 31.9131, 1.96436, 30, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+9, 49025, 0, 1, 16384, 0, 1, -4903.24, -6599.61, 31.9146, 2.58011, 30, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+10, 49025, 0, 1, 16384, 0, 1, -4869.7, -6611.75, 31.9161, 1.32269, 30, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+11, 49025, 0, 1, 16384, 0, 1, -4872.91, -6608.23, 31.9157, 0.84831, 30, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+12, 49025, 0, 1, 16384, 0, 1, -4775.79, -6607.12, 4.82319, 0.945699, 30, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+13, 49025, 0, 1, 16384, 0, 1, -4771.74, -6609.25, 4.85817, 1.52375, 30, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+14, 49025, 0, 1, 16384, 0, 1, -4735.94, -6632.17, 9.35449, 1.60386, 30, 0, 0, 70946, 0, 0, 0, 0, 0);

UPDATE `creature` SET `phaseMask`=2048, `spawntimesecs`=60, `spawndist`=0, `MovementType`=0 WHERE `id` IN (49023, 49024);
UPDATE `creature_template` SET `ScriptName`='npc_th_highbank_guardsman' WHERE `entry`=49023;

-- Deletes creature Highbank Guardsman (id: 49023, guid: 764765) in zone: 4922, area: 5140
DELETE FROM `creature` WHERE `guid` = 764765; DELETE FROM creature_addon WHERE guid = 764765;

-- Deletes creature Highbank Guardsman (id: 49023, guid: 764939) in zone: 4922, area: 5140
DELETE FROM `creature` WHERE `guid` = 764939; DELETE FROM creature_addon WHERE guid = 764939;

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '73';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 73, 2048, 0, 'Twilight Highlands [H]: Add Phase 2048 On Quest Accept: Parting Packages [28592]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '73' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '28592';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 73, 0, 0, 9, 0, 28592, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '74';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 74, 2048, 0, 'Twilight Highlands [H]: Add Phase 2048 On Quest Accept: Of Utmost Importance [28593]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '74' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '28593';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 74, 0, 0, 9, 0, 28593, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '75';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 75, 2048, 0, 'Twilight Highlands [H]: Add Phase 2048 On Quest Accept: Highbank, Crybank [28594]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '75' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '28594';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 75, 0, 0, 9, 0, 28594, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '76';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 76, 1, 4, 'Twilight Highlands [H]: Negate Phase 1 On Quest Accept: Parting Packages [28592]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '76' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '28592';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 76, 0, 0, 9, 0, 28592, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '77';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 77, 1, 4, 'Twilight Highlands [H]: Negate Phase 1 On Quest Accept: Of Utmost Importance [28593]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '77' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '28593';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 77, 0, 0, 9, 0, 28593, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '78';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 78, 1, 4, 'Twilight Highlands [H]: Negate Phase 1 On Quest Accept: Highbank, Crybank [28594]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '78' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '28594';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 78, 0, 0, 9, 0, 28594, 0, 0, 0, 0, 0, '', '');

UPDATE `creature` SET `phaseMask`=2048 WHERE `guid` IN (764254, 764252, 764255);

DELETE FROM `spell_area` WHERE `spell` = '98546' AND `quest_start` = '28592';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`) VALUES
(98546, 5140, 28592, 28595, 1, 10);

DELETE FROM `spell_area` WHERE `spell` = '98546' AND `quest_start` = '28593';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`) VALUES
(98546, 5140, 28593, 28595, 1, 10);

DELETE FROM `spell_area` WHERE `spell` = '98546' AND `quest_start` = '28594';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`) VALUES
(98546, 5140, 28594, 28595, 1, 10);

SET @CGUID := 842847;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+51;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@CGUID+0, 49008, 0, 1, 2048, 0, 1, -4917.08, -6627.96, 18.9656, 0.951014, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+1, 49008, 0, 1, 2048, 0, 1, -4923.42, -6629.29, 18.9656, 0.583447, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+2, 49008, 0, 1, 2048, 0, 1, -4886.88, -6602.63, 18.9661, 3.7164, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+3, 49008, 0, 1, 2048, 0, 1, -4857.65, -6626.47, 10.8339, 5.28092, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+4, 49008, 0, 1, 2048, 0, 1, -4878.94, -6607.32, 10.8344, 2.02151, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+5, 49008, 0, 1, 2048, 0, 1, -4868.56, -6617.8, 10.8452, 0.714611, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+6, 49008, 0, 1, 2048, 0, 1, -4915.43, -6630.35, 10.8301, 2.23514, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+7, 49008, 0, 1, 2048, 0, 1, -4895.61, -6659.94, 10.8334, 5.35396, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+8, 49008, 0, 1, 2048, 0, 1, -4902.77, -6646.08, 10.8454, 3.67949, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+9, 49008, 0, 1, 2048, 0, 1, -4756.99, -6707.88, 7.52902, 6.22261, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+10, 49008, 0, 1, 2048, 0, 1, -4756.19, -6704.51, 7.84644, 6.01526, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+11, 49008, 0, 1, 2048, 0, 1, -4746.25, -6740.9, 5.15909, 5.51418, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+12, 49008, 0, 1, 2048, 0, 1, -4767.13, -6744.58, 9.41804, 5.25029, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+13, 49008, 0, 1, 2048, 0, 1, -4825.69, -6730.04, 8.96126, 2.62863, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+14, 49008, 0, 1, 2048, 0, 1, -4915.33, -6691.35, 4.65863, 1.59465, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+15, 49008, 0, 1, 2048, 0, 1, -4899.58, -6708.03, 4.82075, 1.90881, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+16, 49008, 0, 1, 2048, 0, 1, -4873.57, -6684.17, 9.38026, 3.24949, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+17, 49008, 0, 1, 2048, 0, 1, -4843.32, -6662.42, 8.19748, 1.24515, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+18, 49008, 0, 1, 2048, 0, 1, -4813.94, -6594.94, 9.41654, 5.76197, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+19, 49008, 0, 1, 2048, 0, 1, -4853.2, -6598.8, 9.41654, 5.86329, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+20, 49008, 0, 1, 2048, 0, 1, -4833.72, -6617.58, 9.31301, 1.2695, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+21, 49008, 0, 1, 2048, 0, 1, -4833.19, -6611.93, 9.24026, 5.51929, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+22, 49008, 0, 1, 2048, 0, 1, -4799.83, -6627.84, 4.97694, 0.870516, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+23, 49008, 0, 1, 2048, 0, 1, -4778.8, -6639.13, 4.33234, 6.24578, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+24, 49008, 0, 1, 2048, 0, 1, -4767.87, -6641.74, 4.55614, 0.880729, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+25, 49008, 0, 1, 2048, 0, 1, -4769.23, -6657, 4.37155, 1.83499, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+26, 49008, 0, 1, 2048, 0, 1, -4767.45, -6661.15, 4.34526, 4.77002, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+27, 49008, 0, 1, 2048, 0, 1, -4765.59, -6665.69, 4.33315, 1.21059, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+28, 49008, 0, 1, 2048, 0, 1, -4756.98, -6677.67, 4.84183, 2.07218, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+29, 49008, 0, 1, 2048, 0, 1, -4757.61, -6671.51, 4.42511, 4.77159, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+30, 49008, 0, 1, 2048, 0, 1, -4752.92, -6673.54, 4.75669, 3.3995, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+31, 49008, 0, 1, 2048, 0, 1, -4761.33, -6675.67, 4.48504, 0.952984, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+32, 49008, 0, 1, 2048, 0, 1, -4772.4, -6688.19, 4.33039, 1.64256, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+33, 49008, 0, 1, 2048, 0, 1, -4778.44, -6694.63, 4.33039, 3.43484, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+34, 49008, 0, 1, 2048, 0, 1, -4787.42, -6683.99, 5.56023, 4.23752, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+35, 49008, 0, 1, 2048, 0, 1, -4789.35, -6689.9, 5.158, 2.83637, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+36, 49008, 0, 1, 2048, 0, 1, -4793.39, -6701.48, 4.59731, 0.342729, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+37, 49008, 0, 1, 2048, 0, 1, -4805.67, -6687.51, 5.15746, 0.798262, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+38, 49008, 0, 1, 2048, 0, 1, -4807.97, -6679.98, 5.18558, 3.3885, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+39, 49008, 0, 1, 2048, 0, 1, -4808.12, -6682.49, 5.17086, 3.32017, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+40, 49008, 0, 1, 2048, 0, 1, -4814.96, -6685.23, 4.91396, 0.30817, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+41, 49008, 0, 1, 2048, 0, 1, -4824.38, -6684.74, 4.34157, 0.897219, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+42, 49008, 0, 1, 2048, 0, 1, -4833.23, -6681.81, 4.49883, 3.19687, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+43, 49008, 0, 1, 2048, 0, 1, -4840.67, -6687.05, 4.53445, 0.83282, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+44, 49008, 0, 1, 2048, 0, 1, -4840.83, -6695.81, 4.34293, 0.622335, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+45, 49008, 0, 1, 2048, 0, 1, -4853.06, -6698.22, 4.34639, 5.52008, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+46, 49008, 0, 1, 2048, 0, 1, -4855.08, -6700.31, 4.34065, 5.91592, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+47, 49008, 0, 1, 2048, 0, 1, -4860.96, -6705.55, 4.33413, 0.0568513, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+48, 49008, 0, 1, 2048, 0, 1, -4874.19, -6702.97, 5.01942, 1.00169, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+49, 49008, 0, 1, 2048, 0, 1, -4872.5, -6704.02, 4.89992, 0.903511, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+50, 49008, 0, 1, 2048, 0, 1, -4877.41, -6713.99, 4.53703, 1.25773, 60, 0, 0, 70946, 0, 0, 0, 0, 0),
(@CGUID+51, 49008, 0, 1, 2048, 0, 1, -4923.72, -6747.56, 5.62413, 2.89999, 60, 0, 0, 70946, 0, 0, 0, 0, 0);

UPDATE `creature` SET `phaseMask`=2048 WHERE `guid` IN (764306, 764311, 764269, 764303);

DELETE FROM `spell_script_names` WHERE `spell_id` = '91976';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(91976, 'spell_th_place_ticker_explosives');

UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=49384;

DELETE FROM `creature_text` WHERE `entry`=49384;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(49384,0,0,'3...',42,0,100,0,0,0,'Comment'),
(49384,1,0,'2...',42,0,100,0,0,0,'Comment'),
(49384,2,0,'1...',42,0,100,0,0,0,'Comment');

-- Highbank Bomb Controller Bunny
SET @ENTRY := 49384;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,1,0,1000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,52,0,100,0,0,49384,0,0,1,1,1000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"After Talk 0 - Talk 1"),
(@ENTRY,@SOURCETYPE,2,0,52,0,100,0,1,49384,0,0,1,2,1000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"After Talk 1 - Talk 2"),
(@ENTRY,@SOURCETYPE,3,0,52,0,100,0,2,49384,0,0,11,91980,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 2 - Cast Explosion"),
(@ENTRY,@SOURCETYPE,4,0,52,0,100,0,2,49384,0,0,41,5000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 2 - Despawn");

DELETE FROM `creature_text` WHERE `entry`=49023;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(49023,0,0,'This land belongs to the Alliance, Horde wretch! Away with you!',12,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=49018;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(49018,0,0,'Oh come on! What about us?!',12,0,100,1,0,0,'Comment'),
(49018,1,0,'You\'re kidding, right? You came all the way here for THAT?!',12,0,100,1,0,0,'Comment'),
(49018,2,0,'Hey bud, I\'ll sell ya my wife if you get me outta here. She won\'t mind',12,0,100,1,0,0,'Comment');

UPDATE `creature` SET `phaseMask`=2048 WHERE `id` IN (49029, 49018);
UPDATE `creature` SET `phaseMask`=2048 WHERE `guid`=764266;
UPDATE `gameobject` SET `phaseMask`=2048 WHERE `guid` IN (727491, 727492, 727567);
UPDATE `gameobject` SET `spawntimesecs`=10 WHERE `guid`=727567;
UPDATE `gameobject_template` SET `ScriptName`='go_th_induction_samophlange' WHERE `entry`=207259;

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '79';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 79, 2048, 0, 'Twilight Highlands [H]: Add Phase 2048 On Quest Complete: Parting Packages [28592]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '79' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28592';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 79, 0, 0, 28, 0, 28592, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '80';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 80, 2048, 0, 'Twilight Highlands [H]: Add Phase 2048 On Quest Rewarded: Parting Packages [28592]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '80' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28592';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 80, 0, 0, 8, 0, 28592, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '81';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 81, 2048, 0, 'Twilight Highlands [H]: Add Phase 2048 On Quest Complete: Of Utomst Importance [28593]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '81' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28593';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 81, 0, 0, 28, 0, 28593, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '82';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 82, 2048, 0, 'Twilight Highlands [H]: Add Phase 2048 On Quest Rewarded: Of Utomst Importance [28593]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '82' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28593';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 82, 0, 0, 8, 0, 28593, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '83';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 83, 2048, 0, 'Twilight Highlands [H]: Add Phase 2048 On Quest Complete: Highbank, Crybank [28594]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '83' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28594';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 83, 0, 0, 28, 0, 28594, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '84';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 84, 2048, 0, 'Twilight Highlands [H]: Add Phase 2048 On Quest Rewarded: Highbank, Crybank [28594]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '84' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28594';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 84, 0, 0, 8, 0, 28594, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '85';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 85, 1, 4, 'Twilight Highlands [H]: Negate Phase 1 On Quest Complete: Parting Packages [28592]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '85' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28592';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 85, 0, 0, 28, 0, 28592, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '86';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 86, 1, 4, 'Twilight Highlands [H]: Negate Phase 1 On Quest Complete: Of Utmost Importance [28593]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '86' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28593';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 86, 0, 0, 28, 0, 28593, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '87';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 87, 1, 4, 'Twilight Highlands [H]: Negate Phase 1 On Quest Complete: Highbank, Crybank [28594]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '87' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28594';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 87, 0, 0, 28, 0, 28594, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '88';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 88, 1, 4, 'Twilight Highlands [H]: Negate Phase 1 On Quest Rewarded: Parting Packages [28592]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '88' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28592';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 88, 0, 0, 8, 0, 28592, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '89';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 89, 1, 4, 'Twilight Highlands [H]: Negate Phase 1 On Quest Rewarded: Of Utmost Importance [28593]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '89' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28593';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 89, 0, 0, 8, 0, 28593, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '90';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 90, 1, 4, 'Twilight Highlands [H]: Negate Phase 1 On Quest Rewarded: Highbank, Crybank [28594]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '90' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28594';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 90, 0, 0, 8, 0, 28594, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '91';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 91, 1, 0, 'Twilight Highlands [H]: Add Phase 1 On Quest Complete: Krazz Works! [28595]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '91' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28595';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 91, 0, 0, 28, 0, 28595, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '92';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 92, 1, 0, 'Twilight Highlands [H]: Add Phase 1 On Quest Rewarded: Krazz Works! [28595]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '92' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28595';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 92, 0, 0, 8, 0, 28595, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '93';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 93, 2048, 4, 'Twilight Highlands [H]: Negate Phase 2048 On Quest Complete: Krazz Works! [28595]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '93' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28595';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 93, 0, 0, 28, 0, 28595, 0, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` = '94';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(4922, 94, 2048, 4, 'Twilight Highlands [H]: Negate Phase 2048 On Quest Rewarded: Krazz Works! [28595]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '94' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28595';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 94, 0, 0, 8, 0, 28595, 0, 0, 0, 0, 0, '', '');

UPDATE `creature` SET `phaseMask`=2049 WHERE `guid` IN (764252, 764255, 764254);
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry` IN (49000, 49005, 49002);
UPDATE `creature_template` SET `ScriptName`='npc_th_skullcrusher_fighters', `DamageModifier`=9, `mechanic_immune_mask`=613097436, `unit_flags`=0  WHERE `entry` IN (47039, 46893, 46897);

DELETE FROM `creature_text` WHERE `entry`=47039;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(47039,0,0,'He\'s too powerful! You\'ve got to find a way to use those altars to give us an edge!',12,0,100,0,0,0,'Comment'),
(47039,1,0,'Revive your fallen companion by right-clicking on their unconscious body!',41,0,100,0,0,0,'Comment'),
(47039,2,0,'We cannot hold out against power of this magnitude! You must use the horn!',12,0,100,0,0,0,'Comment'),
(47039,3,0,'Blow into the Wildhammer horn to call for reinforcements!',41,0,100,0,0,0,'Comment');
