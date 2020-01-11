H_fnc_speech = compile (preprocessFileLineNumbers "functions\fn_speech.sqf");

badguy2 hideObject true; 
badguy2 enableSimulation false;

titleText ["", "BLACK FADED", 0.4];
playMusic "LeadTrack02_F_Malden";
wait = true;
addMusicEventHandler ["MusicStop", {[1] call BIS_fnc_cinemaBorder; wait = false; removeAllMusicEventHandlers "MusicStop"}];
sleep 1;
private _camera = "camera" camcreate [7476.2,8158.9,70];
_camera cameraeffect ["internal", "back"];
cameraEffectEnableHUD true;
_camera camPrepareTarget [7416.3,8111.98,0];
_camera camPrepareFOV 0.75;
_camera camPreparePos [7476.2,8158.9,70];
_camera camCommitPrepared 0;
[0] call BIS_fnc_cinemaBorder;
titleFadeOut 2;
sleep 2;
["After the events in the Mediterranean in 2035, NATO occupied the strategic island of Malden to prevent CSAT denying access to the Gibraltar Straits.",-1,-1,6,1] spawn BIS_fnc_dynamicText;
sleep 9;
["The local population in Malden were unhappy about NATO troops being present, not wanting to be drawn into conflict for a third time in recent history.",-1,-1,6,1] spawn BIS_fnc_dynamicText;
sleep 9;
["Protests were common place, and some even took up arms against the NATO forces. On the 1st of May 2036, a drone strike killed several prominent civilians.",-1,-1,6,1] spawn BIS_fnc_dynamicText;
sleep 9;
["Immediately, protests flared up across the country, mostly focussed at the airport and NATO garrison at the radio station.",-1,-1,6,1] spawn BIS_fnc_dynamicText;
sleep 9;
["NATO forces in La Trinitie became under siege at PB Moss, with protests blocking both entrances.",-1,-1,6,1] spawn BIS_fnc_dynamicText;
sleep 9;
["Local insurgent groups are determined to take advantage of the situation and overrun the isolated outpost.",-1,-1,6,1] spawn BIS_fnc_dynamicText;
sleep 9;
titleText ["", "BLACK", 1];
sleep 1;
_camera cameraEffect ["terminate","back"];
camDestroy _camera;
player switchMove "HubSpectator_walk";
titleFadeOut 0.5;
sleep 0.5;
[
	[
		["Private Dixon", "<t align = 'right' shadow = '1' size = '0.7' font='PuristaBold'>%1</t><br/>",5],
		["Patrol Base Moss, La Trinitie, Malden", "<t align = 'right' shadow = '1' size = '0.7'>%1</t><br/>",5],
		["Task Force Ship, NATO Garrison Forces (Malden)", "<t align = 'right' shadow = '1' size = '0.7'>%1</t><br/>", 5],
		["14 0200L MAY 36", "<t align = 'right' shadow = '1' size = '0.7'>%1</t>", 15]
	],
	safezoneX + safezoneW - 1,
	safezoneY + safezoneH - 0.5
] spawn BIS_fnc_typeText;
sleep 1.5;
player switchMove "HubSpectator_stand";
waitUntil {!wait};
player switchMove "";
sleep 3;
[ 
  ["Sergeant Connor","OK first squad, let them throw things, it won't hurt you.",0,[connor],3],
  ["Sergeant Connor","Just keep your eyes peeled for any weapons or insurgents, they'll be wanting to overrun the outpost tonight.",4,[connor],4],
  ["Sergeant Connor","Dixon! We need more light over here, head over to the south gate and grab the light over there.",9,[connor],4]
] spawn H_fnc_speech;
sleep 9;
[player, ["task1"], ["Sergeant Connor wants you to go to the southern gate and get the portable light, then bring it back to the northern gate.", "Redeploy the portable light", ""], objNull ,"CREATED"] call BIS_fnc_taskCreate;
[player, ["task1A","task1"], ["Pick up the portable single light by the northern gate", "Pick up the light", ""], light ,"ASSIGNED"] call BIS_fnc_taskCreate;
waitUntil {
	(light distance [7445.45,8067.84,0]) > 2
};
["task1A","SUCCEEDED"] call BIS_fnc_taskSetState;
[player, ["task1B","task1"], ["Deploy the light at the northern gate and aim it so that it shines away from the base.", "Deploy light at Northern gate", ""], [7395.73,8136.22,0] ,"ASSIGNED"] call BIS_fnc_taskCreate;

waitUntil {
	((light distance [7395.73,8136.22,0]) < 2) &&
	(getDir light > 60) && (getDir light < 160)
};
["task1B","SUCCEEDED"] call BIS_fnc_taskSetState;
["task1","SUCCEEDED"] call BIS_fnc_taskSetState;
[ 
  ["Sergeant Connor","Good job Dixon, get back on the line.",0,[connor],3]
] spawn H_fnc_speech;
[player, ["task2"], ["Return to the line", "Return to position", ""], [7393.4,8141.34,0] ,"ASSIGNED"] call BIS_fnc_taskCreate;
waitUntil {(player distance [7393.4,8141.34,0]) < 1};
["task2","SUCCEEDED"] call BIS_fnc_taskSetState;
saveGame;
sleep 8;
badguy2 hideObject false; 
badguy2 enableSimulation true;
sleep 4;
[ 
  ["Sergeant Connor","The South Gate's in contact, keep your eyes open!",0,[connor],3]
] spawn H_fnc_speech;
sleep 12;
badguy addMagazine ["30Rnd_9x21_Mag", 2];
badguy addWeapon "hgun_PDW2000_F";
sleep 1;
badguy setCaptive false;
playMusic "SkyNet";
private _groupCiv = createGroup CIVILIAN;
{
	if ((_x isKindOf "Civilian") && !(_x == badguy)) then {
		[_x] joinSilent _groupCiv;
		_x enableai "path";
		_x allowFleeing 1;
		_x doMove [7231.33,8008.35,0];
	};
} forEach allUnits;
private _group = [[7340,8159.04,0], EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_G_F" >> "Infantry" >> "O_G_InfSquad_Assault")] call BIS_fnc_spawnGroup;
_wp = _group addWaypoint [[7407.83,8128.6,0], 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointCombatMode "RED";
_wp setWaypointFormation "WEDGE";
_group setCurrentWaypoint _wp;
sleep 30;
private _group = [[7340,8159.04,0], EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_G_F" >> "Infantry" >> "O_G_InfSquad_Assault")] call BIS_fnc_spawnGroup;
_wp = _group addWaypoint [[7407.83,8128.6,0], 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointCombatMode "RED";
_wp setWaypointFormation "WEDGE";
_group setCurrentWaypoint _wp;
sleep 30;
private _group = [[7340,8159.04,0], EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_G_F" >> "Infantry" >> "O_G_InfSquad_Assault")] call BIS_fnc_spawnGroup;
_wp = _group addWaypoint [[7407.83,8128.6,0], 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointCombatMode "RED";
_wp setWaypointFormation "WEDGE";
_group setCurrentWaypoint _wp;
sleep 60;
private _group = [[7340,8159.04,0], EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_G_F" >> "Infantry" >> "O_G_InfSquad_Assault")] call BIS_fnc_spawnGroup;
_wp = _group addWaypoint [[7407.83,8128.6,0], 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointCombatMode "RED";
_wp setWaypointFormation "WEDGE";
_group setCurrentWaypoint _wp;
waitUntil {{side _x == east} count allUnits < 6};
badguy2 setDammage 1;
sleep 10;
["end1",true] call BIS_fnc_endMission;