// not documented: called at display creation

#include "\a3\UI_F_Orange\UI\resincl.inc"
#include "\a3\UI_F_Orange\UI\dikCodes.inc"

#define PREVIEW_SOUNDVOLUME	0.25

_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

switch _mode do {
	case "onLoad": {
		_display = _params select 0;

		_ctrlNotepadIn = _display displayCtrl 1004;
		_ctrlNotepadBack = _display displayCtrl 1201;

		_ctrlNotepadIn ctrlEnable true;

		_notepadContents = uiNamespace getVariable ["LRG_Notepad_Content", ""];

		_ctrlNotepadIn ctrlSetText _notepadContents;
	};
	case "onUnload": {
		_display = _params select 0;

		_ctrlNotepadIn = _display displayCtrl 1004;
		_notepadContents = ctrlText _ctrlNotepadIn;

		// Save the contents of the notepad to the missionNamespace
		missionNamespace setVariable ["LRG_Notepad_Content", _notepadContents];
	};
};