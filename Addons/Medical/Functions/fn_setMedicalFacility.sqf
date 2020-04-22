/*
Function: LR_fnc_setMedicalFacility

Description:
	Turns the given object or trigger into a medical facility.

Arguments:
	_object - Object to turn into a portable FOB

Return Values:
	Nothing.

Examples:
    Nothing to see here

Author:
	Mokka
*/

params ["_object"];

private _trigger = _object getVariable ["LR_MedFac_Trigger", objNull];

// If there is no trigger associated with the medical facility yet,
// create one and assign it globally...
if (isNull _trigger) then {

    // If the object is not a trigger, create one based on bounding boxes
    if !(_object isKindOf "EmptyDetector") then {
        private _SpawnLocation = getPosATL _object;
        private _GetObjectSize = boundingBoxReal _object;
        private _Width = (_GetObjectSize select 1) select 0;
        private _Length = (_GetObjectSize select 1) select 1;
        private _Height = ((_GetObjectSize select 1) select 2) *2;
        _trigger = createTrigger ["EmptyDetector",_SpawnLocation, true];
        _trigger setTriggerArea [_Width, _Length, getdir _object, false, _Height];
    } else {
        _trigger = _object;
    };

    // Associate the trigger with the object
    _object setVariable ["LR_MedFac_Trigger", _trigger, true];
};

_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerStatements [
    "player in thislist",
    "if (player getVariable [""ACE_isUnconscious"", false]) then {
    [format [""%1<br />is being revived at the LRG Medical Facility."", profileName], [1,-0.2], ""#ed1b2e"", 0.4] call LR_fnc_dynamicText;
    };

    [
    	""You are being treated at the LRG Medical Facility"",
    	[-1, 0.8],
    	""#FFA500"",
    	0.5,
    	false
    ] call LR_fnc_DynamicText;

    [
        {
            [player] call ACE_medical_treatment_fnc_fullHealLocal;
            [
                ""Treatment Complete"",
                [-1, 0.8],
                ""#228B22"",
                0.5,
                false
            ] call LR_fnc_DynamicText;
        }, [], 10
    ] call CBA_fnc_waitAndExecute;",
    ""
];