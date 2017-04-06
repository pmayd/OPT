//	fn_iconText

private ["_n","_v","_y","_vt","_t","_vn"];
_v = _this select 0;
_vt = _v getVariable ["vt",""];

if (_vt == "") then {
	_vt = getText (configFile >> "CfgVehicles" >> typeOf _v >> "displayName");
	_v setVariable ["vt",_vt];
};
_vn = name (crew _v select 0);
if (((_v distance player) < 3500) || {(serverCommandAvailable "#kick")}) then {
	_t = format ["%1 [%2]",_vn,_vt];
} else {
	_t = format ["%1",_vn];
};

if (_v isKindOf "LandVehicle" || _v isKindOf "Air" || _v isKindOf "Ship") then {
	_n = 0;
	_n = ((count crew _v) - 1);

	if (_n > 0) then {
		if (!isNull driver _v) then {
			_t = format ["%1 [%2] +%3",_vn,_vt,_n];
		} else {
			_t = format ["[%1] %2 +%3",_vt,_vn,_n];
		};
	} else {
		if (!isNull driver _v) then {
			_t = format ["%1 [%2]",_vn,_vt];
		} else {
			_t = format ["[%1] %2",_vt,_vn];
		};
	};
	if (!isPlayer _v) then {
		_au = ["OPT_B_UGV_01_F","OPT_O_UGV_01_F","OPT_B_UGV_01_rcws_F","OPT_O_UGV_01_rcws_F","OPT_B_UAV_02_F","OPT_O_UAV_02_F","OPT_B_UAV_01_F","OPT_O_UAV_01_F","I_UAV_01_F","B_UAV_01_F","O_UAV_01_F","I_UAV_02_F","O_UAV_02_F","I_UAV_02_CAS_F","O_UAV_02_CAS_F","B_UAV_02_F","B_UAV_02_CAS_F","O_UAV_01_F","O_UGV_01_F","O_UGV_01_rcws_F","I_UGV_01_F","B_UGV_01_F","I_UGV_01_rcws_F","B_UGV_01_rcws_F","B_GMG_01_A_F","B_HMG_01_A_F","O_GMG_01_A_F","O_HMG_01_A_F","I_GMG_01_A_F","I_HMG_01_A_F"];
		_iau = ({typeOf _v == _x} count _au) > 0;
		if (_iau) exitWith {
			if (isUavConnected _v) then {	
				_y = (UAVControl _v) select 0;	
				_t = format ["%1 [%2]",name _y,_vt]; _t;
			} else {
				_t = format ["[AI] [%1]",_vt]; _t;
			};
		};
	};
};

_t