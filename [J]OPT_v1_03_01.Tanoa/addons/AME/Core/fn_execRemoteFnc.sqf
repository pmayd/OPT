/*
	Author: [C-L-F] NetFusion

	Description:
	Executes a function remotely.

	Remarks:
	* Has to run on the server to distribute data to clients.
	* Supports execution on all clients or server only.

	Parameter(s):
	0: ARRAY - parameters for the function (shouldn't be local to sender).
	1: STRING - the name of the function to be executed (should exists on the target).
	2: NUMBER - equipment level id, describing how heavily is the unit equipped.
	   > 0       - execute on this machine
	   > 1       - execute on server
	   > 2       - execute on this machine and broadcast to others
	   
	3: BOOL	- determines whether the function should be called for JIP players (TODO).
	4: BOOL	- determines whether the function is spawned or called.

	Returns:
	-

	Example:
	[[player, "Crew"], "switchMove", 2, false, true] call AME_Core_fnc_execRemoteFnc;
*/

_params = _this select 0;
_function =	call compile (_this select 1);
_mode = _this select 2;
_isPersistent =	_this select 3;
_isCall = _this select 4;

AME_Core_remoteFnc = _this;

//diag_log format ["REMOTE: %1", _this];

switch (_mode) do {
    case 0: {
        if (_isCall) then {
            _params call _function;
        } else {
            _params spawn _function;
        };
    };
    case 1: {
        if (isServer) then {
            AME_Core_remoteFnc set [2, 0];
            AME_Core_remoteFnc call AME_Core_fnc_execRemoteFnc;
        } else {
            publicVariableServer "AME_Core_remoteFnc";
        };
    };
    case 2: {
        AME_Core_remoteFnc set [2, 0];
        AME_Core_remoteFnc call AME_Core_fnc_execRemoteFnc;
        
        publicVariable "AME_Core_remoteFnc";
    };
};