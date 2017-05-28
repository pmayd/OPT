/*
    Arma Mission Enhancement - Core\Events\fn_removeOnEachFrame.sqf
    
    Author: NetFusion
	
    Description:
    Remove an OEF EH by its id. Ids are not persistent but unique inside one frame.
	
    Parameter(s):
    - SCALAR - the id of the OEF EH
	
    Returns:
    -
	
    Example:
    _id call AME_Core_fnc_removeOnEachFrame;
*/


// Deletes the OEF EH with the given id.
private _onEachFrameData = missionNamespace getVariable ["AME_Core_onEachFrameData", []];
_onEachFrameData deleteAt _this;
missionNamespace setVariable ["AME_Core_onEachFrameData", _onEachFrameData];