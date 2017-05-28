/*
    Arma Mission Enhancement - Core\Events\fn_initEvents.sqf
    Author: NetFusion
	
    Description:
    Adds a loop which call all OEF EHs. Will be called by autoload for client and server. There is no need to call it manually.
	
    Parameter(s):
    -
	
    Returns:
    -
	
    Example:
    -
*/


AME_Core_eachFrameHandlerId = addMissionEventHandler ["EachFrame", {
    // Fetch all OEF EHs from missionNamespace.
	private _onEachFrameHandler = missionNamespace getVariable ["AME_Core_onEachFrameData", []];

    {
        _x params ["_code", "_delay", "_nextExecTime", "_params"];

        // If the execution time is up call the function.
        if (diag_tickTime > _nextExecTime) then {
            // Set the new execution time depending on the provided delay.
            _x set [2, _nextExecTime + _delay];

            [_forEachIndex, _params] call _code; //@todo if an EH removed itself the next EH may be skipped
        };
    } forEach _onEachFrameHandler;

    if (getClientState == "GAME FINISHED") then {
		removeMissionEventHandler ["EachFrame", AME_Core_eachFrameHandlerId];
    };
}];