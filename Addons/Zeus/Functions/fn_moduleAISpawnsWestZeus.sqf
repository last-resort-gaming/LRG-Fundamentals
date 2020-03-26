params ["_pos"];

if (_pos isEqualTo [0, 0, 0]) exitWith {
	[format ["Error: Invalid position for module"], "ZeusLog"] call YAINA_fnc_log;
};

["West", _pos] call LR_fnc_SpawnAIZeusWrapper;