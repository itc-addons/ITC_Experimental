params ["_object"];
private _inRange = ({((_x # 0) distance _object) < (_x # 1)} count itc_exp_ecmUnits) > 0;
_inRange 