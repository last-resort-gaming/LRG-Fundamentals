params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic"
];


if (hasInterface && !isServer) exitWith {};

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


[0, [_GlobalText, _GlobalVoice]] remoteExec ["enablechannel",0,true];
[1, [_SideText, _SideVoice]] remoteExec ["enablechannel",0,true];
[2, [_CommandText, _CommandVoice]] remoteExec ["enablechannel",0,true];
[3, [_GroupText, _GroupVoice]] remoteExec ["enablechannel",0,true];
[4, [_VehicleText, _VehicleVoice]] remoteExec ["enablechannel",0,true];
[5, [_DirectText, _DirectVoice]] remoteExec ["enablechannel",0,true];

_handle = [
	{
		if (_SideChatDuration == -1) exitwith {};
		if (time > (_SideChatDuration * 60)) exitwith {
			[5] remoteExec ["setcurrentchannel",0,false];
			[1, [false, false]] remoteExec ["enablechannel",0,true];
			["<t color='#40FFFF' size = '.5'>Side Chat Disabled </t>",1,-0.2,10,2,0,789] remoteExec ["BIS_fnc_dynamicText", 0, false];
			[_handle] call CBA_fnc_removePerFrameHandler;
		};
	}, 60, []
] call CBA_fnc_addPerFrameHandler;