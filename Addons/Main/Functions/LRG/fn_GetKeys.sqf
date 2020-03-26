/*
Function: LR_fnc_GetKeys

Description:
	Get all the keys in a map as an array

Arguments:
	_map - The map to get the keys from

Return Values:
	List of all the keys stored in the map

Examples:
    Nothing to see here

Author:
	Mokka
*/
params ["_map"];

private _keys = [];

{
	_keys pushBack (_x select 0);
} forEach _map;

_keys;