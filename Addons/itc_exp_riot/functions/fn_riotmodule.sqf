_logic = param [0,objNull,[objNull]];

private _sideString = (_logic getVariable "RiotSide");
private _side = nil;
switch (_sideString) do {
	case "West": { _side = west };
	case "East": { _side = east };
	case "Independent": { _side = independent };
};

private _group = createGroup _side;
_group setCombatMode "RED";

private _syncedObjects = synchronizedObjects _logic;

{
	if ((_x isKindOf "Man") && !(isPlayer _x)) then {
		[_x,_group] call itc_exp_fnc_rioter;
	};
}  forEach _syncedObjects;