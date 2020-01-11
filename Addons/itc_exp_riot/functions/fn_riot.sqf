params ["", "", "", "", "", "", "_projectile"];

private _riotAmmo = "(configName _x) isKindOf ['itc_exp_riotStart', configFile >> 'CfgAmmo']" configClasses (configFile >> "CfgAmmo");

private _subAmmos = [];

{
	private _type = configName _x;
	if (!(_type == "itc_exp_riotStart")) then {
		_subAmmos pushBack _type;
	};
} forEach _riotAmmo;

private _vel = velocity _projectile;
private _pos = position _projectile;
deleteVehicle _projectile;

private _subAmmo = selectRandom _subAmmos;
private _newProjectile = _subAmmo createVehicle _pos;
_newProjectile setVelocity _vel;