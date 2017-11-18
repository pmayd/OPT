/**
* Author: James
* create local map marker for down unit
*
* Arguments:
* 0: <OBJECT> down unit
*
* Return Value:
* None
*
* Example:
* [player] call fnc_createMarker.sqf;
*
*/
#include "script_component.hpp"

params ["_unit"];

private _mark = "";
	
if (FAR_PlayerSide == [_unit] call EFUNC(common,getPlayerSide)) then {
    private _name = [_unit] call EFUNC(log,getPlayerName);

	private _marker = _unit getVariable ["far_unitMarker", ""];

	// erzeuge neuen Marker oder...
	if (_marker == "") then {

		_marker = format ["FAR_marker_%1", _name];
		_mark = createMarkerLocal [_marker, position _unit];
		_mark setMarkerTextLocal format ["%1 down", _name];
		_mark setMarkerShapeLocal "ICON";
		_mark setMarkerTypeLocal FAR_REVIVE_MARKER_TYPE;
		_mark setMarkerColorLocal FAR_REVIVE_MARKER_COLOR;
		_mark setMarkerAlphaLocal FAR_REVIVE_MARKER_ALPHA;

		// da auf allen Clíents ausgeführt, hat jeder Client diese Info
		_unit setVariable ["far_unitMarker", _marker];
	} else {
		// versetze alten
		_marker setMarkerPosLocal (position _unit);
		_mark = _marker;
	};

};

_mark