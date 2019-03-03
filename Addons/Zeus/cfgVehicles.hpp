class CfgVehicles {
    class Module_F;
    class ModuleEmpty_F;

    class ModuleCurator_F: Module_F {
		class Attributes
		{
            class LRG_Config_Zeus {
                property = QUOTE(LRG_Config_Zeus);
                control = "Checkbox";
				typeName = "BOOL";
                displayName = "LRG Fundamentals: Config Zeus:";
                tooltip = "Enable to allow this Zeus to have placed units use LRG AI Difficulty Settings (Settings - Addon Options)";
                expression = "if (_value isequalto true) then {[_this] call LR_fnc_ConfigZeus;}";
                condition = "logicModule";
                defaultValue = "(true)";
			};
		};
	};
};