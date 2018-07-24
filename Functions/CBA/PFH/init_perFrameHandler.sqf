#define DELAY_MONITOR_THRESHOLD 1 // Frames

CBAP_perFrameHandlerArray = [];
CBAP_lastTickTime = diag_tickTime;

CBAP_waitAndExecArray = [];
CBAP_waitAndExecArrayIsSorted = false;
CBAP_nextFrameNo = diag_frameno + 1;
// PostInit can be 2 frames after preInit, need to manually set nextFrameNo, so new items get added to buffer B while processing A for the first time:
CBAP_nextFrameBufferA = [[[], {CBAP_nextFrameNo = diag_frameno;}]];
CBAP_nextFrameBufferB = [];
CBAP_waitUntilAndExecArray = [];

// per frame handler system
CBAP_fnc_onFrame = {
    private _tickTime = diag_tickTime;
    call CBAP_fnc_missionTimePFH;

    // Execute per frame handlers
    {
        _x params ["_function", "_delay", "_delta", "", "_args", "_handle"];

        if (diag_tickTime > _delta) then {
            _x set [2, _delta + _delay];
            [_args, _handle] call _function;
            false
        };
    } count CBAP_perFrameHandlerArray;


    // Execute wait and execute functions
    // Sort the queue if necessary
    if (!CBAP_waitAndExecArrayIsSorted) then {
        CBAP_waitAndExecArray sort true;
        CBAP_waitAndExecArrayIsSorted = true;
    };
    private _delete = false;
    {
        if (_x select 0 > CBAP_missionTime) exitWith {};

        (_x select 2) call (_x select 1);

        // Mark the element for deletion so it's not executed ever again
        CBAP_waitAndExecArray set [_forEachIndex, objNull];
        _delete = true;
    } forEach CBAP_waitAndExecArray;
    if (_delete) then {
        CBAP_waitAndExecArray = CBAP_waitAndExecArray - [objNull];
    };


    // Execute the exec next frame functions
    {
        (_x select 0) call (_x select 1);
        false
    } count CBAP_nextFrameBufferA;
    // Swap double-buffer:
    CBAP_nextFrameBufferA = CBAP_nextFrameBufferB;
    CBAP_nextFrameBufferB = [];
    CBAP_nextFrameNo = diag_frameno + 1;


    // Execute the waitUntilAndExec functions:
    _delete = false;
    {
        // if condition is satisfied call statement
        if ((_x select 2) call (_x select 0)) then {
            (_x select 2) call (_x select 1);

            // Mark the element for deletion so it's not executed ever again
            CBAP_waitUntilAndExecArray set [_forEachIndex, objNull];
            _delete = true;
        };
    } forEach CBAP_waitUntilAndExecArray;
    if (_delete) then {
        CBAP_waitUntilAndExecArray = CBAP_waitUntilAndExecArray - [objNull];
    };
};

// fix for save games. subtract last tickTime from ETA of all PFHs after mission was loaded
addMissionEventHandler ["Loaded", {
    private _tickTime = diag_tickTime;

    {
        _x set [2, (_x select 2) - CBAP_lastTickTime + _tickTime];
    } forEach CBAP_perFrameHandlerArray;

    CBAP_lastTickTime = _tickTime;
}];

CBAP_missionTime = 0;
CBAP_lastTime = time;

// increase CBAP_missionTime variable every frame
if (isMultiplayer) then {
    // multiplayer - no accTime in MP
    if (isServer) then {
        // multiplayer server
        CBAP_fnc_missionTimePFH = {
            if (time != CBAP_lastTime) then {
                CBAP_missionTime = CBAP_missionTime + (_tickTime - CBAP_lastTickTime);
                CBAP_lastTime = time; // used to detect paused game
            };

            CBAP_lastTickTime = _tickTime;
        };

        addMissionEventHandler ["PlayerConnected", {
            (_this select 4) publicVariableClient "CBAP_missionTime";
        }];
    } else {
        CBAP_missionTime = -1;

        // multiplayer client
        0 spawn {
            "CBAP_missionTime" addPublicVariableEventHandler {
                CBAP_missionTime = _this select 1;

                CBAP_lastTickTime = diag_tickTime; // prevent time skip on clients

                CBAP_fnc_missionTimePFH = {
                    if (time != CBAP_lastTime) then {
                        CBAP_missionTime = CBAP_missionTime + (_tickTime - CBAP_lastTickTime);
                        CBAP_lastTime = time; // used to detect paused game
                    };

                    CBAP_lastTickTime = _tickTime;
                };
            };
        };
    };
} else {
    // single player
    CBAP_fnc_missionTimePFH = {
        if (time != CBAP_lastTime) then {
            CBAP_missionTime = CBAP_missionTime + (_tickTime - CBAP_lastTickTime) * accTime;
            CBAP_lastTime = time; // used to detect paused game
        };

        CBAP_lastTickTime = _tickTime;
    };
};
