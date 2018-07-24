/*
	LRG MISSION TEMPLATE
	LR_fnc_LaptopHoldActions.sqf
	Author: MitchJC
	Description: Adds Hold AddActions to a Laptop. Can be placed in the init field of a laptop or executed via script.
	
	Syntax
	[_object, _title, _time, _sound] call LR_fnc_LaptopHoldActions;
	
	Parameters
	_object - Object the addaction is applied to.  <OBJECT>
	_title - The name of the addaction, visable to players. <STRING>
	_time - How long the action must be held to complete. <NUMBER>
	_sound -  Path to Sound file. only A3 sound files supported. https://community.bistudio.com/wiki/Arma_3:_SoundFiles <STRING>
	
	Example 1:	[this] call LR_fnc_LaptopHoldActions;
	Example 2:	[MyLaptopName] call LR_fnc_LaptopHoldActions;
	Example 3:	[this, "Download the Intel"] call LR_fnc_LaptopHoldActions;
	Example 4;	[this, "Trigger the Alarm", 5, "A3\Sounds_F\sfx\alarm_blufor.wss"] call LR_fnc_LaptopHoldActions;
*/


if (!isServer) exitWith {};

params [
		"_object",
		["_Title", "Close the Laptop"],
		["_Time", 10],
		["_sound", "A3\Missions_F_Bootcamp\data\sounds\vr_shutdown.wss"]
];

[
	_object,
	format ["<t color='#00FFFF'>%1</t>", _Title],
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"_this distance _target < 3",
	"_caller distance _target < 3",
	{ [format["<t color='#FFBB00' size = '.5'>Processing</t>",(_this select 3) select 1],-1,0.8,(_this select 3) select 2,2,0,789] spawn BIS_fnc_dynamicText;},
	{},
	{ [format["<t color='#339900' align='center' size = '.4'>%1</t><t color='#FFBB00' align='center' size = '.4'><br/>%2 has completed this action</t>",(_this select 3) select 1, (name _caller)],1,-0.2,10,0,0,789] remoteExec ["BIS_fnc_dynamicText",0,false];
	
	_OriginalPos = getPosATL ((_this select 3) select 0);
	_OriginalDir = getDir ((_this select 3) select 0);
	deleteVehicle ((_this select 3) select 0);
	_Newobject = createVehicle ["Land_Laptop_F", [0,0,0], [], 0,"NONE"];
	{[_Newobject, false] remoteExec [_x, 2];} foreach ["enableSimulationGlobal","allowDamage"];
	_Newobject SetPosATL _OriginalPos;
	_Newobject setDir _OriginalDir;
	{_x addCuratorEditableObjects [[_Newobject], false];} ForEach allcurators;
	playSound3D [((_this select 3) select 3), _Newobject, false, getposATL _Newobject, 1, 1, 200];
	},
	{[format["<t color='#cc3232' size = '.5'>Aborted</t>",(_this select 3) select 1],-1,0.8,5,2,0,789] spawn BIS_fnc_dynamicText;},
	[_object, _Title, _Time, _sound],
	_Time,
	0,
	true,
	false
	] remoteExec ["BIS_fnc_holdActionAdd", 0, _object];

	{_x addCuratorEditableObjects [[_object], false];} ForEach allcurators;
	{[_object, false] remoteExec [_x, 2];} foreach ["enableSimulationGlobal","allowDamage"];