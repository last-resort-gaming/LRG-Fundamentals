/*
Function: LR_fnc_findInArrayMap

Description:
	Find a certain element in a map by ID (the first element of the map entry).

Arguments:
	_map - The map to find an entry in
	_id - ID of the entry you want to find
	_default - Default value to return if key not found

Return Values:
	The value of the entry or _default if element was not found

Examples:
    Nothing to see here

Author:
	Mokka
*/

params ["_map", "_id", "_default"];

private _value = nil;

{
	if ((_x select 0) isEqualTo _id) then {
		_value = (_x select 1);
	};
} forEach _map;

if (isNil "_value") exitWith {_default;};

_value;