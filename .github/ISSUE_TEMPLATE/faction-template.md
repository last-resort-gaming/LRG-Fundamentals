---
name: Faction Template
about: Use this template to submit a Faction for us to add to LRG Fundamentals. If
  approved, faction will be added to the next update.
title: Faction Template
labels: Faction Template
assignees: ''

---

See the current list of [Factions](https://github.com/last-resort-gaming/LRG-Fundamentals/tree/master/Addons/AI/Functions/Factions) if you're unsure on how this file should look. Infantry Groups are found using CfgGroups in the Config Viewer of the editor.
Vehicle classes are found by placing in the editor, right clicking and copying class name.

```sqf

// Steam Mod Link: 
// Faction Name: @CUP - British Armed Forces
// Faction Class Name:  CUP_B_GB

_InfantryType = "Infantry";
_infaaList    = ["AAGroup1Example", "AAGroup2Example"];
_infatList    = [];
_sniperList   = [];
_vehAAList    = [];
_vehMrapList  = [];
_vehLightList = ["B_Example01_F", "B_Example02_F"];
_vehHeavyList = [];

[_InfantryType, _infaaList, _infatList, _sniperList, _vehAAList, _vehMrapList, _vehLightList, _vehHeavyList]


```
