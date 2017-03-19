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
R3F_LOG_CFG_no_gravity_objects_can_be_set_in_height_over_ground = true;

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
R3F_LOG_CFG_string_condition_allow_creation_factory_on_this_client = "true";

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
	["OPT_B_G_Offroad_01_F", 30],						// Pickup
	["OPT_B_G_Offroad_01_armed_F", 30],					// Pickup HMG
	["OPT_B_MRAP_03_F", 30],							// Strider
	["OPT_B_MRAP_03_hmg_F", 30],						// Strider HMG
	["OPT_B_MRAP_03_gmg_F", 30],						// Strider GMG
	["OPT_B_MRAP_01_F", 30],							// Hunter
	["OPT_B_MRAP_01_hmg_F", 30],						// Hunter HMG
	["OPT_B_MRAP_01_gmg_F", 30],						// Hunter GMG
	["OPT_B_Truck_01_covered_F", 100], 					// HEMTT Transport	
	["OPT_B_APC_Wheeled_01_cannon_F", 30],				// AMV-7 Marshall
	["OPT_B_APC_Wheeled_01_cannon_light_F", 30],		// AMV-7 Marshall (Leicht)
	["OPT_B_UGV_01_F", 30],								// UGV Stomper	
	["OPT_B_MBT_01_cannon_F", 30],						// M2A4 Slammer
	["OPT_B_MBT_01_TUSK_F", 30],						// M2A4 SlammerUp
	["OPT_B_APC_Tracked_01_rcws_F", 30],				// IFV-6c Panther	
	["OPT_B_APC_tracked_03_cannon_F", 30],				// FV-720 Mora	
	["OPT_O_G_Offroad_01_F", 30],						// Pickup
	["OPT_O_G_Offroad_01_armed_F", 30],					// Pickup HMG
	["OPT_O_MRAP_02_F", 30],							// Ifrit
	["OPT_O_MRAP_02_hmg_F", 30],						// Ifrit HMG
	["OPT_O_MRAP_02_gmg_F", 30],						// Ifrit GMG
	["OPT_O_Truck_03_covered_F", 100],					// Tempest Transport	
	["OPT_O_APC_Wheeled_03_cannon_F", 30],				// AFV-4 Gorgon
	["OPT_O_APC_Wheeled_03_cannon_light_F", 30],		// AFV-4 Gorgon (Leicht)
	["OPT_O_APC_Wheeled_02_rcws_F", 30],				// MSE-3 Marid
	["OPT_O_UGV_01_F", 30],								// UGV Saif	
	["OPT_O_APC_Tracked_02_cannon_F", 30],				// BTR-K Kamysh (Titan)
	["OPT_O_APC_Tracked_02_cannon_light_F", 30]			// BTR-K Kamysh	
];

/**
 * List of class names of objects which can be loaded in transport vehicle/cargo.
 * The second element of the nested arrays is the cost capacity (in relation with the capacity of the vehicles).
 */
 // e.g. : ["MyTransportableObjectClassName1", itsCost], ["MyTransportableObjectClassName2", itsCost]
R3F_LOG_CFG_can_be_transported_cargo = R3F_LOG_CFG_can_be_transported_cargo +
[														
	/*["Land_BagFence_Round_F", 5],						// runde sandsackecke!
	["Land_BagFence_Long_F", 10],						// lange sandsackbarriere
	["Land_BagFence_Short_F", 5],						// kurze sandsackbarriere
	["Land_HBarrier_5_F", 35],							// H-barrier 5 blocks
	["Land_HBarrierBig_F", 40],							// H-barrier 4 blocks
	["Land_HBarrier_3_F", 25],							// H-Barrier 3 blocks
	["Land_Razorwire_F", 5],							// Stacheldraht
	["Land_CncBarrier_F", 30],							// beton barriere
	["Land_CncBarrierMedium_F", 30],					// beton barriere (mittel)
	["Land_CncBarrierMedium4_F", 40],					// beton barriere (mittel - lang)
	["Land_Mil_WiredFence_F", 5],						// maschendrahtzaun
	["CamoNet_BLUFOR_big_Curator_F", 5],				// Camonet zum testen!	*/
	["OPT_B_supplyCrate_F", 30],						// Transportkiste (leer)													
	["OPT_Box_NATO_Ammo_F", 30],          				// Munitionskiste
    ["OPT_Box_NATO_Grenades_F", 30],  					// Explosivkiste
  	["OPT_Box_NATO_WpsSpecial_F", 30],					// Raketenkiste
	["OPT_Box_NATO_WpsLaunch_F", 30],					// HAT-Kiste
	["OPT_B_Slingload_01_Fuel_F", 100],     			// Fuelcontainer
	["OPT_B_Slingload_01_Repair_F",	100],       		// Reparaturcontainer
    ["OPT_B_Slingload_01_Ammo_F", 110],					// Munitionscontainer
  	["OPT_B_Slingload_01_Medevac_F", 100],				// Lazarettcontainer															
	["OPT_O_supplyCrate_F", 30],						// Transportkiste (leer)
	["OPT_Box_East_Ammo_F", 30],         				// Munitionskiste
   	["OPT_Box_East_Grenades_F", 30],     				// Explosivkiste
   	["OPT_Box_East_WpsSpecial_F", 30],   				// AT Raketenkiste
	["OPT_Box_East_WpsLaunch_F", 30],					// HAT-Kiste
   	["OPT_Land_Pod_Heli_Transport_04_fuel_F", 100],		// Fuelcontainer
   	["OPT_Land_Pod_Heli_Transport_04_ammo_F", 110],		// Munitionscontainer
   	["OPT_Land_Pod_Heli_Transport_04_repair_F", 100],	// Reparaturcontainer
	["OPT_Land_Pod_Heli_Transport_04_medevac_F", 100],	// Lazarettcontainer
	["OPT_O_supplyCrate_F",	30],						// Transportkiste
	["OPT_FlexibleTank_01_sand_F", 30],					// Treibstoff-Fass
	["OPT_FlexibleTank_01_forest_F", 30],				// Treibstoff-Fass
	["OPT_Box_NATO_WpsSpecial_Diver_F", 30],			// Taucherkiste
	["OPT_Box_East_WpsSpecial_Diver_F",	30],			// Taucherkiste
	["OPT_Box_NATO_WpsSpecial_AT_F", 30],				// PCML Raketenkiste
	["OPT_Box_NATO_WpsSpecial_AA_F", 30],				// AA Raketenkiste
	["OPT_Box_East_WpsSpecial_AA_F", 30],				// AA Raketenkiste
	["OPT_B_Boat_Armed_01_minigun_F", 100],				// Speedboat Minigun
	["OPT_O_Boat_Armed_01_hmg_F", 100],					// Speedboat HMG
	["OPT_B_Boat_Transport_01_F", 50],					// Assault Boat
	["OPT_O_Boat_Transport_01_F", 50],					// Assault Boat
	["OPT_B_SDV_01_F", 80],								// SDV
	["OPT_O_SDV_01_F", 80]								// SDV
];

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

/**
 * List of class names of objects which can be carried and moved by a player.
 */
 // e.g. : "MyMovableObjectClassName1", "MyMovableObjectClassName2"
R3F_LOG_CFG_can_be_moved_by_player = R3F_LOG_CFG_can_be_moved_by_player +
[											
	"OPT_Box_NATO_Ammo_F",		        // Munitionskiste
    "OPT_Box_NATO_Grenades_F",		  	// Explosivkiste
  	"OPT_Box_NATO_WpsSpecial_F",		// Raketenkiste
	"OPT_Box_NATO_WpsSpecial_AT_F",		// PCML Raketenkiste
	"OPT_Box_NATO_WpsSpecial_AA_F",		// AA Raketenkiste
	"OPT_Box_NATO_WpsLaunch_F", 		// HAT-Kiste
	"OPT_B_supplyCrate_F",				// Transportkiste (leer)
	"OPT_Box_NATO_WpsSpecial_Diver_F",	// Taucherkiste
	"OPT_Box_East_WpsSpecial_Diver_F",	// Taucherkiste
	"OPT_FlexibleTank_01_forest_F",		// Treibstoff-Fass
	"OPT_Box_East_Ammo_F", 				// Munitionskiste
   	"OPT_Box_East_Grenades_F",    		// Explosivkiste
   	"OPT_Box_East_WpsSpecial_F",    	// AT Raketenkiste
	"OPT_Box_East_WpsSpecial_AA_F",		// AA Raketenkiste
	"OPT_Box_East_WpsLaunch_F",			// HAT-Kiste	
	"OPT_O_supplyCrate_F",				// Transportkiste (leer)
	"OPT_FlexibleTank_01_sand_F",		// Treibstoff-Fass
	"OPT_Land_Pod_Heli_Transport_04_fuel_F",		// Fuelcontainer
   	"OPT_Land_Pod_Heli_Transport_04_ammo_F",		// Munitionscontainer
   	"OPT_Land_Pod_Heli_Transport_04_repair_F",		// Reparaturcontainer
	"OPT_Land_Pod_Heli_Transport_04_medevac_F",		// Lazarettcontainer
	"OPT_B_Slingload_01_Repair_F",	       			// Reparaturcontainer
	"OPT_B_Slingload_01_Fuel_F",     				// Fuelcontainer
    "OPT_B_Slingload_01_Ammo_F",					// Munitionscontainer
  	"OPT_B_Slingload_01_Medevac_F",					// Lazarettcontainer	
	"OPT_B_Boat_Armed_01_minigun_F",				// Speedboat Minigun
	"OPT_O_Boat_Armed_01_hmg_F",					// Speedboat HMG
	"OPT_B_Boat_Transport_01_F",					// Assault Boat
	"OPT_O_Boat_Transport_01_F",					// Assault Boat
	"OPT_B_SDV_01_F",					// SDV
	"OPT_O_SDV_01_F",					// SDV
	"OPT_B_Mortar_01_F",				// Mk6 Mortar
	"OPT_O_Mortar_01_F",				// Mk6 Mortar
	"OPT_B_HMG_01_F",					// Mk30 HMG .50
	"OPT_O_HMG_01_F",					// Mk30 HMG .50	
	"OPT_B_HMG_01_high_F",				// Mk30 HMG .50 (Raised)
	"OPT_O_HMG_01_high_F",				// Mk30 HMG .50 (Raised)
	"OPT_B_GMG_01_F",					// Mk32 GMG 20 mm
	"OPT_O_GMG_01_F",					// Mk32 GMG 20 mm
	"OPT_B_GMG_01_high_F",				// Mk32 GMG 20 mm (Raised)
	"OPT_O_GMG_01_high_F",				// Mk32 GMG 20 mm (Raised)
	"OPT_B_static_AA_F",				// Static Titan Launcher (AA)
	"OPT_O_static_AA_F",				// Static Titan Launcher (AA)
	"OPT_B_static_AT_F",				// Static Titan Launcher (AT)
	"OPT_O_static_AT_F",				// Static Titan Launcher (AT)	
	"Land_BagFence_Round_F",			// runde sandsackecke!
	"Land_BagFence_Long_F",				// lange sandsackbarriere
	"Land_BagFence_Short_F",			// kurze sandsackbarriere
	"Land_HBarrier_5_F",				// H-barrier 5 blocks
	"Land_HBarrierBig_F",				// H-barrier 4 blocks
	"Land_HBarrier_3_F",				// H-Barrier 3 blocks
	"Land_Razorwire_F",					// Stacheldraht
	"Land_CncBarrier_F",				// beton barriere
	"Land_CncBarrierMedium_F",			// beton barriere (mittel)
	"Land_CncBarrierMedium4_F",			// beton barriere (mittel - lang)
	"Land_Mil_WiredFence_F",			// maschendrahtzaun
	"CamoNet_BLUFOR_big_Curator_F"		// Camonet zum testen!
];