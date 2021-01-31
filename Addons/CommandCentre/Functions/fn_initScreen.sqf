/*
Function: LR_fnc_initScreen

Description:
	Initializes a Screen for the Command Centre based on the passed parameters.

Arguments:
	_object - Screen object
	_allowCam - If true, allows viewing Helmet Cameras through the screen
	_allowDrone - If true, allows viewing Drone Cameras through the screen
	_allowSat - If true, allows viewing Satellite imagery through the screen
	_allowMap - If true, allows viewing the Tactical Map through the screen
	_count - Number of sub-screens

Return Values:
	Nothing.

Examples:
    Nothing to see here

Author:
	Mokka
*/

params [
	"_object",
	["_allowCam", true],
	["_allowDrone", true],
	["_allowSat", true],
	["_allowMap", true],
	["_count", 1]
];

