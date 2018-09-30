/**
* Author: James
* create local map marker for down unit
*
* Arguments:
* 0: <OBJECT> down unit
*
* Return Value:
* 0: <MARKER> created unit marker
*
* Example:
* [player] call fnc_createMarker.sqf;
*
* Server only:
* no
*
* Public:
* yes
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_unit", objNull, [objNull], 1]
];

/* VALIDATION */
if (_unit isEqualTo objNull) exitWith{};
private _name = UNIT_NAME(_unit);
if (_name isEqualTo "") exitWith{};

/* CODE BODY */
private _marker = _unit getVariable ["FAR_unitMarker", ""];
	
if (PLAYER_SIDE == UNIT_SIDE(_unit)) then {

	// erzeuge neuen Marker oder...
	if (_marker == "") then {

		_marker = format ["FAR_marker_%1", _name];
		_marker = createMarkerLocal [_marker, position _unit];
		_marker setMarkerTextLocal format ["%1 down", _name];
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal FAR_REVIVE_MARKER_TYPE;
		_marker setMarkerColorLocal FAR_REVIVE_MARKER_COLOR;
		_marker setMarkerAlphaLocal FAR_REVIVE_MARKER_ALPHA;

		// da auf allen Clíents ausgeführt, hat jeder Client diese Info
		_unit setVariable ["FAR_unitMarker", _marker];
	} else {
		// versetze alten
		_marker setMarkerPosLocal (position _unit);

	};

};

_marker