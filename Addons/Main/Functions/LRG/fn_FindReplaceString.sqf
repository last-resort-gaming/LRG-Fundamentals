/*
Function: LR_fnc_FindReplaceString

Description:
	Finds and replaces a certain substring in a given string with a different
	string.

Arguments:
	_src - The source string <STRING>
	_find - The part to find in the source string <STRING>
	_replace - The string that _find shall be replaced with <STRING>
	_numLimit - The maximum number of substitutions, default: 1 <SCALAR>
	_limit - Set to true to enable the substitution limit, false to disable, default: true <BOOLEAN>

Return Values:
	The edited string

Examples:
    --- Code
		[
			"123456123", "123", "abc", 1, true
		] call LR_fnc_FindReplaceString; // returns "abc456123"
	---

Author:
	Mokka
*/

params ["_src", "_find", "_replace", ["_numLimit", 1], ["_limit", true]];

_char = count _find;

private _i = 0;

while {-1 != _src find _find && _i < _numLimit} do {
	_idx = _src find _find;
	_splitStr = _src splitString "";
	_splitStr deleteRange [(_idx + 1), _char - 1];
	_splitStr set [_idx, _replace];
	_src = _splitStr joinString "";

	if (_limit) then {
		_i = _i + 1;
	};
};

_src