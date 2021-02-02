/*
Function: LR_fnc_initScreen

Description:
	Initializes a Screen for the Command Centre based on the passed parameters.

Arguments:
	_object - Screen object
	_name - Name of the screen, used for the actions
	_allowCam - If true, allows viewing Helmet Cameras through the screen
	_allowDrone - If true, allows viewing Drone Cameras through the screen
	_allowSat - If true, allows viewing Satellite imagery through the screen
	_allowMap - If true, allows viewing the Tactical Map through the screen
	_selection - The texture selection of the screen content

Return Values:
	Nothing.

Examples:
    Nothing to see here

Author:
	Mokka
*/

params [
	"_object",
	"_name",
	["_allowCam", true],
	["_allowDrone", true],
	["_allowSat", true],
	["_allowMap", true],
	["_selection", 0]
];

if !(isClass (configFile >> "CfgPatches" >> "cTab")) exitWith {};

// server-side setup stuffs
if (isServer) then {
	// register screen, important to properly assign the render targets later down the line
	if (isNil "LRG_CC_nextScreenID") then {
		LRG_CC_nextScreenID = 0;
	};

	_object setVariable [format ["LRG_CC_screen_%1_ID", _selection], LRG_CC_nextScreenID, true];

	LRG_CC_nextScreenID = LRG_CC_nextScreenID + 1;

	_object setVariable [format ["LRG_CC_screen_%1_on", _selection], false, true];
	_object setVariable [format ["LRG_CC_screen_%1_mode", _selection], "", true];
	_object setVariable [format ["LRG_CC_screen_%1_target", _selection], "", true];

	// set default screen texture
	_object setObjectTextureGlobal [_selection, "z\LRG Fundamentals\Addons\Media\images\cc_screen_standby.paa"];
};

// add actions
if !(hasInterface) exitWith {};

private _parentAction = [
	format ["screen%1_parent", _selection],
	format ["%1", _name],
	"",
	{ diag_log "hi" },
	{ true },
	nil,
	[]
] call ACE_interact_menu_fnc_createAction;

private _configAction = [
	format ["screen%1_config", _selection],
	"Configure Screen",
	"",
	{
		params ["_target", "_player", "_params"];
		_params params ["_object", "_selection"];

		[_object, _selection] call LR_fnc_configureScreen;
	},
	{
		params ["_target", "_player", "_params"];
		_params params ["_object", "_selection"];

		_object getVariable [format ["LRG_CC_screen_%1_on", _selection], false];
	},
	nil,
	[_object, _selection]
] call ACE_interact_menu_fnc_createAction;

private _turnOnAction = [
	format ["screen%1_turnOn", _selection],
	"Turn On",
	"",
	{
		params ["_target", "_player", "_params"];
		_params params ["_object", "_selection"];

		[_object, _selection, true] call LR_fnc_turnOnScreen;
	},
	{
		params ["_target", "_player", "_params"];
		_params params ["_object", "_selection"];

		!(_object getVariable [format ["LRG_CC_screen_%1_on", _selection], false]);
	},
	nil,
	[_object, _selection]
] call ACE_interact_menu_fnc_createAction;

private _turnOffAction = [
	format ["screen%1_turnOff", _selection],
	"Turn Off",
	"",
	{
		params ["_target", "_player", "_params"];
		_params params ["_object", "_selection"];

		[_object, _selection, false] call LR_fnc_turnOnScreen;
	},
	{
		params ["_target", "_player", "_params"];
		_params params ["_object", "_selection"];

		_object getVariable [format ["LRG_CC_screen_%1_on", _selection], false];
	},
	nil,
	[_object, _selection]
] call ACE_interact_menu_fnc_createAction;

[_object, 0, ["ACE_MainActions"], _parentAction] call ACE_interact_menu_fnc_addActionToObject;
[_object, 0, ["ACE_MainActions", format ["screen%1_parent", _selection]], _configAction] call ACE_interact_menu_fnc_addActionToObject;
[_object, 0, ["ACE_MainActions", format ["screen%1_parent", _selection]], _turnOnAction] call ACE_interact_menu_fnc_addActionToObject;
[_object, 0, ["ACE_MainActions", format ["screen%1_parent", _selection]], _turnOffAction] call ACE_interact_menu_fnc_addActionToObject;