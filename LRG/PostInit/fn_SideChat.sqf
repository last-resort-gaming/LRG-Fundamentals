/*
	LRG MISSION TEMPLATE
	fn_SideChat.sqf
	Author: MitchJC
	Description: Handle removing Side Chat.
*/
params [
	"_SideChatDuration"

];
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
