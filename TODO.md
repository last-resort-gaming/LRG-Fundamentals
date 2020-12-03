# (Un-)Curated List of ToDo's

## AI

* (!) Find a better way to find suitable spawn location for RANDOM (kind of done? needs testing)
* (!) Delete SpawnAI/Civ modules after spawning complete
* Space out the spawns to reduce strain
* Different behaviours for newly spawned AI
* Allow SpawnAI modules to be "cocked" and activated by script (see CreatorActions)
* Side selection for SpawnCivilians
* Civilian Issues
  * ~~TK civilians error~~

## AIS Revive

* Test, test, test

## Explosives

* ~~Use LR_fnc_addHoldAction for IEDVehicle actions instead of vanilla~~
* ~~Add 3den Modules and ZEN Context Actions for the IEDs~~
  * Icons for these modules...

## Interaction

* ~~Finally fix the creatorActions more reliably in SP testing (publicVar shenanigans)~~
* ~~Completely rework the CreatorActions system~~
* Add some default CreatorActions to control various aspects of Fundamentals in the mission
  * ~~Enable/Disable channels~~
  * Trigger explosives
  * Trigger AI Spawns
  * ~~Save Map Markers (scrapped)~~
  * End Mission
    * Confirmation dialog if the mission really should be ended
* Add PiP live video screens for a command centre
  * Of helmet cams?
  * Of unit map?
  * UAV cam?

## FOBs

* Allow Camps to be deployed from Backpacks (using the AssembleTo system from Vanilla)
* ~~Add Zeus Modules to create portable FOBs on the fly~~
* Distance checking to other FOBs and Vehicles
* Add an option to choose FOB on deployment
* ~~Show where FOB would be deployed to allow better positioning~~

## Main

### YAINA

* Fix up the positioning hack for fn_showFPS

### LRG

* ~~Fix the co-pilot authorization script, stop reset every time someone gets in~~

## Medical

* ~~Test locality issues with fn_setMedicalFacility~~

## Training

* Fix up Casualty system
  * T1 can't be reset...
* ~~Make the Casualty actions ACE ones~~
* ~~Fix up ACE Settings for Training mission~~

## Zeus

* ~~Test the FOB ZEN Context Actions in mp~~
* ~~Test the Medical Facility ZEN Context Action in mp~~
  * Especially test for some border cases with fn_canBeMedFacility
* ~~Test the new ZEN modules~~
* Icons for the FOB Context Actions
* ~~Add Zeus Support for Casualty System (Module)~~
* CBA Settings Entries for Context Actions
