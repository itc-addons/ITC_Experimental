itc_fnc_ied = compile (preprocessFileLineNumbers "functions\ied.sqf");

_ECMon = ["ecmOn", "Turn ECM On", "", {

	if ("ACE_Banana" in (items player)) then {player setVariable ["H_ECM",5,true]};
	if ("ACE_UAVBattery" in (items player)) then {player setVariable ["H_ECM",25,true]};
	if ("ToolKit" in (items player)) then {player setVariable ["H_ECM",50,true]};

}, {("ToolKit" in (items player)) || ("ACE_UAVBattery" in (items player)) ||("ACE_Banana" in (items player)) && ((player getVariable "H_ECM") == 0)}] call ace_interact_menu_fnc_createAction;

_ECMoff = ["ecmOff", "Turn ECM Off", "", {player setVariable ["H_ECM",0,true]}, {("ToolKit" in (items player)) || ("ACE_UAVBattery" in (items player)) ||("ACE_Banana" in (items player)) && ((player getVariable "H_ECM")>0)}] call ace_interact_menu_fnc_createAction;

["CAManBase", 1, ["ACE_SelfActions","ACE_Equipment"], _ECMon, true] call ace_interact_menu_fnc_addActionToClass;
["CAManBase", 1, ["ACE_SelfActions","ACE_Equipment"], _ECMoff, true] call ace_interact_menu_fnc_addActionToClass;

player setVariable ["H_ECM",0,true];