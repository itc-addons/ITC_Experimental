/*
	Author: Thomas Ryan

	Description:
	Display the given subtitles at the correctly defined moments.

	Parameters:
		_this: ARRAY -
			_this select 0: STRING - Name of the person speaking.
			_this select 1: STRING - Subtitle to display.
			_this select 2: NUMBER - Time at which to display the subtitle.

	Returns:
	True if successful, false if not.
*/

// Global variable for terminating subtitles before they finish
BIS_fnc_EXP_camp_playSubtitles_terminate = false;

// Log the time at which the subtitles were called
private _start = time;

{
	_x params [
		["_name", ""],
		["_subtitle", ""],
		["_time", 1],
		["_talkers", []],
		["_talkTime", 1]
	];

	// Localize name and subtitle if necessary
	_name = _name call BIS_fnc_localize;
	_subtitle = _subtitle call BIS_fnc_localize;

	waitUntil {
		// Wait for the correct timestamp
		time - _start >= _time
		||
		// Or for the subtitles to be terminated
		BIS_fnc_EXP_camp_playSubtitles_terminate
	};
	// Make each of the objects set as _talkers talk
	{
		[_x,_talkTime] spawn {
			params ["_talker","_time"];
			// The possible sounds for talking
			private _sounds = ["A3\sounds_f\characters\human-sfx\Other\drowning_02.wss","A3\sounds_f\characters\human-sfx\Other\drowning_03.wss","A3\sounds_f\characters\human-sfx\Other\drowning_04.wss","A3\sounds_f\characters\human-sfx\Other\drowning_06.wss","A3\sounds_f\characters\human-sfx\Other\drowning_07.wss"];
			private _pitch = pitch _talker;
			private _start = diag_tickTime;
			_talker setRandomLip true;
			while {(diag_tickTime - _start) < _time} do {
				private _sound = selectRandom _sounds;
				playSound3d [_sound,_talker,false,eyePos _talker,0.5,_pitch];
				sleep 0.1;
				sleep random 0.1;
			};
			_talker setRandomLip false;
		};
	} forEach _talkers;

	// If necessary, terminate the loop and clear the subtitles
	if (BIS_fnc_EXP_camp_playSubtitles_terminate) exitWith {titleText ["", "PLAIN"]};

	// Display subtitle
	[_name, _subtitle, true] call BIS_fnc_showSubtitle;
	sleep 0.01;
} forEach _this;

true