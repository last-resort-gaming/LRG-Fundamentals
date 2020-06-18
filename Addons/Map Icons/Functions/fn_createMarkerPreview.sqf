/*
Function: LR_MI_fnc_createMarkerPreview

Description:
    Creates a preview of the currently selected saved markers.

Arguments:
    _markersData - The save data to preview markers of

Return Value:
    None

Example:
    Nothing to see here

Author:
	Gruppe Adler, modified by Mokka
*/

params [["_markersData",[]]];

private _previewMarkers = missionNamespace getVariable ["LR_MI_previewMarkers",[]];
{deleteMarker _x} forEach _previewMarkers;

LR_MI_previewMarkers = [];
{
    _x params [
        "_alpha",
        "_brush",
        "_color",
        "_dir",
        "_pos",
        "_shape",
        "_size",
        "_text",
        "_type",
        "_channel"
    ];

    private _markerID = format ["_USER_DEFINED #-1/%1/%2",_forEachIndex,_channel];

    private _marker = createMarkerLocal [_markerID,_pos];
    _marker setMarkerAlphaLocal _alpha;
    _marker setMarkerBrushLocal _brush;
    _marker setMarkerColorLocal _color;
    _marker setMarkerDirLocal _dir;
    _marker setMarkerPosLocal _pos;
    _marker setMarkerShapeLocal _shape;
    _marker setMarkerSizeLocal _size;
    _marker setMarkerTextLocal _text;
    _marker setMarkerTypeLocal _type;

    LR_MI_previewMarkers pushBack _marker;

} forEach _markersData;
