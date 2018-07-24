/* ----------------------------------------------------------------------------
Function: CBAP_fnc_taskPatrol

Description:
    A function for a group to randomly patrol a parsed radius and location.

Parameters:
    - Group (Group or Object)

Optional:
    - Position (XYZ, Object, Location or Group)
    - Radius (Scalar)
    - Waypoint Count (Scalar)
    - Waypoint Type (String)
    - Behaviour (String)
    - Combat Mode (String)
    - Speed Mode (String)
    - Formation (String)
    - Code To Execute at Each Waypoint (String)
    - TimeOut at each Waypoint (Array [Min, Med, Max])

Example:
    (begin example)
    [this, getMarkerPos "objective1", 50] call CBAP_fnc_taskPatrol
    [this, this, 300, 7, "MOVE", "AWARE", "YELLOW", "FULL", "STAG COLUMN", "this call CBAP_fnc_searchNearby", [3, 6, 9]] call CBAP_fnc_taskPatrol;
    (end)

Returns:
    Nil

Author:
    Rommel

---------------------------------------------------------------------------- */

params [
    ["_group", grpNull, [grpNull, objNull]],
    ["_position", [], [[], objNull, grpNull, locationNull], [2, 3]],
    ["_radius", 100, [0]],
    ["_count", 3, [0]]
];

_group = _group call CBAP_fnc_getGroup;
if !(local _group) exitWith {}; // Don't create waypoints on each machine

_position = [_position, _group] select (_position isEqualTo []);
_position = _position call CBAP_fnc_getPos;

// Clear existing waypoints first
[_group] call CBAP_fnc_clearWaypoints;

// Can pass parameters straight through to addWaypoint
_this =+ _this;
_this set [2,0];
if (count _this > 3) then {
    _this deleteAt 3;
};

// Using angles create better patrol patterns
// Also fixes weird editor bug where all WP are on same position
private _step = 360 / _count;
private _offset = random _step;
private _wpc = 0;
private _wps = 0;

while { !(_wpc isEqualTo _count ) } do {

    // Gaussian distribution avoids all waypoints ending up in the center
    private _rad = _radius * random [0.1, 0.75, 1];

    // Alternate sides of circle & modulate offset
    private _theta = (_wps % 2) * 180 + sin (deg (_step * _wps)) * _offset + _step * _wps;

    private _testPos = _position getPos [_rad, _theta];

    if !(surfaceIsWater _testPos) then {
        _this set [1, _testPos];
        _this call CBAP_fnc_addWaypoint;
        _wpc = _wpc + 1;
        _wps = _wps + 1;
    };

    // If we failed in finding a position, flip to other side again, so we don't end up hitting a wall
    // trying to find a position when onyl faced with water
    if (_wps isEqualTo _wps) then {
        _wps = _wps + 1;
    };
};

// Close the patrol loop
_this set [1, _position];
_this set [2, _radius];
_this set [3, "CYCLE"];
_this call CBAP_fnc_addWaypoint;