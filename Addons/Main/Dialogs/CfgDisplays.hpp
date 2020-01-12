
#include "defineResGrids.inc"

class IGUIBack;
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
class RscCombo;
class RscButton;
class RscButtonMenuSteam;
class RscMapControl;
class RscVignette;
class RscInterlacingScreen;
class RscLadderPicture;
class VScrollbar;
class HScrollbar;
class RscXSliderH;
class DefaultFont
{
	font = "RobotoCondensed";
};

class RscLRGXSliderH: RscXSliderH
{
	colorBackground[] = {0,0,0,1};
};
class RscLRGCombo : RscCombo
{
	h = 1 * GUI_GRID_H_FIX;
	rowHeight = 1.1 * GUI_GRID_H_FIX;
	wholeHeight = 6.5 * GUI_GRID_H_FIX;
};
class RscLRGEdit: RscEdit
{
	autocomplete = "general";
	colorBackground[] = {0,0,0,0};
};
class RscLRGMessageEdit: RscLRGEdit
{
	style = 16;
	linespacing = 1;
	default = 1;
};
class RscLRGScriptEdit: RscLRGMessageEdit
{
	autocomplete = "scripting";
};

#include "RscDisplayCueCard.hpp"
#include "RscNotePad.hpp"
#include "RscDialogDynamic.hpp"