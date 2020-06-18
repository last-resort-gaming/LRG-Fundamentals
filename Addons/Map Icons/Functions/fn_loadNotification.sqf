/*
Function: LR_MI_fnc_loadNotification

Description:
    Displays a notification after joining the mission if a save is available for loading.

Arguments:
    None

Return Value:
    None

Example:
    Nothing to see here

Author:
	Gruppe Adler, modified by Mokka
*/

private _saveMarkersData = profileNamespace getVariable "LR_MI_saveData";
if (isNil "_saveMarkersData") exitWith {};

private _hasWorldSaveData = _saveMarkersData findIf {worldName isEqualTo (_x select 1)};
if (_hasWorldSaveData < 0) exitWith {};

[{!isNull (findDisplay 46)},{
    [{
        ["LR_MI_notification",["GRAD SAVE MARKERS","You have markers that can now be loaded."]] call bis_fnc_showNotification;
    },[],10] call CBA_fnc_waitAndExecute;
},[]] call CBA_fnc_waitUntilAndExecute;
