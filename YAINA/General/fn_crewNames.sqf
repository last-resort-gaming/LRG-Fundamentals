/*
Function: YAINA_fnc_crewNames

Description:
	Display the crew and vehicle heading/target. Initialized during
    postInit phase.

Parameters:
	None

Return Values:
	None

Examples:
    Nothing to see here

Author:
	Unknown, rewritten by Alganthe
*/

player addEventHandler ["GetInMan", {
    [{
        params ["_args", "_pfhID"];

        if (isNull objectParent player) then {
            [_pfhID] call CBA_fnc_removePerFrameHandler;
        } else {
            disableSerialization;

            1000 cutRsc ["HudNames","PLAIN"];
            private _ui = uiNameSpace getVariable "HudNames";
            private _HudNames = _ui displayCtrl 99999;

            private _vehicle = assignedVehicle player;
            private _weap = currentWeapon vehicle player;
            private _name = format ["<t size='1.1' color='#FFFFFF'>%1</t><br/>", getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "DisplayName")];

            {
                _x params ["_unit", "_role", "_cargoIndex", "_turretPath", "_personTurret"];

                if (_role isEqualTo "driver") then {
                    _name = format ["<t size='0.9' color='#f0e68c'>%1 %2</t> <img size='0.8' color='#6b8e23' image='a3\ui_f\data\IGUI\Cfg\Actions\getindriver_ca.paa'/><br/>", _name, (name _unit)];
                } else {
                    if ((_role isEqualTo "Turret" || { _role isEqualTo "gunner" }) && { count (getArray (([_vehicle, _turretPath] call CBA_fnc_getTurret) >> "weapons") select { !(_x isEqualTo "Laserdesignator_mounted") }) > 0 }) then {
                        _name = format ["<t size='0.9' color='#f0e68c'>%1 %2</t> <img size='0.8' color='#6b8e23' image='a3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa'/><br/>", _name, (name _unit)];
                    } else {
                        _name = format ["<t size='0.9' color='#f0e68c'>%1 %2</t> <img size='0.8' color='#6b8e23' image='a3\ui_f\data\IGUI\Cfg\Actions\getincargo_ca.paa'/><br/>", _name, (name _unit)];
                    };
                };
                nil;
            } count (fullCrew _vehicle);

            _HudNames ctrlSetStructuredText parseText _name;
            _HudNames ctrlCommit 0;

        };
    }, 0, []] call CBA_fnc_addPerFrameHandler;
}];