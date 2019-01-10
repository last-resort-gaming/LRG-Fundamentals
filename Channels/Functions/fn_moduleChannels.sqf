params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic"
];


if (hasInterface && !isServer) exitWith {};

// Channel Variables
_GlobalText = _logic getVariable ["GlobalText", 0];
_GlobalVoice = _logic getVariable ["GlobalText", 0];

_SideText = _logic getVariable ["SideText", 0];
_SideVoice = _logic getVariable ["SideVoice", 0];

_CommandText = _logic getVariable ["CommandText", 0];
_CommandVoice = _logic getVariable ["CommandVoice", 0];

_GroupText = _logic getVariable ["GroupText", 0];
_GroupVoice = _logic getVariable ["GroupVoice", 0];

_VehicleText = _logic getVariable ["VehicleText", 0];
_VehicleVoice = _logic getVariable ["VehicleVoice", 0];

_DirectText = _logic getVariable ["DirectText", 0];
_DirectVoice = _logic getVariable ["DirectVoice", 0];

_GlobalDuration = _logic getVariable ["GlobalDuration", -1];
_SideDuration = _logic getVariable ["SideDuration", 60];
_CommandDuration = _logic getVariable ["CommandDuration", -1];
_GroupDuration = _logic getVariable ["GroupDuration", -1];
_VehicleDuration = _logic getVariable ["VehicleDuration", -1];
_DirectDuration = _logic getVariable ["DirectDuration", -1];

// Enable/Disable Channels
[0, [_GlobalText, _GlobalVoice]] remoteExec ["enablechannel",0,true];
[1, [_SideText, _SideVoice]] remoteExec ["enablechannel",0,true];
[2, [_CommandText, _CommandVoice]] remoteExec ["enablechannel",0,true];
[3, [_GroupText, _GroupVoice]] remoteExec ["enablechannel",0,true];
[4, [_VehicleText, _VehicleVoice]] remoteExec ["enablechannel",0,true];
[5, [_DirectText, _DirectVoice]] remoteExec ["enablechannel",0,true];


// Global Duration Check
    [{
		params ["_args", "_pfhID"];
		_args params ["_GlobalDuration"];

		if (_GlobalDuration isEqualTo -1) then {[_pfhID] call CBA_fnc_removePerFrameHandler;} else {
			if (time > (_GlobalDuration * 60)) then {
				[0, [false, false]] remoteExec ["enablechannel",0,true];
				[_pfhID] call CBA_fnc_removePerFrameHandler;
			};
		};
    }, 60, [_GlobalDuration]] call CBA_fnc_addPerFrameHandler;

// Side Duration Check
    [{
		params ["_args", "_pfhID"];
		_args params ["_SideDuration"];

		if (_SideDuration isEqualTo -1) then {[_pfhID] call CBA_fnc_removePerFrameHandler;} else {
			if (time > (_SideDuration * 60)) then {
				[1, [false, false]] remoteExec ["enablechannel",0,true];
				[_pfhID] call CBA_fnc_removePerFrameHandler;
			};
		};
    }, 60, [_SideDuration]] call CBA_fnc_addPerFrameHandler;

// Command Duration Check
    [{
		params ["_args", "_pfhID"];
		_args params ["_CommandDuration"];

		if (_CommandDuration isEqualTo -1) then {[_pfhID] call CBA_fnc_removePerFrameHandler;} else {
			if (time > (_CommandDuration * 60)) then {
				[2, [false, false]] remoteExec ["enablechannel",0,true];
				[_pfhID] call CBA_fnc_removePerFrameHandler;
			};
		};
    }, 60, [_CommandDuration]] call CBA_fnc_addPerFrameHandler;

// Group Duration Check
    [{
		params ["_args", "_pfhID"];
		_args params ["_GroupDuration"];

		if (_GroupDuration isEqualTo -1) then {[_pfhID] call CBA_fnc_removePerFrameHandler;} else {
			if (time > (_GroupDuration * 60)) then {
				[3, [false, false]] remoteExec ["enablechannel",0,true];
				[_pfhID] call CBA_fnc_removePerFrameHandler;
			};
		};
    }, 60, [_GroupDuration]] call CBA_fnc_addPerFrameHandler;

// Vehicle Duration Check
    [{
		params ["_args", "_pfhID"];
		_args params ["_VehicleDuration"];

		if (_VehicleDuration isEqualTo -1) then {[_pfhID] call CBA_fnc_removePerFrameHandler;} else {
			if (time > (_VehicleDuration * 60)) then {
				[4, [false, false]] remoteExec ["enablechannel",0,true];
				[_pfhID] call CBA_fnc_removePerFrameHandler;
			};
		};
    }, 60, [_VehicleDuration]] call CBA_fnc_addPerFrameHandler;

// Direct Duration Check
    [{
		params ["_args", "_pfhID"];
		_args params ["_DirectDuration"];

		if (_DirectDuration isEqualTo -1) then {[_pfhID] call CBA_fnc_removePerFrameHandler;} else {
			if (time > (_DirectDuration * 60)) then {
				[5, [false, false]] remoteExec ["enablechannel",0,true];
				[_pfhID] call CBA_fnc_removePerFrameHandler;
			};
		};
    }, 60, [_DirectDuration]] call CBA_fnc_addPerFrameHandler;