/*
Function: YAINA_F_fnc_formatDuration

Description:
    Formats given duration of time in seconds into a string with format hh:mm:ss

Arguments:
    _in - Duration to format in s

Return Value:
    Given duration in string format hh:mm:ss

Example:
    Nothing to see here

Author:
	Martin
*/
params ["_in"];

_seconds = round(_in);

// Hours
_hours = floor(_seconds / 3600);
_seconds = _seconds - (3600 * _hours);
_hoursString = format ["%1 hour%2", _hours,  ["s", ""] select (_hours isEqualTo 1)];

// Minutes
_minutes = floor(_seconds / 60);
_seconds = _seconds - (60 * _minutes);
_minutesString = format ["%1 minute%2", _minutes,  ["s", ""] select (_minutes isEqualTo 1)];

// Seconds
_secondsString = format ["%1 second%2", _seconds,  ["s", ""] select (_seconds isEqualTo 1)];


if (_hours > 0) exitWith {
    if (_minutes > 0) exitWith {
        format["%1 %2", _hoursString, _minutesString];
    };
    _hoursString;
};

if (_minutes > 0) exitWith {
    if (_seconds > 0) exitWith {
        format["%1 %2", _minutesString, _secondsString];
    };
    _minutesString;
};

_secondsString