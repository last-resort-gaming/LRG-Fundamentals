/* ----------------------------------------------------------------------------
Function: CBAP_fnc_addEventHandler

Description:
    Registers an event handler for a specific CBA event.

Parameters:
    _eventName - Type of event to handle. <STRING>
    _eventFunc - Function to call when event is raised. <CODE>

Returns:
    _eventId - Unique ID of the event handler (can be used with CBAP_fnc_removeEventHandler).

Examples:
    (begin example)
        _id = ["test", {systemChat str _this}] call CBAP_fnc_addEventHandler;
    (end)

Author:
    Spooner, commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

[{
    params [["_eventName", "", [""]], ["_eventFunc", nil, [{}]]];

    if (_eventName isEqualTo "" || isNil "_eventFunc") exitWith {-1};

    private _events = GVAR(eventNamespace) getVariable _eventName;
    private _eventHash = GVAR(eventHashes) getVariable _eventName;


    // generate event name on logic
    if (isNil "_events") then {
        _events = [];
        GVAR(eventNamespace) setVariable [_eventName, _events];

        _eventHash = [[], -1] call CBAP_fnc_hashCreate;
        GVAR(eventHashes) setVariable [_eventName, _eventHash];
    };

    private _internalId = _events pushBack _eventFunc;

    // get new id
    private _eventId = [_eventHash, "#lastId"] call CBAP_fnc_hashGet;
    INC(_eventId);

    [_eventHash, "#lastId", _eventId] call CBAP_fnc_hashSet;
    [_eventHash, _eventId, _internalId] call CBAP_fnc_hashSet;

    _eventId
}, _this] call CBAP_fnc_directCall;
