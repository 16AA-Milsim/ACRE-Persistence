#pragma sls disable file SQFVM-10005 //disable duplicate MACRO definition warning
#include "script_component.hpp"
/*
 * File: initSettings.sqf
 * Author: Mildly_Interested, 3Mydlo3
 * Date: 2023-08-01
 * Last Update: 2023-09-30
 * License: GNU General Public License v3.0 only - https://www.gnu.org/licenses/gpl-3.0-standalone.html
 *
 * Sets up CBA settings for the ACRE submodule.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

private _category = "ACRE Persistence";

//Amount of radios to restore
[
    QGVAR(amountOfRadiosToRestore),
    "SLIDER",
    [
        "Number of radios to restore",
        "How many radio configurations to restore, applies to respawn and persistence. PTT assigned radios are first in the list."
    ],
    _category,
    [1, 10, 6, 0, false]
] call CBA_fnc_addSetting;
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
        "In format: 'name1','name2', ...."
    ],
    [_category, "On respawn"],
    ["'ACRE_PRC77', 'ACRE_PRC117F', 'ACRE_PRC148', 'ACRE_PRC152', 'ACRE_PRC343', 'ACRE_SEM52SL', 'ACRE_SEM70', 'ACRE_BF888S'"]

] call CBA_fnc_addSetting;
//Respawn restore timeout
[
    QGVAR(restoreRadiosOnRespawnDelay),
    "SLIDER",
    [
        "Timeout for restoring radios",
        "Skip restoring radios if unit has no radios equipped after x seconds. Useful if you add radios to units after they spawn. Set to -1 to never timeout."
    ],
    [_category, "On respawn"],
    [-1, 15, 5, 0, false]
] call CBA_fnc_addSetting;
//Default speech volume normal bod
[
    QGVAR(defaultSpeechVolume),
    "LIST",
    [
        "Default volume",
        "Speech volume of players after spawning in."
    ],
    [_category, "Volume"],
    [
        [0, 1, 2, 3, 4],
        ["Whisper", "Quiet", "Normal", "Loud", "Shout"],
        2
    ]
] call CBA_fnc_addSetting;
//Default speech volume group leader
[
    QGVAR(defaultSpeechVolumeLeader),
    "LIST",
    [
        "Default volume leader",
        "Speech volume of group leaders after spawning in. Whoever spawns in first in a group is group leader until the 'true' group leader spawns."
    ],
    [_category, "Volume"],
    [
        [0, 1, 2, 3, 4],
        ["Whisper", "Quiet", "Normal", "Loud", "Shout"],
        2
    ]
] call CBA_fnc_addSetting;
