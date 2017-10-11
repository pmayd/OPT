/**
* Author: James
* defines all objects that can be bought and sold with prices. A price of 0 means not able to buy or sell.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call vehiclePool_war.sqf;
*
*/
#include "script_component.hpp"

#define DEF_PROD(var1) var1, __ORDER_SELL_RETURN_VALUE__ * var1 // default product with 0.75 sold value

GVAR(nato_vehicles) = [
	["OPT_B_Quadbike_01_F", DEF_PROD(1500)],				// Quadbike
	["OPT_B_T_LSV_01_unarmed_F", DEF_PROD(3000)], 			// Prowler unarmed
	["OPT_B_T_LSV_01_armed_F", DEF_PROD(5000)], 			// Prowler armed
	["OPT_B_G_Offroad_01_F", DEF_PROD(0)],					// Pickup, 1000, ersetzt durch Prawler
	["OPT_B_G_Offroad_01_armed_F", DEF_PROD(0)],			// Pickup HMG, 4000, ersetzt durch Prawler
	["OPT_B_Truck_01_covered_F", DEF_PROD(8000)], 			// HEMTT Transport
	["OPT_B_Truck_01_Repair_F", DEF_PROD(10000)], 			// HEMTT Repair, ersetzt durch Container
	["OPT_B_Truck_01_medical_F", DEF_PROD(10000)], 		    // HEMTT Medical, ersetzt durch Container
	["OPT_B_Truck_01_transport_F", DEF_PROD(2000)], 		// HEMTT 2000 (fr Radar Container, keine Sitze auf 
	["OPT_B_MRAP_01_F", DEF_PROD(5000)],					// Hunter
	["OPT_B_MRAP_01_hmg_F", DEF_PROD(25000)],				// Hunter HMG
	["OPT_B_MRAP_01_gmg_F", DEF_PROD(30000)],				// Hunter GMG
	["OPT_B_MRAP_03_F", DEF_PROD(0)],						// Strider, 6500 fliegt raus
	["OPT_B_MRAP_03_hmg_F", DEF_PROD(0)],					// Strider HMG, fliegt raus
	["OPT_B_MRAP_03_gmg_F", DEF_PROD(35000)]				// Strider GMG, Ladefläche)
];

// Fahrzeuge dieser Liste knnen nicht verkauft werden!
GVAR(nato_vehicles_supply) = [
	["OPT_B_Truck_01_ammo_F", DEF_PROD(50000)], 			// HEMTT Ammo, 50000 ersetzt durch Container
	["OPT_B_Truck_01_fuel_F", DEF_PROD(10000)] 			    // HEMTT Fuel, 10000 ersetzt durch Container
];
	
GVAR(nato_choppers) = [
	["OPT_B_Heli_Light_01_F", DEF_PROD(60000)],					// MH-9 Hummingbird
	["OPT_B_Heli_Light_01_armed_F", DEF_PROD(140000)],			// AH-9 Pawnee
	["OPT_B_Heli_Light_01_armed_2_F", DEF_PROD(0)],				// AH-9 Pawnee DAGR - erstma raus wegen DAGR-problematik
	["OPT_B_Heli_Transport_01_F", DEF_PROD(90000)],				// UH-80 Ghosthawk
	["OPT_B_Heli_Transport_03_unarmed_F", DEF_PROD(150000)],	// CH-67 Huron unarmed (Transport+Lift)
	["OPT_B_Heli_Transport_03_F", DEF_PROD(170000)],			// CH-67 Huron armed (Transport+Lift)
	["OPT_B_UAV_02_light_F", DEF_PROD(300000)],					// Greyhawk unbewaffnet
	["OPT_B_UAV_02_CAS_F", DEF_PROD(400000)],					// Greyhawk LGB
	["OPT_B_UAV_02_F", DEF_PROD(380000)],						// Greyhawk Raketen
	["OPT_B_UAV_02_AA_F", DEF_PROD(400000)],					// Greyhawk AA-Raketen	
	["OPT_B_Heli_Transport_02_F", DEF_PROD(150000)],			// CH-49 Mohawk (Transport+Lift)
	["OPT_B_T_UAV_03_dynamicLoadout_F", DEF_PROD(650000)],		// MQ12-Falcon - noch in arbeit erstma nur testweise mit preis eingebaut
	["OPT_B_T_VTOL_01_infantry_F", DEF_PROD(200000)],			// VTOL Blackfish (Inf-Transport)
	["OPT_B_T_VTOL_01_vehicle_F", DEF_PROD(180000)],			// VTOL Blackfish (Fahrzeug-Transport)
	["OPT_B_T_VTOL_01_armed_F", DEF_PROD(0)],					// VTOL Blackfish BEWAFFNET
	["OPT_B_Heli_Attack_01_F", DEF_PROD(650000)],				// AH-99 Blackfoot
	["OPT_B_Plane_CAS_01_F", DEF_PROD(600000)],				    // A-164 Wipeout
	["OPT_B_Plane_Fighter_AA_01_F", DEF_PROD(0)]				// F/A-181 Black Wasp II (AA)
];
	
GVAR(nato_armored) = [
	["OPT_B_APC_Tracked_01_rcws_F", DEF_PROD(45000)],					// IFV-6c Panther
	["OPT_B_APC_Wheeled_01_cannon_light_F", DEF_PROD(70000)],			// AMV-7 Marshall (Leicht)
	["OPT_B_APC_Wheeled_01_cannon_F", DEF_PROD(120000)],				// AMV-7 Marshall	
	["OPT_B_APC_Tracked_01_AA_F", DEF_PROD(275000)],					// IFV-6a Cheetah
	["OPT_B_APC_tracked_03_cannon_F", DEF_PROD(130000)],				// FV-720 Mora	
	["OPT_B_MBT_01_cannon_F", DEF_PROD(340000)],						// M2A4 Slammer
	["OPT_B_MBT_01_TUSK_F", DEF_PROD(430000)],						    // M2A4 SlammerUp
	["OPT_B_MBT_03_cannon_F", DEF_PROD(0)],							    // MBT-52 Kuma, fliegt raus
	["OPT_B_MBT_01_Arty_F", DEF_PROD(400000)],						    // M4 Scorcher
	["OPT_B_MBT_01_mlrs_F", DEF_PROD(400000)]							// M5 Sandstorm	
];

GVAR(nato_supplies) = [
	["OPT_Box_NATO_Ammo_F", DEF_PROD(40000)],            			// Munitionskiste
	["OPT_Box_NATO_Grenades_F", DEF_PROD(75000)],         			// Explosivkiste
	["OPT_Box_NATO_WpsSpecial_AT2_F", DEF_PROD(30000)],				// AT Raketenkiste (RPG-42)
	["OPT_Box_NATO_WpsSpecial_AA_F", DEF_PROD(40000)],				// AA Raketenkiste
   	["OPT_B_supplyCrate_F", DEF_PROD(500)],							// Transportkiste (leer)
	["OPT_B_CargoNet_01_ammo_F", DEF_PROD(5000)],					// Ausrstungskiste
	["OPT_Box_NATO_WpsSpecial_Diver_F", DEF_PROD(5000)],			// Taucherkiste	
  	["OPT_Box_NATO_WpsSpecial_F", DEF_PROD(0)],						// PCML-M Raketenkiste
	["OPT_Box_NATO_WpsSpecial_AT_F", DEF_PROD(0)],					// PCML Raketenkiste	
	["OPT_Box_NATO_WpsLaunch_F", DEF_PROD(0)],						// HAT-Kiste (Titan)
	["OPT_B_UGV_01_F", DEF_PROD(2000)],								// UGV Stomper
	["OPT_B_UAV_01_F", DEF_PROD(30000)],							// Darter AR-2
	["OPT_FlexibleTank_01_forest_F", DEF_PROD(1000)],				// Treibstoff-Fass
    ["OPT_B_Slingload_01_Ammo_F", DEF_PROD(90000)],            		// Munitionscontainer
	["OPT_B_Slingload_01_Fuel_F", DEF_PROD(8000)],           		// Fuelcontainer
    ["OPT_B_Slingload_01_Repair_F", DEF_PROD(8000)], 	       		// Reparaturcontainer
	["OPT_B_Slingload_01_Medevac_F", DEF_PROD(0)],                  // Lazarettcontainer, 5000			//psycho, dieser container verursacht Probleme mit den Load-Scripts und wird durch den weien Container ersetzt welcher zum Lazarett ausgebaut werden kann
	["OPT_B_Slingload_01_Repair_radar_F", DEF_PROD(0)], 	       	// Radar Container
	["Land_Cargo20_white_F", DEF_PROD(0)],							// weier Container (Lazarett)
	["Land_BagFence_Round_F", DEF_PROD(0)],							// runde sandsackecke!
	["Land_BagFence_Long_F", DEF_PROD(0)],							// lange sandsackbarriere
	["Land_BagFence_Short_F", DEF_PROD(0)],							// kurze sandsackbarriere
	["Land_HBarrier_5_F", DEF_PROD(0)],								// H-barrier 5 blocks
	["Land_HBarrierBig_F", DEF_PROD(0)],							// H-barrier 4 blocks
	["Land_HBarrier_3_F", DEF_PROD(0)],								// H-Barrier 3 blocks
	["Land_Razorwire_F", DEF_PROD(0)],								// Stacheldraht
	["Land_CncBarrier_F", DEF_PROD(0)],								// beton barriere
	["Land_CncBarrierMedium_F", DEF_PROD(0)],						// beton barriere (mittel)
	["Land_CncBarrierMedium4_F", DEF_PROD(0)],						// beton barriere (mittel - lang)
	["Land_Mil_WiredFence_F", DEF_PROD(0)],							// maschendrahtzaun
	["CamoNet_BLUFOR_big_Curator_F", DEF_PROD(0)]					// Camonet zum testen!
];

GVAR(nato_static) = [
    ["OPT_B_HMG_01_high_F", DEF_PROD(10000)],						// Stand-MG hoch
	["OPT_B_HMG_01_F", DEF_PROD(10000)],							// Stand-MG niedrig
	["OPT_B_GMG_01_high_F", DEF_PROD(15000)],						// Stand-GMG hoch
	["OPT_B_GMG_01_F", DEF_PROD(15000)],							// Stand-GMG niedrig
	["OPT_B_static_AA_F", DEF_PROD(25000)],							// Stand-AA
	["OPT_B_static_AT_F", DEF_PROD(200000)],						// Stand-AT
	["OPT_B_Mortar_01_F", DEF_PROD(200000)],						// MK6 - Mrser
	["OPT_B_Static_Designator_01_F", DEF_PROD(10000)] 				// Remote Designator
];

GVAR(nato_sea) = [
	["OPT_B_Boat_Armed_01_minigun_F", DEF_PROD(10000)],				// Speedboat Minigun
	["OPT_B_Boat_Transport_01_F", DEF_PROD(500)],					// Assault Boat
	["OPT_B_SDV_01_F", DEF_PROD(2000)],								// Submarine
	["OPT_B_C_Boat_Transport_02_F", DEF_PROD(7000)]					// Rhib unbewaffnet
];

GVAR(csat_vehicles) = [
	["OPT_O_T_Quadbike_01_ghex_F", DEF_PROD(1500)],					// Quadbike
	["OPT_O_T_LSV_02_unarmed_F", DEF_PROD(3000)], 					// Quilin unarmed
	["OPT_O_T_LSV_02_armed_F", DEF_PROD(4000)], 					// Quilin armed
	["OPT_O_T_Truck_03_covered_ghex_F", DEF_PROD(8000)],			// Tempest Transport
	["OPT_O_T_Truck_03_repair_ghex_F", DEF_PROD(10000)],			// Tempest Repair, ersetzt durch container
	["OPT_O_T_Truck_03_medical_ghex_F", DEF_PROD(10000)],			// Tempest Medical, ersetzt durch container
	["OPT_O_T_Truck_03_transport_ghex_F", DEF_PROD(2000)],			// Tempest (fr Radar, keine Sitze auf Ladeflche)
	["OPT_O_G_Offroad_01_F", DEF_PROD(0)],							// Pickup, ersetzt durch quilin
	["OPT_O_G_Offroad_01_armed_F", DEF_PROD(0)],					// Pickup HMG, ersetzt durch quilin
	["OPT_O_T_MRAP_02_ghex_F", DEF_PROD(5500)],						// Ifrit
	["OPT_O_T_MRAP_02_hmg_ghex_F", DEF_PROD(26000)],				// Ifrit HMG
	["OPT_O_T_MRAP_02_gmg_ghex_F", DEF_PROD(31000)]					// Ifrit GMG
];

// Fahrzeuge dieser Liste knnen nicht verkauft werden!
GVAR(csat_vehicles_supply) = [
	["OPT_O_T_Truck_03_ammo_ghex_F", DEF_PROD(50000)],				// Tempest Ammo, ersetzt durch container
	["OPT_O_T_Truck_03_fuel_ghex_F", DEF_PROD(10000)]				// Tempest Fuel, ersetzt durch container
];

GVAR(csat_choppers) = [
	["OPT_O_Heli_Light_03_unarmed_F", DEF_PROD(70000)],				// WY-55 Hellcat
	["OPT_O_Heli_Light_03_unarmed_green_F", DEF_PROD(0)],			// WY-55 Hellcat
	["OPT_O_Heli_Light_03_F", DEF_PROD(170000)],					// WY-55 Hellcat (DAR)
	["OPT_O_Heli_Light_03_green_F", DEF_PROD(0)],					// WY-55 Hellcat (DAR)
	["OPT_O_Heli_Light_02_unarmed_F", DEF_PROD(0)],					// PO-30 Orca
	["OPT_O_Heli_Light_02_unarmed_black_F", DEF_PROD(80000)],		// PO-30 Orca
	["OPT_O_Heli_Light_02_v2_F", DEF_PROD(0)],						// PO-30 Orca (DAR)
	["OPT_O_Heli_Light_02_v2_black_F", DEF_PROD(180000)],			// PO-30 Orca (DAR)
	["OPT_O_Heli_Light_02_F", DEF_PROD(0)],							// PO-30 Orca (DAGR) - erstma raus wegen DAGR-problematik
	["OPT_O_Heli_Light_02_black_F", DEF_PROD(0)],					// PO-30 Orca (DAGR) - erstma raus wegen DAGR-problematik
	["OPT_O_Heli_Transport_04_F", DEF_PROD(0)],						// Mi-290 Taru (Lift)
	["OPT_O_Heli_Transport_04_black_F", DEF_PROD(85000)],			// Mi-290 Taru (Lift)
	["OPT_O_Heli_Transport_04_covered_F", DEF_PROD(0)], 			// Mi-290 Taru (Transport)
	["OPT_O_Heli_Transport_04_covered_black_F", DEF_PROD(110000)], 	// Mi-290 Taru (Transport)
	["OPT_O_Heli_Transport_04_bench_F", DEF_PROD(0)],				// Mi-290 Taru (Bench)
	["OPT_O_Heli_Transport_04_bench_black_F", DEF_PROD(90000)],		// Mi-290 Taru (Bench)
	["OPT_O_UAV_02_light_F", DEF_PROD(300000)],						// Ababil unbewaffnet
	["OPT_O_UAV_02_CAS_F", DEF_PROD(400000)],						// Ababil GBU-12
	["OPT_O_UAV_02_F", DEF_PROD(600000)],							// Ababil Scalpel
	["OPT_O_UAV_02_AA_F", DEF_PROD(400000)],						// Ababil AA	
	["OPT_O_T_VTOL_02_infantry_unarmed_F", DEF_PROD(170000)],		// VTOL Y-32 Xi'an (Inf-Transport)
	["OPT_O_T_VTOL_02_vehicle_unarmed_F", DEF_PROD(170000)],		// VTOL Y-32 Xi'an (Fahrzeug-Transport)
	["OPT_O_T_VTOL_02_infantry_F", DEF_PROD(0)],					// VTOL Y-32 Xi'an (Inf-Transport)
	["OPT_O_T_VTOL_02_vehicle_F", DEF_PROD(0)],						// VTOL Y-32 Xi'an (Fahrzeug-Transport)
	["OPT_O_Heli_Attack_02_F", DEF_PROD(0)],						// Mi-48 Kajman	
	["OPT_O_Heli_Attack_02_black_F", DEF_PROD(680000)],				// Mi-48 Kajman (Schwarz)
	["OPT_O_Plane_CAS_02_AA_F", DEF_PROD(0)],						// To-199 Neophron light - raus
	["OPT_O_Plane_CAS_02_F", DEF_PROD(600000)],						// To-199 Neophron
	["OPT_O_Plane_Fighter_03_AA_F", DEF_PROD(0)],					// A-143 Buzzard (AA)
	["OPT_O_Plane_Fighter_03_CAS_F" , DEF_PROD(0)],					// A-143 Buzzard (CAS)	
	["OPT_O_T_UAV_04_CAS_F", DEF_PROD(650000)],						// KH-3A Fenghuan - noch in arbeit erstma nur testweise mit preis eingebaut
	["OPT_O_Plane_Fighter_AA_02_F", DEF_PROD(0)]					// To-201 Shikra (AA)
];
	
GVAR(csat_armored) = [
	["OPT_O_T_APC_Wheeled_02_rcws_ghex_F", DEF_PROD(50000)],			// MSE-3 Marid
	["OPT_O_APC_Wheeled_03_cannon_light_F", DEF_PROD(70000)],			// AFV-4 Gorgon (Leicht)
	["OPT_O_APC_Wheeled_03_cannon_F", DEF_PROD(120000)],				// AFV-4 Gorgon
	["OPT_O_T_APC_Tracked_02_AA_ghex_F", DEF_PROD(275000)],			    // ZSU-39 Tigris
	["OPT_O_T_APC_Tracked_02_cannon_ghex_light_F", DEF_PROD(120000)],	// BTR-K Kamysh
	["OPT_O_T_APC_Tracked_02_cannon_ghex_F", DEF_PROD(275000)],		    // BTR-K Kamysh (Titan)
	["OPT_O_T_MBT_02_cannon_ghex_F", DEF_PROD(450000)],				    // T-100 Varsuk
	["OPT_O_T_MBT_02_arty_ghex_F", DEF_PROD(400000)]					// 2S9 Sochor <-- Psycho, Preis runter solange es die zustzliche Munition nicht gibt	
];

GVAR(csat_supplies) = [
	["OPT_Box_East_Ammo_F", DEF_PROD(40000)],            			        // Munitionskiste
	["OPT_Box_East_Grenades_F", DEF_PROD(75000)],            		        // Explosivkiste
	["OPT_Box_East_WpsSpecial_F", DEF_PROD(30000)],            		        // AT Raketenkiste (RPG-42)
    ["OPT_Box_East_WpsSpecial_AA_F", DEF_PROD(40000)],				        // AA Raketenkiste
	["OPT_O_supplyCrate_F", DEF_PROD(500)],							        // Transportkiste
	["OPT_O_CargoNet_01_ammo_F", DEF_PROD(5000)],					        // Ausrstungskiste
	["OPT_Box_East_WpsSpecial_Diver_F", DEF_PROD(5000)],			        // Taucherkiste
	["OPT_Box_East_WpsLaunch_F", DEF_PROD(0)],						        // HAT-Kiste (Titan)
	["OPT_O_T_UGV_01_ghex_F", DEF_PROD(2000)],						        // UGV Saif	
	["OPT_O_UAV_01_F", DEF_PROD(30000)],							        // Tayran AR-2
	["OPT_FlexibleTank_01_sand_F", DEF_PROD(1000)],					        // Treibstoff-Fass
	["OPT_Land_Pod_Heli_Transport_04_fuel_F", DEF_PROD(0)],			        // Fuelcontainer
	["OPT_Land_Pod_Heli_Transport_04_fuel_black_F", DEF_PROD(8000)],        // Fuelcontainer (schwarz)
   	["OPT_Land_Pod_Heli_Transport_04_ammo_F", DEF_PROD(0)],			        // Munitionscontainer
	["OPT_Land_Pod_Heli_Transport_04_ammo_black_F", DEF_PROD(90000)],       // Munitionscontainer (Schwarz)
   	["OPT_Land_Pod_Heli_Transport_04_repair_F", DEF_PROD(0)],		        // Reparaturcontainer
	["OPT_Land_Pod_Heli_Transport_04_repair_black_F", DEF_PROD(8000)],      // Reparaturcontainer (schwarz)
	["OPT_Land_Pod_Heli_Transport_04_repair_black_radar_F", DEF_PROD(0)],	// Radar Container
	["OPT_Land_Pod_Heli_Transport_04_medevac_F", DEF_PROD(0)],			    // Lazarettcontainer, psycho, dieser container verursacht Probleme mit den Load-Scripts und wird durch den weien Container ersetzt welcher zum Lazarett ausgebaut werden kann
	["Land_Cargo20_white_F", DEF_PROD(0)],							// weier Container (Lazarett)
	["Land_BagFence_Round_F", DEF_PROD(0)],							// runde sandsackecke!
	["Land_BagFence_Long_F", DEF_PROD(0)],							// lange sandsackbarriere
	["Land_BagFence_Short_F", DEF_PROD(0)],							// kurze sandsackbarriere
	["Land_HBarrier_5_F", DEF_PROD(0)],								// H-barrier 5 blocks
	["Land_HBarrierBig_F", DEF_PROD(0)],							// H-barrier 4 blocks
	["Land_HBarrier_3_F", DEF_PROD(0)],								// H-Barrier 3 blocks
	["Land_Razorwire_F", DEF_PROD(0)],								// Stacheldraht
	["Land_CncBarrier_F", DEF_PROD(0)],								// beton barriere
	["Land_CncBarrierMedium_F", DEF_PROD(0)],						// beton barriere (mittel)
	["Land_CncBarrierMedium4_F", DEF_PROD(0)],						// beton barriere (mittel - lang)
	["Land_Mil_WiredFence_F", DEF_PROD(0)],							// maschendrahtzaun
	["CamoNet_BLUFOR_big_Curator_F", DEF_PROD(0)]					// Camonet zum testen!
];

GVAR(csat_static) = [
    ["OPT_O_HMG_01_high_F", DEF_PROD(10000)],						// Stand-MG hoch
	["OPT_O_HMG_01_F", DEF_PROD(10000)],							// Stand-MG niedrig
	["OPT_O_GMG_01_high_F", DEF_PROD(15000)],						// Stand-GMG hoch
	["OPT_O_GMG_01_F", DEF_PROD(15000)],							// Stand-GMG niedrig
	["OPT_O_static_AA_F", DEF_PROD(25000)],							// Stand-AA
	["OPT_O_static_AT_F", DEF_PROD(200000)],						// Stand-AT
	["OPT_O_Mortar_01_F", DEF_PROD(200000)],						// MK6 Mrser
	["OPT_O_Static_Designator_02_F", DEF_PROD(10000)]			    // Remote Designator
];

GVAR(csat_sea) = [
	["OPT_O_Boat_Transport_01_F", DEF_PROD(500)],					// Assault Boat
	["OPT_O_Boat_Armed_01_hmg_F", DEF_PROD(14000)],					// Speedboat HMG
	["OPT_O_C_Boat_Transport_02_F", DEF_PROD(7000)],				// rhib unbewaffnet
	["OPT_O_SDV_01_F", DEF_PROD(2000)]								// Submarine
];