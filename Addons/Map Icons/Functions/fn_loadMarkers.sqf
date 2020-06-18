/*
Function: LR_MI_fnc_loadMarkers

Description:
    Load the markers in the supplied save data

Arguments:
    _saveName - The name of the save to load
    _mapName - The name of the world to load the markers on
    _markersData - The data of the save to load 

Return Value:
    None

Example:
    Nothing to see here

Author:
	Gruppe Adler, modified by Mokka
*/


params ["_saveName","_mapName",["_markersData",[]]];

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

    private _markerID = format ["_USER_DEFINED #-1%1%2/%3/%4",_saveName,_mapName,_forEachIndex,_channel]; // loads in previous channels
    // private _markerID = format ["_USER_DEFINED #-1%1%2/%3/%4",_saveName,_mapName,_forEachIndex,currentChannel];

    private _marker = createMarker [_markerID,_pos];
    _marker setMarkerAlpha _alpha;
    _marker setMarkerBrush _brush;
    _marker setMarkerColor _color;
    _marker setMarkerDir _dir;
    _marker setMarkerPos _pos;
    _marker setMarkerShape _shape;
    _marker setMarkerSize _size;
    _marker setMarkerText _text;
    _marker setMarkerType _type;

} forEach _markersData;
