playSound "IncomingChallenge";
[_this, "CREATED", true] call BIS_fnc_taskSetState;
player setCurrentTask _this;