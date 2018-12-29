class CfgPatches
{
	class LRGFundamentals_YAINA
	{
		// Use meta information from specified addon. Used to avoid repeated declarations.
		addonRootClass = "LRG Fundamentals";

		requiredVersion = 1.60;
		requiredAddons[]={"A3_Data_F"};
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions {

    #include "cfgFunctions.hpp"
};

#include "General\crewNamesTitles.hpp"