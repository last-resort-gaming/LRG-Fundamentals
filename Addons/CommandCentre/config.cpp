#include "script_component.hpp"

class CfgPatches
{
	class LRG_CommandCentre
	{
		author = AUTHOR;
		name = NAME;
		url = URL;
		units[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"A3_UI_F","cba_main","cba_xeh"};
		version = VERSION;
		authors[] = {"MitchJC", "Mokka"};
		weapons[] = {};
	};
};

class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit;
			class Combo;
			class Checkbox;
			class CheckboxNumber;
			class ModuleDescription;
			class Units;
		};

		class ModuleDescription
		{
			class AnyBrain;
		};
	};

	#include "ModuleCommsTower.hpp"
	#include "ModuleSingleScreen.hpp"
	#include "ModuleMultiScreen.hpp"
	#include "ModuleStationaryRadio.hpp"
	#include "ModuleVehicleCam.hpp"
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class LRG_CommandCentre: NO_CATEGORY
	{
		displayName = "LRG Command Centre";
	};
};

#include "GUI\defines.hpp"
#include "GUI\DialogStationaryRadio.hpp"
#include "GUI\DialogScreen.hpp"


class CfgFunctions {

    #include "cfgFunctions.hpp"
};