/**
* SETUP FILE Classnames 
*  setup all needed classnames or variables here
*/
// alle funktionierenden und für die Wertung relevanten Flaggenmarker definieren
// Name hier eintragen so wie die Flaggen benannt sind - Dominator ist derjenige der mehr Flaggen als die gegnerische Seite besitzt (das gilt immer - wenn hier also eine Seite mehr Flaggen definiert bekommen hat ist sie autom. Dominator)
// wenn __OPT_Sector_Message__ in setup aktiviert werden automatisch die Marker um die Flaggen generiert. Achtung - Dummyflaggen benötigen weiterhin manuelle einen Marker

/* BY JAMES */
// automatisches Auslesen aller Flaggen mit dem Variablenname OPT_CSAT_FLAG_x und OPT_NATO_FLAG_x
// d.h. es können beliebig viele Flaggen gesetzt werden, der Name kann wie beim Kopieren automatisch
// übernommen mit OPT_CSAT_FLAG beginnen und eine beliebige Nummer haben.
opt_csat_flags = [];
{
	if (_x getVariable ["opt_csat_flag", false]) then {
		opt_csat_flags pushBack _x;

		// erzeuge für jede gefundene Flagge einen Marker auf der Karte
		#ifdef __OPT_FLAG_MARKER__
			_markerName = format["marker_%1_%2", _x, _forEachIndex];
			_marker = createMarkerLocal [_markerName, getPos _x];
			_marker setMarkerTypeLocal "flag_CSAT";
		#endif

	};

} foreach allMissionObjects "FLAG_CSAT_F";

opt_nato_flags = [];
{
	if (_x getVariable ["opt_nato_flag", false]) then {
		opt_nato_flags pushBack _x;
		
		// erzeuge für jede gefundene Flagge einen Marker auf der Karte
		#ifdef __OPT_FLAG_MARKER__
			_markerName = format["marker_%1_%2", _x, _forEachIndex];
			_marker = createMarkerLocal [_markerName, getPos _x];
			_marker setMarkerTypeLocal "flag_NATO";
		#endif
	};

} foreach allMissionObjects "FLAG_NATO_F";

/*
Für jede Flagge in einem Sektor: unverwundbar, Logistik-Script aus
Sowie Actionmenüeintrag für Spieler
*/
{
	_x addAction [
		'Flagge ziehen' call XRedText, 	// Anzeigetext
		'common\client\opt_flag.sqf', 	// Skript
		[], 														// Parameter für Skript
		1, 															// priority
		true, 													// showWindow
		true,														// hideOnUse 
		"",															// shortcut
		'((_target distance player) < 5) and vehicle player == player and MissionStarted and (OPT_PLAYTIME - (serverTime - opt_startTime)) > 0' // Flagge kann nur nach Missionsstart, in 5 m Radius, außerhalb eines Fahrzeugs und in Restspielzeit gezogen werden
	];
	_x allowDamage false; 						// Flagge kann nicht beschädigt werden
	_x setVariable ["R3F_LOG_disabled", true]; // Flagge kann nicht verladen werden
} foreach (opt_csat_flags + opt_nato_flags);

//-------------------------------------------------------------------------- Playermarker --------------------------------------------------------------------------
#ifdef __SHOW_CUSTOM_PLAYERMARKER__
	// Funktioniert nur wenn in setup/setup.sqf aktiviert...
	// im folgenden Beispiel werden 5 Gruppenführer und ein Pilot mit einem Marker ausgestattet, im folgenden die Syntax:
	// ["name des spielers als string (im editor definieren)" , "Markertext" , "Markertyp"]
	opt_p_entities = [
		["alpha_leader","Alpha","b_inf"],
		["bravo_leader","Bravo","b_inf"],
		["charlie_leader","Charlie","b_inf"],
		["delta_leader","Delta","b_inf"],
		["echo_leader","Echo","b_inf"],
		["wolf_leader","Wolf","b_inf"]
	];
#endif

//-------------------------------------------------------------------------- Sichtweiten --------------------------------------------------------------------------
#ifdef __PLAYER_GRAPHIC_SETTINGS__
	// hier können die einstellbaren Sichtweiten für den Spieler definiert werden
	opt_v_distance_list = [500,900,1200,1500,1800,2200,3000,4000,5000,6000];
#endif



// hier werden diverse Klassen definiert welche in Scripten abgefragt werden (z.B. klassenbezogene Tätigkeiten oder Waffen)
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------- Pilotenklassen --------------------------------------------------------------------------
#ifdef __ONLY_PILOTS_CAN_FLY__
	// hier sind alle Classnames aufgelistet, welche als Piloten definiert werden um fliegen zu dürfen
	opt_pilots = ["OPT_NATO_Pilot_T","OPT_CSAT_Pilot_T"];

	opt_pilots_vecs = [
					"OPT_O_Heli_Light_03_unarmed_F",			// WY-55 Hellcat
					"OPT_O_Heli_Light_03_F",					// WY-55 Hellcat (DAR)	
					"OPT_O_Heli_Light_02_unarmed_F",			// PO-30 Orca
					"OPT_O_Heli_Light_02_v2_F",					// PO-30 Orca (DAR)
					"OPT_O_Heli_Light_02_F",					// PO-30 Orca (DAGR)
					"OPT_O_Heli_Transport_04_F",				// Mi-290 Taru (Lift)
					"OPT_O_Heli_Transport_04_bench_F",			// Mi-290 Taru (Bench)
					"OPT_O_Heli_Transport_04_covered_F", 		// Mi-290 Taru (Transport)	
					"OPT_O_Heli_Attack_02_F",					// Mi-48 Kajman	
					"OPT_O_Plane_Fighter_03_CAS_F",				// A-143 Buzzard (CAS)
					"OPT_O_Plane_Fighter_03_AA_F",				// A-143 Buzzard (AA)
					"OPT_O_Plane_CAS_02_F",						// To-199 Neophron
					"OPT_B_Heli_Light_01_F",					// MH-9 Hummingbird
					"OPT_B_Heli_Light_01_armed_F",				// AH-9 Pawnee
					"OPT_B_Heli_Light_01_armed_2_F",			// AH-9 Pawnee DAGR
					"OPT_B_Heli_Transport_01_F",				// UH-80 Ghosthawk
					"OPT_B_Heli_Transport_02_F",				// CH-49 Mohawk (Transport+Lift)
					"OPT_B_Heli_Attack_01_F",					// AH-99 Blackfoot
					"OPT_B_Heli_Transport_03_unarmed_F",		// CH-67 Huron unarmed (Transport+Lift)
					"OPT_B_Heli_Transport_03_F",				// CH-67 Huron armed (Transport+Lift)
					"OPT_B_Plane_CAS_01_F"						// A-164 Wipeout
	];
#endif
//-------------------------------------------------------------------------- Crewklassen --------------------------------------------------------------------------
#ifdef __ONLY_CREW_CAN_DRIVE__
	// hier sind alle Classnames aufgelistet, welche als Crew definiert werden um gepanzerte Fahrzeuge fahren zu dürfen (und Schützenposition)
	opt_crew = ["OPT_NATO_Besatzungsmitglied_T","OPT_CSAT_Besatzungsmitglied_T"];

	opt_crew_vecs = [
		"OPT_B_MBT_03_cannon_F",				// MBT-52 Kuma
		"OPT_B_MBT_01_cannon_F",				// M2A4 Slammer
		"OPT_B_MBT_01_TUSK_F",					// M2A4 SlammerUp
		"OPT_B_APC_Tracked_01_rcws_F",			// IFV-6c Panther
		"OPT_B_APC_Tracked_01_AA_F",			// IFV-6a Cheetah
		"OPT_B_APC_tracked_03_cannon_F",		// FV-720 Mora
		"OPT_B_MBT_01_Arty_F",					// M4 Scorcher
		"OPT_B_MBT_01_mlrs_F",					// M5 Sandstorm
		"OPT_B_APC_Wheeled_01_cannon_F",		// AMV-7 Marshall
		"OPT_O_MBT_02_cannon_F",				// T-100 Varsuk	
		"OPT_O_APC_Tracked_02_cannon_F",		// BTR-K Kamysh (Titan)
		"OPT_O_APC_Tracked_02_cannon_light_F",	// BTR-K Kamysh (Leicht)
		"OPT_O_APC_Tracked_02_AA_F",			// ZSU-39 Tigris
		"OPT_O_APC_Wheeled_03_cannon_F",		// AFV-4 Gorgon
		"OPT_O_MBT_02_arty_F"					// 2S9 Sochor
	];
#endif
//-------------------------------------------------------------------------- Pioklassen --------------------------------------------------------------------------
#ifdef __ONLY_PIO_CAN_BUILD_FARPS__
	opt_engineers = ["OPT_NATO_Pionier_T","OPT_CSAT_Pionier_T"];
#endif

//-------------------------------------------------------------------------- Launcher Klassen --------------------------------------------------------------------------
opt_rocketmen = [
	"OPT_NATO_Luftabwehrspezialist",
	"OPT_CSAT_Luftabwehrspezialist",
	"OPT_NATO_PA_Schuetze",
	"OPT_CSAT_PA_Schuetze",
	"OPT_NATO_PA_Schuetze_Heavy",
	"OPT_CSAT_PA_Schuetze_Heavy",
	"OPT_NATO_Aufklaerung_Spaeher_AT",
	"OPT_CSAT_Aufklaerung_Spaeher_AT"
];

opt_launchers = ["OPT_launch_RPG32_F","OPT_launch_NLAW_F","OPT_launch_NLAW_M_F","OPT_launch_B_Titan_F","OPT_launch_O_Titan_F","OPT_launch_O_Titan_short_F","OPT_launch_B_Titan_short_F"];

opt_operator = [
	"OPT_NATO_Operator_T",
	"OPT_CSAT_Operator_T"
];

opt_medic = [
	"OPT_NATO_Sanitaeter_T",
	"OPT_CSAT_Sanitaeter_T"
];

opt_snipers = [
	"OPT_NATO_Scharfschuetze_T",
	"OPT_NATO_Scharfschuetze_2",
	"OPT_CSAT_Scharfschuetze_T",
	"OPT_CSAT_Scharfschuetze_2",
	"OPT_NATO_Aufklaerung_Scharfschutze_T",
	"OPT_NATO_Aufklaerung_Scharfschutze_2",
	"OPT_CSAT_Aufklaerung_Scharfschutze_T",
	"OPT_CSAT_Aufklaerung_Scharfschutze_2"
];

opt_soldatMG = [
	"OPT_CSAT_MG_Schuetze_T",
	"OPT_NATO_MG_Schuetze_T",
	"OPT_CSAT_SMG_Schuetze_T",
	"OPT_NATO_SMG_Schuetze_T"
];

opt_grenadiers = [
	"OPT_CSAT_Grenadier_T",
	"OPT_NATO_Grenadier_T",
	"OPT_CSAT_Aufklaerung_JTAC",
	"OPT_NATO_Aufklaerung_JTAC"
];

opt_gps_units = [
	"OPT_Maintainer",
	"OPT_NATO_Offizier_T",
	"OPT_CSAT_Offizier_T",
	"OPT_NATO_Gruppenfuehrer_T",
	"OPT_CSAT_Gruppenfuehrer_T"
];

opt_pioniers = [
	"OPT_NATO_Pionier_T",
	"OPT_CSAT_Pionier_T"
];