/* ----------------------------------------------------------------------------
Function: CBAP_fnc_removeEventHandler

Description:
    Removes an event handler previously registered with CBAP_fnc_addEventHandler.

Parameters:
    _eventName - Type of event to remove. <STRING>
    _eventId   - Unique ID of the event handler to remove. <NUMBER>

Returns:
    None

Examples:
    (begin example)
        ["test", _id] call CBAP_fnc_removeEventHandler;
    (end)

Author:
    Spooner, commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

params [["_eventName", "", [""]], ["_eventId", -1, [0]]];

{
    if (_eventId < 0) exitWith {};

    private _events = GVAR(eventNamespace) getVariable _eventName;
    private _eventHash = GVAR(eventHashes) getVariable _eventName;

    if (isNil "_events") exitWith {};

    private _internalId = [_eventHash, _eventId] call CBAP_fnc_hashGet;

    if (_internalId != -1) then {
        _events deleteAt _internalId;
        [_eventHash, _eventId] call CBAP_fnc_hashRem;

        // decrement all higher internal ids, to adjust to new array position, _key == _eventId, _value == _internalId
        [_eventHash, {
            if (_value > _internalId && {!(_key isEqualTo "#lastId")}) then {
                [_eventHash, _key, _value - 1] call CBAP_fnc_hashSet;
            };
        }] call CBAP_fnc_hashEachPair;
    };
} call CBAP_fnc_directCall;

nil
