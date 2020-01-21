params ["_unit","_ecm"];
itc_exp_ecmUnits deleteAt [itc_exp_ecmUnits find [_unit,_ecm]];
_unit setVariable ["itc_exp_hasECMOn",false,true];
