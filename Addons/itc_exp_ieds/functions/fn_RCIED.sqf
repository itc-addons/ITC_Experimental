params ["_ied","_friendlysides","_collapsing","_logic","_switch","_triggers","_circuit","_iedClass"];

private _switchType = selectRandom ["Land_MobilePhone_old_F","Land_PortableLongRangeRadio_F"];
_switch = _switchType createVehicle (position _logic);
_switch attachTo [_ied,[0,0,0.1]];
{
	[_x, _ied, "ace_m26_clacker"] call ace_explosives_fnc_connectExplosive;
} forEach _triggers;
[{
	(_this # 0) params ["_ied","_friendlysides","_collapsing","_logic","_switch","_triggers","_circuit","_iedClass"];
	private _inECMRange = [_ied] call itc_exp_inECMRange;
	if ((({((_x distance _ied) < 5) && !((side _x) in _friendlySides) && !(unitIsUAV vehicle _x)} count allUnits) > 0) && 
	((count ([_triggers,{(alive _x) && (([objNull, "VIEW"] checkVisibility [eyepos _x, [getPosASL _ied # 0,getPosASL _ied # 1,(getPosASL _ied # 2)+1]]) > 0)}] call BIS_fnc_conditionalSelect)) > 0) && !_inECMRange) 
	 ) then {
		deleteVehicle _switch;
		[[_ied]] call ace_explosives_fnc_scriptedExplosive;
		[_this # 1] call CBA_fnc_removePerFrameHandler;
	 };
	 if (!(alive _ied)) then {
		if (_collapsing) then {
			if (({(((position _x) distance _logic) < 0.5)} count (allMissionobjects "GroundWeaponHolder")) > 0) then {
				private _iedN = _iedClass createVehicle (position _logic);
				[_iedN, _iedN, "ACE_Clacker"] call ace_explosives_fnc_connectExplosive;
				[[_iedN]] call ace_explosives_fnc_scriptedExplosive;
				deleteVehicle _circuit;
				deleteVehicle _switch;
				deleteVehicle ((position _logic) nearestObject "GroundWeaponHolder");
			};
		};
		[_this # 1] call CBA_fnc_removePerFrameHandler;
	};
},0.5,[_ied,_friendlysides,_collapsing,_logic,_switch,_triggers,_circuit,_iedClass]]  spawn CBA_fnc_addPerFrameHandler;