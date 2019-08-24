player setVariable ["itc_exp_ecm",0,true];
player setVariable ["itc_exp_chatAllowed",true,true];

_ECMon = ["ecmOn", "Turn ECM On", "", {

	if ("itc_exp_ecmL" in (items player)) then {player setVariable ["itc_exp_ecm",5,true]};
	if ("itc_exp_ecmM" in (items player)) then {player setVariable ["itc_exp_ecm",25,true]};
	if ("itc_exp_ecmH" in (items player)) then {player setVariable ["itc_exp_ecm",50,true]};
	[] spawn itc_exp_fnc_ecmOn;
}, {("itc_exp_ecmH" in (items player)) || ("itc_exp_ecmM" in (items player)) ||("itc_exp_ecmL" in (items player)) && ((player getVariable "itc_exp_ecm") == 0)}] call ace_interact_menu_fnc_createAction;

_ECMoff = ["ecmOff", "Turn ECM Off", "", {player setVariable ["itc_exp_ecm",0,true]}, {("itc_exp_ecmH" in (items player)) || ("itc_exp_ecmM" in (items player)) ||("itc_exp_ecmL" in (items player)) && ((player getVariable "itc_exp_ecm")>0)}] call ace_interact_menu_fnc_createAction;

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
