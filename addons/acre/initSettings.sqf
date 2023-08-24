#include "script_component.hpp"

//Restore radios on respawn?
[
    QGVAR(restoreRadiosOnRespawn),
    "CHECKBOX",
    [
        "Restore radios on respawn",
        "Setting does nothing at the moment."
    ],    
    "ACRE2-Persistence",
    true
] call CBA_fnc_addSetting;
//Amount of radios to restore
[
    QGVAR(amountOfRadiosToRestore),
    "SLIDER",
    [
        "Amount of radios to restore",
        "Setting does nothing at the moment."
    ],    
    "ACRE2-Persistence",
    [1, 10, 6, 0, false]
] call CBA_fnc_addSetting;
//Only restore radios on exact match
[
    QGVAR(exactMatch),
    "CHECKBOX",
    [
        "Only restore radios on exact match",
        "Setting does nothing at the moment."
    ],    
    "ACRE2-Persistence",
    false
] call CBA_fnc_addSetting;