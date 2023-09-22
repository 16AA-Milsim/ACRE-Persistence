#include "script_component.hpp"
/*
 * File: fnc_restoreRadiosOnRespawn.sqf
 * Author: Darojax, KrippeJaevel, Mildly_Interested
 * Date: 2023-08-24
 * Last Update: 2023-09-22
 * License: License: GNU General Public License v3.0 only - https://www.gnu.org/licenses/gpl-3.0-standalone.html
 *
 * Adds respawn event handler to restore radios on respawn.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Function reached the end [BOOL]
 *
 * Example:
 * call l6AA_acre_fnc_restoreRadiosOnRespawn;
 *
 * Public: No
 */

player addEventHandler ["Respawn", { //TODO maybe just replace with new functions as seen in restoreRadioSettings
    params ["_unit", "_corpse"];
    if !QGVAR(restoreRadiosOnRespawn) exitWith {false};
    _newRadioList = [];
    _newRadioList set [0, 1];
    _newRadioList set [1, 1];
    _newRadioList set [2, 1];
    private _radioTypesToRestore = GVAR(radioTypesToRestore) splitString "', ";
    {
        private _radioType = _x;
        private _radios = [_radioType, _corpse] call acre_api_fnc_getAllRadiosByType; //return array of unique Radio IDs from corpse
        private _radioChannel = [];
        private _radioVolume = [];
        private _radioSpatial = [];
        private _pttList = [];
        _pttRadioList = [] call acre_api_fnc_getMultiPushToTalkAssignment; //return array of radioIDs assigned to each PTT key
        {
            //iterate through all radios by IDs, add their properties to arrays in a set order
            private _radioID = _x;
            private _currentChannel = [_radioID] call acre_api_fnc_getRadioChannel; //get channel of Radio
            private _currentVolume = [_radioID] call acre_api_fnc_getRadioVolume; //get volume of Radio
            private _currentSpatial = [_radioID] call acre_api_fnc_getRadioSpatial; //get spatial of Radio
            switch (_radioID) do
            {
                //if ptt1 radio, add int 1
                case (_pttRadioList select 0):
                {
                    (_pttList pushBack 1);
                };
                //if ptt2 radio, add int 2
                case (_pttRadioList select 1):
                {
                    (_pttList pushBack 2);
                };
                //if ptt3 radio, add int 3
                case (_pttRadioList select 2):
                {
                    (_pttList pushBack 3);
                };
                //if radio without ptt set, add int 9
                default
                {
                    (_pttList pushBack 9);
                };
            };
            _radioChannel pushBack _currentChannel; //add channel to radioChannel
            _radioVolume pushBack _currentVolume; //add volume to radioVolume
            _radioSpatial pushBack _currentSpatial; //add spatial to radioSpatial
        } forEach _radios;
        //now we have four arrays - radioChannel, radioVolume, radioSpatial and pttList setup for every radio the player had
        [
            {call acre_api_fnc_isInitialized},
            {
                params ["_newUnit", "_radioType", "_radioChannel", "_radioVolume", "_radioSpatial", "_pttList", "_newRadioList"];
                private _radios = [_radioType, _newUnit] call acre_api_fnc_getAllRadiosByType;
                {
                    //iterate through all NEW radios by IDs, add properties in the order set above
                    private _radioID = _x;
                    private _channel = _radioChannel select _forEachIndex;
                    private _volume = _radioVolume select _forEachIndex;
                    private _spatial = _radioSpatial select _forEachIndex;
                    private _pttKey = _pttList select _forEachIndex;
                    if (_pttKey == 1) then {_newRadioList set [0, _radioID]}; //assign new radio to PTT slot 1
                    if (_pttKey == 2) then {_newRadioList set [1, _radioID]}; //assign new radio to PTT slot 2
                    if (_pttKey == 3) then {_newRadioList set [2, _radioID]}; //assign new radio to PTT slot 3
                    [_radioID, _channel] call acre_api_fnc_setRadioChannel;
                    [_radioID, _volume] call acre_api_fnc_setRadioVolume;
                    [_radioID, _spatial] call acre_api_fnc_setRadioSpatial;
                } forEach _radios;
            },
            [_newUnit, _radioType, _radioChannel, _radioVolume, _radioSpatial, _pttList, _newRadioList]
        ] call CBA_fnc_waitUntilAndExecute;
    } forEach _radioTypesToRestore; //TODO race condition? we add multile waitUntilAndExecute calls, put loop into waitUntilAndExecute?
    [
        {GVAR(respawnRadioSettingsDone)},
        {
            params ["_newRadioList"];
            //assign the radio IDs of those with assigned PTTs
            private _ptt1 = _newRadioList select 0;
            private _ptt2 = _newRadioList select 1;
            private _ptt3 = _newRadioList select 2;
            _pttNewRadioList = [ [_ptt1, _ptt2, _ptt3] ] call acre_api_fnc_setMultiPushToTalkAssignment; //assign new radios to old PTT setup
        },
        [_newRadioList]
    ] call CBA_fnc_waitUntilAndExecute; //Can't we just add that to the previous waitUntilAndExecute?
}];

true
