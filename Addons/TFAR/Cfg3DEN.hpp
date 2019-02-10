class ctrlToolbox;

class Cfg3DEN {
    class Attributes {
        class Default;
        class Title: Default {
            class Controls {
                class Title;
            };
        };
        class GroupSelect: Title {
            attributeLoad = "(_this controlsGroupCtrl 100) lbSetCurSel (((_value + 1) min 7) max 0);";
            attributeSave = "(lbCurSel (_this controlsGroupCtrl 100)) - 1";
            class Controls: Controls {
                class Title: Title{};
                class Value: ctrlToolbox {
                    idc = 100;
                    style = "0x02";
                    x = "48 * (pixelW * pixelGrid * 0.50)";
                    w = "75 * (pixelW * pixelGrid * 0.50)";
                    h = "5 * (pixelH * pixelGrid * 0.50)";
                    rows = 1;
                    columns = 7;
                    strings[] = {"None", "HQ", "One", "Two", "Three", "909", "Support"};
                };
            };
        };
    };
    class Object {
        class AttributeCategories {
            class LRG_attributes {
                displayName = "LRG Fundamentals";
                collapsed = 1;
                class Attributes {
                    class LRG_Group_Preset {
                        property = QUOTE(LRG_Group_Preset);
                        control = GroupSelect;
                        displayName = "LRG Preset Group:";
                        tooltip = "Default Preset for Patches & TFAR Radio Frequencies.";
                        expression = "[_this, _value] call LR_fnc_ConfigPlayer;";
                        typeName = "STRING";
                        condition = "objectBrain";
                        defaultValue = "-1";
                    };
                };
            };
        };
    };
};