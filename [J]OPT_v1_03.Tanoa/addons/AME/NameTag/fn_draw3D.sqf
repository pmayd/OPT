if (!isNull (findDisplay 49)) exitWith {};

private _targets = [];
private _targets = player nearEntities ["CAManBase", 12];
if (count _targets < 1) exitWith {};

private _playerPos = positionCameraToWorld [0, 0, 0];


/*	--> Freund/Feinderkennung sonst zu einfach
_cursorTarget = cursorTarget;
if (_cursorTarget isKindOf "CAManBase") then {
	if (!(_cursorTarget in _targets)) then {
		_targets pushBack _cursorTarget;
	};
};
*/

if (!surfaceIsWater _playerPos) then {
    _playerPos = ATLtoASL _playerPos;
};

#define TEXTURES_RANKS [ \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\captain_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\major_gs.paa", \
    "\A3\Ui_f\data\GUI\Cfg\Ranks\colonel_gs.paa" \
]

{
    private _target = effectiveCommander _x;

	if (
		_target != player &&
		//{isPlayer _target} &&
		{!(_x in allUnitsUAV)} &&
		{alive player} &&
		{(side _target) getFriend playerSide >= 0.6}
	) then {
        _targetPos = getPosASLVisual _target;
        _distance = _targetPos distance2D _playerPos;
		_headPosition = _target modelToWorldVisual (_target selectionPosition "pilot");
		_unconcious = _target getVariable ["OPT_isUnconscious",false];
        _alpha = ((1 - 0.2 * (_distance - 7)) min 1) * 0.8;
    
        if (_alpha > 0 && !(_unconcious)) then {
            if (lineIntersects [_playerPos, _targetPos vectorAdd [0,0,1], vehicle player, _target]) then {
                _alpha = 0;
            };
        } else {
			_alpha = 0.8;
		};
		
		_color = if (group _target == group player) then {
			_tempColor = [
				[1,1,1,_alpha],//Main
				[1,0,0.1,_alpha],//Red
				[0.1,1,0,_alpha],//Green
				[0.1,0,1,_alpha],//Blue
				[1,1,0.1,_alpha]//Yellow
			] select (["MAIN","RED","GREEN","BLUE","YELLOW"] find assignedTeam _target);
			_tempColor
		} else {
			[0.77, 0.51, 0.08, _alpha]// orange
		};
		if (_unconcious) then {
			_color = [0.65,0.15,0,_alpha];//Dark Red
		};
		
        _targetPos set [2, ((_target modelToWorld [0,0,0]) select 2) + _height + _distance * 0.026];
		
        _text = "";
        {
            _text = _text + " " + _x;
			true
        } count (_target getVariable ["AME_Core_displayText", []]);
		
		_icon = if (_unconcious) then {
			if (_target getVariable ["OPT_isStabilized",false]) then {
				"\a3\ui_f\data\IGUI\Cfg\Revive\overlayIcons\u100_ca.paa"
			} else {
				"\a3\ui_f\data\IGUI\Cfg\Cursors\unitBleeding_ca.paa"
			};
		} else {
			TEXTURES_RANKS select ((["PRIVATE", "CORPORAL", "SERGEANT", "LIEUTENANT", "CAPTAIN", "MAJOR", "COLONEL"] find (rank _x)) + 0);
		};
		
		drawIcon3D [_icon, _color, _headPosition vectorAdd [0, 0, 0.4], 0.8, 0.8, 0, _text, 2, 0.033, "PuristaMedium"];
    };
	true
} count _targets;