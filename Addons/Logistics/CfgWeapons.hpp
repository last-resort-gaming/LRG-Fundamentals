class CfgWeapons {
    class CBA_MiscItem_ItemInfo;
    class ACE_ItemCore;

    class LRG_axe: ACE_ItemCore {
        author = "Mokka";
        displayName = "Axe";
        descriptionShort = "An axe to chop down trees and bushes.";
        model = "\A3\Structures_F\Items\Tools\Axe_F.p3d";
        picture = "\z\LRG Fundamentals\addons\Logistics\ui\item_axe_ca.paa";
        scope = 2;
        class ItemInfo : CBA_MiscItem_ItemInfo {
            mass = 25;
        };
    };
};