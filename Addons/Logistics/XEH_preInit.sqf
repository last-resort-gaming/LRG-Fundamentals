[
    "LRG_Logistics_axeTimeFactor",
    "SLIDER",
    ["Chopping Time Factor", "Higher values means that the chopping takes longer"],
    "LRG Logistics",
    [0.1, 10, 1, 1],
    true
] call CBA_Settings_fnc_init;

[
    "LRG_Logistics_axeMaxTime",
    "SLIDER",
    ["Max Chopping Time", "Maximum Time in seconds that chopping can take (no matter how tall the tree is)"],
    "LRG Logistics",
    [5, 600, 40, 0],
    true
] call CBA_Settings_fnc_init;