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
		_ctrlTextGroup = _display displayctrl 1003;
		_ctrlText = _display displayctrl 1005;

		_ctrlTexture ctrlsettext _texture;
		_ctrlTextGroup ctrlshow false;

		missionnamespace setvariable ["RscDisplayCueCard_data",nil];

	};
	case "onUnload": {
		_display = _params select 0;
		ppeffectdestroy (_display getvariable ["pp",-1]);
	};
};