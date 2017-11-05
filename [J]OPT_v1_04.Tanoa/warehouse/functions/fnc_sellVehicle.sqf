/**
* Author: James
* sell selected vehicle from Dialog
*
* Arguments:
* None (dialog controll variables)
*
* Return Value:
* None
*
* Example:
* [] call fnc_sellVehicle.sqf;
*
*/
#include "script_component.hpp"

#define IDD_DLG_ORDER 20000
#define IDC_CTRL_VEHICLE_LIST 20100
#define IDC_CTRL_PRICE_LIST 20101

// begin of script
disableSerialization;

private _display = findDisplay IDD_DLG_ORDER;
private _listbox_vehicle = _display displayCtrl IDC_CTRL_VEHICLE_LIST;
private _index = lbCurSel _listbox_vehicle;

if (_index < 0) exitWith {	
    private _txt = "Bitte ein Fahrzeug auswählen";
    [QEGVAR(gui,message), [_txt, "yellow"]] call CBA_fnc_localEvent;
};

private _selectedVehicle = (GVAR(vehiclesToSell) select _index) select 0;
private _selectionText = _listbox_vehicle lbText _index;
private _unitCost = (GVAR(vehiclesToSell) select _index) select 1;

[QEGVAR(common,updateBudget), [player getVariable QGVARMAIN(playerSide), _unitCost, "+"]] call CBA_fnc_serverEvent;
deleteVehicle _selectedVehicle;

private _txt = format["%1 für %2 € verkauft.", _selectionText, _unitCost];
[QEGVAR(gui,message), ["Verkauf", _txt, "green"]] call CBA_fnc_localEvent;

// neu öffnen
[] call FUNC(updateBudget);

// lösche Option aus Verkaufsmenü!
_listbox_vehicle lbDelete _index;
_listbox_price lbDelete _index;

