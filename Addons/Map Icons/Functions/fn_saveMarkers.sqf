/*
Function: LR_MI_fnc_saveMarkers

Description:
    Save the selected markers with the supplied name.

Arguments:
    _saveAs - Name of the save
    _worldName - Name of the current world
    _markers - List of markers to save

Return Value:
    None

Example:
    Nothing to see here

Author:
	Gruppe Adler, modified by Mokka
*/

params ["_saveAs","_worldName","_markers"];

private _saveMarkersData = profileNamespace getVariable "LR_MI_saveData";
if (isNil "_saveMarkersData") then {
    profileNamespace setVariable ["LR_MI_saveData",[]];
    _saveMarkersData = profileNamespace getVariable "LR_MI_saveData";
};

private _existingSaveID = -1;
{
    _x params ["_thisSaveAs","_thisWorldName"];
    if (_thisSaveAs == _saveAs && {_worldName == _thisWorldName}) exitWith {
        _existingSaveID = _forEachIndex;
    };
} forEach _saveMarkersData;

private _thisDataMarkersArray = if (_existingSaveID < 0) then {
    (_saveMarkersData select (_saveMarkersData pushBack [_saveAs,_worldName,[]])) select 2
} else {
    (_saveMarkersData select _existingSaveID) select 2;
};
_thisDataMarkersArray resize 0;

{
    _thisDataMarkersArray pushBack [
        markerAlpha _x,
        markerBrush _x,
        markerColor _x,
        markerDir _x,
        markerPos _x,
        markerShape _x,
        markerSize _x,
        markerText _x,
        markerType _x,
        [_x] call LR_MI_fnc_getMarkerChannel
    ];

} forEach _markers;

saveProfileNamespace;

_newSaveID
