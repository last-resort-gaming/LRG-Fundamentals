/*
Function: LR_MI_fnc_getMarkersInArea

Description:
    Return all markers in the supplied area

Arguments:
    _area - The area in which to obtain markers
    _selectEditorMarkers - True to select script-placed and editor markers, too

Return Value:
    List of all markers in given area

Example:
    Nothing to see here

Author:
	Gruppe Adler, modified by Mokka
*/


params ["_area",["_selectEditorMarkers",false]];

private _markersInArea = ([_selectEditorMarkers] call LR_MI_fnc_allMarkers) select {
    (getMarkerPos _x) inArea _area
};

_markersInArea
