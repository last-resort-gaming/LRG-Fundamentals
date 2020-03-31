/*
Function: YAINA_F_fnc_hideTerrainObjects

Description:
	Hides terrain objects, similar to that of 3DEN's ModuleHideTerrain_F.
    To avoid the issue of exploding buildings re-appearing, we set their damage
    handling to disabled.

Parameters:
    _pos - Position around which we want to hide terrain objects
    _radius - Radius around given position in which to hide terrain objects
    _excludes - Objects to exclude from being hidden
    _types - The types of terrain objects to hide, defaults to ["BUILDINGS", "WALLS", "VEGETATION", "MISC"]

Return Values:
	Array containing the objects that were hidden

Examples:
    Nothing to see here

Author:
	Martin, modified by Mokka
*/
#define MAP_TYPES_BUILDING      ["BUILDING","HOUSE","CHURCH","CHAPEL","FUELSTATION","HOSPITAL","RUIN","BUNKER"]
#define MAP_TYPES_VEGETATION    ["TREE","SMALL TREE","BUSH"]
#define MAP_TYPES_WALL          ["WALL","FENCE"]
#define MAP_TYPES_MISC          ["ROCK","ROCKS","FOREST BORDER","FOREST TRIANGLE","FOREST SQUARE","CROSS","FORTRESS","FOUNTAIN","VIEW-TOWER","LIGHTHOUSE","QUAY","HIDE","BUSSTOP","ROAD","FOREST","TRANSMITTER","STACK","TOURISM","WATERTOWER","TRACK","MAIN ROAD","POWER LINES","RAILWAY","POWERSOLAR","POWERWAVE","POWERWIND","SHIPWRECK","TRAIL"]

#define CATEGORIES              ["BUILDINGS", "WALLS", "VEGETATION", "MISC"]
#define CATEGORY_COMP           [MAP_TYPES_BUILDING,MAP_TYPES_WALL,MAP_TYPES_VEGETATION,MAP_TYPES_MISC]

params ["_pos", "_radius", ["_excludes", []], ["_types", CATEGORIES, [[]]]];

if !(isServer) exitWith {};


private _clearTypes  = [];
{
    _id = CATEGORIES find _x;
    if (_id isEqualTo -1) exitWith { _clearTypes pushBackUnique _x; };
    {
        _clearTypes pushBackUnique _x;
        true;
    } count (CATEGORY_COMP select _id);
} forEach _types;

private _hide = nearestTerrainObjects [_pos, _clearTypes, _radius, false, true];

{
    if !(_x in _excludes) then {
        _x hideObjectGlobal true;
        _x allowDamage false;
    };
    true;
} count _hide;

_hide;