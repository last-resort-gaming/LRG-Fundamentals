/*
	LRG MISSION TEMPLATE
	fn_ArsenalLoadSave.sqf
	Author: MitchJC
	Description: Removes Load/Save function from the Virtual Arsenal.
*/

If ((ArsenalLoadSave) || (!hasInterface)) exitwith {};	

	[missionNamespace, "arsenalOpened", {
		disableSerialization;
		params ["_display"];
		_display displayAddEventHandler ["keydown", "_this select 3"];
		{(_display displayCtrl _x) ctrlShow false} forEach [44151, 44150, 44146, 44147, 44148, 44149, 44346];
		}] call BIS_fnc_addScriptedEventHandler;