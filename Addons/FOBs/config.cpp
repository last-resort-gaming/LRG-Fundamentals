#include "script_component.hpp"

class CfgPatches
{
	class LRG_FOBs
	{
		author = AUTHOR;
		name = NAME;
		url = URL;
		units[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"A3_UI_F","cba_main","cba_xeh"};
		version = VERSION;
		authors[] = {"Mokka"};
		weapons[] = {};
	};
};
class CfgFunctions {

    #include "cfgFunctions.hpp"
};

#include "CfgVehicles.hpp"