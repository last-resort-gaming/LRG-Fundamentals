#include "script_component.hpp"

class CfgPatches
{
	class LRG_Vehicles
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

class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits;
		class ModuleDescription;
	};
	#include "ServicingModule.hpp"
};


class CfgFunctions {

    #include "cfgFunctions.hpp"
};

#include "cfg3Den.hpp"

class Extended_InitPost_EventHandlers {
    class Car {
        class ADDON {
            init = "[_this select 0] call LR_fnc_VehicleLoadout";
        };
    };
    class Tank {
        class ADDON {
            init = "[_this select 0] call LR_fnc_VehicleLoadout";
        };
    };
    class Motorcycle {
        class ADDON {
            init = "[_this select 0] call LR_fnc_VehicleLoadout";
        };
    };
    class Helicopter {
        class ADDON {
            init = "[_this select 0] call LR_fnc_VehicleLoadout";
        };
    };
    class Plane {
        class ADDON {
            init = "[_this select 0] call LR_fnc_VehicleLoadout";
        };
    };
    class Ship_F {
        class ADDON {
            init = "[_this select 0] call LR_fnc_VehicleLoadout";
        };
    };
};