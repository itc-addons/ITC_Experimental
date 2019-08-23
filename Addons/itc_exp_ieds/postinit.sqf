player setVariable ["itc_exp_ecm",0,true];
player setVariable ["itc_exp_chatAllowed",true,true];

_ECMon = ["ecmOn", "Turn ECM On", "", {

	if ("ACE_Banana" in (items player)) then {player setVariable ["itc_exp_ecm",5,true]};
	if ("ACE_UAVBattery" in (items player)) then {player setVariable ["itc_exp_ecm",25,true]};
	if ("ToolKit" in (items player)) then {player setVariable ["itc_exp_ecm",50,true]};
	[] spawn itc_exp_fnc_ecmOn;
}, {("ToolKit" in (items player)) || ("ACE_UAVBattery" in (items player)) ||("ACE_Banana" in (items player)) && ((player getVariable "itc_exp_ecm") == 0)}] call ace_interact_menu_fnc_createAction;

_ECMoff = ["ecmOff", "Turn ECM Off", "", {player setVariable ["itc_exp_ecm",0,true]}, {("ToolKit" in (items player)) || ("ACE_UAVBattery" in (items player)) ||("ACE_Banana" in (items player)) && ((player getVariable "itc_exp_ecm")>0)}] call ace_interact_menu_fnc_createAction;

["CAManBase", 1, ["ACE_SelfActions","ACE_Equipment"], _ECMon, true] call ace_interact_menu_fnc_addActionToClass;
["CAManBase", 1, ["ACE_SelfActions","ACE_Equipment"], _ECMoff, true] call ace_interact_menu_fnc_addActionToClass;

[{
    params ["_unit", "_range", "_explosive", "_fuzeTime", "_triggerItem"];
    if ((({(_x distance _explosive) < (_x getVariable "itc_exp_ecm")} count allPlayers) > 0) && ((_triggerItem == "ace_cellphone") || (_triggerItem == "ace_m26_clacker") || (_triggerItem == "ACE_DeadManSwitch"))) exitWith { false }; 
    true
}] call ace_explosives_fnc_addDetonateHandler;

if (isClass (configfile >> "CfgPatches" >> "acre_main")) then {
	[itc_exp_fnc_ecmOnACRE]  call acre_api_fnc_setCustomSignalFunc;
};
