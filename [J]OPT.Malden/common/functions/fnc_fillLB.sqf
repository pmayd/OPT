/**
* Author: James
* fill a listbox of a dialog with given keys
*
* Arguments:
* 0: <IDD> idd of dialog listbox belongs to
* 1: <IDC> idc of listbox
* 2: <ARRAY> list of strings as display text to fill listbox with
* 3: <ARRAY> (optional) list of paths to pictures to fill picture attribute
* 4: <ARRAY> (optional) list of arbitrary data to fill data attribute
*
* Return Value:
* 0: <BOOLEAN> true if lb was filled correctly, false otherwise
*
* Example:
* [1000, 2000, ["a","b"],["a.paa","b.paa"], [1,2]] call fnc_fillLB.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_idd", 0, [1], 1], 
    ["_idc", 0, [1], 1],
    ["_txtToAdd", "", [["s"]]],
    ["_picToAdd", "", [["s"]]],
    ["_dataToAdd", "", [["s"]]]
];

if (_idd == 0 or _idc == 0) exitWith {false};
if (_txtToAdd isEqualTo "") exitWith {false};
if ((count _picToAdd != count _txtToAdd) or (count _dataToAdd != count _txtToAdd)) exitWith {false};

private _display = findDisplay _idd;
private _lb = _display displayCtrl _idc;

{
    _lb lbAdd _x;

    if (count _dataToAdd > 0) then {
        _lb lbSetData [_forEachIndex, (_dataToAdd select _forEachIndex)];
    };
    if (count _picToAdd > 0) then {
        _lb lbSetPicture [_forEachIndex, (_picToAdd select _forEachIndex)];
    };

} forEach _txtToAdd;

true
