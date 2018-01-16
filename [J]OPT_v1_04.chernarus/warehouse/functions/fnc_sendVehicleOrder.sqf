/**
* Author: James
* process buy request from client and spawn vehicle
*
* Arguments:
* None (works via global variables)
*
* Return Value:
* None
*
* Example:
* [] call fnc_sendVehicleOrder.sqf;
*
*/
#include "script_component.hpp"

#define IDD_DLG_ORDER 20000
#define IDC_CTRL_VEHICLE_LIST 20100
disableSerialization;

private _display = findDisplay IDD_DLG_ORDER;
private _list = _display displayCtrl IDC_CTRL_VEHICLE_LIST;
private _selectedVehicle = lbCurSel _list;

if (_selectedVehicle < 0) exitWith {	
    private _txt = "Bitte ein Fahrzeug auswählen";
    [QEGVAR(gui,message), ["Fehler", _txt, "yellow"]] call CBA_fnc_localEvent;
};

private _unitRecord = GVAR(orderDialogObjects) select _selectedVehicle;
private _selectionText = lbtext [IDC_CTRL_VEHICLE_LIST, _selectedVehicle];
if (_selectionText == "") exitWith {};

private _unitType = _unitRecord select 0;
private _unitCost = _unitRecord select 1;

private _side_Budget = if (PLAYER_SIDE == west) then {GVARMAIN(nato_budget)} else {GVARMAIN(csat_budget)};

private _displayName = getText (configFile >> "CfgVehicles" >> _unitType >> "displayName");

// Prüfe, ob aktuelle Kosten größer sind als aktuelles Budget + Dispo
// wenn Budget < 0, dann kann noch bis dispo eingekauft werden (siehe setup_publicvariable)
if (_unitCost > (_side_Budget + GVARMAIN(dispo))) exitWith {
	private _txt = "Budget reicht nicht aus, Dispo überzogen!";
    [QEGVAR(gui,message), ["Budget unzureichend", _txt, "red"]] call CBA_fnc_localEvent;
};

private _spawnObj = nearestObject [player, "Land_HelipadCircle_F"];
private _empty_pos = (position _spawnObj) findEmptyPosition [0.2, GVAR(orderSpawnRadius), _unitType];

if (count _empty_pos == 0) exitWith {
    private _txt = format["Kein freier Platz im Umkreis von %1m. Bereich räumen.", GVAR(orderSpawnRadius)];
	[QEGVAR(gui,message), ["Platz unzureichend", _txt, "red"]] call CBA_fnc_localEvent;
};

[QEGVAR(common,updateBudget), [PLAYER_SIDE, _unitCost, "-"]] call CBA_fnc_serverEvent;
[QGVAR(spawnVehicle), [_unitType, _spawnObj]] call CBA_fnc_serverEvent;

private _txt = format["%1 geliefert.",_displayName];
[QEGVAR(gui,message), ["Bestellung", _txt, "green"]] call CBA_fnc_localEvent;

// Budget in Dialog updaten
[] call FUNC(updateBudget);