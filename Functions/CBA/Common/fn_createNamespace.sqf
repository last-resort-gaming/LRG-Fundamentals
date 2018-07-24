/* ----------------------------------------------------------------------------
Function: CBAP_fnc_createNamespace

Description:
    Creates a namespace. Used to store and read variables via setVariable and getVariable.

    The Namespace is destroyed after the mission ends.

Parameters:
    _isGlobal - create a global namespace (optional, default: false) <BOOLEAN>

Returns:
    _namespace - a namespace <LOCATION, OBJECT>

Examples:
    (begin example)
        _namespace = call CBAP_fnc_createNamespace;

        My_GlobalNamespace = true call CBAP_fnc_createNamespace;
        publicVariable "My_GlobalNamespace";
    (end)

Author:
    commy2
---------------------------------------------------------------------------- */

params [["_isGlobal", false]];

if (_isGlobal isEqualTo true) then {
    createSimpleObject ["Land_HelipadEmpty_F", [-1000, -1000, 0]]
} else {
    createLocation ["Invisible", [-1000, -1000, 0], 0, 0]
};
