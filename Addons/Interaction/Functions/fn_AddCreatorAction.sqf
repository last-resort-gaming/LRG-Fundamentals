/*
Function: LR_fnc_AddCreatorAction

Description:
	Adds an action for the mission creator that allows executing code/functions
	during the live mission.

Arguments:
	_title - The globally unique identifier of the action <STRING>
	_name - The name of the action as shown to players <STRING>
	_statement - The code executed upon calling the action, the following params are available: [_target, _caller, _args] <CODE>
	_args - Arguments for the statement script <ARRAY OF ANYTHING>

Return Values:
	None

Examples:
    (begin example)
		[
			"MissionStart",
			"Start Mission",
			{hint "Mission started!";},
			[]
		] call LR_fnc_AddCreatorAction;
	(end)

Author:
	Mokka
*/

if (!isServer) exitWith {
	_this remoteExec ["LR_fnc_AddCreatorAction", 2];
};

params ["_title", "_name", "_statement", "_args"];

CreatorActions pushBackUnique [_title, _name, _statement, _args];
publicVariable "CreatorActions";