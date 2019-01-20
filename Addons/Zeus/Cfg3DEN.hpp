class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class LRG_attributes {
                displayName = "LRG Fundamentals";
                collapsed = 1;
                class Attributes {
                    class LRG_Config_Zeus {
                        property = QUOTE(LRG_Config_Zeus);
                        control = "Checkbox";
                        displayName = "LRG Config Zeus:";
                        tooltip = "Enable to allow this Zeus to have placed units use LRG AI Difficulty Settings (Settings - Addon Options)";
                        expression = "[_this] call LR_fnc_ConfigZeus;";
                        typeName = "BOOL";
                        condition = "logicModule";
                        defaultValue = "true";
                    };

                };
            };
        };
    };
};