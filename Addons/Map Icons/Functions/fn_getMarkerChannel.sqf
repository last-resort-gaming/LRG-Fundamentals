/*
Function: LR_MI_fnc_getMarkerChannel

Description:
    Get the channel of the passed marker.

Arguments:
    _marker - Marker to obtain the channel of

Return Value:
    Channel of the supplied marker

Example:
    Nothing to see here

Author:
	Gruppe Adler, modified by Mokka
*/

params ["_marker"];

if (_marker find "_USER_DEFINED" != 0) exitWith {0};

(_marker splitString " ") params ["",["_markerData",""]];
(_markerData splitString "/") params ["","",["_markerChannel",0]];

_markerChannel
