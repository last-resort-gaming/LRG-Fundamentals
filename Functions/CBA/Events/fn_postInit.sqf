#include "script_component.hpp"

// execute JIP events after post init to guarantee execution of events added during postInit
[{
    {
        private _event = GVAR(eventNamespaceJIP) getVariable _x;
        if (_event isEqualType []) then {
            if ((_event select 0) isEqualTo EVENT_PVAR_STR) then {
                (_event select 1) call CBAP_fnc_localEvent;
            };
        };
    } forEach allVariables GVAR(eventNamespaceJIP);

    // allow new incoming jip events
    [QGVAR(eventJIP), CBAP_fnc_localEvent] call CBAP_fnc_addEventHandler;
}, []] call CBAP_fnc_execNextFrame;

if (isServer) then {
    CBAP_clientID = [0, 2] select isMultiplayer;
    addMissionEventHandler ["PlayerConnected", {
        params ["_id", "_uid", "_name", "_jip", "_owner"];

        if (_owner != 2) then {
            CBAP_clientID = _owner;
            _owner publicVariableClient "CBAP_clientID";
            CBAP_clientID = [0, 2] select isMultiplayer;
        };
    }];
};

nil;
