private ["_timesleep","_pitch"];

private _unit = _this;
private _run = _unit getVariable ['OPT_Detector_in_use', false];

if (!alive _unit || {!_run} || {_unit getVariable ["OPT_isUnconscious",false]} || {!('MineDetector' in (items _unit))}) exitWith {
	if (_run) then {
		{
			if ((typeOf _x) isEqualTo "Item_MineDetector") then {
				_x setVariable ["OPT_needed_item", false, true];
				deleteVehicle _x;
				_unit setVariable ["OPT_Detector_in_use", false];
			};
			true
		} count (attachedObjects _unit);
		_unit forceWalk false;
		hintSilent "";
	};
};

_timesleep = 3;

private _mines = [];
_mines = [nearestObject [_unit, "MineBase"], nearestObject [_unit, "TimeBombCore"]];
private _explosive = ([_mines, [], {_x distance _unit} ,"ASCEND" ,{!isNull _x}] call BIS_fnc_sortBy) select 0;

if (!isNil "_explosive") then {
	private _distance = _explosive distance _unit;
	
	if (_distance < 18) then {
		_inSector = [getPosATL _unit, getDir _unit, 60, getPosATL _explosive] call BIS_fnc_inAngleSector;	// within a angle of 60 degrees?

		if (_inSector) then {
			_pitch = 18 - _distance;
			_timesleep = _distance / 6;
			_dirTo = _unit getRelDir _explosive;
			if (_dirTo > 180) then {_dirTo = (360 - _dirTo)};

			_pic = "<img size='3.0' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa' align='center'/><br/><br/>";
			_line1 = format ["<t color='#f0bfbfbf' size='1.1' font='EtelkaMonospaceProBold' shadow='1' shadowColor='#000000' align='left'>Distanz: %1m</t><br/>", round _distance];
			_line2 = format ["<t color='#f0bfbfbf' size='1.1' font='EtelkaMonospaceProBold' shadow='1' shadowColor='#000000' align='left'>Abweichung: %1°</t>", round _dirTo];
			hintSilent parseText (_pic + _line1 + _line2);

			playSound3D [
				"A3\UI_F\data\sound\CfgNotifications\addItemOk.wss",
				_unit,
				false,
				getPosASL _unit,
				80,
				_pitch,
				10
			];
		};
	};
};

sleep _timesleep;
_unit spawn OPT_Detector_fnc_detect;