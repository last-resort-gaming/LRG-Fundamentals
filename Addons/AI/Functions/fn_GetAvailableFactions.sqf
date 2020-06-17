/*
Function: LR_fnc_GetAvailableFactions


Description:
    Returns a list of all the available factions of the selected side(s).

Arguments:
    _sides - Array containing all sides for which the available factions should be retrieved <STRING>

Return Value:
    List of all the available factions of selected sides(s).

Example:
    Nothing to see here

Author:
	Mokka
*/

params ["_sides"];

if !(_sides isEqualType []) then {
	_sides = _this;
};

private _factions = [];

{
	private _side = _x;
	private _sideFactions = [];
	private _sideVar = format ["LR_AvailableFactions_%1", _side];

	// Retrieve cached factions if possible
	if !(isNil _sideVar) then {
		_sideFactions = missionNamespace getVariable _sideVar;
		_factions append _sideFactions;
	} else {
		_sideFactions = [nil, ["LRG_AI", format ["%1_Factions", _side]]] call YAINA_F_fnc_GetFunctions;

		for "_i" from (count _sideFactions) to 0 step -1 do {
			if !(isClass (configFile >> "CfgFactionClasses" >> (_sideFactions select _i))) then {
				_sideFactions deleteAt _i;
			};
		};

		missionNamespace setVariable [_sideVar, _sideFactions];
		_factions append _sideFactions;
	};
} forEach _sides;

_factions;