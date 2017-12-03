/**
* Author: James
* initialize all opt objects with correct ACE Cargo setLightnings
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_setupCargoSpaceAndSize.sqf;
*
*/
#include "script_component.hpp"

/****** LOAD IN VEHICLE  ******/
[cursorTarget, 3] call ace_cargo_fnc_setSize // -1 -> not loadable, 
 [vehicle player, 20] call ace_cargo_fnc_setSpace   // -> -1, no cargo possible

 Arguments:
 * 0: Any object <OBJECT>
 * 1: true to enable dragging, false to disable <BOOL>
 * 2: Position offset for attachTo command (optinal; default: [0,0,0])<ARRAY>
 * 3: Direction in degree to rotate the object after attachTo (optional; default: 0) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object, true, [0,0,0], 0] call ace_dragging_fnc_setDraggable;

 * Arguments:
 * 0: Any object <OBJECT>
 * 1: true to enable carrying, false to disable <BOOL>
 * 2: Position offset for attachTo command <ARRAY> (default: [0,1,1])
 * 3: Direction in degree to rotate the object after attachTo <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [object, true, [0,1,1], 0] call ace_dragging_fnc_setCarryable;

/* FORMAT
* (classname, cargo space): Wenn cargo space = -1, dann cargo deaktiviert
*/
GVAR(canTransportCargo) = [
// NATO Vehicles
    ["OPT_B_Quadbike_01_F", 15],						// Quadbike	- checken!
	["OPT_B_G_Offroad_01_F", 30],						// Pickup - grad nich drin!
	["OPT_B_G_Offroad_01_armed_F", 30],					// Pickup HMG - grad nich drin!
	["OPT_B_T_LSV_01_unarmed_F", 30], 					// Prowler unarmed
	["OPT_B_T_LSV_01_armed_F", 30],                     // Prowler armed
	["OPT_B_MRAP_03_F", 30],							// Strider - grad nich drin!
	["OPT_B_MRAP_03_hmg_F", 30],						// Strider HMG - grad nich drin!
	["OPT_B_MRAP_03_gmg_F", 30],						// Strider GMG
	["OPT_B_MRAP_01_F", 30],							// Hunter
	["OPT_B_MRAP_01_hmg_F", 30],						// Hunter HMG
	["OPT_B_MRAP_01_gmg_F", 30],						// Hunter GMG
	["OPT_B_Truck_01_covered_F", 60], 					// HEMTT Inf-Transport
	["OPT_B_Truck_01_transport_F", 100],				// HEMTT Logistik - hinzugefügt
// NATO Armored	
	["OPT_B_APC_Wheeled_01_cannon_F", 60],				// AMV-7 Marshall
	["OPT_B_APC_Wheeled_01_cannon_light_F", 60],		// AMV-7 Marshall (Leicht)
	["OPT_B_MBT_01_cannon_F", 30],						// M2A4 Slammer
	["OPT_B_MBT_01_TUSK_F", 30],						// M2A4 SlammerUp
	["OPT_B_APC_Tracked_01_rcws_F", 60],				// IFV-6c Panther	von 30
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
	["OPT_B_C_Boat_Transport_02_F", 30],				// Rhib unbewaffnet      - hinzugefügt
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
	["OPT_O_T_Truck_03_covered_ghex_F", 60],			// Tempest Transport	
	["OPT_O_T_Truck_03_transport_ghex_F", 100],			// Tempest Logistik - hinzugefügt
// CSAT Armored
	["OPT_O_APC_Wheeled_03_cannon_F", 60],				// AFV-4 Gorgon
	["OPT_O_APC_Wheeled_03_cannon_light_F", 60],		// AFV-4 Gorgon (Leicht)
	["OPT_O_T_APC_Wheeled_02_rcws_ghex_F", 30],			// MSE-3 Marid  - tropentarn hinzugefügt
	["OPT_O_T_APC_Tracked_02_cannon_ghex_F", 60],		// BTR-K Kamysh (Titan)
	["OPT_O_T_APC_Tracked_02_cannon_ghex_light_F", 60],	// BTR-K Kamysh	
	["OPT_O_T_MBT_02_cannon_ghex_F", 30],				// T-100  - hinzugefügt
// CSAT Helicopter
	["OPT_O_Heli_Light_03_unarmed_F", 30],				// WY-55 Hellcat,70000
	["OPT_O_Heli_Light_03_unarmed_green_F", 30],		// WY-55 Hellcat,70000
	["OPT_O_Heli_Light_02_unarmed_F", 60],				// PO-30 Orca,100000
	["OPT_O_Heli_Light_02_unarmed_black_F", 60],		// PO-30 Orca,100000
	["OPT_O_Heli_Transport_04_covered_black_F", 60], 	// Mi-290 Taru (Transport),110000
	["OPT_O_T_VTOL_02_infantry_unarmed_F", 60],			// Y-32 Xi'an (Inf-Transport), 180000
// CSAT Supplies	
	["OPT_O_T_UGV_01_ghex_F", 60],						// UGV Saif	
// CSAT Ships
	["OPT_O_Boat_Transport_01_F", 30],					// Assault Boat,500
	["OPT_O_Boat_Armed_01_hmg_F", 30],					// Speedboat HMG,14000
	["OPT_O_C_Boat_Transport_02_F", 30]				    // rhib unbewaffnet,7000	
];

/**
 * List of class names of objects which can be loaded in transport vehicle/cargo.
 * The second element of the nested arrays is the cost capacity (in relation with the capacity of the vehicles).
 * (classname, cargo size): Wenn cargo size = -1, dann Verladen deaktiviert
*/
GVAR(canBeTransported) = []
[	
// NATO supplies													
	["OPT_B_supplyCrate_F", 15],							// Transportkiste (leer)	+					
	["OPT_Box_NATO_Ammo_F", 30],          					// Munitionskiste	+
	["OPT_Box_NATO_Grenades_F", 30],  						// Explosivkiste	+
	["OPT_Box_NATO_WpsSpecial_AT2_F", 30],					// Raketenkiste		RPG42 +
	["OPT_Box_NATO_WpsSpecial_AA_F", 30],					// Raketenkiste		AA +
	["OPT_Box_NATO_WpsSpecial_Diver_F", 30],				// Taucherkiste,5000	
	["OPT_B_Slingload_01_Fuel_F", 100],     				// Fuelcontainer  +
	["OPT_B_Slingload_01_Repair_F", 100],       			// Reparaturcontainer +
	["OPT_B_Slingload_01_Ammo_F", 100],						// Munitionscontainer - von 110 runtergesetzt damit es in lkw passt
	["OPT_B_Slingload_01_Medevac_F", 100],					// Lazarettcontainer	+					
	["OPT_B_Slingload_01_Repair_radar_F", 100],				// Radarcontainer +		
	["OPT_Box_NATO_WpsSpecial_Diver_F", 30],				// Taucherkiste
	["OPT_FlexibleTank_01_forest_F", 15],					//Spritfass
// NATO ships
	["OPT_B_Boat_Transport_01_F", 30],				    	// Assault Boat     - hinzugefügt
	["OPT_B_C_Boat_Transport_02_F", 30],					// Rhib unbewaffnet      - hinzugefügt
// CSAT supplies
	["OPT_O_supplyCrate_F", 15],							// Transportkiste (leer)
	["OPT_Box_East_Ammo_F", 30],         					// Munitionskiste
	["OPT_Box_East_Grenades_F", 30],     					// Explosivkiste
	["OPT_Box_East_WpsSpecial_F", 30],   					// AT Raketenkiste
	["OPT_Box_East_WpsSpecial_AA_F", 30],					// AA Raketenkiste
	["OPT_Box_East_WpsSpecial_Diver_F", 30],				// Taucherkiste
	["OPT_FlexibleTank_01_sand_F", 15],					    // Treibstoff-Fass
	["OPT_Land_Pod_Heli_Transport_04_fuel_F", 100],			// Fuelcontainer
	["OPT_Land_Pod_Heli_Transport_04_fuel_black_F", 100],	// Fuelcontainer (schwarz)
    ["OPT_Land_Pod_Heli_Transport_04_ammo_F", 100],			// Munitionscontainer
	["OPT_Land_Pod_Heli_Transport_04_ammo_black_F", 100],	// Munitionscontainer (Schwarz)
    ["OPT_Land_Pod_Heli_Transport_04_repair_F", 100],		    // Reparaturcontainer
	["OPT_Land_Pod_Heli_Transport_04_repair_black_F", 100],	// Repcontainer schwarz
	["OPT_Land_Pod_Heli_Transport_04_repair_black_radar_F", 100],	// Radar Container
	["OPT_Land_Pod_Heli_Transport_04_repair_radar_F", 100],
    // CSAT Ships
	["OPT_O_Boat_Transport_01_F", 30],						// Assault Boat,500
	["OPT_O_C_Boat_Transport_02_F", 30]				        // rhib unbewaffnet,7000	
];


/**
 * List of class names of objects which can be carried and moved by a player.
 */
 // e.g. : "MyMovableObjectClassName1", "MyMovableObjectClassName2"
GVAR(canBeMoved) = 
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
	"OPT_B_Mortar_01_F",							// MK6 - M�rser,200000
	"OPT_FlexibleTank_01_forest_F",					//Spritfass
	"OPT_B_Static_Designator_01_F",					// Remote Designator,10000
	"OPT_B_Slingload_01_Fuel_F",           			// Fuelcontainer,5000
	"OPT_B_Slingload_01_Ammo_F",            		// Munitionscontainer,50000
	"OPT_B_Slingload_01_Repair_F", 	       			// Reparaturcontainer,5000
	"OPT_Land_Pod_Heli_Transport_04_repair_black_radar_F", 	       	// NATO Radar Container
	"OPT_B_Slingload_01_Medevac_F",          			// Lazarettcontainer,5000			//psycho, dieser container verursacht Probleme mit den Load-Scripts und wird durch den wei�en Container ersetzt welcher zum Lazarett ausgebaut werden kann
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
	"OPT_O_Mortar_01_F",							// MK6 M�rser,200000
	"OPT_FlexibleTank_01_sand_F",					// Treibstoff-Fass
	"OPT_O_Static_Designator_02_F",					// Remote Designator,10000
	"OPT_Land_Pod_Heli_Transport_04_fuel_F",			// Fuelcontainer,5000
	"OPT_Land_Pod_Heli_Transport_04_fuel_black_F",	// Fuelcontainer (schwarz),5000
	"OPT_Land_Pod_Heli_Transport_04_ammo_F",		// Munitionscontainer,50000
	"OPT_Land_Pod_Heli_Transport_04_ammo_black_F",	// Munitionscontainer (Schwarz),50000
	"OPT_Land_Pod_Heli_Transport_04_repair_F",			// Reparaturcontainer,5000
	"OPT_Land_Pod_Heli_Transport_04_repair_black_F",	// Reparaturcontainer (schwarz),5000
	"OPT_Land_Pod_Heli_Transport_04_repair_radar_F", // CSAT Radar Container
	"OPT_Land_Pod_Heli_Transport_04_medevac_F",			// Lazarettcontainer,5000			//psycho, dieser container verursacht Probleme mit den Load-Scripts und wird durch den wei�en Container ersetzt welcher zum Lazarett ausgebaut werden kann
//CSAT ships
	"OPT_O_Boat_Transport_01_F",						// Assault Boat,500
	//"OPT_O_Boat_Armed_01_hmg_F",					// Speedboat HMG,14000
	"OPT_O_C_Boat_Transport_02_F"					// rhib unbewaffnet,7000	
	//"OPT_O_SDV_01_F"									// Submarine,2000	
];