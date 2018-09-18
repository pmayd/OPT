#include "script_component.hpp"

private _unit = _this select 0;
private _Betrag = _this select 1;
private _txtcl = _this select 2;

if (side player == west) then 
    {

    {
    if (player iskindof _x) then 
        {
        private _txt = format["%1:%2", _unit, _txtcl];
        ["Ausrüsten", _txt, "green"] call EFUNC(gui,message);    
        };        
    } forEach GVAR(textslotwest);    
    };
    
if (side player == east) then 
    {

    {
    if (player iskindof _x) then 
        {
        private _txt = format["%1:%2", _unit, _txtcl];
        ["Ausrüsten", _txt, "green"] call EFUNC(gui,message);    
        };        
    } forEach GVAR(textsloteast);    
    };    