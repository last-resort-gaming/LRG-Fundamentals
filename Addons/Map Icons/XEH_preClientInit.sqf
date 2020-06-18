["lrg-saveMarkers",{
    [] call LR_MI_fnc_openDialog;
},"all"] call CBA_fnc_registerChatCommand;

[] call LR_MI_fnc_loadNotification;

[
    "SaveMarkers",
    "Save Map Markers",
    {
        [] call LR_MI_fnc_openDialog;
    },
    []
] call LR_fnc_addCreatorAction;