// to make sure a target will blow up with a satchel

private "_tower";
_tower = _this select 0;
if ((getText(configFile >> "CfgAmmo" >> (_this select 4) >> "simulation") in ["shotPipeBomb", "shotTimeBomb"]) || ((_this select 4) == "ACE_PipebombExplosion")) then {
	_radio setdamage 1;
};