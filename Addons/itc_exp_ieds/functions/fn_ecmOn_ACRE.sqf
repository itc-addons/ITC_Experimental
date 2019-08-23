params ["_freq","_power","_receiving","_transmitting"];
private _receivePos = [_receiving]  call acre_sys_radio_fnc_getRadioPos;
private _transmitPos = [_transmitting]  call acre_sys_radio_fnc_getRadioPos;
if (({(_x distance _receivePos) < (_x getVariable "itc_exp_ecm")} count allPlayers) > 0) exitWith {
	[0,-300]
};
if (({(_x distance _transmitPos) < (_x getVariable "itc_exp_ecm")} count allPlayers) > 0) exitWith {
	[0,-300]
};
{}

