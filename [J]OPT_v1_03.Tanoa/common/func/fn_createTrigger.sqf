//example: 	[_pos, [0, 0, 0, false],["NONE", "PRESENT", true], ["", "", ""]] call tcb_fnc_CreateTrigger;
private ["_pos", "_trigarea", "_trigact", "_trigstatem", "_trigger"];

_pos = _this select 0;
_trigarea = _this select 1;
_trigact = _this select 2;
_trigstatem = _this select 3;
_trigger = createTrigger ["EmptyDetector" ,_pos, true];
_trigger setTriggerArea _trigarea;
_trigger setTriggerActivation _trigact;
_trigger setTriggerStatements _trigstatem;

_trigger