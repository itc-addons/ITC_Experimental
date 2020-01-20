params ["", "", "", "", "", "", "_projectile"];

if (!local _projectile) exitWith {};

private _riotAmmo = "((configName _x) isKindOf ['itc_exp_riotStart', configFile >> 'CfgAmmo']) && !(_type == 'itc_exp_riotStart')" configClasses (configFile >> "CfgAmmo");

private _vel = velocity _projectile;
private _pos = position _projectile;
deleteVehicle _projectile;

private _subAmmo = selectRandom _riotAmmo;
private _newProjectile = _subAmmo createVehicle _pos;
_newProjectile setVelocity _vel;