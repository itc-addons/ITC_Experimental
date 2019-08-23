[{
	if ((player getVariable "itc_exp_ecm")==0) then {
		[_this # 1] call CBA_fnc_removePerFrameHandler;
		{
			if (!(_x getVariable "itc_exp_chatAllowed")) then {
				[true] remoteExec ["itc_exp_fnc_switchChat",owner _x];
			};
		} forEach allPlayers;
	};
	{
		if ((_x getVariable "itc_exp_chatAllowed") && (_x distance player)<(player getVariable "itc_exp_ecm")) then {
			[false] remoteExec ["itc_exp_fnc_switchChat",owner _x];
		};
		if (!(_x getVariable "itc_exp_chatAllowed") && (_x distance player)>(player getVariable "itc_exp_ecm")) then {
			[true] remoteExec ["itc_exp_fnc_switchChat",owner _x];
		};
	} forEach allPlayers;
},1,[]] call CBA_fnc_addPerFrameHandler;