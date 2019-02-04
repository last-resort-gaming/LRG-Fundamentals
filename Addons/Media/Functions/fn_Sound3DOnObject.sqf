/*
Function: LR_Sound3DOnObject

Description:
	Plays a sound on an object by attaching a dummy object to said object. Dummy
	object can be deleted later to stop the sound from playing.

Parameters:
	_pos - The position at which to play the sound <ARRAY>
	_sound - The name of the sound class (CfgSounds) <STRING>
	_distance - How far away the sound can be heard from _object. <NUMBER>
	_pitch - pitch of the sound. Should usually be 1. <NUMBER>
	_volume - Volume of the sound. If volume above 1 sound is multiplied <NUMBER>

Return Values:
	Dummy object playing the sound

Examples:
    Nothing to see here.

Author:
	Mokka
*/

// If run locally, run on server instead
if (!isServer) exitWith {
	_this remoteExec ["LR_fnc_Sound3DOnObject", 2];
};

params [
	"_object",
	["_SoundClass", "AirRaid"],
	["_distance", 250],
	["_pitch", 1],
	["_volume", 1]
];

// Get the length property from the sound config entry
_lengthCfg = configFile >> "CfgSounds" >> _SoundClass >> "length";
_length = getNumber _lengthCfg;

// If length propery is not set, use a default value of 100 seconds
if (_length <= 0) then {
	_length = 100;
};

// Create dummy to play sound on
_dummy = "#particlesource" createVehicle [0, 0, 0];
_dummy setPos (getPos _object);
_dummy attachTo [_object];

// Play sound on the created object
[_dummy, _SoundClass, _distance, _pitch] call LR_fnc_Sound3D;

// Delete the dummy object after the sound is over (according to the config entry)
[
	{deleteVehicle (_this select 0);},
	[_dummy],
	_length
] call CBA_fnc_waitAndExecute;

_soundObjects = _object getVariable ["SoundObjects", []];
_soundObjects pushBack _dummy;
_object setVariable ["SoundObjects", _soundObjects, true];

_dummy;