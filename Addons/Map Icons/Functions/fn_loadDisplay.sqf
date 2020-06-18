#include "..\ui\defines.inc"
/*
Function: LR_MI_fnc_loadDisplay

Description:
    Load the map icon saving display.

Arguments:
    None

Return Value:
    None

Example:
    Nothing to see here

Author:
	Gruppe Adler, modified by Mokka
*/


LR_MI_selectedMarkers = [];
LR_MI_previewMarkers = [];

private _display = (findDisplay 46) createDisplay "LR_MI_RscDisplayMarkers";

_display displayAddEventHandler ["KeyDown",LR_MI_fnc_onKeydownMap];

// map =========================================================================
private _mapCtrl = _display displayCtrl IDC_MAP;
_mapCtrl ctrlAddEventHandler ["MouseButtonDown",LR_MI_fnc_onMouseButtonDownMap];
_mapCtrl ctrlAddEventHandler ["MouseButtonUp",LR_MI_fnc_onMouseButtonUpMap];
_mapCtrl ctrlAddEventHandler ["MouseButtonDblClick",{_nil = 0}];
_mapCtrl ctrlAddEventHandler ["Draw",LR_MI_fnc_onDraw];
_mapCtrl ctrlMapAnimAdd [0,0.8,[worldSize/2,worldSize/2]];
ctrlMapAnimCommit _mapCtrl;

onMapSingleClick "true";

// buttons =====================================================================
private _ctrlButtonSave = _display displayCtrl IDC_BUTTONSAVE;
_ctrlButtonSave ctrlAddEventHandler ["buttonClick",LR_MI_fnc_onButtonSave];

private _ctrlButtonDelete = _display displayCtrl IDC_BUTTONDELETE;
_ctrlButtonDelete ctrlAddEventHandler ["buttonClick",LR_MI_fnc_onButtonDelete];

private _ctrlButtonLoad = _display displayCtrl IDC_BUTTONLOAD;
_ctrlButtonLoad ctrlAddEventHandler ["buttonClick",LR_MI_fnc_onButtonLoad];

[IDC_BUTTONDELETE,false] call LR_MI_fnc_setButtonEnabled;
[IDC_BUTTONLOAD,false] call LR_MI_fnc_setButtonEnabled;
[IDC_BUTTONSAVE,false] call LR_MI_fnc_setButtonEnabled;

// saves list ==================================================================
private _ctrlSavesList = _display displayCtrl IDC_SAVESLIST;
_ctrlSavesList ctrlAddEventHandler ["lbSelChanged",LR_MI_fnc_onSavesListSelChanged];

[_display] call LR_MI_fnc_updateSavesList;

// edit name ===================================================================
private _ctrlEditName = _display displayCtrl IDC_EDITNAME;

// execNextFrame here, because handler fires before backspace deletes a character
_ctrlEditName ctrlAddEventHandler ["keyDown",{[LR_MI_fnc_onEditNameChanged,_this] call CBA_fnc_execNextFrame}];
_ctrlEditName ctrlAddEventHandler ["setFocus",{(ctrlParent (_this select 0)) setVariable ["LR_MI_editNameFocused",true]}];
_ctrlEditName ctrlAddEventHandler ["killFocus",{(ctrlParent (_this select 0)) setVariable ["LR_MI_editNameFocused",false]}];

// help ========================================================================
private _ctrlHelp = _display displayCtrl IDC_HELP;
_ctrlHelp ctrlShow false;
_ctrlHelp ctrlShow true;

private _ctrlHelpText = _display displayCtrl IDC_HELP_TEXT;
[_ctrlHelpText] call LR_MI_fnc_loadHelp;

private _ctrlHelpPos = ctrlPosition _ctrlHelp;
_ctrlHelpPos set [3,[1 * Y_FACTOR,22.2 * Y_FACTOR] select (missionNamespace getVariable ["LR_MI_helpEnabled",false])];
_ctrlHelp ctrlSetPosition _ctrlHelpPos;
_ctrlHelp ctrlCommit -1;
