/*
	Order Maintainer Vehicles

	Author: schmingo (OPT MOD Team)

	v2015-01-21 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/

opt_mt_Vehicles = [
// NATO Vehicles
	["OPT_B_Quadbike_01_F"],							// Quadbike, von 500
	["OPT_B_G_Offroad_01_F"],								// Pickup,1000, ersetzt durch Prawler
	["OPT_B_G_Offroad_01_armed_F"],						// Pickup HMG,4000, ersetzt durch Prawler
	["OPT_B_MRAP_01_F"],								// Hunter,4500
	["OPT_B_MRAP_01_hmg_F"],							// Hunter HMG,24500
	["OPT_B_MRAP_01_gmg_F"],							// Hunter GMG,30500
	["OPT_B_MRAP_03_gmg_F"],							// Strider GMG,32500
	["OPT_B_Truck_01_covered_F"], 						// HEMTT Transport,8000
	["OPT_B_Truck_01_Repair_F"], 							// HEMTT Repair,10000 ersetzt durch Container
	["OPT_B_Truck_01_ammo_F"], 						// HEMTT Ammo,50000 ersetzt durch Container
	["OPT_B_Truck_01_fuel_F"], 							// HEMTT Fuel,10000 ersetzt durch Container
	["OPT_B_Truck_01_medical_F"], 					// HEMTT Medical,10000 ersetzt durch Container
	["B_Truck_01_mover_F"], 								// HEMTT 2000 (für Radar Container, keine Sitze auf Ladefläche)
	["OPT_B_Truck_01_transport_F"], 					// HEMTT 2000 (für Radar Container, keine Sitze auf Ladefläche)
	["OPT_B_T_LSV_01_unarmed_F"], 						// Prowler unarmed, 2000
	["OPT_B_T_LSV_01_armed_F"], 						// Prowler armed, 4000
// NATO Helicopter
	["OPT_B_Heli_Light_01_F"],						// MH-9 Hummingbird,70000
	["OPT_B_Heli_Light_01_armed_F"],					// AH-9 Pawnee,150000
	["OPT_B_Heli_Light_01_armed_2_F"],					// AH-9 Pawnee DAGR,350000 - erstma raus wegen DAGR-problematik
	["OPT_B_Heli_Transport_01_F"],					// UH-80 Ghosthawk,130000
	["OPT_B_Heli_Transport_02_F"],						// CH-49 Mohawk (Transport+Lift),150000
	["OPT_B_Heli_Attack_01_F"],						// AH-99 Blackfoot,750000
	["OPT_B_Heli_Transport_03_unarmed_F"],			// CH-67 Huron unarmed (Transport+Lift),150000
	["OPT_B_Heli_Transport_03_F"],					// CH-67 Huron armed (Transport+Lift),170000
	["OPT_B_Plane_CAS_01_F"],						// A-164 Wipeout,540000
	["OPT_B_UAV_02_light_F"],						// Greyhawk unbewaffnet,300000
	["OPT_B_UAV_02_CAS_F"],							// Greyhawk LGB,400000	
	["OPT_B_UAV_02_F"],								// Greyhawk Raketen,600000	
	["B_T_UAV_03_F"],									// MQ12-Falcon - noch in arbeit erstma nur testweise mit preis eingebaut
	["OPT_B_T_VTOL_01_infantry_F"],					// Blackfish (Inf-Transport)
	["OPT_B_T_VTOL_01_vehicle_F"],					// Blackfish (Fahrzeug-Transport)
	["OPT_B_T_VTOL_01_armed_F"],						// Blackfish BEWAFFNET
// NATO Armored
	["OPT_B_APC_Wheeled_01_cannon_light_F"],			// AMV-7 Marshall (Leicht),70000
	["OPT_B_APC_Wheeled_01_cannon_F"],				// AMV-7 Marshall,120000
	["OPT_B_APC_Tracked_01_rcws_F"],					// IFV-6c Panther,45000
	["OPT_B_APC_tracked_03_cannon_F"],				// FV-720 Mora,100000
	["OPT_B_APC_Tracked_01_AA_F"],					// IFV-6a Cheetah,275000
	["OPT_B_MBT_01_cannon_F"],						// M2A4 Slammer,340000
	["OPT_B_MBT_01_TUSK_F"],							// M2A4 SlammerUp,430000
	["OPT_B_MBT_01_mlrs_F"],							// M5 Sandstorm,600000	
	["OPT_B_MBT_01_Arty_F"],							// M4 Scorcher,650000 <-- Psycho, Preis runter solange es die zusätzliche Munition nicht gibt
// NATO supplies
    ["OPT_B_supplyCrate_F"],							// Transportkiste (leer),500
	["OPT_B_CargoNet_01_ammo_F"],						// Ausrüstungskiste,5000
	["OPT_Box_NATO_WpsSpecial_Diver_F"],				// Taucherkiste,5000	
	["OPT_Box_NATO_Ammo_F"],            				// Munitionskiste,40000
    ["OPT_Box_NATO_Grenades_F"],         				// Explosivkiste,75000
	["OPT_Box_NATO_WpsSpecial_AT2_F"],				// AT Raketenkiste (RPG-42),30000
	["OPT_Box_NATO_WpsSpecial_AA_F"],					// AA Raketenkiste,40000	
	["OPT_Box_NATO_WpsLaunch_F"],							// HAT-Kiste (Titan),400000
	["OPT_B_HMG_01_F"],								// Stand-MG niedrig,10000
	["OPT_B_HMG_01_high_F"],							// Stand-MG hoch,10000
	["OPT_B_GMG_01_F"],								// Stand-GMG niedrig,15000
	["OPT_B_GMG_01_high_F"],							// Stand-GMG hoch,15000
	["OPT_B_static_AA_F"],							// Stand-AA,25000
	["OPT_B_static_AT_F"],							// Stand-AT,200000	
	["OPT_B_Mortar_01_F"],							// MK6 - Mörser,200000	
	["OPT_B_Static_Designator_01_F"],					// Remote Designator,10000
	["OPT_B_UGV_01_F"],								// UGV Stomper,2000
	["OPT_B_UAV_01_F"],								// Darter AR-2,30000
	["OPT_B_Slingload_01_Fuel_F"],           			// Fuelcontainer,5000
    ["OPT_B_Slingload_01_Ammo_F"],            		// Munitionscontainer,50000
    ["OPT_B_Slingload_01_Repair_F"], 	       			// Reparaturcontainer,5000
	["OPT_B_Slingload_01_Repair_radar_F"], 	       	// Radar Container
   	["OPT_B_Slingload_01_Medevac_F"],          			// Lazarettcontainer,5000			//psycho, dieser container verursacht Probleme mit den Load-Scripts und wird durch den weißen Container ersetzt welcher zum Lazarett ausgebaut werden kann
// NATO ships
	["OPT_B_Boat_Transport_01_F"],						// Assault Boat,500
	["OPT_B_Boat_Armed_01_minigun_F"],				// Speedboat Minigun,10000
	["OPT_B_SDV_01_F"],									// Submarine,2000
	["OPT_B_C_Boat_Transport_02_F"],					// Rhib unbewaffnet,2000
// CSAT Vehicles
	["OPT_O_T_Quadbike_01_ghex_F"],					// Quadbike,500
	["OPT_O_G_Offroad_01_F"],								// Pickup,1000 ersetzt durch quilin
	["OPT_O_G_Offroad_01_armed_F"],						// Pickup HMG,4000 ersetzt durch quilin
	["OPT_O_T_MRAP_02_ghex_F"],						// Ifrit,5000
	["OPT_O_T_MRAP_02_hmg_ghex_F"],					// Ifrit HMG,25000
	["OPT_O_T_MRAP_02_gmg_ghex_F"],					// Ifrit GMG,31000
	["OPT_O_T_Truck_03_covered_ghex_F"],				// Tempest Transport,8000
	["OPT_O_T_Truck_03_repair_ghex_F"],					// Tempest Repair,10000 ersetzt durch container
	["OPT_O_T_Truck_03_ammo_ghex_F"],					// Tempest Ammo,50000 ersetzt durch container
	["OPT_O_T_Truck_03_fuel_ghex_F"],						// Tempest Fuel,10000 ersetzt durch container
	["OPT_O_T_Truck_03_medical_ghex_F"],				// Tempest Medical,10000 ersetzt durch container
	["OPT_O_T_Truck_03_transport_ghex_F"],				// Tempest (für Radar, keine Sitze auf Ladefläche)
	["OPT_O_T_LSV_02_unarmed_F"], 						// Quilin unarmed
	["OPT_O_T_LSV_02_armed_F"], 						// Quilin armed
// CSAT Helicopter
	["OPT_O_Heli_Light_03_unarmed_F"],					// WY-55 Hellcat,70000
	["OPT_O_Heli_Light_03_unarmed_green_F"],			// WY-55 Hellcat,70000
	["OPT_O_Heli_Light_03_F"],							// WY-55 Hellcat (DAR),170000	
	["OPT_O_Heli_Light_03_green_F"],					// WY-55 Hellcat (DAR),170000	
	["OPT_O_Heli_Light_02_unarmed_F"],					// PO-30 Orca,100000
	["OPT_O_Heli_Light_02_unarmed_black_F"],			// PO-30 Orca,100000
	["OPT_O_Heli_Light_02_v2_F"],							// PO-30 Orca (DAR),200000
	["OPT_O_Heli_Light_02_v2_black_F"],				// PO-30 Orca (DAR),200000
	["OPT_O_Heli_Light_02_F"],							// PO-30 Orca (DAGR),400000 - erstma raus wegen DAGR-problematik
	["OPT_O_Heli_Light_02_black_F"],					// PO-30 Orca (DAGR),400000 - erstma raus wegen DAGR-problematik
	["OPT_O_Heli_Transport_04_F"],						// Mi-290 Taru (Lift),85000
	["OPT_O_Heli_Transport_04_black_F"],				// Mi-290 Taru (Lift),85000
	["OPT_O_Heli_Transport_04_bench_F"],					// Mi-290 Taru (Bench),90000
	["OPT_O_Heli_Transport_04_bench_black_F"],		// Mi-290 Taru (Bench),90000
	["OPT_O_Heli_Transport_04_covered_F"], 				// Mi-290 Taru (Transport),110000
	["OPT_O_Heli_Transport_04_covered_black_F"], 	// Mi-290 Taru (Transport),110000
	["OPT_O_Heli_Transport_02_F"],					// CH-49 Mohawk (Transport+Lift),150000	
	["OPT_O_Heli_Attack_02_F"],							// Mi-48 Kajman,800000	
	["OPT_O_Heli_Attack_02_black_F"],				// Mi-48 Kajman (Schwarz),800000	
	["OPT_O_Plane_Fighter_03_CAS_F"],				// A-143 Buzzard (CAS),450000
	["OPT_O_Plane_Fighter_03_AA_F"],					// A-143 Buzzard (AA),500000
	["OPT_O_Plane_CAS_02_F"],						// To-199 Neophron,560000
	["OPT_O_UAV_02_light_F"],						// Ababil unbewaffnet,300000
	["OPT_O_UAV_02_CAS_F"],							// Ababil GBU-12,400000
	["OPT_O_UAV_02_F"],								// Ababil Scarpel,600000
	["O_T_UAV_04_CAS_F"],									// KH-3A Fenghuan, 400000 - noch in arbeit erstma nur testweise mit preis eingebaut
	["OPT_O_T_VTOL_02_infantry_F"],					// Y-32 Xi'an (Inf-Transport), 180000
	["OPT_O_T_VTOL_02_vehicle_F"],					// Y-32 Xi'an (Fahrzeug-Transport), 200000
	["OPT_O_T_VTOL_02_infantry_unarmed_F"],			// Y-32 Xi'an (Inf-Transport), 180000
	["OPT_O_T_VTOL_02_vehicle_unarmed_F"],			// Y-32 Xi'an (Fahrzeug-Transport), 180000
// CSAT Armored
	["OPT_O_T_APC_Wheeled_02_rcws_ghex_F"],			// MSE-3 Marid,55000
	["OPT_O_APC_Wheeled_03_cannon_light_F"],			// AFV-4 Gorgon (Leicht),70000
	["OPT_O_APC_Wheeled_03_cannon_F"],				// AFV-4 Gorgon,120000
	["OPT_O_T_APC_Tracked_02_cannon_ghex_light_F"],	// BTR-K Kamysh,100000
	["OPT_O_T_APC_Tracked_02_cannon_ghex_F"],		// BTR-K Kamysh (Titan),280000
	["OPT_O_T_APC_Tracked_02_AA_ghex_F"],			// ZSU-39 Tigris,275000
	["OPT_O_T_MBT_02_cannon_ghex_F"],				// T-100 Varsuk,450000	
	["OPT_O_T_MBT_02_arty_ghex_F"],					// 2S9 Sochor,650000 <-- Psycho, Preis runter solange es die zusätzliche Munition nicht gibt	
// CSAT Supplies
   	["OPT_O_supplyCrate_F"],							// Transportkiste,500
	["OPT_O_CargoNet_01_ammo_F"],						// Ausrüstungskiste,5000
	["OPT_Box_East_WpsSpecial_Diver_F"],				// Taucherkiste,5000
	["OPT_Box_East_WpsSpecial_AA_F"],					// AA Raketenkiste,40000
	["OPT_Box_East_WpsSpecial_F"],            		// AT Raketenkiste (RPG-42),30000
	["OPT_Box_East_Ammo_F"],            				// Munitionskiste,40000	
   	["OPT_Box_East_Grenades_F"],            			// Explosivkiste,75000	
	["OPT_Box_East_WpsLaunch_F"],							// HAT-Kiste (Titan),400000	
	["OPT_O_HMG_01_F"],								// Stand-MG niedrig,10000	
	["OPT_O_HMG_01_high_F"],							// Stand-MG hoch,10000
	["OPT_O_GMG_01_F"],								// Stand-GMG niedrig,15000
	["OPT_O_GMG_01_high_F"],							// Stand-GMG hoch,15000	
	["OPT_O_static_AA_F"],							// Stand-AA,25000
	["OPT_O_static_AT_F"],							// Stand-AT,200000	
	["OPT_O_Mortar_01_F"],							// MK6 Mörser,200000
	["OPT_O_Static_Designator_02_F"],					// Remote Designator,10000
	["OPT_O_T_UGV_01_ghex_F"],							// UGV Saif,2000 	
	["OPT_O_UAV_01_F"],								// Tayran AR-2,30000
	["OPT_Land_Pod_Heli_Transport_04_fuel_F",0],			// Fuelcontainer,5000
	["OPT_Land_Pod_Heli_Transport_04_fuel_black_F"],	// Fuelcontainer (schwarz),5000
   	["OPT_Land_Pod_Heli_Transport_04_ammo_F"],			// Munitionscontainer,50000
	["OPT_Land_Pod_Heli_Transport_04_ammo_black_F"],	// Munitionscontainer (Schwarz),50000
   	["OPT_Land_Pod_Heli_Transport_04_repair_F"],			// Reparaturcontainer,5000
	["OPT_Land_Pod_Heli_Transport_04_repair_black_F"],	// Reparaturcontainer (schwarz),5000
	["OPT_Land_Pod_Heli_Transport_04_repair_black_radar_F"],	// Radar Container
	["OPT_Land_Pod_Heli_Transport_04_medevac_F"],			// Lazarettcontainer,5000			//psycho, dieser container verursacht Probleme mit den Load-Scripts und wird durch den weißen Container ersetzt welcher zum Lazarett ausgebaut werden kann
// CSAT Ships
	["OPT_O_Boat_Transport_01_F"],						// Assault Boat,500
	["OPT_O_Boat_Armed_01_hmg_F"],					// Speedboat HMG,14000
	["OPT_O_C_Boat_Transport_02_F"],					// rhib unbewaffnet,7000	
	["OPT_O_SDV_01_F"]									// Submarine,2000	
];

// Add Vehicles to MT Dialog
#define mt_dialog 10000
#define mt_vehiclelist 10100

private ["_display", "_listbox", "_displayName"];

disableSerialization;

_display = findDisplay mt_dialog;
_listbox = _display displayCtrl mt_vehiclelist;

{
	_displayName = getText (configFile >> "CfgVehicles" >> (_x select 0) >> "displayName");
	_listbox lbAdd format["%1", _displayName];
} forEach opt_mt_Vehicles;