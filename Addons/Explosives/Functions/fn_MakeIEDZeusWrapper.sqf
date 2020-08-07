private _dialogResult = [
	"Make IED",
	[
		[
			"SLIDER", ["Detonation Time", "Time in seconds until the IED detonates after being triggered"], [0, 3600, 120, 0]
		],
		[
			"SLIDER", ["Trigger Proximity Radius", "Radius in m around the IED where players will trigger the detonation timer"], [0, 2000, 20, 0]
		],
		[
			"CHECKBOX", ["Secondary Explosions", "Enable/disable random secondary explosives around the IED"], true
		],
		[
			"CHECKBOX", ["Announcements", "Enable/disable announcements when the IED is triggered, when it explodes and in certain intervals during the detonation countdown (see Announce Interval)"], false
		],
		[
			"SLIDER", ["Announce Interval", "Interval in seconds between announcements, ignore if 'Announcements' are disabled"], [0, 600, 30, 0]
		],
		[
			"CHECKBOX", ["Require Defusal Kit", "If enabled, players require an ACE defusal kit in order to be able to defuse the IED"], true
		]
	],
	{
		params ["_results", "_args"];
		_results params ["_detTime", "_proxRadius", "_secondaries", "_announce", "_annInterval", "_reqDefKit"];
		_args params ["_hoveredEntity"];

		[_hoveredEntity, _detTime, _proxRadius, _secondaries, _announce, _annInterval, _reqDefKit] remoteExec ["LR_fnc_MakeIED", 0, true];
	},
	{},
	[_hoveredEntity]
] call zen_dialog_fnc_create;

if !(_dialogResult) exitWith {
	["Failed to create zen dialog!", "ErrorLog"] call YAINA_F_fnc_log;
};