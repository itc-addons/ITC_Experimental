params ["_unit"];
private _hasECM = (("itc_exp_ecmH" in (items _unit)) || ("itc_exp_ecmM" in (items _unit)) ||("itc_exp_ecmL" in (items _unit)));
_hasECM
