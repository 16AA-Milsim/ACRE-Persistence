#include "script_component.hpp"
/*
 * File: fnc_adjustVoiceVolume.sqf
 * Author: 3Mydlo3, Mildly_Interested
 * Date: 2023-09-22
 * Last Update: 2023-09-24
 * License: GNU General Public License v2.0 only - https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
 *
 * Adjusts default direct speech volume for local player based on CBA settings.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Function reached the end [BOOL]
 *
 * Example:
 * call l6AA_acre_fnc_adjustVoiceVolume;
 *
 * Public: No
 */

private _volumeLevel = [GVAR(defaultSpeechVolume), GVAR(defaultSpeechVolumeLeader)] select (player isEqualTo leader player);

private _volume = switch (round _volumeLevel) do {
    case 0: {0.1};
    case 1: {0.4};
    case 2: {0.7};
    case 3: {1};
    case 4: {1.3};
    default {0.7};
};


[
    {[] call acre_api_fnc_isInitialized;},
    {
        params ["_volume", "_volumeLevel"];
        [_volume] call acre_api_fnc_setSelectableVoiceCurve;
        [{acre_sys_gui_volumeLevel = _this;}, round _volumeLevel / 4] call CBA_fnc_execNextFrame;
    },
    [_volume, _volumeLevel]
] call CBA_fnc_waitUntilAndExecute;

true
