class CfgPatches
{
	class LRGFundamentals_General
	{
		requiredVersion=0.1;
		requiredAddons[]={"A3_Data_F"};
		units[]={};
		weapons[]={};
	};
	
};

#include "CfgRespawnTemplates.hpp"
#include "CfgDisplays.hpp"
#include "CfgUnitInsignia.hpp"

// This needs to look the way it does. Yes, it sucks.
class CfgScriptPaths
{
	LRGDisplays = "LRG Fundamentals\General\Scripts\UI\Displays\";
};

class CfgFunctions {

    #include "cfgFunctions.hpp"
};
