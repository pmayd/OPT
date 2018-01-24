/*
Diese Datei enthält alle Flaggenpositionen aufgeteilt in NATO und CSAT.
Jede Flagge besitzt Koordinaten (x,y) sowie die owner Seite, die im Besitz der Flagge ist.
Demnach muss nach jeder Schlacht nur der owner angepasst werden.
west -> Angriffsziel für CSAT
east -> Angriffsziel für NATO
*/
#include "script_component.hpp"

GVARMAIN(nato_flags_pos) = [
//	   [13424, 2792, west], // Kamyshovo - Skalisty Dorf
//	   [12390, 3303, west], // Kamyshovo - Insel (muss gebaut werden!)
//	   [12049, 3554, west], // Kamyshovo - Zentrum
	   
//	   [11242, 4281, west], // Staroye - Rog-Burg
//	   [10126, 5491, west], // Staroye - Zentrum
//	   [8376, 5962, west], // Staroye - Ruinenstadt Kumyrna
	   
//	   [8442, 6682, west], // Guglovo - Zentrum
//	   [7778, 6888, west], // Guglovo - Farm
//	   [7080, 7708, west], // Guglovo - Novi Sobor
	   
//	   [6242, 7748, west], // Stary Sobor - Farm
//	   [5971, 7884, west], // Stary Sobor - Zentrum
//	   [5342, 8626, west], // Stary Sobor - Kabanino
	   
//	   [2718, 10032, west], // Lopatino - Zentrum
//	   [2880, 9746, west], // Lopatino - Farm	   
//	   [2305, 10894, west], // Lopatino - Militär (muss gebaut werden!)

//	   [3794, 8908, west], // Vybor - Zentrum
//	   [4159, 8947, west], // Vybor - Fabrik
	   [4361, 8174, west] // Vybor - Militär (muss gebaut werden!)
	   
//	   [6540, 5603, west], // Vyshnoye - Zub
//	   [6539, 6097, west], // Vyshnoye - Zentrum
//	   [7533, 5120, west], // Vyshnoye - Mogilevka
	   
//	   [9142, 3857, west], // Pusta - Zentrum   
//	   [10422, 2586, west], // Pusta - Kraftwerk
//	   [10481, 2265, west], // Vyshnoye - Elektro-Zentrum
	   
//	   [10088, 1912, west], // Elektrozavodsk - Industrie
//	   [8687, 2428, west], // Elektrozavodsk - Vorort
//	   [8073, 3350, west], // Elektrozavodsk - Prigorodky

//	   [6492, 4660, west], // Pulkovo - Militär (muss gebaut werden!)
//	   [5859, 4857, west], // Pulkovo - Nadezhdino
//	   [4940, 5604, west], // Pulkovo - Zentrum
	   
//	   [4766, 6807, west], // Rogovo - Zentrum
//	   [4495, 6477, west], // Rogovo - Pogorevka
//	   [3126, 7954, west], // Rogovo - Pustoshka
	   
//	   [3699, 5986, west], // Pass Sosnovy - Green Mountain
//	   [3005, 6734, west], // Pass Sosnovy - Farm
//	   [2004, 7337, west], // Pass Sosnovy - Myshkino
	   
//	   [2779, 5258, west], // Zelenogorsk - Zentrum
//	   [4389, 4618, west], // Zelenogorsk - Kozlovka
//	   [3389, 4934, west], // Zelenogorsk - Drozhino
	   
//	   [6928, 2471, west], // Chernogorsk - Zentrum
//	   [6281, 3779, west], // Chernogorsk - Farm
//	   [5836, 3977, west] // Chernogorsk - Vorort
    ];

GVARMAIN(csat_flags_pos) = [
//      [12781, 9635, east], // Berezino - Sägewerk (muss gebaut werden!)
//	   [12399, 9523, east], // Berezino - Vorort
//	   [12105, 9729, east], // Berezino - Militär (muss gebaut werden!)
	   
//	   [10269, 12019, east], // Black Mountain - Burg (muss gebaut werden!)
//	   [10220, 11781, east], // Black Mountain - Ruine (muss gebaut werden!)
//	   [10749, 10784, east], // Black Mountain - Tanke (muss gebaut werden!)

//       [12933, 8121, east], // Nizhnoye - Farm
//	   [12297, 8497, east], // Nizhnoye - Vorort
//	   [11938, 8869, east], // Nizhnoye - Müllhalde
	   
//	   [10224, 9846, east], // Dubrovka - Vorort
//	   [9882, 10326, east], // Dubrovka - Militär (muss gebaut werden!)
//	   [10544, 9726, east], // Dubrovka - Zentrum
	   
//	   [8779, 11617, east], // Gvozdno - Farm
//	   [8557, 11927, east], // Gvozdno - Zentrum
//	   [9160, 11015, east], // Gvozdno - Vorort

//	   [13372, 6237, east], // Solnichniy - Zentrum
//	   [12945, 6276, east], // Solnichniy - Zementwerk
//	   [12182, 6283, east], // Solnichniy - Vorort
	   
//	   [10652, 8051, east], // Polana - Zentrum
//	   [11452, 7448, east], // Polana - Fabrik
//	   [12123, 7260, east], // Polana - Vorort
 
//	   [9444, 8800, east], 	// Gorka - Zentrum
//	   [9785, 8725, east], 	// Gorka - Farm
//	   [8567, 9700, east], 	// Gorka - Militär (muss gebaut werden!)
	   
//	   [7785, 10352, east], // Devils Castle - Ausgrabungsstelle (muss gebaut werden!)
//	   [7227, 11018, east], // Devils Castle - Militär (muss gebaut werden!)
//	   [6894, 11443, east], // Devils Castle - Burg
	   
//	   [12849, 4436, east], // Tulga - Zentrum
//	   [12178, 5044, east], // Tulga - Holzfäller-Lager
//	   [11267, 5457, east], // Tulga - Vorort
	   
//	   [11192, 6572, east], // Shakovka - Vorort
//	   [9577, 6571, east], // Shakovka - Zentrum
//	   [9023, 7828, east], // Shakovka - Militär (muss gebaut werden!)
	   	   
	   [7205, 9059, east] // Grishino - Farm (muss gebaut werden!)
//	   [5945, 10347, east], // Grishino - Zentrum
//	   [5437, 11088, east], // Grishino - Militär (muss gebaut werden!)
	   
//	   [4975, 12512, east], // Petrovka - Zentrum
//	   [4004, 11659, east], // Petrovka - Militär (muss gebaut werden!)
//	   [1903, 12442, east], // Petrovka - Sägewerk (muss gebaut werden!)
	   
//	   [4614, 9658, east], // Flughafen - Stützpunkt
//	   [4731, 10335, east], // Flughafen - Tower
//	   [4195, 10953, east] // Flughafen - Militär  (muss gebaut werden!)
    ];


// erzeuge für alle oben gelisteten Positionen einen Flaggenmast mit korrekter Flagge
{
    _x params ["_x", "_y", "_owner"];

    // Objekt erzeugen
    private _flag = createVehicle ["FlagPole_F", [_x, _y],  [], 0, "CAN_COLLIDE"];
    _flag setFlagTexture "\A3\Data_F\Flags\Flag_NATO_CO.paa";

    // notwendige Variablen fuer OPT
    _flag setVariable ["owner", _owner, true];        
    _flag setVariable ["opt_flag", true, true];
} forEach GVARMAIN(nato_flags_pos);

{
    _x params ["_x", "_y", "_owner"];
    
    // Objekt erzeugen
    private _flag = createVehicle ["FlagPole_F", [_x, _y],  [], 0, "CAN_COLLIDE"];
    _flag setFlagTexture "\A3\Data_F\Flags\Flag_CSAT_CO.paa";

    // notwendige Variablen fuer OPT
    _flag setVariable ["owner", _owner, true];
    _flag setVariable ["opt_flag", true, true];
} forEach GVARMAIN(csat_flags_pos);

