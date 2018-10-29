/*
Script: RscDisplayCueCard

Description:
	Display script for showing cue cards on-screen.

Parameters:
	None

Return Values:
	None

Examples:
    Nothing to see here, called by createDisplay

Author:
	Mokka
*/

#include "\a3\UI_F_Orange\UI\resincl.inc"
#include "\a3\UI_F_Orange\UI\dikCodes.inc"

#define PREVIEW_SOUNDVOLUME	0.25

_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

fnc_updatePos = {
	params ["_displayorcontrol", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
	systemChat format ["Display: %1, Button: %2, X: %3, Y: %4", _displayorcontrol, _button, _xPos, _yPos];

	_displayorcontrol ctrlSetPosition [_XPos, _yPos];
	_displayorcontrol ctrlCommit 2;

	_ctrl = (findDisplay 20305) displayCtrl 1200;
	_ctrl ctrlSetPosition [_XPos, _yPos];
	_ctrl ctrlCommit 2;
};

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


		_ctrlTexture ctrlsettext _texture;

		missionnamespace setvariable ["RscDisplayCueCard_data",nil];

	};
	case "onUnload": {
		_display = _params select 0;
		ppeffectdestroy (_display getvariable ["pp",-1]);
	};
};