/*
Function: LR_fnc_getCopilots

Description:
	Returns all the copilots that are currently in the given vehicle

Arguments:
	_vehicle - Vehicle to return copilots of

Return Values:
	Copilots in the vehicle

Examples:
    Nothing to see here

Author:
	Mokka
*/

params ["_vehicle"];

private _copilotTurrets = (allTurrets _vehicle) select { getNumber ([_vehicle, _x] call BIS_fnc_turretConfig >> "isCopilot") > 0 };
private _copilots = _copilotTurrets apply { _vehicle turretUnit _x };

_copilots;