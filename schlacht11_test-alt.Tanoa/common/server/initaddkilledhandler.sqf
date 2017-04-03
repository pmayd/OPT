#include "..\..\setup\setup.sqf"
private ["_gr", "_vec"];
if (!isServer) exitWith {};

waitUntil {time > 30};

//while {true} do {		remove the loop - no longer needed since the new ai handling system. Run the code one time to add vehicles that wasnt crwate by the ai handling system self.
	{
		if ((side (group _x)) in tcb_addkilledhandler) then {
			if (_x isKindOf "CAManBase") then { // not needed, I guess ;)
				if (!isPlayer _x) then {
					if (vehicle _x != _x) then {
						_vec = vehicle _x;
						if (isNil {_vec getVariable "x_ke"}) then {
							_vec setVariable ["x_ke", 1];
							__addDead(_vec);
							_vec addMPEventHandler ["MPKilled", {if (isServer) then {_this call tcb_fnc_handleDeadVehicle}}];
						};
					};
				};
			};
		};
		sleep 0.423;
	} forEach allUnits;
	//sleep 180;
//};