params ["_ied","_friendlysides","_deleteThese","_collapsing","_logic","_triggers","_circuit","_iedClass"];

_deleteThese = [];
{
	[_x, _ied, "ACE_Clacker"] call ace_explosives_fnc_connectExplosive;
	_x setVariable ["H_cwPos",position _x,true];
	private _switch = createVehicle ["Land_CarBattery_02_F",(position _x),[],0,"CAN_COLLIDE"];
	_deleteThese pushBack _switch;
	_switch enableRopeAttach true;
	private _fakeVeh = createVehicle ["B_Quadbike_01_F",(position _x),[],0,"CAN_COLLIDE"];
	_deleteThese pushBack _fakeVeh;
	ropeCreate [_fakeVeh,[0,0,-1.6],_ied,[0,0,0]];
	hideObjectGlobal _fakeVeh;
} forEach _triggers;
[{
	(_this # 0) params ["_ied","_friendlysides","_deleteThese","_collapsing","_logic","_triggers","_circuit","_iedClass"];
	if ((({((_x distance _ied) < 5) && !((side _x) in _friendlySides) && !(unitIsUAV vehicle _x)} count allUnits) > 0) && 
	
	((count ([_triggers,{(alive _x) && (([objNull, "VIEW"] checkVisibility [eyepos _x, [getPosASL _ied # 0,getPosASL _ied # 1,(getPosASL _ied # 2)+1]]) > 0) && ((_x distance (_x getVariable "H_cwPos")) < 5)}] call BIS_fnc_conditionalSelect)) > 0) ) then {
		{
			deleteVehicle _x;
		} forEach _deleteThese;
		[[_ied]] call ace_explosives_fnc_scriptedExplosive;
		[_this # 1] call CBA_fnc_removePerFrameHandler;
	};
	
	if (!(alive _ied) || isNull(ropeAttachedTo _ied)) then {
		if (_collapsing) then {
			if (({(((position _x) distance _logic) < 0.5)} count (allMissionobjects "GroundWeaponHolder")) > 0) then {
				private _iedN = _iedClass createVehicle (position _logic);
				[_iedN, _iedN, "ACE_Clacker"] call ace_explosives_fnc_connectExplosive;
				[[_iedN]] call ace_explosives_fnc_scriptedExplosive;
				deleteVehicle _circuit;
				deleteVehicle ((position _logic) nearestObject "GroundWeaponHolder");
			};
		};
		[_this # 1] call CBA_fnc_removePerFrameHandler;
	};

},0.5,[_ied,_friendlysides,_deleteThese,_collapsing,_logic,_triggers,_circuit,_iedClass]]  spawn CBA_fnc_addPerFrameHandler;