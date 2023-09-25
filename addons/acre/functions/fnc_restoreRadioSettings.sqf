#include "script_component.hpp"
/*
 * File: fnc_restoreRadioSettings.sqf
 * Author: Darojax, KrippeJaevel, Mildly_Interested
 * Date: 2023-08-24
 * Last Update: 2023-09-25
 * License: License: GNU General Public License v3.0 only - https://www.gnu.org/licenses/gpl-3.0-standalone.html
 *
 * Get radio config from profileNamespace and apply to radios in player's inventory.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Function reached the end [BOOL]
 *
 * Example:
 * call l6AA_acre_fnc_restoreRadioSettings;
 *
 * Public: No
 */

// get saved variables/arrays from profileNamespace
private _baseRadios = profileNamespace getVariable [QGVAR(baseRadios), []];
private _channels = profileNamespace getVariable [QGVAR(channels), []];
private _volumes = profileNamespace getVariable [QGVAR(volumes), []];
private _spatials = profileNamespace getVariable [QGVAR(spatials), []];

// Get the radio list from the player's inventory
private _radios = [] call acre_api_fnc_getCurrentRadioList;

// if player has no radios, exit with hint
if (count _radios == 0) exitWith {
	["acre_persistence", "ACRE Persistence", "You are not carrying any radios", "", 3, [1, 0.29, 0.16, 1]] call acre_sys_list_fnc_displayHint;
};

// Reorder _radios array to match _baseRadios placing to be PTT1 PTT2 and PTT3 radios first
private _sortedRadios = [];
{
	_baseType = _x;
	_foundRadio = _radios findIf {
		[_x] call acre_api_fnc_getBaseRadio isEqualTo _baseType && !(_x in _sortedRadios)
	};
	if (_foundRadio != -1) then {
		_sortedRadios pushBack (_radios select _foundRadio);
	};
} forEach _baseRadios;

// Add remaining radios not in _baseRadios list
_radios = _sortedRadios + (_radios - _sortedRadios);

// set PTT assignments and implement restored radio settings
private _success = [_radios] call acre_api_fnc_setMultiPushToTalkAssignment;
private _foundMatchingRadios = false;
private _baseRadiosCopy = +_baseRadios;
private _channelsCopy = +_channels;
private _volumesCopy = +_volumes;
private _spatialsCopy = +_spatials;

{
	if (_forEachIndex >= GVAR(amountOfRadiosToRestore)) exitWith {};
	_currentBaseRadio = [_x] call acre_api_fnc_getBaseRadio;
	_index = _baseRadiosCopy find _currentBaseRadio;

	if (_index != -1) then {
		[_x, _channelsCopy select _index] call acre_api_fnc_setRadioChannel;
		[_x, _volumesCopy select _index] call acre_api_fnc_setRadioVolume;
		[_x, _spatialsCopy select _index] call acre_api_fnc_setRadioSpatial;
		{
			_x deleteAt _index
		} forEach [_baseRadiosCopy, _channelsCopy, _volumesCopy, _spatialsCopy];
		_foundMatchingRadios = true;
	};
} forEach _radios;

if (_foundMatchingRadios) then {
    if (count _baseRadiosCopy == 0) then {
        ["acre_persistence", "ACRE Persistence", "Radio Settings restored", "", 3, [0.29, 1, 0.16, 1]] call acre_sys_list_fnc_displayHint;
    } else {
        ["acre_persistence", "ACRE Persistence", "Radio Settings partially sestored", "Missing radios in your inventory", 3, [1, 0.8, 0, 1]] call acre_sys_list_fnc_displayHint;
    };
} else {
    ["acre_persistence", "ACRE Persistence", "No matching radio types found", "", 3, [1, 0.29, 0.16, 1]] call acre_sys_list_fnc_displayHint;
};

true
