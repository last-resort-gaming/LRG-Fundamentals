/*
Function: LR_Sound3DFromPos

Description:
	Plays a sound in 3D Space at a given position on every player.
	lenght property needs to be set for the sound in config. If value is 
	omitted, sound won't play properly!

Parameters:
	_pos - The position at which to play the sound <ARRAY>
	_sound - The name of the sound class (CfgSounds) <STRING>
	_distance - How far away the sound can be heard from _object. <NUMBER>
	_pitch - pitch of the sound. Should usually be 1. <NUMBER>
	_volume - Volume of the sound. If volume above 1 sound is multiplied <NUMBER>

Return Values:
	Nothing

Examples:
    Nothing to see here.

Author:
	Mokka
*/

// If run locally, run on server instead
if (!isServer) exitWith {
	_this remoteExec ["LR_fnc_Sound3DFromPos", 2];
};

params [
	"_pos",
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
_dummy = "#particlesource" createVehicle _pos;

// Play sound on the created object
[_dummy, _SoundClass, _distance, _pitch] call LR_fnc_Sound3D;

// Delete the dummy object after the sound is over (according to the config entry)
[
	{deleteVehicle (_this select 0);},
	[_dummy],
	_length
] call CBA_fnc_waitAndExecute;