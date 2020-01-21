params ["_unit","_ecm"];
itc_exp_ecmUnits deleteAt [itc_exp_ecmUnits find [_unit,_ecm]];
private _anyOtherECM = (itc_exp_ecmUnits findIf {(_x # 0) == _unit}) > -1;
if (!_anyOtherECM) then {
	_unit setVariable ["itc_exp_hasECMOn",false,true];
};
