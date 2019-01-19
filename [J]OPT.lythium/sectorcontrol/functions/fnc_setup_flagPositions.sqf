/*
Diese Datei enthält alle Flaggenpositionen aufgeteilt in NATO und CSAT.
Jede Flagge besitzt Koordinaten (x,y) sowie die owner Seite, die im Besitz der Flagge ist.
Demnach muss nach jeder Schlacht nur der owner angepasst werden.
west -> Angriffsziel für CSAT
east -> Angriffsziel für NATO
*/
#include "script_component.hpp"

GVARMAIN(nato_flags_pos) = [

// Basis Nordost - 7
//	   [17917, 17885, west], // TWOVILLAGES - Kamir - twovillages-kamir
//	   [19523, 18697, west], // TWOVILLAGES - Farm - twovillages-farm
//	   [19852, 19876, west], // TWOVILLAGES - Morar - twovillages-morar

//	   [17412, 14800, west], // ZARATH - Zentrum - zarath-zentrum
//	   [17621, 17401, west], // ZARATH - Farm - zarath-farm
//	   [16457, 15164, west], // ZARATH - Vorort - zarath-vorort
	   
//	   [16457, 15164, west], // ANYAKAR - Zentrum - anyakar-zentrum - markstände no damage?!
//	   [17673, 9282, west], // ANYAKAR - Razbula - anyakar-razbula
//	   [16095, 10300, west], // ANYAKAR - Farm - anyakar-farm
	   
//	   [16047, 19996, west], // AFARAT - Zentrum - afarat-zentrum
//	   [16274, 19531, west], // AFARAT - Bergdorf - afarat-bergdorf
//	   [15067, 19151, west], // AFARAT - Farm - afarat-farm	 

//	   [14291, 16015, west], // ZENTRALMASSIV - Getreidefarm - zentral-getreide	
//	   [15139, 14937, west], // ZENTRALMASSIV - ziegenfarm - zentral-ziegenfarm	   
//	   [14815, 14739, west], // ZENTRALMASSIV - gutshof - zentral-gut
	   
//	   [15657, 7367, west], // PUESTO CROW - Farm - puesto-farm 	   
//	   [13755, 9326, west], // PUESTO CROW - Militärstützpunkt - puesto-militär
//	   [15249, 9919, west], // PUESTO CROW - Altes Bergdorf - puesto-dorf

	   [19683, 7062, west], // AFSHER - Vorort - afsher-vorort
	   [17152, 7101, west], // AFSHER - Müllhalde - afsher-müll
	   [16291, 6548, west] // AFSHER - Baustelle - afsher-bau  
	   
// Basis Südwest - 9
	   
//	   [3990, 12566, west], // KARIFT - Kloster - karift-kloster
//	   [4121, 12036, west], // KARIFT - Marktplatz - karift-markt
//	   [4973, 11829, west], // KARIFT - Zhapirs Orangenplantage - karift-zhapir	   

//	   [6766, 9836, west], // MAFARAZ - Fabrikruine - mafaraz-fabrik
//	   [5197, 10342, west], // MAFARAZ - Zentrum - mafaraz-zentrum
//	   [5239, 10770, west], // MAFARAZ - Militärcamp - mafaraz-militär

//	   [7092, 4416, west], // AMIR - Zentrum - amir-zentrum   
//	   [8425, 4832, west], // AMIR - Roggenfarm - amir-roggen
//	   [7487, 4242, west], // AMIR - Benamair - amir-ben
	   
//	   [5107, 3449, west], // MOZARAT - Pferdezucht - mozarat-pferd
//	   [5442, 3229, west], // MOZARAT - Maisplantage - mozarat-mais	 
//	   [4129, 841, west], // MOZARAT - Militär - mozarat-militär - muss oppa ran! oder bergbau?!
	   
//	   [5883, 12473, west], // BERG 447 - Gutshof - 447-gut
//	   [8834, 10928, west], // BERG 447 - Dorf am Fluss - 447-dorf
//	   [8327, 10219, west], // BERG 447 - Farm - 447-farm

//	   [9408, 8075, west], // MORUT - Kloster - morut-kloster
//	   [9456, 7279, west], // MORUT - Gutshof - morut-gut
// 	   [9876, 6830, west], // MORUT - Plantage - morut-plantage	 

//	   [10816, 5364, west], // LOBORIBER - Brückenzollstation - lobo-zoll
//	   [9906, 5887, west], // LOBORIBER - Dorf - lobo-dorf	   
//	   [9915, 4163, west], // LOBORIBER - Gutshof - lobo-gut

//	   [13064, 17284, east], // KALAE NOOWI - Alter Markt - kalae noowi-alter markt
//	   [13220, 17668, east], // KALAE NOOWI - Rathaus - kalae noowi-rathaus
//	   [13864, 17900, east], // KALAE NOOWI - Krankenhaus - kalae noowi-krankenhaus

//	   [10393, 3529, west], // KINDUF-VORORT - Fabrik - kinduf-v-fabrik
//	   [9296, 2786, west], // KINDUF-VORORT - Bergdorf - kinduf-v-dorf	
//	   [9509, 2052, west], // KINDUF-VORORT - Plantage - kinduf-v-plantage

//	   [10329, 10837, east], // MIKIS - Fabrik - mikis-fabrik
//	   [9673, 11322, east], // MIKIS - FOB - mikis-fob    - nur 1 eingang
//	   [8921, 12697, east] // MIKIS - Vorort - mikis-vorort	   
];

GVARMAIN(csat_flags_pos) = [

//Basis NORD - 7
//	   [3835, 17824, east], // NEFER - Martin FOB - nefer-martin
//	   [4891, 17004, east], // NEFER - Stadt Süd - nefer-stadt
//	   [5678, 17464, east], // NEFER - Stadt Nord, Sanatorium - nefer-stadt

//	   [8042, 16429, east], // KANDAR - Vorort east - kandar-stadt 
//	   [8353, 16704, east], // KANDAR - Zentrum Nord - kandar-stadt
//	   [9034, 16169, east], // KANDAR - Agrarstützpunkt - kandar-agrar

//	   [11623, 18650, east], // VORORT KALAE NOOWI - Radarturm east - kalae noowi-radar
//	   [11547, 17735, east], // VORORT KALAE NOOWI - Militär - kalae noowi-Reg44
//	   [12584, 19046, east], // VORORT KALAE NOOWI - Alte Zollstation - kalae noowi-grenzposten

//	   [2718, 16189, east], // LIMAR - Stadt - limar-stadt
//	   [2573, 15912, east], // LIMAR - Militär - limar-stadt - 3 eingänge
//	   [5367, 14380, east], // LIMAR - Shoran - limar-shoran
	   
//	   [3794, 8908, east], // KUNARA - Farm - kunara-farm
//	   [8064, 12817, east], // KUNARA - Zentrum - kunara-farm
//	   [9611, 14150, east], // KUNARA - Tunkuf -  kunara-tunkuf
	   
//	   [11859, 15510, east], // RAMIR - Vorort - ramir-vorort
//	   [12428, 15473, east], // RAMIR - Farm - ramir-farm
//	   [12994, 15276, east], // RAMIR - Zentrum - ramir-zentrum

//		[1187, 14232, west], // MAYANKEL - Zentrum - mayankel-zentrum  - markstände no damage?!
//	   [1751, 13859, west], // MAYANKEL - Vorort - mayankel-vorort  - markstände no damage?!
//	   [3290, 13192, west], // MAYANKEL - Wochenmarkt - mayankel-markt - markstände no damage?!
	   
// Basis SÜD - 5  
//	   [13244, 807, east], // BAGDIR - Zentrum - bagdir-zentrum
//	   [13386, 1436, east], // BAGDIR - Farm - bagdir-farm
//	   [15965, 3096, east], // BAGDIR - Orfar - bagdir-orfar

//	   [19207, 3243, east], // TERUK - Zentrum - teruk-zentrum
//	   [20028, 3488, east], // TERUK - Markt - teruk-markt - zeltdächer auf damage false!
//	   [17495, 2856, east], // TERUK - Fabrik Offar - teruk-fabrik
	   
//	   [10668, 1283, east], // KINDUF - Vorort - kinduf-vorort
//	   [11417, 2824, east], // KINDUF - Zentrum - kinduf-zentrum
//	   [12123, 2744, east], // KINDUF - Altstadt - kinduf-altstadt
	   
//	   [13101, 3526, east], // TWOCAMPS - Hanfplantage - twocamps-hanf
//	   [13966, 3414, east], // TWOCAMPS - Iban Camp - twocamps-iban - nur 1 eingang!
//	   [15108, 4326, east], // TWOCAMPS - Peloton Camp - twocamps-peloton - nur 1 eingang!

//	   [16492, 5374, east], // AROBSTER - Vorort - arobster-vorort
//	   [17383, 5803, east], // AROBSTER - Funkstation - arobster-funk - 3 eingänge
//	   [18058, 6018, east], // AROBSTER - Farm - arobster-farm
	   
// Mittelbereich - 4
	   [11397, 3913, east], // SHEGARA - Farm - shegara-farm
	   [11525, 5020, east], // SHEGARA - Klärwerk - shegara-klärwerk
	   [13359, 4859, east] // SHEGARA - Kloster - shegara-kloster

//	   [11948, 6141, east], // ORCARIF - Fabrik - orcarif-fabrik
//	   [11400, 6698, east], // ORCARIF - Stadt - orcarif-stadt	  
//	   [12243, 7098, east], // ORCARIF - Gutshaus - orcarif-gutshaus
	   
//	   [10474, 9259, east], // LIMARI - Markt - limari-markt - markstände no damage?!
//	   [10703, 10108, east], // LIMARI - Stadt - limari-stadt    - markstände no damage?!
//	   [11941, 8159, east], // LIMARI - Vorort - limari-bramar    - markstände no damage?!
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

