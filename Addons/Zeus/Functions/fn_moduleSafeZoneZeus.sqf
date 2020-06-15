params ["_pos"];

if (_pos isEqualTo [0, 0, 0]) exitWith {
	[format ["Error: Invalid position for module"], "ZeusLog"] call YAINA_F_fnc_log;
};

private _dialogResult = [
	"Spawn AI - Civilian",
	[
		["EDIT", "Size", "150"],
		["EDIT", "Duration", "0"]
	],
	{
		params ["_results", "_args"];

		_args params ["_pos"];

		_procResults = [];

		{
			// Process number inputs and make sure they're integers
			_value = round (parseNumber _x);
			_procResults pushBack _value;
		} forEach _results;

		_procResults params [
			"_size",
			"_duration"
		];

		[_size, _duration, _pos] remoteExec ["LR_fnc_SafeZone", 0];
	},
	{},
	[_pos]
] call zen_dialog_fnc_create;

if !(_dialogResult) exitWith {
	["Failed to create zen dialog!", "ErrorLog"] call YAINA_F_fnc_log;
};