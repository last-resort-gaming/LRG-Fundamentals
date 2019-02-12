class ctrlToolbox;

class Cfg3DEN {
    class Attributes {
        class Default;
        class Title: Default {
            class Controls {
                class Title;
            };
        };
        class MedicalFacility: Title {
            attributeLoad = "(_this controlsGroupCtrl 100) lbSetCurSel (((_value + 1) min 2) max 0);";
            attributeSave = "(lbCurSel (_this controlsGroupCtrl 100)) - 1";
            class Controls: Controls {
                class Title: Title{};
                class Value: ctrlToolbox {
                    idc = 100;
                    style = "0x02";
                    x = "48 * (pixelW * pixelGrid * 0.50)";
                    w = "50 * (pixelW * pixelGrid * 0.50)";
                    h = "5 * (pixelH * pixelGrid * 0.50)";
                    rows = 1;
                    columns = 2;
                    strings[] = {"Disabled", "Enabled"};
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
                    class LRG_Medical_Facility {
                        property = QUOTE(LRG_Medical_Facility);
                        control = MedicalFacility;
                        displayName = "LRG Emergency Medical Facility";
                        tooltip = "Define this object as an Emergency Medical Facility. If a player enters this area, they will be revived and fully healed. @ACE Only.";
                        expression = "if (_value > -1) then {[_this] call LR_fnc_MedicalFacility};";
                        typeName = "STRING";
						condition = "(1 - objectBrain) * (1 - objectVehicle) * (1 - objectHasInventoryCargo)";
                        defaultValue = "-1";
                    };
                };
            };
        };
    };
};