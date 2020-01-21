player setVariable ["itc_exp_chatAllowed",true,true];
player setVariable ["itc_exp_checkingECM",false,true];
player setVariable ["itc_exp_hasECMOn",false,true];

if (isServer) then {
	missionNameSpace setVariable ["itc_exp_ecmUnits",[],true];
};

if (!isDedicated) then {
	["itc_exp_ecmOn",{
		if (!(player getVariable ["itc_exp_checkingECM",false]) then {
			[] call itc_exp_fnc_ecmHandler
		};
	}] call CBA_fnc_addEventHandler;
};

[{
    params ["_unit", "_range", "_explosive", "_fuzeTime", "_triggerItem"];
    if ((({((_x # 0) distance _explosive) < (_x # 1)} count itc_exp_ecmUnits) > 0) && ((_triggerItem == "ace_cellphone") || (_triggerItem == "ace_m26_clacker") || (_triggerItem == "ACE_DeadManSwitch"))) exitWith { false }; 
    true
}] call ace_explosives_fnc_addDetonateHandler;

if (isClass (configfile >> "CfgPatches" >> "acre_main")) then {
	[itc_exp_fnc_ecmOnACRE]  call acre_api_fnc_setCustomSignalFunc;
};
