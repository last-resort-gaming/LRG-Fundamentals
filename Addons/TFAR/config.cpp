////////////////////////////////////////////////////////////////////
//DeRap: LRG_Modules\config.bin
//Produced from mikero's Dos Tools Dll version 6.44
//'now' is Thu Jan 03 16:49:44 2019 : 'file' last modified on Wed Dec 05 17:41:22 2018
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#include "script_component.hpp"

class CfgPatches
{
	class LRG_TFAR
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
    class LRG_TFAR_Event {
        init = "call compile preprocessFileLineNumbers 'z\LRG Fundamentals\Addons\TFAR\XEH_preInit.sqf'";
    };
};


class CfgFunctions {

    #include "cfgFunctions.hpp"

};

#include "cfg3Den.hpp"


class Extended_InitPost_EventHandlers {
    class CAManBase {
        class ADDON {
            init = "[_this select 0] call LR_fnc_ConfigPlayer";
        };
    };
};