#include "script_component.hpp"

class CfgPatches
{
	class LRG_Equipment
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

class CfgFunctions {

    #include "cfgFunctions.hpp"
};

#include "cfg3Den.hpp"


class Extended_InitPost_EventHandlers {
    class ReammoBox_F {
        class ADDON {
            init = "[_this select 0] call LR_fnc_EquipmentLoadout";
        };
        class LimitedAmmo {
            init = "[_this select 0] call LR_fnc_LimitedAmmo";
        };		
    };
};