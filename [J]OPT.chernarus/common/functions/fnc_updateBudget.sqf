/**
* Author: James
* update budget for given side, log budget change and send new budget to all players
*
* Arguments:
* 0: <STRING> name of buyer or seller
* 1: <SIDE> side of buyer
* 2: <STRING> classname (type) of vehicle or object that was bought or sold
* 3: <NUMBER> cost of transaction
* 4: <STRING> sign of transaction: "+" if cost is added to budget, "-" if cost is subtracted
* 5: <BOOL> true - transaction was due to respawn, false - otherwise
*
* Return Value:
* None
*
* Example:
* [name player, west, typeOf vehicle, 1000, "-", false] call fnc_updateBudget.sqf;
*
* public: 
* yes
*/
#include "script_component.hpp"

params [
	["_buyerName", "", [""], 1], 
	["_side", sideUnknown, [sideUnknown], 1],
	["_unitType", "", [""], 1],
	["_unitCost", 0, [0], 1],
	["_sign", "", [""], 1],
	["_respawn", false, [true], 1]
];

if (_buyerName isEqualTo "" or _side isEqualTo sideUnknown or _unitType isEqualTo "" or _sign isEqualTo "") exitWith{};

private _cat = "Budget";
private _message = "";
private _budget_neu = 0;

switch (_sign) do {
	case "-": {
			if (_side == west) then {
				_budget_neu = GVARMAIN(nato_budget) - _unitCost;
			} else {
				_budget_neu = GVARMAIN(csat_budget) - _unitCost;
			};

	};
	case "+":  {
			if (_side == west) then {
				_budget_neu = GVARMAIN(nato_budget) + _unitCost;
			} else {					
				_budget_neu = GVARMAIN(csat_budget) + _unitCost;
			};
			
	};
};

// server log sowie Aktualisierung via publicVarialbe
private _unitName = (getText(configFile >> 'CfgVehicles' >> _unitType >> 'displayName'));
if (_side == west) then {
	_message = format["NATO alt: %1 - neu: %2 - Differenz: %3%4.", GVARMAIN(nato_budget), _budget_neu, _sign, _unitCost];

	GVARMAIN(nato_budget) = _budget_neu;
	publicVariable QGVARMAIN(nato_budget);

} else {
	_message = format["CSAT alt: %1 - neu: %2 - Differenz: %3%4.", GVARMAIN(csat_budget), _budget_neu, _sign, _unitCost];
	GVARMAIN(csat_budget) = _budget_neu;
	publicVariable QGVARMAIN(csat_budget);

};

if (_respawn) then {
	_message = format["%1 Respawn von %2", _message, _buyerName];
} else {
	_message = format["%1 %2 (ver)kaufte %3", _message, _buyerName, _unitName];
};

[QEGVAR(log,write), [_cat, _message]] call CBA_fnc_localEvent;