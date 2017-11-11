waitUntil {time > 0};
execVM "addons\attach_exp\EtV.sqf";
waitUntil {!isNil "EtVInitialized"};
[player] spawn EtV_Actions;