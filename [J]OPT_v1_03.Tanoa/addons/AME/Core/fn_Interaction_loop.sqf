/*
	Author: NetFusion
	Description:
	Continuously checks whether an action should be added to the cursorTarget.
	Parameter(s):
	- 
    Remarks:
    * Should only be called once per mission.
    
	Returns:
	-
	Example:
	-
*/

AME_Core_lastCursorTarget = objNull;

[{
    _cursorTarget = cursorTarget;
    if (_cursorTarget isEqualTo AME_Core_lastCursorTarget || {player distance _cursorTarget > 15}) exitWith {};	// psycho: prevent cycling trough cursorTargets more than 15m away (engine limitation is 15m for every action)
    AME_Core_lastCursorTarget = _cursorTarget;
    
	private _objActions = _cursorTarget getVariable ["AME_Core_actionStorage", []];
    {
        _x params ["_onObject", "_text", "_condition", "_callback", "_args"];
        
        if (!(_x in _objActions)) then {
            if ((_onObject isEqualType "" && {_cursorTarget isKindOf _onObject}) || (_onObject isEqualType objNull && {_cursorTarget isEqualTo _onObject})) then {
                _cursorTarget addAction [_text, _callback, _args, 1.5, true, true, "", _condition];
                _objActions pushBack _x;
            };
        };
        nil
    } count (missionNamespace getVariable ["AME_Core_actionStorage", []]);

	_cursorTarget setVariable ["AME_Core_actionStorage", _objActions]; //@todo maybe init array and remove this line - this requires module dependencies
}] call AME_Core_fnc_onEachFrame;