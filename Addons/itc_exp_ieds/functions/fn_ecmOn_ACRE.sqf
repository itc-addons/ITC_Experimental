params ["_freq","_power","_receiving","_transmitting"];

private _receivePos = [_receiving]  call acre_sys_radio_fnc_getRadioPos;
private _transmitPos = [_transmitting]  call acre_sys_radio_fnc_getRadioPos;
private _receiveinECMRange = [_receivePos] call itc_exp_fnc_inECMRange;
private _transmitinECMRange = [_transmitPos] call itc_exp_fnc_inECMRange;
if (_receiveinECMRange || _transmitinECMRange) exitWith {
	[0,-300]
};

{}

