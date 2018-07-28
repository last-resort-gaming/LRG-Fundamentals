/*
	LRG MISSION TEMPLATE
	LR_fnc_Sound3D.sqf
	Author: MitchJC
	Description: Plays a sound from CfgSounds on an object in 3D space. Sound follows object if moving.

	
	Syntax
	[_object, _SoundClass, _distance] call LR_fnc_Sound3D;
	
	Parameters
	_object - Object the Sound is played from.  <OBJECT>
	_SoundClass - Class name of sound from CfgSounds <STRING>
	_distance - How far away the sound can be heard from _object. <NUMBER>
	_pitch - pitch of the sound. Should usually be 1. <NUMBER>

	Example 1:	[Speaker, "AirRaid", 500] call LR_fnc_Sound3D;
	Example 2:	[Jason, "JohnCena", 250] call LR_fnc_Sound3D;
	Example 3:	[this, "NukeAlarm", 250] call LR_fnc_Sound3D;

*/


if (!isserver) exitwith {};

params [
	"_object",
	["_SoundClass", "AirRaid"],
	["_distance", 250],
	["_pitch", 1]
];


[_object, [_SoundClass, _distance, _pitch]] remoteExec ["say3D",0,true];



