class CfgVehicles
{
	class ModuleCurator_F;
	class MyEntity: ModuleCurator_F
	{
		class Attributes
		{
            class LRG_Config_Zeus {
                property = QUOTE(LRG_Config_Zeus);
                control = "Checkbox";
                displayName = "LRG Config Zeus:";
                tooltip = "Enable to allow this Zeus to have placed units use LRG AI Difficulty Settings (Settings - Addon Options)";
                expression = "[_this] call LR_fnc_ConfigZeus;";
                typeName = "BOOL";
                condition = "1";
                defaultValue = "true";
			};
		};
	};
};