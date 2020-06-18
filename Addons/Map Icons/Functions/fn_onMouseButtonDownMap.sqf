// event handler

params ["_mapCtrl","_mouseButton","_mouseX","_mouseY"];

// leftclick only
if (_mouseButton != 0) exitWith {};

if (!isNil "LR_MI_selectDrawEH") exitWith {};

LR_MI_mouseDragStart = _mapCtrl ctrlMapScreenToWorld [_mouseX,_mouseY];
LR_MI_selectDrawEH = _mapCtrl ctrlAddEventHandler ["draw",{
    params ["_mapCtrl"];

    (_mapCtrl ctrlMapScreenToWorld getMousePosition) params ["_currentMouseX","_currentMouseY"];
    LR_MI_mouseDragStart params ["_startMouseX","_startMouseY"];

    _halfDeltaX = (_currentMouseX - _startMouseX)/2;
    _halfDeltaY = (_currentMouseY - _startMouseY)/2;

    _mapCtrl drawRectangle [[_startMouseX + _halfDeltaX,_startMouseY + _halfDeltaY],_halfDeltaX,_halfDeltaY,0,[0,0,0,1],""];
}];
