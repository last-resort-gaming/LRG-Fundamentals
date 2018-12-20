/*
Function: YAINA_fnc_log

Description:
	General purpose logging function, that logs the message either to
	the rpt or to an external log using A3Log.

Parameters:
	_message - The log message
	_log - The log type, for example Kill Log, Admin Log or General Log

Return Values:
	None

Examples:
    Nothing to see here

Author:
	Martin
*/

params ["_message", ["_log", "GENERAL"]];

if (isNil "YAINA_A3Log") then {
    YAINA_A3Log = isClass(configFile >> "CfgPatches" >> "a3log");
};

if (YAINA_A3Log) then {
    [_message, _log] call A3Log;
} else {
    diag_log format ["%1 | %2", _log, _message];
};
