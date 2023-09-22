#pragma sls disable file SQFVM-10005 //disable duplicate MACRO definition warning
#include "script_component.hpp"
private _category = "ACRE Persistence";

//Restore radios on respawn?
[
    QGVAR(restoreRadiosOnRespawn),
    "CHECKBOX",
    [
        "Restore radio configuration",
        "Restore radios on respawn. Works best if units spawn with the same gear they died with."
    ],
    [_category, "On respawn"],
    true
] call CBA_fnc_addSetting;
//Which Radios to restore on respawn
[
    QGVAR(radioTypesToRestore),
    "EDITBOX",
    [
        "Radio types to restore",
        "Does not apply to radio persistence. In format: 'name1','name2', ..."
    ],
    [_category, "On respawn"],
    ["'ACRE_PRC77', 'ACRE_PRC117F', 'ACRE_PRC148', 'ACRE_PRC152', 'ACRE_PRC343', 'ACRE_SEM52SL', 'ACRE_SEM70', 'ACRE_BF888S'"]

] call CBA_fnc_addSetting;
//Amount of radios to restore
[
    QGVAR(amountOfRadiosToRestore),
    "SLIDER",
    [
        "Amount of radios to restore",
        "Setting does nothing at the moment."
    ],
    [_category, "Persistence"],
    [1, 10, 6, 0, false]
] call CBA_fnc_addSetting;
//Default speech volume normal bod
[
    QGVAR(defaultSpeechVolume),
    "LIST",
    ["Default volume", LSTRING(StartBppVolume_Description)],
    [_category, "Volume"],
    [
        [0, 1, 2, 3, 4],
        ["Whisper", "Quiet", "Normal", "Loud", "Shout"],
        1
    ]
] call CBA_fnc_addSetting;
//Default speech volume group leader
[
    QGVAR(defaultSpeechVolumeLeader),
    "LIST",
    ["Default volume leader", LSTRING(StartLeaderVolume_Description)],
    [_category, "Volume"],
    [
        [0, 1, 2, 3, 4],
        ["Whisper", "Quiet", "Normal", "Loud", "Shout"],
        1
    ]
] call CBA_fnc_addSetting;
