/*
Function: LR_fnc_Patches

Description:
	Apply Section Patches to Players/Vehicles

Arguments:
	_unit - Player the Patch is applied to. <OBJECT>
	_Section - The Section the Player is in. <STRING>

Examples:
	(begin example)
		[this, "1Section"] call LR_fnc_Patches;
	(end)

Author:
	MitchJC
*/

params [
	"_unit",
	["_Section", "Support"]
];

private ["_PatchClass"];
call {
	if (_Section == "Command") exitwith {
		_PatchClass = "Command";
	};
	if (_Section == "1 Section") exitwith {
		_PatchClass = "1Section";
	};
	if (_Section == "2 Section") exitwith {
		_PatchClass = "2Section";
	};
	if (_Section == "3 Section") exitwith {
		_PatchClass = "3Section";
	};
	if (_Section == "909 EAW") exitwith {
		_PatchClass = "909EAW";
	};
	_PatchClass = "LRGLogo";
};

// ===== Apply the Patch to player.	

[BIS_fnc_setUnitInsignia, [_unit,_PatchClass], 5] call CBA_fnc_waitAndExecute;

// ======= When Player Repsawns, apply the patch they had when they died.
_unit addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_OldPatch = _corpse call BIS_fnc_getUnitInsignia;

	[_unit, ""] call BIS_fnc_setUnitInsignia;
	[BIS_fnc_setUnitInsignia, [_unit,_OldPatch], 5] call CBA_fnc_waitAndExecute;
}];