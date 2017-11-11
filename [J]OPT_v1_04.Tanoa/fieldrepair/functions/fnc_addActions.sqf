/**
* Author: James
* add all action menu entries to unit
*
* Arguments:
* 0: <OBJECT> unit to add action menu entries to
*
* Return Value:
* None
*
* Example:
* [player] call fnc_addActions.sqf;
*
*/
#include "script_component.hpp"

params ["_unit"];

GVAR(cancelActionId) = _unit addAction[
	"<t color='#0000ff'>"+STR_CANCEL_ACTION+"</t>", 
	{GVAR(mutexAction) = false}, 
	[], 
	10, 
	false, 
	true, 
	'',
	QGVAR(mutexAction)
];