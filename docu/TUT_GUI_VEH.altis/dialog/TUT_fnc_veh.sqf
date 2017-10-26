
TUT_fnc_OpenVehUI = 
{	
	private ["_flag"];
	disableSerialization;
	player action ["WeaponOnBack", player];
	createDialog "RscTUTVehDialog";
	["Car"] call TUT_gui_LoadVeh;
	_serverTitleCbo = ((findDisplay 1601) displayCtrl (10));
	_plr = profileName;
	_title = "VEHICLE SELECTOR TITLE";
	_serverTitleCbo ctrlSetStructuredText parseText format ["<t align='left'>%1</t><t align='right'>%2</t>",_plr,_title];
	_plrClass = typeOf player;
	_side = getNumber(configFile >> "cfgVehicles" >> _plrClass>> "side");
	_flagCbo = ((findDisplay 1601) displayCtrl (11));
	switch (_side) do
	{				
		case 0: {_flag = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";}; 
		case 1: {_flag = "\A3\Data_F\Flags\Flag_nato_CO.paa";}; 
		case 2: {_flag = "\A3\Data_F\Flags\Flag_AAF_CO.paa";}; 	
	};
	_flagCbo ctrlSetText _flag;
};
TUT_gui_LoadVeh = 
{
	_kind = _this select 0;
	_cbo = ((findDisplay 1601) displayCtrl (7));
	lbCLear _cbo;
	_count =  count (configFile >> "cfgVehicles");
	for "_x" from 0 to (_count-1) do
	{
		_veh = ((configFile >> "cfgVehicles") select _x);
		if (isClass _veh) then
		{	
			if (getnumber (_veh >> "scope") == 2) then
			{	
			_class = configName _veh;
			if (_class isKindOf _kind) then
			{
				_index = _cbo lbAdd(getText(configFile >> "cfgVehicles" >> _class>> "displayName"));
				_cbo lbSetData[(lbSize _cbo)-1,  _class];
				_picture = (getText(configFile >> "cfgVehicles" >> _class >> "picture"));
				_cbo lbSetPicture[(lbSize _cbo)-1,_picture];
			};
			};
		};
	};
};
TUT_gui_VehInfo = 
{
	private ["_weapArray","_class","_crewCount","_model","_maxSpeed","_invSpace","_armor"];
	disableSerialization;
	_id =  lbCurSel 7;
	_class = lbData [7, _id];
	_weapons = [];
	_weaponsClass = getArray(configFile >> "cfgVehicles" >> _class >> "weapons");
	{
	_name = getText (configFile >> "cfgWeapons" >> _x >> "displayName");
	_weapons = _weapons + [ _name];
	}forEach _weaponsClass; 
	if (isClass (configFile >> "cfgVehicles" >> _class >> "Turrets" >> "M2_Turret")) then 
		{
			_weapArray = getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "M2_Turret" >> "weapons");
			
		} else
		{
			_weapArray = getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "MainTurret" >> "weapons");
			_weapArray = _weapArray + (getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "FrontTurret" >> "weapons"));
			_weapArray = _weapArray + (getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "RearTurret" >> "weapons"));
			
		};
		{
			_name = getText (configFile >> "cfgWeapons" >> _x >> "displayName");
			_weapons = _weapons + [ _name];
		}forEach _weapArray;
	_crewCount = [_class,true] call BIS_fnc_crewCount;
	_model = getText(configFile >> "cfgVehicles" >> _class >> "model");
	_maxSpeed = getNumber(configFile >> "cfgVehicles" >> _class >> "maxSpeed");
	_invSpace = getNumber(configFile >> "cfgVehicles" >> _class >> "maximumLoad");
	_armor = getNumber(configFile >> "cfgVehicles" >> _class >> "armor");
	_textCbo = ((findDisplay 1601) displayCtrl (8));
	_separator = parseText "-------------------------------------------------------------------------------------";
	_textCbo ctrlSetStructuredText parseText format 
	["<t align='left'>Weapons:</t><br/>
	<t align='left'>%1</t>
	<t align='left'>%6</t><br/>
	<t align='left'>Passengers:</t> <t align='right'>%2</t>
	<t align='left'>%6</t><br/>
	<t align='left'>Max Speed:</t> <t align='right'>%3</t>
	<t align='left'>%6</t><br/>
	<t align='left'>Inventory:</t> <t align='right'>%4</t>
	<t align='left'>%6</t><br/>
	<t align='left'>Armor:</t> <t align='right'>%5</t>
	<t align='left'>%6</t><br/>",_weapons,_crewCount,_maxSpeed,_invSpace,_armor, _separator];	
};
TUT_gui_VehCreate = 
{

	_idVeh =  lbCurSel 7;
	_classVeh = lbData [7, _idVeh];
	_emptyPos = position player findEmptyPosition [5,50,_classVeh];
	if (count _emptyPos == 0) then { hint "Vehicle cannot be spawned here"; }
	else
	{	
		_veh = createVehicle [_classVeh, _emptyPos, [], 0,""];
	};
			closeDialog 1601;

};

