/**
* SETUP FILE Classnames 
*  setup all needed classnames or variables here
*/
#include "script_component.hpp"

// hier werden diverse Klassen definiert welche in Scripten abgefragt werden (z.B. klassenbezogene Ttigkeiten oder Waffen)
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* HL UND PL */
opt_officer = [
    "OPT_NATO_Offizier_T",
    "OPT_CSAT_Offizier_T"
];

/* PILOTS */
// hier sind alle Classnames aufgelistet, welche als Piloten definiert werden um fliegen zu drfen
opt_pilots = [
    "OPT_NATO_Pilot_T",
    "OPT_CSAT_Pilot_T"
];

#ifdef __ONLY_PILOTS_CAN_FLY__

	opt_pilots_vecs = [
        "OPT_B_Heli_Light_01_F",				    // MH-9 Hummingbird,70000
        "OPT_B_Heli_Light_01_armed_F",			    // AH-9 Pawnee,150000
        "OPT_B_Heli_Light_01_armed_2_F",		    // AH-9 Pawnee DAGR,350000 - erstma raus wegen DAGR-problematik
        "OPT_B_Heli_Transport_01_F",			    // UH-80 Ghosthawk,130000
        "OPT_B_Heli_Transport_02_F",			    // CH-49 Mohawk (Transport+Lift),150000
        "OPT_B_Heli_Attack_01_F",				    // AH-99 Blackfoot,750000
        "OPT_B_Heli_Transport_03_unarmed_F",	    // CH-67 Huron unarmed (Transport+Lift),150000
        "OPT_B_Heli_Transport_03_F",	    	    // CH-67 Huron armed (Transport+Lift),170000
        "OPT_B_Plane_CAS_01_F",					    // A-164 Wipeout,540000
        "OPT_B_T_VTOL_01_infantry_F",			    // Blackfish (Inf-Transport)
        "OPT_B_T_VTOL_01_vehicle_F",		        // Blackfish (Fahrzeug-Transport)
        "OPT_B_T_VTOL_01_armed_F",			        // Blackfish BEWAFFNET
        "OPT_B_Plane_Fighter_AA_01_F",			    // F/A-181 Black Wasp II (AA)
        "OPT_O_Heli_Light_03_unarmed_F",		    // WY-55 Hellcat,70000
        "OPT_O_Heli_Light_03_unarmed_green_F",	    // WY-55 Hellcat,70000
        "OPT_O_Heli_Light_03_F",				    // WY-55 Hellcat (DAR),170000	
        "OPT_O_Heli_Light_03_green_F",			    // WY-55 Hellcat (DAR),170000	
        "OPT_O_Heli_Light_02_unarmed_F",    	    // PO-30 Orca,100000
        "OPT_O_Heli_Light_02_unarmed_black_F",	    // PO-30 Orca,100000
        "OPT_O_Heli_Light_02_v2_F",				    // PO-30 Orca (DAR),200000
        "OPT_O_Heli_Light_02_v2_black_F",   	    // PO-30 Orca (DAR),200000
        "OPT_O_Heli_Light_02_F",				    // PO-30 Orca (DAGR),400000 - erstma raus wegen DAGR-problematik
        "OPT_O_Heli_Light_02_black_F",			    // PO-30 Orca (DAGR),400000 - erstma raus wegen DAGR-problematik
        "OPT_O_Heli_Transport_04_F",			    // Mi-290 Taru (Lift),85000
        "OPT_O_Heli_Transport_04_black_F",		    // Mi-290 Taru (Lift),85000
        "OPT_O_Heli_Transport_04_bench_F",		    // Mi-290 Taru (Bench),90000
        "OPT_O_Heli_Transport_04_bench_black_F",    // Mi-290 Taru (Bench),90000
        "OPT_O_Heli_Transport_04_covered_F", 	    // Mi-290 Taru (Transport),110000
        "OPT_O_Heli_Transport_04_covered_black_F",	// Mi-290 Taru (Transport),110000
        "OPT_O_Heli_Transport_02_F",			    // CH-49 Mohawk (Transport+Lift),150000	
        "OPT_O_Heli_Attack_02_F",				    // Mi-48 Kajman,800000	
        "OPT_O_Heli_Attack_02_black_F",			    // Mi-48 Kajman (Schwarz),800000	
        "OPT_O_Plane_Fighter_03_CAS_F",			    // A-143 Buzzard (CAS),450000
        "OPT_O_Plane_Fighter_03_AA_F",			    // A-143 Buzzard (AA),500000
        "OPT_O_Plane_CAS_02_F",					    // To-199 Neophron,560000
        "OPT_O_T_VTOL_02_infantry_F",			    // Y-32 Xi'an (Inf-Transport), 180000
        "OPT_O_T_VTOL_02_vehicle_F",			    // Y-32 Xi'an (Fahrzeug-Transport), 200000
        "OPT_O_T_VTOL_02_infantry_unarmed_F",	    // Y-32 Xi'an (Inf-Transport), 180000
        "OPT_O_T_VTOL_02_vehicle_unarmed_F",	    // Y-32 Xi'an (Fahrzeug-Transport), 180000
        "OPT_O_Plane_Fighter_AA_02_F"			    // To-201 Shikra (AA), 180000
	];
#endif

/* FAHRZEUGE UND CREW */
	// hier sind alle Classnames aufgelistet, welche als Crew definiert werden um gepanzerte Fahrzeuge fahren zu drfen (und Schtzenposition)
opt_crew = [
        "OPT_NATO_Besatzungsmitglied_T",
        "OPT_CSAT_Besatzungsmitglied_T"
    ];

#ifdef __ONLY_CREW_CAN_DRIVE__
	opt_crew_vecs = [
        "OPT_B_APC_Wheeled_01_cannon_F",				// AMV-7 Marshall,120000
        "OPT_B_APC_Tracked_01_rcws_F",					// IFV-6c Panther,45000
        "OPT_B_APC_tracked_03_cannon_F",				// FV-720 Mora,100000
        "OPT_B_APC_Tracked_01_AA_F",					// IFV-6a Cheetah,275000
        "OPT_B_MBT_01_cannon_F",						// M2A4 Slammer,340000
        "OPT_B_MBT_01_TUSK_F",							// M2A4 SlammerUp,430000
        "OPT_B_MBT_03_cannon_F",						// MBT-52 Kuma,500000 fliegt raus
        "OPT_B_MBT_01_mlrs_F",						    // M5 Sandstorm,600000	
        "OPT_B_MBT_01_Arty_F",						    // M4 Scorcher,650000 <-- Psycho, Preis runter solange es die zustzliche Munition nicht gibt	
        "OPT_O_APC_Wheeled_03_cannon_F",				// AFV-4 Gorgon,120000
        "OPT_O_T_APC_Tracked_02_cannon_ghex_light_F",	// BTR-K Kamysh,100000
        "OPT_O_T_APC_Tracked_02_cannon_ghex_F",	        // BTR-K Kamysh (Titan),280000
        "OPT_O_T_APC_Tracked_02_AA_ghex_F",		        // ZSU-39 Tigris,275000
        "OPT_O_T_MBT_02_cannon_ghex_F",			        // T-100 Varsuk,450000	
        "OPT_O_T_MBT_02_arty_ghex_F"					// 2S9 Sochor,650000 <-- Psycho, Preis runter solange es die zustzliche Munition nicht gibt	
	];
#endif

/* AT-Schützen UND LAUNCHER */

opt_rocketmen = [
	"OPT_NATO_Luftabwehrspezialist",
	"OPT_CSAT_Luftabwehrspezialist",
	"OPT_NATO_PA_Schuetze",
	"OPT_NATO_PA_Schuetze_T",
	"OPT_CSAT_PA_Schuetze_T",
	"OPT_CSAT_PA_Schuetze",
	"OPT_NATO_PA_Schuetze_Heavy",
	"OPT_CSAT_PA_Schuetze_Heavy",
	"OPT_NATO_Aufklaerung_Spaeher_AT",
	"OPT_CSAT_Aufklaerung_Spaeher_AT",
	"OPT_NATO_Aufklaerung_Spaeher_AT_T",
	"OPT_CSAT_Aufklaerung_Spaeher_AT_T"
];

opt_launchers = [
    "OPT_launch_B_RPG32_F",
    "OPT_launch_RPG32_F",
    "OPT_launch_NLAW_F",
    "OPT_launch_NLAW_M_F",
    "OPT_launch_B_Titan_F",
    "OPT_launch_O_Titan_F",
    "OPT_launch_O_Titan_short_F",
    "OPT_launch_B_Titan_short_F"
];

/* OPERATOR */

opt_operator = [
	"OPT_NATO_Operator_T",
	"OPT_CSAT_Operator_T"
];

/* MEDIC */

opt_medic = [
	"OPT_NATO_Sanitaeter_T",
	"OPT_CSAT_Sanitaeter_T"
];

/* SNIPER */
opt_snipers = [
	"OPT_NATO_Scharfschuetze_T",
	"OPT_NATO_Scharfschuetze_2",
	"OPT_CSAT_Scharfschuetze_T",
	"OPT_CSAT_Scharfschuetze_2",
	"OPT_NATO_Aufklaerung_Scharfschutze_T",
	"OPT_NATO_Aufklaerung_Scharfschutze_2",
	"OPT_CSAT_Aufklaerung_Scharfschutze_T",
	"OPT_CSAT_Aufklaerung_Scharfschutze_2",
	"OPT_NATO_Scharfschuetze_2_T",
	"OPT_CSAT_Scharfschuetze_2_T"	
];

/* MG */

opt_soldatMG = [
	"OPT_CSAT_MG_Schuetze_T",
	"OPT_NATO_MG_Schuetze_T",
	"OPT_CSAT_SMG_Schuetze_T",
	"OPT_NATO_SMG_Schuetze_T"
];

/* GRENADIER */

opt_grenadiers = [
	"OPT_CSAT_Grenadier_T",
	"OPT_NATO_Grenadier_T",
	"OPT_CSAT_Aufklaerung_JTAC",
	"OPT_NATO_Aufklaerung_JTAC",
	"OPT_NATO_Aufklaerung_JTAC_T"
];

/* PIONIER */

opt_pioniers = [
	"OPT_NATO_Pionier_T",
	"OPT_CSAT_Pionier_T",
	"OPT_CSAT_Aufklaerung_Sprengmeister_T",
	"OPT_NATO_Aufklaerung_Sprengmeister_T"
];

#ifdef __ONLY_PIO_CAN_BUILD_FARPS__
    opt_engineers = [
        "OPT_NATO_Pionier_T",
        "OPT_CSAT_Pionier_T"
    ];
#endif


/* UAV */

opt_big_uavs = [
	"OPT_B_UAV_02_F",
	"OPT_B_UAV_02_CAS_F",
	"OPT_B_UAV_02_light_F",
	"OPT_O_UAV_02_F",
	"OPT_O_UAV_02_CAS_F",
	"OPT_O_UAV_02_light_F",
	"OPT_B_UAV_02_AA_F",
	"OPT_O_UAV_02_AA_F",
	"B_UCSV_01",
	"O_UCSV_01",
	"OPT_O_T_UAV_04_CAS_F",
	"OPT_B_T_UAV_03_dynamicLoadout_F"
];