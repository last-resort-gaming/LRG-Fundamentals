class RscDisplayCueCard
{
	idd = 20305;
	enableSimulation = 1;
	closeOnMissionEnd = 0;
	scriptName = "RscDisplayCueCard";
	scriptPath = "LRGDisplays";
	onLoad = "[""onLoad"",_this,""RscDisplayCueCard"",'LRGDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload = "[""onUnload"",_this,""RscDisplayCueCard"",'LRGDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	movingEnable = true;

	class Controls
	{
		class Picture: RscPictureKeepAspect
		{
			idc = 1001;
			text = "#(argb,8,8,3)color(1,0,0,0.2)";
			x = "safezoneX + 5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "safezoneY + 5 * (((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "safezoneW * 0.26";
			h = "safezoneH * 0.52";
			moving = 1;
			onMouseMoving = "\
				params [""_control"", ""_xPos"", ""_yPos"", ""_mouseOver""]; \
				\
				if !(uinamespace getVariable [""1001_dragged"", false]) exitWith {}; \
				\
				(ctrlPosition _control) params [""_x"", ""_y"", ""_w"", ""_h""]; \
				\
				_control ctrlSetPosition [_XPos - _w / 2, _yPos - _h / 2]; \
				\
				_control ctrlCommit 0; \
			";
			onMouseButtonDown = "\
				if ((_this select 1) != 0) exitWith {}; \
				uinamespace setVariable [""1001_dragged"", true]; \
			";
			onMouseButtonUp	= "\
				if ((_this select 1) != 0) exitWith {}; \
				uinamespace setVariable [""1001_dragged"", false]; \
			";
			onKeyDown = "\
				params [""_displayorcontrol"", ""_key"", ""_shift"", ""_ctrl"", ""_alt""]; \
				[_this, ""keyDown""] call CBA_events_fnc_keyHandler; \
			";
			onKeyUp = "\
				params [""_displayorcontrol"", ""_key"", ""_shift"", ""_ctrl"", ""_alt""]; \
				[_this, ""keyUp""] call CBA_events_fnc_keyHandler; \
			";
		};

		class NotePad: RscEdit
        {
            idc = 1002;
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
				if !(uinamespace getVariable [""1002_dragged"", false]) exitWith {}; \
				\
				(ctrlPosition _control) params [""_x"", ""_y"", ""_w"", ""_h""]; \
				\
				_control ctrlSetPosition [_XPos - _w / 2, _yPos - _h / 2]; \
				\
				_control ctrlCommit 0; \
				\
				_ctrl = (findDisplay 20305) displayCtrl 1200; \
				_ctrl ctrlSetPosition [_XPos - _w / 2, _yPos - _h / 2]; \
				_ctrl ctrlCommit 0; \
			";
			onMouseButtonDown = "\
				if ((_this select 1) != 0) exitWith {}; \
				uinamespace setVariable [""1002_dragged"", true]; \
			";
			onMouseButtonUp	= "\
				if ((_this select 1) != 0) exitWith {}; \
				uinamespace setVariable [""1002_dragged"", false]; \
			";
        };
    };

	class controlsBackground
	{
        class NotePadBackground: RscPicture
        {
            idc = 1200;
            text = "z\LRG Fundamentals\addons\Media\images\Cue Cards\notepad_CA.paa";
            x = 0.288594 * safezoneW + safezoneX;
            y = 0.093 * safezoneH + safezoneY;
            w = 0.31 * safezoneW;
            h = 0.754 * safezoneH;
			moving = 0;
        };
    };
};