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

		_data = missionnamespace getvariable ["RscDisplayCueCard_data",[]];
		_data params [
			["_textureData","",["",[]]]
		];
		_textureData params [
			["_texture","",[""]]
		];

		_ctrlTexture = _display displayctrl 1001;
		_ctrlNotepadIn = _display displayCtrl 1002;
		_ctrlNotepadBack = _display displayCtrl 1200;

		ctrlSetFocus _ctrlTexture;
		_ctrlTexture ctrlEnable true;
		_ctrlNotepadIn ctrlEnable true;

		_notepadContents = missionNamespace getVariable ["LRG_Notepad_Content", ""];

		_ctrlNotepadIn ctrlSetText _notepadContents;

		_ctrlTexture ctrlsettext _texture;

		missionnamespace setvariable ["RscDisplayCueCard_data",nil];
	};
	case "onUnload": {
		_display = _params select 0;
		ppeffectdestroy (_display getvariable ["pp",-1]);

		_ctrlNotepadIn = _display displayCtrl 1002;
		_notepadContents = ctrlText _ctrlNotepadIn;

		// Save the contents of the notepad to the missionNamespace
		missionNamespace setVariable ["LRG_Notepad_Content", _notepadContents];
	};
};