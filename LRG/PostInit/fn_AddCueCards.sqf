/*
Function: LR_fnc_AddCueCards

Description:
	Adds the LRG Cue Cards for Operations to every player. Executed during postInit,
	don't call directly!

Parameters:
	None

Return Values:
	None

Examples:
    Nothing to see here, called in postInit

Author:
	Mokka
*/

_cueCardsData = [
	// 	0 - CASEVAC Request Card
	[
		"LRG Fundamentals\Media\images\Cue Cards\casevac_request_CA.paa",
		"CASEVAC Request Card"
	],
	
	//	1 - Contact Report Card
	[
		"LRG Fundamentals\Media\images\Cue Cards\contact_card_CA.paa",
		"Contact Report Card"
	],
	
	// 	2 - FAC 5-Liner Request Card
	[
		"LRG Fundamentals\Media\images\Cue Cards\fac_5_liner_request_CA.paa",
		"FAC 5-Liner Request Card"
	],
	
	// 	3 - Fire Control Orders Card
	[
		"LRG Fundamentals\Media\images\Cue Cards\fire_control_orders_CA.paa",
		"Fire Control Orders Card"
	],
	
	// 	4 - Reorg (GASCARD) Card
	[
		"LRG Fundamentals\Media\images\Cue Cards\reorg_gascard_CA.paa",
		"Reorg (GASCARD) Card"
	]
];

// Add Parent Action
_parentAction = [
	"CueCardAction",
	"Cue Cards",
	"",
	{diag_log "running parent action"},
	{true}
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _parentAction] call ace_interact_menu_fnc_addActionToObject;

// Add Action to open notepad
_npAction = [
	"openNotepad",
	"Open Notepad",
	"", // see if this looks nice or not TODO
	{
			_this spawn {
			params ["_target", "_caller"];

			diag_log format ["[[LOGGING]] Target: %1", _target];

			disableserialization;
			([] call bis_fnc_displayMission) createdisplay "RscNotepad";
			[missionnamespace,"cueCardShown",[_target] + ["Notepad"]] spawn bis_fnc_callScriptedEventHandler;
		};
	},
	{true},
	{},
	[],
	""
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "CueCardAction"], _npAction] call ace_interact_menu_fnc_addActionToObject;

// Add Cue Card Actions
{

	_x params [
		"_texture",
		"_name"
	];

	_title = format ["Show %1", _name];
	_id = format ["cueCardAction_%1", _forEachIndex];

	diag_log format ["[[LOGGING]]  ID: %1    Title: %2", _id, _title];

	_action = [
		_id,
		_title,
		_texture, // see if this looks nice or not TODO
		{
			_this spawn {
				params ["_target", "_caller", "_data"];

				diag_log format ["[[LOGGING]] Target: %2    Data: %1", _data, _target];

				disableserialization;
				missionNamespace setVariable ["RscDisplayCueCard_data", _data];
				([] call bis_fnc_displayMission) createdisplay "RscDisplayCueCard";
				([] call bis_fnc_displayMission) createdisplay "NotepadDialog";
				[missionnamespace,"cueCardShown",[_target] + _data] spawn bis_fnc_callScriptedEventHandler;
			};
		},
		{true},
		{},
		_x,
		""
	] call ace_interact_menu_fnc_createAction;

	[player, 1, ["ACE_SelfActions", "CueCardAction"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _cueCardsData;
