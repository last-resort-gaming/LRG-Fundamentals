/*
Grab data:
Mission: fob_prefabs
World: VR
Anchor position: [6671.83, 3431.95]
Area size: 30
Using orientation of objects: yes
*/

[
	["Land_AirConditioner_04_F",[-2.89453,-3.03735,0],45,1,0,[0,0],"","",true,false], 
	["ACE_medicalSupplyCrate",[-4.74268,1.04004,0],96.3256,1,0,[-5.00657e-005,8.73013e-006],"","[_this, ""MERT"", true] call LR_fnc_MedicalSupplies;",true,false], 
	["ACE_medicalSupplyCrate",[-4.68945,-2.1814,-4.76837e-007],79.013,1,0,[-0.000318755,-2.92337e-005],"","[_this, ""MERT"", true] call LR_fnc_MedicalSupplies;",true,false], 
	["Land_MedicalTent_01_MTP_closed_F",[-10.229,-0.658691,0],90,1,0,[0,-0],"","_this animateSource [""Door_Hide"",1,true];_this setVariable [""ACE_medical_isMedicalFacility"", true, true]",true,false], 
	["CamoNet_BLUFOR_big_F",[-11.4648,-0.703369,0],270,1,0,[0,0],"","_this allowDamage false",true,false]
]