class ctrlToolbox;

class Cfg3DEN {
    class Attributes {
        class Default;
        class Title: Default {
            class Controls {
                class Title;
            };
        };
        class ArsenalSelect: Title {
            attributeLoad = "(_this controlsGroupCtrl 100) lbSetCurSel (((_value + 1) min 4) max 0);";
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
                    columns = 4;
                    strings[] = {"None", "Vanilla", "3CB", "RHS"};
                };
            };
        };
        class EquipmentSelect: Title {
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
                    class LRG_Arsenal_Select {
                        property = QUOTE(LRG_Arsenal_Select);
                        control = ArsenalSelect;
                        displayName = "LRG Virtual Arsenal Selection:";
                        tooltip = "Removes all items from this container and replaces them with a Full Arsenal of the selected gear.";
                        expression = "if (_value > -1) then {[_this, _value] call LR_fnc_Arsenal;}";
                        typeName = "STRING";
                        condition = "objectHasInventoryCargo - objectVehicle";
                        defaultValue = "-1";
                    };
                        class LRG_Ammo_Select {
                        property = QUOTE(LRG_Ammo_Select);
                        control = ArsenalSelect;
                        displayName = "LRG Virtual Ammobox Selection:";
                        tooltip = "Removes all items from this container and replaces them with a Limited Arsenal of the selected gear, such as Weapons and Ammo.";
                        expression = "if (_value > -1) then {[_this, _value] call LR_fnc_Ammobox;}";
                        typeName = "STRING";
                        condition = "objectHasInventoryCargo - objectVehicle";
                        defaultValue = "-1";
                    };
                        class LRG_Equipment_Select {
                        property = QUOTE(LRG_Equipment_Select);
                        control = EquipmentSelect;
                        displayName = "LRG Equipment Selection:";
                        tooltip = "Suppliments the equipment is this object with a preset equipment loadout. This doesn't remove currently selected equipment.";
                        expression = "_this setVariable ['%s',_value, true];";
                        typeName = "STRING";
                        condition = "objectHasInventoryCargo - objectVehicle";
                        defaultValue = "-1";
                    };
                };
            };
        };
    };
};
