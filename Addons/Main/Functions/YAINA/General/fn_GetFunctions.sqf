/*
Function: YAINA_F_fnc_getFunctions

Description:
	Return the functions stored in CfgFunctions at a certain path.
    Used mainly for reading out all existing missions of a certain type.

Parameters:
	_prefix - The prefix of the config key we're looking at, that is the function prefix (e.g. YAINA_MM_...)
    _path - The path to the Cfg we want to look through

Return Values:
	Array containing the functions with the valid prefix found at given path

Examples:
    Nothing to see here

Author:
	Martin
*/

// Takes an array to bundle configClasses

params ["_prefix", "_path"];
private ["_cf", "_ret"];

_ret = [];

if (isNil "_prefix") then {
    _prefix = "";
} else {
    _prefix = _prefix + "_";
};

// Config File
_cf = configFile >> "CfgFunctions"; { _cf = _cf >> _x } forEach _path;
{
    _ret pushBackUnique format["%1%2", _prefix, configName _x];
    nil
} count ("true" configClasses _cf);

// Mission Config File
_cf = missionConfigFile >> "CfgFunctions"; { _cf = _cf >> _x } forEach _path;
{
    _ret pushBackUnique format["%1%2", _prefix, configName _x];
    nil
} count ("true" configClasses _cf);

_ret