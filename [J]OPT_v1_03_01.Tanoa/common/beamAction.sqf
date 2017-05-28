// by psycho
params ["_target","_caller","_ID"];

global_target = _target;
global_id = _id;

openMap [true, true];
mapAnimAdd [0.5, 0.2, getPosATL player];
mapAnimCommit;
onMapSingleClick "[_pos,global_target,global_id] call opt_fnc_vehicleBeam; onMapSingleClick ''; openMap [true, false]; openMap [false, false]; true;";