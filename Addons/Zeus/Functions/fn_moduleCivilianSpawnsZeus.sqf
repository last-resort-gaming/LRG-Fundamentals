params ["_pos"];

if (_pos isEqualTo [0, 0, 0]) exitWith {
	[format ["Error: Invalid position for module"], "ZeusLog"] call YAINA_F_fnc_log;
};

[_pos] call LR_fnc_SpawnCivZeusWrapper;