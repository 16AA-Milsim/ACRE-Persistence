#pragma sls disable file SQFVM-10005 //disable duplicate MACRO definition warning
#include "script_component.hpp"

//Restore radios on respawn?
[
    QGVAR(restoreRadiosOnRespawn),
    "CHECKBOX",
    [
        "Restore radios on respawn",
        "Setting does nothing at the moment."
    ],
    "ACRE2 Persistence",
    true
] call CBA_fnc_addSetting;
//Which Radios to restore on respawn
[
    QGVAR(radioTypesToRestore),
    "EDITBOX",
    [
        "Radio types to restore on respawn",
        "Does not apply to radio persistence."
    ],
    "ACRE2 Persistence",
    ["ACRE_PRC77", "ACRE_PRC117F", "ACRE_PRC148", "ACRE_PRC152", "ACRE_PRC343", "ACRE_SEM52SL", "ACRE_SEM70", "ACRE_BF888S"]

] call CBA_fnc_addSetting;
//Amount of radios to restore
[
    QGVAR(amountOfRadiosToRestore),
    "SLIDER",
    [
        "Amount of radios to restore",
        "Setting does nothing at the moment."
    ],
    "ACRE2 Persistence",
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
    "ACRE2 Persistence",
    false
] call CBA_fnc_addSetting;
