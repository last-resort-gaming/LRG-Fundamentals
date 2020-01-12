class RscNotepad
{
	idd = 20306;
	enableSimulation = 1;
	closeOnMissionEnd = 0;
	scriptName = "RscNotepad";
	scriptPath = "LRGDisplays";
	onLoad = "[""onLoad"",_this,""RscNotepad"",'LRGDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload = "[""onUnload"",_this,""RscNotepad"",'LRGDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onMouseButtonDown = "\
		if ((_this select 1) != 0) exitWith { \
			_ctrl = ((_this select 0) displayCtrl 1004); \
			_ctrlEnabled = ctrlEnabled _ctrl; \
			_ctrl ctrlEnable (not _ctrlEnabled); \
		}; \
	";
	onKeyDown = "\
		params [""_displayorcontrol"", ""_key"", ""_shift"", ""_ctrl"", ""_alt""]; \
		_ctrl = _displayorcontrol displayCtrl 1004; \
		if (ctrlEnabled _ctrl) exitWith {}; \
		[_this, ""keyDown""] call CBA_events_fnc_keyHandler; \
	";
	onKeyUp = "\
		params [""_displayorcontrol"", ""_key"", ""_shift"", ""_ctrl"", ""_alt""]; \
		_ctrl = _displayorcontrol displayCtrl 1004; \
		if (ctrlEnabled _ctrl) exitWith {}; \
		[_this, ""keyUp""] call CBA_events_fnc_keyHandler; \
	";
	able = true;

	class Controls
	{
		class NotePad: RscEdit
        {
            idc = 1004;
            x = 0.288594 * safezoneW + safezoneX;
            y = 0.093 * safezoneH + safezoneY;
            w = 0.31 * safezoneW;
            h = 0.754 * safezoneH;
            //multiline:
            text = "";
            style = 16;
            lineSpacing = 1;
            colorText[] =   {       0,  0,      0,      1   };
            sizeEx = 0.05;
			onMouseMoving= "\
				params [""_control"", ""_xPos"", ""_yPos"", ""_mouseOver""]; \
				if !(uinamespace getVariable [""1004_dragged"", false]) exitWith {}; \
				\
				(ctrlPosition _control) params [""_x"", ""_y"", ""_w"", ""_h""]; \
				\
				_control ctrlSetPosition [_XPos - _w / 2, _yPos - _h / 2]; \
				\
				_control ctrlCommit 0; \
				\
				_ctrl = (findDisplay 20306) displayCtrl 1201; \
				_ctrl ctrlSetPosition [_XPos - _w / 2, _yPos - _h / 2]; \
				_ctrl ctrlCommit 0; \
			";
			onMouseButtonDown = "\
				uinamespace setVariable [""1004_dragged"", true]; \
			";
			onMouseButtonUp	= "\
				uinamespace setVariable [""1002_dragged"", false]; \
			";
		};
    };

	class controlsBackground
	{
        class NotePadBackground: RscPicture
        {
            idc = 1201;
            text = "z\LRG Fundamentals\addons\Media\images\Cue Cards\notepad_CA.paa";
            x = 0.288594 * safezoneW + safezoneX;
            y = 0.093 * safezoneH + safezoneY;
            w = 0.31 * safezoneW;
            h = 0.754 * safezoneH;
			moving = 1;
        };
    };
};