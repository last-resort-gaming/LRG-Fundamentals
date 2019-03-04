/*
Function: LR_fnc_LaptopHoldActions

Description:
    Adds Hold AddActions to a Laptop. Can be placed in the init field of a laptop or executed via script.

Arguments:
    _object - Object the addaction is applied to.  <OBJECT>
	_title - The name of the addaction, visable to players. <STRING>
	_time - How long the action must be held to complete. <SCALAR>
	_SoundClass - Class name of sound from CfgSounds <STRING>
	_distance - How far away the sound can be heard from _object. <SCALAR>
	_pitch - pitch of the sound. Should usually be 1. <SCALAR>

Return Value:
    None

Examples:
    (begin example)
        [this] call LR_fnc_LaptopHoldActions;
		[MyLaptopName] call LR_fnc_LaptopHoldActions;
		[this, "Download the Intel"] call LR_fnc_LaptopHoldActions;
		[this, "Trigger the Alarm", 5, "A3\Sounds_F\sfx\alarm_blufor.wss"] call LR_fnc_LaptopHoldActions;
    (end)

Author:
	MitchJC
*/

if (!isServer) exitWith {};

params [
	"_object",
	["_Title", "Close the Laptop"],
	["_Time", 10],
	["_SoundClass", "AirRaid"],
	["_distance", 250],
	["_pitch", 1]

];

[
	_object,
	"laptop" + str (floor (random 360)),
	format ["<t color='#00FFFF'>%1</t>", _Title],
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"true",
	"true",
	{ [format["<t color='#FFBB00' size = '.5'>Processing</t>",(_this select 2) select 1],-1,0.8,(_this select 2) select 2,2,0,789] spawn BIS_fnc_dynamicText;},
	{},
	{
		[format["<t color='#339900' align='center' size = '.4'>%1</t><t color='#FFBB00' align='center' size = '.4'><br/>%2 has completed this action</t>",(_this select 2) select 1, (name _caller)],1,-0.2,10,0,0,789] remoteExec ["BIS_fnc_dynamicText",0,false];

		_OriginalPos = getPosATL ((_this select 2) select 0);
		_OriginalDir = getDir ((_this select 2) select 0);
		deleteVehicle ((_this select 2) select 0);
		_Newobject = createVehicle ["Land_Laptop_F", [0,0,0], [], 0,"NONE"];
		{[_Newobject, false] remoteExec [_x, 2];} foreach ["enableSimulationGlobal","allowDamage"];
		_Newobject SetPosATL _OriginalPos;
		_Newobject setDir _OriginalDir;
		{_x addCuratorEditableObjects [[_Newobject], false];} forEach allcurators;
//		playSound3D [((_this select 2) select 3), _Newobject, false, getposATL _Newobject, 1, 1, 200];
		[_Newobject, (_this select 2) select 3, (_this select 2) select 4, (_this select 2) select 5] call LR_fnc_Sound3D;
//		[_Newobject, "AirRaid"] call LR_fnc_Sound3D;
	},
	{[format["<t color='#cc3232' size = '.5'>Aborted</t>",(_this select 2) select 1],-1,0.8,5,2,0,789] spawn BIS_fnc_dynamicText;},
	[_object, _Title, _Time, _SoundClass, _distance, _pitch],
	_Time,
	true,
	"Processing",
	false
] remoteExec ["LR_fnc_AddHoldAction", 0, _object];

{
	_x addCuratorEditableObjects [[_object], false];
} forEach allcurators;

{
	[_object, false] remoteExec [_x, 2];
} foreach ["enableSimulationGlobal","allowDamage"];