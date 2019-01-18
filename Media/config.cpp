class CfgPatches
{
	class LRGFundamentals_Media
	{
		// Use meta information from specified addon. Used to avoid repeated declarations.
		addonRootClass = "LRG Fundamentals";

		requiredVersion = 1.60;
		requiredAddons[]={"A3_Data_F"};
		units[] = {};
		weapons[] = {};
	};
};

#include "CfgMusic.hpp"
#include "CfgSounds.hpp"

class CfgFunctions {

    #include "cfgFunctions.hpp"
};

