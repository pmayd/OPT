/*
	Author: [C-L-F] NetFusion

	Description:
	Add an action to an object or type(s) of object(s).

	Parameter(s):
	0: STRING - the title of the action.
	1: OBJECT, ARRAY, STRING - the object (type) which the action should be added to.
	2: NUMBER - the distance in which the action is visible.
	3: STRING - the condition which is evaluated on every frame (if play is in range) to determine whether the action is visible.
	4: CODE - the callback which gets called when the action is activated.
	5: ARRAY - (optional) the arguments which get passed to the callback.

    Remarks:
    * '_target' is the object inside the condition string.
    * [object, caller, ID, arguments] is _this in the callback
    
	Returns:
	-

	Example:
	["Hint Hello!", player, 0, "true", { hint format ["Hello %1", name player]; }] call AME_Core_fnc_Interaction_addAction;
	["Hint Hello!", "Man", 3, "true", { hint format ["Hello %1", name (_this select 0)]; }] call AME_Core_fnc_Interaction_addAction;
*/

params ["_text", "_onObject", "_distance", "_condition", "_callback", ["_args", []]];

if (_distance > 0) then {
    _condition = format ["([cursorTarget, %1] call AME_Core_fnc_inRange) && {%2}", _distance, _condition];
};

if (_onObject isEqualType objNull && {_onObject == OPT_Core_realPlayer}) exitWith {
    _onObject addAction [_text, _callback, _args, 1.5, false, true, "", _condition];
    ["playerChanged", {
        params ["_data", "_params"];
        _data params ["_currentPlayer", "_oldPlayer"];
        _params params ["_text", "_callback", "_args", "_condition"];
        
        _currentPlayer addAction [_text, _callback, _args, 1.5, false, true, "", _condition];
    }, [_text, _callback, _args, _condition]] call AME_Core_fnc_bindEventHandler;
};

if (!(_onObject isEqualType [])) then {
    _onObject = [_onObject];
};

private _actionStorage = missionNamespace getVariable ["AME_Core_actionStorage", []];

{
    _actionStorage pushBack [_x, _text, _condition, _callback, _args];
    nil
} count _onObject;
missionNamespace setVariable ["AME_Core_actionStorage", _actionStorage]; //@todo maybe init array and remove this line