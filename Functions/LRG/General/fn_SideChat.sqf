/*
	LRG MISSION TEMPLATE
	fn_SideChat.sqf
	Author: MitchJC
	Description: Temp enable Sidechat for selected roles to allow briefing.
*/

params [
	"_unit",
	["_Section", ""]
];

if ((!local _unit) || !(isClass (configFile >> "CfgPatches" >> "task_force_radio"))) exitwith {};

if ((_Section == "Command") || (_Section == "909 EAW")) then {
		1 enableChannel [true, false];
		_handle = [
			{
				if (SideChatDuration == 0) exitwith {};
				if (time > (SideChatDuration * 60)) exitwith {
					if (CurrentChannel == 1) then {setCurrentChannel 5;};
					1 enableChannel [false, false];
					["<t color='#40FFFF' size = '.5'>Side Chat Disabled </t>",1,-0.2,10,2,0,789] spawn BIS_fnc_dynamicText;
					[_handle] call CBAP_fnc_removePerFrameHandler;
				};
			}, 60, []
		] call CBAP_fnc_addPerFrameHandler;
	};