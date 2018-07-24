/* ----------------------------------------------------------------------------
Function: CBAP_fnc_globalEvent

Description:
    Raises a CBA event on all machines, including the local one.

Parameters:
    _eventName - Type of event to publish. <STRING>
    _params    - Parameters to pass to the event handlers. <ANY>

Returns:
    None

Examples:
    (begin example)
        ["test", ["global"]] call CBAP_fnc_globalEvent;
    (end)

Author:
    Spooner, commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

params [["_eventName", "", [""]], ["_params", []]];

CALL_EVENT(_params,_eventName);
SEND_EVENT_TO_OTHERS(_params,_eventName);

nil
