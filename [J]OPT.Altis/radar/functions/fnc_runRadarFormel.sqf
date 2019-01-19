/**
* Description:
* Formel Höhenerfassung und Auswertung für Anzeige
*
* Author:
* [GNC]Lord-MDB
*
* Arguments:
* 0: <ARRAY>    _units
* 1: <NUMBER>   _signalLoss
*
* Return Value:
* _Radaranzeige
*
* Server only:
* no
*
* Public:
* no
*
* Global:
* no
*
* Sideeffects:
* yes - zusammenstellung für Radaranzeige
*
* Example:
* [] call EFUNC(radar,runRadarFormel);
*/
#include "script_component.hpp"


/* PARAMS */
params 
[
    "_units",
    "_signalLoss"
];

/* VALIDATION */

/* CODE BODY */

private _m = GVAR(radarFormelm);
private _b = GVAR(radarFormelb);
private _df = GVAR(radarFormeldf);

//systemChat format ["U:%1 M:%2 B:%3 d:%4",_units,_m,_b,_df]; 

//Formel für Höhenberechnung
//f(x)=-mx+b
//D=d*df
//F(x)+[D*F(x)]
              
_units apply 
{

if ((_x iskindof "AIR") and ((getPos _x select 2) > ((-_m*(speed _x)+_b)+((-_m*(speed _x)+_b)*(_signalLoss/100*_df))))) then
    {
	//systemChat format ["B:%1 hm:%2 hf:%3",((getPos _x select 2) > ((-_m*(speed _x)+_b)+((-_m*(speed _x)+_b)*(_signalLoss/100*_df)))),(getPos _x select 2),((-_m*(speed _x)+_b)+((-_m*(speed _x)+_b)*(_signalLoss/100*_df)))];
    _Radaranzeige pushBack _x;
    };

};

//systemChat format ["R:%1",_Radaranzeige];   
_Radaranzeige