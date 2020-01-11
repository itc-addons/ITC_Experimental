params ["_unit","_group"];

[_unit] joinSilent _group;
_unit setCaptive true;
_unit disableai "FSM";
_unit disableai "COVER";
removeAllWeapons _unit;
{_unit removeMagazine _x} forEach magazines _unit;
_unit addMagazine "itc_exp_throwObject";
[{
	private _unit = _this # 0;
	if (!(alive _unit)) then {
		[_this # 1] call CBA_fnc_removePerFrameHandler;
	};
	if (count magazines _unit == 0) then {
		_unit addMagazine "itc_exp_throwObject";
	};
},5,_unit]  call CBA_fnc_addPerFrameHandler;