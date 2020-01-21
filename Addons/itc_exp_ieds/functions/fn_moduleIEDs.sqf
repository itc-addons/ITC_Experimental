_logic = param [0,objNull,[objNull]];
_IEDClass = (_logic getVariable "IEDClass");
_IEDType = (_logic getVariable "IEDType");
_collapsing = (_logic getVariable "AntiTamper");

private _syncedObjects = synchronizedObjects _logic;
_triggers = [];
_friendlySides = [];

{
	if ((_x isKindOf "Man") && !(isPlayer _x)) then {
		_triggers pushBack _x;	
		_friendlySides pushBackUnique (side _x);
	};
} forEach _syncedObjects;

_ied = _iedClass createVehicle (position _logic);
_ied setDir (random 360);
private _circuit = objnull;

if (_collapsing) then {
	switch (_iedClass) do {
	case "ACE_IEDLandSmall_Command_Ammo" : {
	_circuit = "Land_MetalWire_F" createVehicle (position _logic);
	_circuit attachTo [_ied,[0,0,0.06]];
	};
	case "ACE_IEDLandBig_Command_Ammo" : {
	_circuit = "Land_MetalWire_F" createVehicle (position _logic);
	_circuit attachTo [_ied,[0,0,0.06]];
	};
	case "ACE_IEDUrbanSmall_Command_Ammo" : {
	_circuit = "Land_MetalWire_F" createVehicle (position _logic);
	_circuit attachTo [_ied,[-0.2,-0.02,0.06]];
	};
	case "ACE_IEDUrbanBig_Command_Ammo" : {
	_circuit = "Land_MetalWire_F" createVehicle (position _logic);
	_circuit attachTo [_ied,[0.1,0.1,0.1]];
	};
	}
};

switch (_IEDType) do {
	case "CWIED": {
		[_ied,_friendlysides,_deleteThese,_collapsing,_logic,_triggers,_circuit,_iedClass] call itc_exp_fnc_cwied;
		};
	case "RCIED": {
		[_ied,_friendlysides,_collapsing,_logic,_switch,_triggers,_circuit,_iedClass] call itc_exp_fnc_rcied;
	};
};