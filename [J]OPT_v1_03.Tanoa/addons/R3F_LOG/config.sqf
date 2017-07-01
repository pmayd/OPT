/**
 * MAIN CONFIGURATION FILE
 * 
 * English comments
 * 
 * (EN)
 * This file contains the configuration variables of the logistics system.
 * For the configuration of the creation factory, see the file "config_creation_factory.sqf".
 * IMPORTANT NOTE : when a logistics feature is given to an object/vehicle class name, all the classes which inherit
 *                  of the parent/generic class (according to the CfgVehicles) will also have this feature.
 *                  CfgVehicles tree view example : http://madbull.arma.free.fr/A3_stable_1.20.124746_CfgVehicles_tree.html
 */

/**
 * DISABLE LOGISTICS ON OBJECTS BY DEFAULT
 * 
 * (EN)
 * Define if objects and vehicles have logistics features by default,
 * or if it must be allowed explicitely on specific objects/vehicles.
 * 
 * If false : all objects are enabled according to the class names listed in this configuration file
 *            You can disable some objects with : object setVariable ["R3F_LOG_disabled", true];
 * If true :  all objects are disabled by default
 *            You can enable some objects with : object setVariable ["R3F_LOG_disabled", false];
 */
R3F_LOG_CFG_disabled_by_default = false;

/**
 * LOCK THE LOGISTICS FEATURES TO SIDE, FACTION OR PLAYER
 * 
 * (EN)
 * Define the lock mode of the logistics features for an object.
 * An object can be locked to the a side, faction, a player (respawn) or a unit (life).
 * If the object is locked, the player can unlock it according to the
 * value of the config variable R3F_LOG_CFG_unlock_objects_timer.
 * 
 * If "none" : no lock features, everyone can used the logistics features.
 * If "side" : the object is locked to the last side which interacts with it.
 * If "faction" : the object is locked to the last faction which interacts with it.
 * If "player" : the object is locked to the last player which interacts with it. The lock is transmitted after respawn.
 * If "unit" : the object is locked to the last player which interacts with it. The lock is lost when the unit dies.
 * 
 * Note : for military objects (not civilian), the lock is initialized to the object's side.
 * 
 * See also the config variable R3F_LOG_CFG_unlock_objects_timer.
 */
R3F_LOG_CFG_lock_objects_mode = "side";

/**
 * COUNTDOWN TO UNLOCK AN OBJECT
 * 
 * Define the countdown duration (in seconds) to unlock a locked object.
 * Set to -1 to deny the unlock of objects.
 * See also the config variable R3F_LOG_CFG_lock_objects_mode.
 */
R3F_LOG_CFG_unlock_objects_timer = 30;

/**
 * ALLOW NO GRAVITY OVER GROUND
 * 
 * Define if movable objects with no gravity simulation can be set in height over the ground (no ground contact).
 * The no gravity objects corresponds to most of decoration and constructions items.
 */
R3F_LOG_CFG_no_gravity_objects_can_be_set_in_height_over_ground = false;	//testweise mal ausgemacht

/**
 * LANGUAGE
 * 
 * Automatic language selection according to the game language.
 * New languages can be easily added (read below).
 */
R3F_LOG_CFG_language = switch (language) do
{
	case "English":{"en"};
	case "French":{"fr"};
	case "German":{"de"};
	
	// Feel free to create you own language file named "XX_strings_lang.sqf", where "XX" is the language code.
	// Make a copy of an existing language file (e.g. en_strings_lang.sqf) and translate it.
	// Then add a line with this syntax : case "YOUR_GAME_LANGUAGE":{"LANGUAGE_CODE"};
	// For example :
	//case "Czech":{"cz"}; // Not supported. Need your own "cz_strings_lang.sqf"
	//case "Polish":{"pl"}; // Not supported. Need your own "pl_strings_lang.sqf"
	//case "Portuguese":{"pt"}; // Not supported. Need your own "pt_strings_lang.sqf"
	//case "YOUR_GAME_LANGUAGE":{"LANGUAGE_CODE"};  // Need your own "LANGUAGE_CODE_strings_lang.sqf"
	
	default {"en"}; // If language is not supported, use English
};

/**
 * CONDITION TO ALLOW LOGISTICS
 * 
 * (EN)
 * This variable allow to set a dynamic SQF condition to allow/deny all logistics features only on specific clients.
 * The variable must be a STRING delimited by quotes and containing a valid SQF condition to evaluate during the game.
 * For example you can allow logistics only on few clients having a known game ID by setting the variable to :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Or based on the profile name : "profileName in [""john"", ""jack"", ""james""]"
 * Or only for the server admin : "serverCommandAvailable "#kick"""
 * The condition is evaluted in real time, so it can use condition depending on the mission progress : "alive officer && taskState task1 == ""Succeeded"""
 * Or to deny logistics in a circular area defined by a marker : "player distance getMarkerPos ""markerName"" > getMarkerSize ""markerName"" select 0"
 * Note that quotes of the strings inside the string condition must be doubled.
 * Note : if the condition depends of the aimed objects/vehicle, you can use the command cursorTarget
 * To allow the logistics to everyone, just set the condition to "true".
 */
R3F_LOG_CFG_string_condition_allow_logistics_on_this_client = "true";

/**
 * CONDITION TO ALLOW CREATION FACTORY
 * 
 * (EN)
 * This variable allow to set a dynamic SQF condition to allow/deny the access to the creation factory only on specific clients.
 * The variable must be a STRING delimited by quotes and containing a valid SQF condition to evaluate during the game.
 * For example you can allow the creation factory only on few clients having a known game ID by setting the variable to :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Or based on the profile name : "profileName in [""john"", ""jack"", ""james""]"
 * Or only for the server admin : "serverCommandAvailable "#kick"""
 * Note that quotes of the strings inside the string condition must be doubled.
 * Note : if the condition depends of the aimed objects/véhicule, you can use the command cursorTarget
 * Note also that the condition is evaluted in real time, so it can use condition depending on the mission progress :
 * "alive officer && taskState task1 == ""Succeeded"""
 * To allow the creation factory to everyone, just set the condition to "true".
 */
R3F_LOG_CFG_string_condition_allow_creation_factory_on_this_client = "false";		//von true auf false - factory haben wir nicht

/*
 ********************************************************************************************
 * BELOW IS THE CLASS NAMES CONFIGURATION / CI-DESSOUS LA CONFIGURATION DES NOMS DE CLASSES *
 ********************************************************************************************
 * 
 * (EN)
 * There are two ways to manage new objects with the logistics system. The first one is to add these objects in the
 * following appropriate lists. The second one is to create a new external file in the /addons_config/ directory,
 * based on /addons_config/TEMPLATE.sqf, and to add a #include below to.
 * The first method is better to add/fix only some various class names.
 * The second method is better to take into account an additional addon.
 * 
 * These variables are based on the inheritance principle according to the CfgVehicles tree.
 * It means that a features accorded to a class name, is also accorded to all child classes.
 * Inheritance tree view : http://madbull.arma.free.fr/A3_1.32_CfgVehicles_tree.html
 */

/****** LIST OF ADDONS CONFIG TO INCLUDE / LISTE DES CONFIG D'ADDONS A INCLURE ******/
//#include "addons_config\A3_vanilla.sqf"
//#include "addons_config\All_in_Arma.sqf" 						
//#include "addons_config\R3F_addons.sqf"
//#include "addons_config\YOUR_ADDITIONAL_ADDON.sqf"

/****** TOW WITH VEHICLE / REMORQUER AVEC VEHICULE ******/

/**
 * List of class names of ground vehicles which can tow objects.
 */
R3F_LOG_CFG_can_tow = R3F_LOG_CFG_can_tow +
[
	// e.g. : "MyTowingVehicleClassName1", "MyTowingVehicleClassName2"	
];

/**
 * List of class names of objects which can be towed.
 */
R3F_LOG_CFG_can_be_towed = R3F_LOG_CFG_can_be_towed +
[
	// e.g. : "MyTowableObjectClassName1", "MyTowableObjectClassName2"	
];


/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/**
 * List of class names of helicopters which can lift objects.
 */
 
R3F_LOG_CFG_can_lift = R3F_LOG_CFG_can_lift +
[	
	// e.g. : "MyLifterVehicleClassName1", "MyLifterVehicleClassName2"
];

/**
 * List of class names of objects which can be lifted.
 */

R3F_LOG_CFG_can_be_lifted = R3F_LOG_CFG_can_be_lifted +
[
	 // e.g. : "MyLiftableObjectClassName1", "MyLiftableObjectClassName2"	
];


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/

/*
* (EN)
 * This section uses a numeric quantification of capacity and cost of the objets.
 * For example, in a vehicle has a capacity of 100, we will be able to load in 5 objects costing 20 capacity units.
 * The capacity doesn't represent a real volume or weight, but a choice made for gameplay.
 */

/**
 * List of class names of vehicles or cargo objects which can transport objects.
 * The second element of the nested arrays is the load capacity (in relation with the capacity cost of the objects).
 */
 // e.g. : ["MyTransporterClassName1", itsCapacity], ["MyTransporterClassName2", itsCapacity]
R3F_LOG_CFG_can_transport_cargo = R3F_LOG_CFG_can_transport_cargo +
[
// NATO Vehicles
    ["OPT_B_Quadbike_01_F", 15],							// Quadbike	- checken!
	["OPT_B_G_Offroad_01_F", 30],						// Pickup - grad nich drin!
	["OPT_B_G_Offroad_01_armed_F", 30],					// Pickup HMG - grad nich drin!
	["OPT_B_T_LSV_01_unarmed_F", 30], 					// Prowler unarmed
	["OPT_B_T_LSV_01_armed_F", 30],                      // Prowler armed
	["OPT_B_MRAP_03_F", 30],								// Strider - grad nich drin!
	["OPT_B_MRAP_03_hmg_F", 30],							// Strider HMG - grad nich drin!
	["OPT_B_MRAP_03_gmg_F", 30],							// Strider GMG
	["OPT_B_MRAP_01_F", 30],								// Hunter
	["OPT_B_MRAP_01_hmg_F", 30],							// Hunter HMG
	["OPT_B_MRAP_01_gmg_F", 30],							// Hunter GMG
	["OPT_B_Truck_01_covered_F", 60], 					// HEMTT Inf-Transport
	["OPT_B_Truck_01_transport_F", 100],					// HEMTT Logistik - hinzugefügt
// NATO Armored	
	["OPT_B_APC_Wheeled_01_cannon_F", 60],				// AMV-7 Marshall
	["OPT_B_APC_Wheeled_01_cannon_light_F", 60],			// AMV-7 Marshall (Leicht)
	["OPT_B_MBT_01_cannon_F", 30],						// M2A4 Slammer
	["OPT_B_MBT_01_TUSK_F", 30],							// M2A4 SlammerUp
	["OPT_B_APC_Tracked_01_rcws_F", 60],					// IFV-6c Panther	von 30
	["OPT_B_APC_tracked_03_cannon_F", 60],				// FV-720 Mora	 von 30
// NATO Helicopters	
	["OPT_B_Heli_Light_01_F", 30],						// MH-9 Hummingbird
	["OPT_B_Heli_Transport_01_F", 60],					// UH-80 Ghosthawk   von 30
	["OPT_B_Heli_Transport_02_F", 60],					// CH-49 Mohawk (Transport+Lift)    von 30
	["OPT_B_Heli_Transport_03_unarmed_F", 60],			// CH-67 Huron unarmed (Transport+Lift)     von 30
	["OPT_B_Heli_Transport_03_F", 60],					// CH-67 Huron armed (Transport+Lift)       von 30
	["OPT_B_T_VTOL_01_infantry_F", 60],					// Blackfish (Inf-Transport)   - hinzugefügt
// NATO ships
	["OPT_B_Boat_Transport_01_F", 30],					// Assault Boat     - hinzugefügt
	["OPT_B_Boat_Armed_01_minigun_F", 30],				// Speedboat Minigun    - hinzugefügt
	["OPT_B_C_Boat_Transport_02_F", 30],					// Rhib unbewaffnet      - hinzugefügt
// NATO supplies/drohnen	
	["OPT_B_UGV_01_F", 60],								// UGV Stomper	von 30
// CSAT Vehicles	
	["OPT_O_T_Quadbike_01_ghex_F", 15],					// Quadbike	- checken!	
	["OPT_O_T_LSV_02_unarmed_F", 30], 					// Quilin unarmed
	["OPT_O_T_LSV_02_armed_F", 30],						// Quilin armed
	["OPT_O_G_Offroad_01_F", 30],						// Pickup  - grad nich drin!
	["OPT_O_G_Offroad_01_armed_F", 30],					// Pickup HMG  - grad nich drin!
	["OPT_O_T_MRAP_02_ghex_F", 30],						// Ifrit - tropentarn hinzugefügt
	["OPT_O_T_MRAP_02_hmg_ghex_F", 30],					// Ifrit HMG  - tropentarn hinzugefügt
	["OPT_O_T_MRAP_02_gmg_ghex_F", 30],					// Ifrit GMG  - tropentarn hinzugefügt
	["OPT_O_T_Truck_03_covered_ghex_F", 60],				// Tempest Transport	
	["OPT_O_T_Truck_03_transport_ghex_F", 100],			// Tempest Logistik - hinzugefügt
// CSAT Armored
	["OPT_O_APC_Wheeled_03_cannon_F", 60],				// AFV-4 Gorgon
	["OPT_O_APC_Wheeled_03_cannon_light_F", 60],			// AFV-4 Gorgon (Leicht)
	["OPT_O_T_APC_Wheeled_02_rcws_ghex_F", 30],			// MSE-3 Marid  - tropentarn hinzugefügt
	["OPT_O_T_APC_Tracked_02_cannon_ghex_F", 60],		// BTR-K Kamysh (Titan)
	["OPT_O_T_APC_Tracked_02_cannon_ghex_light_F", 60],	// BTR-K Kamysh	
	["OPT_O_T_MBT_02_cannon_ghex_F", 30],				// T-100  - hinzugefügt
// CSAT Helicopter
	["OPT_O_Heli_Light_03_unarmed_F", 30],				// WY-55 Hellcat,70000
	["OPT_O_Heli_Light_03_unarmed_green_F", 30],			// WY-55 Hellcat,70000
	["OPT_O_Heli_Light_02_unarmed_F", 60],				// PO-30 Orca,100000
	["OPT_O_Heli_Light_02_unarmed_black_F", 60],			// PO-30 Orca,100000
	["OPT_O_Heli_Transport_04_covered_black_F", 60], 	// Mi-290 Taru (Transport),110000
	["OPT_O_T_VTOL_02_infantry_unarmed_F", 60],			// Y-32 Xi'an (Inf-Transport), 180000
// CSAT Supplies	
	["OPT_O_T_UGV_01_ghex_F", 60],						// UGV Saif	
// CSAT Ships
	["OPT_O_Boat_Transport_01_F", 30],						// Assault Boat,500
	["OPT_O_Boat_Armed_01_hmg_F", 30],					// Speedboat HMG,14000
	["OPT_O_C_Boat_Transport_02_F", 30]				// rhib unbewaffnet,7000	
];

/**
 * List of class names of objects which can be loaded in transport vehicle/cargo.
 * The second element of the nested arrays is the cost capacity (in relation with the capacity of the vehicles).
 */
 // e.g. : ["MyTransportableObjectClassName1", itsCost], ["MyTransportableObjectClassName2", itsCost]
R3F_LOG_CFG_can_be_transported_cargo = R3F_LOG_CFG_can_be_transported_cargo +
[	
// NATO supplies													
	["OPT_B_supplyCrate_F", 15],								// Transportkiste (leer)	+												
	["OPT_Box_NATO_Ammo_F", 30],          					// Munitionskiste	+
	["OPT_Box_NATO_Grenades_F", 30],  						// Explosivkiste	+
	["OPT_Box_NATO_WpsSpecial_AT2_F", 30],					// Raketenkiste		RPG42 +
	["OPT_Box_NATO_WpsSpecial_AA_F", 30],					// Raketenkiste		AA +
	["OPT_Box_NATO_WpsSpecial_Diver_F", 30],				// Taucherkiste,5000	
	["OPT_B_Slingload_01_Fuel_F", 100],     					// Fuelcontainer  +
	["OPT_B_Slingload_01_Repair_F", 100],       				// Reparaturcontainer +
	["OPT_B_Slingload_01_Ammo_F", 100],						// Munitionscontainer - von 110 runtergesetzt damit es in lkw passt
	["OPT_B_Slingload_01_Medevac_F", 100],					// Lazarettcontainer	+														
	["OPT_B_Slingload_01_Repair_radar_F", 100],				// Radarcontainer +														
	["OPT_Box_NATO_WpsSpecial_Diver_F", 30],					// Taucherkiste
// NATO ships
	["OPT_B_Boat_Transport_01_F", 30],					// Assault Boat     - hinzugefügt
	["OPT_B_C_Boat_Transport_02_F", 30],					// Rhib unbewaffnet      - hinzugefügt
// CSAT supplies
	["OPT_O_supplyCrate_F", 15],								// Transportkiste (leer)
	["OPT_Box_East_Ammo_F", 30],         					// Munitionskiste
	["OPT_Box_East_Grenades_F", 30],     					// Explosivkiste
	["OPT_Box_East_WpsSpecial_F", 30],   					// AT Raketenkiste
	["OPT_Box_East_WpsSpecial_AA_F", 30],					// AA Raketenkiste
	["OPT_Box_East_WpsSpecial_Diver_F", 30],					// Taucherkiste
	["OPT_Land_Pod_Heli_Transport_04_fuel_F", 100],			// Fuelcontainer
	["OPT_Land_Pod_Heli_Transport_04_fuel_black_F", 100],	// Fuelcontainer (schwarz)
   	["OPT_Land_Pod_Heli_Transport_04_ammo_F", 100],			// Munitionscontainer
	["OPT_Land_Pod_Heli_Transport_04_ammo_black_F", 100],	// Munitionscontainer (Schwarz)
   	["OPT_Land_Pod_Heli_Transport_04_repair_F", 100],		// Reparaturcontainer
	["OPT_Land_Pod_Heli_Transport_04_repair_black_F", 100],	// Repcontainer schwarz
	["OPT_Land_Pod_Heli_Transport_04_repair_black_radar_F", 100],	// Radar Container
// CSAT Ships
	["OPT_O_Boat_Transport_01_F", 30],						// Assault Boat,500
	["OPT_O_C_Boat_Transport_02_F", 30]				// rhib unbewaffnet,7000	
];

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

/**
 * List of class names of objects which can be carried and moved by a player.
 */
 // e.g. : "MyMovableObjectClassName1", "MyMovableObjectClassName2"
R3F_LOG_CFG_can_be_moved_by_player = R3F_LOG_CFG_can_be_moved_by_player +
[											
// NATO supplies	
   	"OPT_B_supplyCrate_F",							// Transportkiste (leer),500
	"OPT_Box_NATO_WpsSpecial_Diver_F",				// Taucherkiste,5000	
	"OPT_Box_NATO_Ammo_F",            				// Munitionskiste,40000
    "OPT_Box_NATO_Grenades_F",         				// Explosivkiste,75000
  	"OPT_Box_NATO_WpsSpecial_AT2_F",				// AT Raketenkiste (RPG-42),30000
	"OPT_Box_NATO_WpsSpecial_AA_F",					// AA Raketenkiste,40000	
	"OPT_B_HMG_01_F",								// Stand-MG niedrig,10000
	"OPT_B_HMG_01_high_F",							// Stand-MG hoch,10000
	"OPT_B_GMG_01_F",								// Stand-GMG niedrig,15000
	"OPT_B_GMG_01_high_F",							// Stand-GMG hoch,15000
	"OPT_B_static_AA_F",							// Stand-AA,25000
	"OPT_B_static_AT_F",							// Stand-AT,200000	
	"OPT_B_Mortar_01_F",							// MK6 - Mörser,200000	
	"OPT_B_Static_Designator_01_F",					// Remote Designator,10000
	//"OPT_B_Slingload_01_Fuel_F",           			// Fuelcontainer,5000
    //"OPT_B_Slingload_01_Ammo_F",            		// Munitionscontainer,50000
    //"OPT_B_Slingload_01_Repair_F", 	       			// Reparaturcontainer,5000
	//"OPT_B_Slingload_01_Repair_radar_F", 	       	// Radar Container
   	//"OPT_B_Slingload_01_Medevac_F",          			// Lazarettcontainer,5000			//psycho, dieser container verursacht Probleme mit den Load-Scripts und wird durch den weißen Container ersetzt welcher zum Lazarett ausgebaut werden kann
// NATO ships	
	"OPT_B_Boat_Transport_01_F",						// Assault Boat,500
	"OPT_B_C_Boat_Transport_02_F",					// Rhib unbewaffnet,2000
	//"OPT_B_Boat_Armed_01_minigun_F",				// Speedboat Minigun,10000
	//"OPT_B_SDV_01_F",									// Submarine,2000
//CSAT supplies
	"OPT_O_supplyCrate_F",							// Transportkiste,500
	"OPT_Box_East_WpsSpecial_Diver_F",				// Taucherkiste,5000
	"OPT_Box_East_WpsSpecial_AA_F",					// AA Raketenkiste,40000
	"OPT_Box_East_WpsSpecial_F",            		// AT Raketenkiste (RPG-42),30000
	"OPT_Box_East_Ammo_F",            				// Munitionskiste,40000	
   	"OPT_Box_East_Grenades_F",            			// Explosivkiste,75000	
	"OPT_Box_East_WpsLaunch_F",							// HAT-Kiste (Titan),400000	
	"OPT_O_HMG_01_F",								// Stand-MG niedrig,10000	
	"OPT_O_HMG_01_high_F",							// Stand-MG hoch,10000
	"OPT_O_GMG_01_F",								// Stand-GMG niedrig,15000
	"OPT_O_GMG_01_high_F",							// Stand-GMG hoch,15000	
	"OPT_O_static_AA_F",							// Stand-AA,25000
	"OPT_O_static_AT_F",							// Stand-AT,200000	
	"OPT_O_Mortar_01_F",							// MK6 Mörser,200000
	"OPT_O_Static_Designator_02_F",					// Remote Designator,10000
	//"OPT_Land_Pod_Heli_Transport_04_fuel_F",			// Fuelcontainer,5000
	//"OPT_Land_Pod_Heli_Transport_04_fuel_black_F",	// Fuelcontainer (schwarz),5000
   	//"OPT_Land_Pod_Heli_Transport_04_ammo_F",		// Munitionscontainer,50000
	//"OPT_Land_Pod_Heli_Transport_04_ammo_black_F",	// Munitionscontainer (Schwarz),50000
   	//"OPT_Land_Pod_Heli_Transport_04_repair_F",			// Reparaturcontainer,5000
	//"OPT_Land_Pod_Heli_Transport_04_repair_black_F",	// Reparaturcontainer (schwarz),5000
	//"OPT_Land_Pod_Heli_Transport_04_repair_black_radar_F",	// Radar Container
	//"OPT_Land_Pod_Heli_Transport_04_medevac_F",			// Lazarettcontainer,5000			//psycho, dieser container verursacht Probleme mit den Load-Scripts und wird durch den weißen Container ersetzt welcher zum Lazarett ausgebaut werden kann
//CSAT ships
	"OPT_O_Boat_Transport_01_F",						// Assault Boat,500
	//"OPT_O_Boat_Armed_01_hmg_F",					// Speedboat HMG,14000
	"OPT_O_C_Boat_Transport_02_F"					// rhib unbewaffnet,7000	
	//"OPT_O_SDV_01_F"									// Submarine,2000	
];