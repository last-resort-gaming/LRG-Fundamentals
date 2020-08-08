/*
Function: LR_fnc_AddCreatorAction

Description:
	Adds an action for the mission creator that allows executing code/functions
	during the live mission.

Arguments:
	_actionName - Action name <STRING>
	_displayName - Name of the action shown in the menu <STRING>
	_icon - Icon file path or Array of icon file path and hex color ("" for default icon) <STRING|ARRAY>
	_statement - Statement <CODE>
	_condition - Condition <CODE>
	_actionPath - Path for the action, subpath of CreatorActions <ARRAY> (Optional)
	_insertChildren - Insert children code <CODE> (Optional)
	_customParams - Action parameters <ANY> (Optional)
	_params - Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
	_modifierFunction -: Modifier function <CODE> (Optional)

Return Values:
	None

Examples:
    (begin example)
[
	"MissionStart",
	"Start Mission",
	"",
	{hint "Mission started!";},
	{true},
	["ExampleActions"]
] call LR_fnc_AddCreatorAction;
	(end)

Author:
	Mokka
*/

if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitWith {};
if (!LRG_CreatorActions_Master) exitWith {};

params [
    "_actionName",
    "_displayName",
    "_icon",
    "_statement",
    "_condition",
	["_actionPath", []],
    ["_insertChildren", {}],
    ["_customParams", []],
    ["_params", [false, false, false, false, false]],
    ["_modifierFunction", {}]
];

_action = [
	_actionName, _displayName, _icon, _statement, _condition, _insertChildren,
	_customParams, nil, nil, _params, _modifierFunction
] call ACE_interact_menu_fnc_createAction;

[
	"LRG_RegisterCreatorAction", [_action, _actionPath, _actionName], format["LRG_CAJIP_%1", _actionName]
] call CBA_fnc_globalEventJIP;