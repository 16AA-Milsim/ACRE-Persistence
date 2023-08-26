#include "script_component.hpp"

// Get the profileNamespace Radio Settings variables
private _baseRadios = profileNamespace getVariable [QGVAR(baseRadios), []];
private _channels = profileNamespace getVariable [QGVAR(channels), []];
private _volumes = profileNamespace getVariable [QGVAR(volumes), []];
private _spatials = profileNamespace getVariable [QGVAR(spatials), []];

// Check if previous settings exist, if not exit with a hint
if (_baseRadios isEqualTo []) exitWith {
    ["acre_persistence", "ACRE Persistence", "There are no saved settings", "", -1, [1, 0.8, 0, 1]] call acre_sys_list_fnc_displayHint;
}; 

// Create a formatted string with the radio information and the Push To Talk assignment and Display as hint
private _hintString = "SAVED RADIO SETTINGS\n";
{
    _index = _forEachIndex;
    _baseRadio = (_baseRadios select _index) splitString "_" joinString " " select [4];
    _pttText = if (_index < 3) then { format [" - PTT %1", _index + 1] } else { "" };
    _spatial = _spatials select _index;
    _spatialText = switch (_spatial) do {
        case "LEFT": {"Left Ear"};
        case "RIGHT": {"Right Ear"};
        case "CENTER": {"Both Ears"};
    };
    _volumeText = format ["%1", str round((_volumes select _index) * 100)];
    _hintString = _hintString + format ["\nRadio %1%2:\n%3 - Channel %4\nVolume: %5%% - %6\n", _index + 1, _pttText, _baseRadio, _channels select _index, _volumeText, _spatialText];
} forEach _baseRadios;

[_hintString, 1, true] call CBA_fnc_notify; //TODO broken