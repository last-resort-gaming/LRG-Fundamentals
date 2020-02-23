/*
Function: LR_fnc_CivilianPatrol

Description:
	Sets up a patrol for civilians with appropriate reactions to getting shot at.

Arguments:
	_group - Group of civilians to set up for patrol
	_waypoints - Array of waypoints (i.e. roads) to use for the patrol setup
	_patrolLength - Length of the patrol path, array in format [min, max], default: [4, 8]

Return Values:
	Nothing.

Examples:
    Nothing to see here

Author:
	Mokka
*/

params [
	"_group",
	"_waypoints",
	["_patrolLength", [4, 8]]
];

_patrolLength params ["_patrolLengthMin", "_patrolLengthMax"];

_findWps = _patrolLengthMin + floor (random (_patrolLengthMax - _patrolLengthMin));

_group setBehaviour "SAFE";
_group setSpeedMode "LIMITED";

_EHfiredNear = (leader _group) addEventHandler ["FiredNear", {_this call LR_fnc_CivBreakPatrol;}];

for "_i" from 0 to _findWps do {
	_wp = selectRandom _waypoints;
	_wp = _group addWaypoint [_wp, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointCompletionRadius 5;
	[_group, _i] setWaypointTimeout [0, 2, 4];
};

_wpc = _group addWaypoint [selectRandom _wayPoints, 0];
_wpc setWaypointType "CYCLE";
_wpc setWaypointCompletionRadius 5;