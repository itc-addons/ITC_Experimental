player setVariable ["itc_exp_checkingECM",true,true];
[{
	params ["_pfhValues","_pfhId"];
	private _inECM = [player] call itc_exp_fnc_inECMRange;
  
	if (player getVariable ["itc_exp_chatAllowed",true]) then {
		if ( _inECM ) then {
			[false] call itc_exp_fnc_switchChat;
			};
	} else {
		if ( !_inECM ) then {
			[true] call itc_exp_fnc_switchChat;
		};  
	};
	private _aliveECMs = missionNameSpace getVariable ["itc_exp_ecmUnits",[]];
	if (count _aliveECMs == 0) then {
		player setVariable ["itc_exp_checkingECM",false,true];
		[_pfhId] call CBA_fnc_removePerFrameHandler;
	};
},1,[]] call CBA_fnc_addPerFrameHandler;