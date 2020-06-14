#include "script_component.hpp"

class CfgPatches
{
	class LRG_MapIcons
	{
		author = AUTHOR;
		name = NAME;
		url = URL;
		units[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"A3_UI_F","cba_main","cba_xeh"};
		version = VERSION;
		authors[] = {"MitchJC"};
		weapons[] = {};
	};
};

class Extended_PreInit_EventHandlers {
    class LRG_MapIcons_Event {
        clientInit = "call compile preprocessFileLineNumbers 'z\LRG Fundamentals\Addons\Map Icons\XEH_preClientInit.sqf'";
    };
};

class CfgFunctions {
    #include "cfgFunctions.hpp"
};

class cfgNotifications {
    class LR_MI_notification {
        title = "%1";
        iconPicture = "\A3\ui_f\data\map\markers\military\triangle_CA.paa";
        description = "%2";
        duration = 5;
        priority = 0;
    };
};

#include "ui/dialog.hpp"