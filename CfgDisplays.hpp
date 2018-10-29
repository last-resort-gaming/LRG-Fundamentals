class RscStandardDisplay;
class RscText;
class RscPicture;
class RscPictureKeepAspect;
class RscActivePicture;
class RscButtonMenu;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscEdit;
class RscEditMulti;
class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class RscButton;
class RscButtonMenuSteam;
class RscMapControl;
class RscVignette;
class RscInterlacingScreen;
class RscLadderPicture;
class VScrollbar;
class HScrollbar;
class DefaultFont
{
	font = "RobotoCondensed";
};

class RscDisplayCueCard
{
	idd = 20305;
	enableSimulation = 1;
	closeOnMissionEnd = 0;
	scriptName = "RscDisplayCueCard";
	scriptPath = "LRGDisplays";
	onLoad = "[""onLoad"",_this,""RscDisplayCueCard"",'LRGDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	onUnload = "[""onUnload"",_this,""RscDisplayCueCard"",'LRGDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
	movingEnable = false;
	class Controls
	{
		class Picture: RscPictureKeepAspect
		{
			idc = 1001;
			text = "#(argb,8,8,3)color(1,0,0,0.2)";
			x = "safezoneX + 2 * (((safezoneW / safezoneH) min 1.2) / 40)";
			y = "safezoneY + 5 * (((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "safezoneW - 2 * 5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "safezoneH - 2 * 5 * (((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            moving = 1;
		};
		class TextBackground: RscText
		{
			idc = 1002;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";
			colorBackground[] = {0,0,0,0.7};
			fade = 1;
			moving = 0;
		};
		class TextGroup: RscControlsGroup
		{
			idc = 1003;
			x = "0.5 - 0.5 * (safezoneH - 2 * 5 * (((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
			y = "safezoneY + 5 * (((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "safezoneH - 2 * 5 * (((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			h = "safezoneH - 2 * 5 * (((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			fade = 1;
			moving = 0;
			class Controls
			{
				class Text: RscStructuredText
				{
					idc = 1005;
					x = 0;
					y = 0;
					w = "safezoneH - 2 * 5 * (((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					h = "safezoneH - 2 * 5 * (((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					moving = 0;
				};
			};
		};
	};
};