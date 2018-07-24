/* ----------------------------------------------------------------------------
Function: derp_fnc_dirfffectCall
Description:
    Executes a piece of code in unscheduled environment.
Parameters:
    _code      - Code to execute <CODE>
    _arguments - Parameters to call the code with. (optional) <ANY>
Returns:
    _return - Return value of the function <ANY>
Examples:
    (begin example)
        0 spawn { {systemChat str canSuspend} call derp_fnc_directCall; };
        -> false
    (end)
Author:
    commy2
---------------------------------------------------------------------------- */

params [["_CBAP_code", {}, [{}]], ["_CBAP_arguments", []]];

private "_CBAP_return";

isNil {
    _CBAP_return = _CBAP_arguments call _CBAP_code;
};

if (!isNil "_CBAP_return") then {_CBAP_return};