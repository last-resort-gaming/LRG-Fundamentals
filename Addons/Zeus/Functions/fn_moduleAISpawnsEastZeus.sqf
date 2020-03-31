// not documented: called by module

#include "module_zeus_header.inc"

private _pos = getPos _logic;
if (_pos isEqualTo [0, 0, 0]) exitWith {
	[format ["Error: Invalid position for module %1!", _logic], "ZeusLog"] call YAINA_F_fnc_log;
};

["East", _pos] call LR_fnc_SpawnAIZeusWrapper;

#include "module_zeus_footer.inc"