class ctrlToolbox;

class Cfg3DEN {
    class Attributes {
        class Default;
        class Title: Default {
            class Controls {
                class Title;
            };
        };
        class LoadoutSelect: Title {
            attributeLoad = "(_this controlsGroupCtrl 100) lbSetCurSel (((_value + 1) min 3) max 0);";
            attributeSave = "(lbCurSel (_this controlsGroupCtrl 100)) - 1";
            class Controls: Controls {
                class Title: Title{};
                class Value: ctrlToolbox {
                    idc = 100;
                    style = "0x02";
                    x = "48 * (pixelW * pixelGrid * 0.50)";
                    w = "80 * (pixelW * pixelGrid * 0.50)";
                    h = "5 * (pixelH * pixelGrid * 0.50)";
                    rows = 1;
                    columns = 3;
                    strings[] = {"None", "Basic Medical", "Full MERT"};
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
                    class LRG_Equipment_Selection {
                        property = QUOTE(LRG_Equipment_Selection);
                        control = LoadoutSelect;
                        displayName = "LRG Equipment Selection:";
                        tooltip = "Suppliments the equipment is this object with a preset equipment loadout. This doesn't remove currently selected equipment.";
                        expression = "[_this, _value] call LR_fnc_ConfigEquipment;";
                        typeName = "STRING";
                        condition = "objectHasInventoryCargo";
                        defaultValue = "-1";
                    };
                };
            };
        };
    };
};