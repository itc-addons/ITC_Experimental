params ["_unit","_ecm"];

itc_exp_ecmUnits pushBackUnique [_unit,_ecm];
_unit setVariable ["itc_exp_hasECMOn",true,true];
["itc_exp_ecmOn",[]] call CBA_fnc_globalEventJIP;

private _ecmType = nil;

switch (_ecm) do {
	case 5 : {_ecmType = "itc_exp_ecmL" };
	case 25 : {_ecmType = "itc_exp_ecmM" };
	case 50 : {_ecmType = "itc_exp_ecmH" };
};

[{
	params ["_pfhValues","_pfhId"];
	_pfhValues params ["_unit","_ecm","_ecmType"];
	
	private _isECMOn = [_unit,_ecm] in itc_exp_ecmUnits;
	if (!_isECMOn) then {		
		[_pfhId] call CBA_fnc_removePerFrameHandler;
	};
	
	if (!(_ecmType in (items _unit))) then {
		[_unit] call itc_exp_ecmOff;
		[_pfhId] call CBA_fnc_removePerFrameHandler;
	};

},1,[_unit,_ecm,_ecmType]] call CBA_fnc_addPerFrameHandler;