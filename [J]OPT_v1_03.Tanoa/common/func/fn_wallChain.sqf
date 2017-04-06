/*    File: fn_createWallCircle.sqf
    Author: Sa-Matra
    Original version:     fn_createWallChain.sqf
                        http://forums.bistudio.com/showthread.php?143989-RELEASE-fn_createWallChain-sqf-Easy-way-to-create-chain-of-walls
    Adapted by: Ceh
    
    Description:
    Function places objects centered around a specific position.
    
    Example:
    _walls = ["Land_fort_bagfence_long", getPos player, 6, 8] execVM "fn_createWallRing.sqf";


    Parameter(s):
    _this select 0: string, Wall class name
    _this select 1: array, PositionATL of first object
    _this select 2: float, Radius of the circle
    _this select 3: int, Number of objects
    _this select 4: boolean, flip walls
    _this select 5: int, max angle of variation on each object placement angle (useful if you don't want the circle to look too tidy)


    Returns:
    Array of created objects
*/


// changed by psycho


private ["_new_pos", "_angle", "_obj", "_objs", "_i", "_xpos", "_ypos"];

params ["_class","_center","_radius","_count","_flip_walls","_noise"];

_objs = [];
_new_pos = [];
_center set [2, 0];
_flip_walls	= false;
_noise = 0;



for "_i" from 1 to _count do {
    _xpos = (_center select 0) + (_radius * cos(360 * _i / _count));
    _ypos = (_center select 1) + (_radius * sin(360 * _i / _count));
    _angle = 90 - ((360/_count) * _i);
    _new_pos set [0, _xpos];
    _new_pos set [1, _ypos];
    _new_pos set [2, 0];    
    
    
    if(_flip_walls) then { _angle = 180 + _angle; };
    if(_noise != 0) then { _angle = _angle + (random _noise) - (_noise/2); };


    _obj = createVehicle [_class, _new_pos, [], 0, "CAN_COLLIDE"];
	//_obj = _class createVehicleLocal _new_pos;
	//_obj setObjectTexture [0,"#(argb,8,8,3)color(1,0,0,0.3,ca)"];
    _obj setPosATL [_new_pos select 0, _new_pos select 1, 18];
    _obj setVectorUp [0,0,1];
    _objs = _objs + [_obj];
	_obj = createVehicle [_class, _new_pos, [], 0, "CAN_COLLIDE"];
	//_obj = _class createVehicleLocal _new_pos;
	//_obj setObjectTexture [0,"#(argb,8,8,3)color(1,0,0,0.3,ca)"];
    _obj setPosATL [_new_pos select 0, _new_pos select 1, 66];
	_obj setVectorUp [0,0,1];
	_objs = _objs + [_obj];
	_obj = createVehicle [_class, _new_pos, [], 0, "CAN_COLLIDE"];
	//_obj = _class createVehicleLocal _new_pos;
	//_obj setObjectTexture [0,"#(argb,8,8,3)color(1,0,0,0.3,ca)"];
    _obj setPosATL [_new_pos select 0, _new_pos select 1, 114];
	_obj setVectorUp [0,0,1];
	_objs = _objs + [_obj];
};

{_x enableSimulation false} forEach _objs;

_objs