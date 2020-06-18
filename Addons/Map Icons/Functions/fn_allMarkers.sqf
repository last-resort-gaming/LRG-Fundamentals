/*
Function: LR_MI_fnc_allMarkers

Description:
    Returns all valid markers currently on the map.

Arguments:
    _selectEditorMarkers - True to also return editor-placed and scripted markers

Return Value:
    List of all valid markers

Example:
    Nothing to see here

Author:
	Gruppe Adler, modified by Mokka
*/

params [["_selectEditorMarkers",false]];

private _allMarkers = allMapMarkers select {!((getMarkerType _x) in ["","Empty"]) && {(_x find "ACE_BFT_") != 0}};

if (!_selectEditorMarkers) then {
    _allMarkers = _allMarkers select {_x find "_USER_DEFINED" == 0};
};

_allMarkers
