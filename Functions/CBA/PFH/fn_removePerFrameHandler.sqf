/* ----------------------------------------------------------------------------
Function: CBAP_fnc_removePerFrameHandler
Description:
    Remove a handler that you have added using CBAP_fnc_addPerFrameHandler.
Parameters:
    _handle - The function handle you wish to remove. <NUMBER>
Returns:
    None
Examples:
    (begin example)
        _handle = [{player sideChat format["every frame! _this: %1", _this];}, 0, ["some","params",1,2,3]] call CBAP_fnc_addPerFrameHandler;
        sleep 10;
        [_handle] call CBAP_fnc_removePerFrameHandler;
    (end)
Author:
    Nou & Jaynus, donated from ACRE project code for use by the community; commy2
---------------------------------------------------------------------------- */
params [["_handle", -1, [0]]];

if (_handle < 0 || {_handle >= count CBAP_PFHhandles}) exitWith {};

[{
    params ["_handle"];

    CBAP_perFrameHandlerArray deleteAt (CBAP_PFHhandles select _handle);
    CBAP_PFHhandles set [_handle, nil];

    {
        _x params ["", "", "", "", "", "_handle"];
        CBAP_PFHhandles set [_handle, _forEachIndex];
    } forEach CBAP_perFrameHandlerArray;
}, _handle] call CBAP_fnc_directCall;

nil
