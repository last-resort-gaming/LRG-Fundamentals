class RadioConfigDialog {

	idd = 21821;

    class controlsBackground {
        class Backdrop: LRG_CC_RscText
        {
        	idc = 1000;
        	x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 9 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 20 * GUI_GRID_CENTER_W;
        	h = 7 * GUI_GRID_CENTER_H;
        	colorBackground[] = {0.2,0.2,0.2,1};
        };
    };
    class controls {
        class TitleText: LRG_CC_RscText
        {
        	idc = 1001;
            style = "ST_TITLE_BAR";
        	text = "Configure Stationary Radio";
        	x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 8 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 20 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        	colorBackground[] = {0.2,0.4,0.2,1};
        };
        class ChOneText: LRG_CC_RscText
        {
        	idc = 1002;
        	text = "Channel 1 Frequency:";
        	x = 11 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 10 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        };
        class ChTwoText: LRG_CC_RscText
        {
        	idc = 1003;
        	text = "Channel 2 Frequency:";
        	x = 11 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 12 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 10 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        };
        class VolText: LRG_CC_RscText
        {
        	idc = 1004;
        	text = "Radio Volume:";
        	x = 11 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 14 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 10 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        };
        class ButtonOK: LRG_CC_RscButton
        {
			idc = 1100;
        	x = 10 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 16.5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 5 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
			text = "OK";
			soundPush[] = 
			{
				"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush",
				0.09,
				1
			};
        };
        class ButtonCancel: LRG_CC_RscButton
        {
			idc = 1100;
        	x = 25 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 16.5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 5 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
			text = "Cancel";
			soundPush[] = 
			{
				"\A3\ui_f\data\sound\RscButtonMenuOK\soundPush",
				0.09,
				1
			};
        };
        class ChOneEdit: LRG_CC_RscEdit
        {
        	idc = 1400;
        	text = "30";
        	x = 26 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 3 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        	tooltip = "Set Channel 1 of the radio to this frequency. -1 disables the channel.";
        };
        class ChTwoEdit: LRG_CC_RscEdit
        {
        	idc = 1401;
        	text = "40";
        	x = 26 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 12 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 3 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        	tooltip = "Set Channel 2 of the radio to this frequency. -1 disables the channel.";
        };
        class VolSlider: LRG_CC_RscSlider // todo - make this an XSlider for nice looks
        {
        	idc = 1900;
        	x = 23 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
        	y = 14 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
        	w = 6 * GUI_GRID_CENTER_W;
        	h = 1 * GUI_GRID_CENTER_H;
        };
    };
};