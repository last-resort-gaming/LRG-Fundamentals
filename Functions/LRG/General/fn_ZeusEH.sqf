/*
	LRG MISSION TEMPLATE
	LR_fnc_ZeusEH.sqf
	Author: MitchJC
	Description: Applies Skill Level and DynamicSimulation to units placed by Zeus.
*/
params [
"_Object"
];

_Object addEventHandler ["CuratorObjectPlaced", {
	params ["_curator", "_entity"];
	
_class = typeOf (_entity);
_result  = call {
		if (_class isKindOf "Man") exitWith {
			
				private _Group = call {
				if ((typeName _entity) isEqualTo "GROUP") exitWith { _entity };
				if ((typeName _entity) isEqualTo "OBJECT") exitWith { group _entity };
				_entity;
				};
			[_Group, "LRG Default"] call LR_fnc_SetUnitSkill;
			_Group enableDynamicSimulation true;
			};
			
		if (_class isKindOf "AllVehicles") exitWith {
			{[_x, "LRG Default"] call LR_fnc_SetUnitSkill;
			} foreach crew _entity;
			group _entity enableDynamicSimulation true;	
			};					
		};	
	}];
	

