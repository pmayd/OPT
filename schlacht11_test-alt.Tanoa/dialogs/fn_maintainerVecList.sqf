/*
	Order Maintainer Vehicles

	Author: schmingo (OPT MOD Team)

	v2015-01-21 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/

opt_mt_Vehicles = [
// NATO Vehicles
	["OPT_B_Quadbike_01_F"],				// Quadbike
	["OPT_B_G_Offroad_01_F"],				// Pickup
	["OPT_B_G_Offroad_01_armed_F"],			// Pickup HMG
	["OPT_B_MRAP_03_F"],					// Strider 
	["OPT_B_MRAP_03_hmg_F"],				// Strider HMG
	["OPT_B_MRAP_03_gmg_F"],				// Strider GMG
	["OPT_B_MRAP_01_F"],					// Hunter
	["OPT_B_MRAP_01_hmg_F"],				// Hunter HMG
	["OPT_B_MRAP_01_gmg_F"],				// Hunter GMG
	["OPT_B_Truck_01_covered_F"], 			// HEMTT Transport
	["OPT_B_Truck_01_Repair_F"], 			// HEMTT Repair
	["OPT_B_Truck_01_ammo_F"], 				// HEMTT Ammo
	["OPT_B_Truck_01_fuel_F"], 				// HEMTT Fuel
	["OPT_B_Truck_01_medical_F"], 			// HEMTT Medical
	["OPT_B_APC_Wheeled_01_cannon_F"],		// AMV-7 Marshall
	["OPT_B_APC_Wheeled_01_cannon_light_F"],// AMV-7 Marshall (Leicht)
// NATO Helicopter
	["OPT_B_Heli_Attack_01_F"],				// AH-99 Blackfoot
	["OPT_B_Heli_Transport_03_unarmed_F"],	// CH-67 Huron unarmed (Transport+Lift)
	["OPT_B_Heli_Transport_03_F"],			// CH-67 Huron armed (Transport+Lift)
	["OPT_B_Heli_Transport_02_F"],			// CH-49 Mohawk (Transport+Lift)
	["OPT_B_Heli_Light_01_armed_F"],		// AH-9 Pawnee (DAR)
	["OPT_B_Heli_Light_01_armed_2_F"],		// AH-9 Pawnee (DAGR)
	["OPT_B_Heli_Light_01_F"],				// MH-9 Hummingbird
	["OPT_B_Heli_Transport_01_F"],			// UH-80 Ghosthawk
	["OPT_B_Plane_CAS_01_F"],				// A-164 Wipeout
	["OPT_B_UAV_02_F"],						// Greyhawk Scarpel
	["OPT_B_UAV_02_CAS_F"],					// Greyhawk GBU-12
	["OPT_B_UAV_02_light_F"],				// Greyhawk unbewaffnet
// NATO Armored
	["OPT_B_MBT_03_cannon_F"],				// MBT-52 Kuma
	["OPT_B_MBT_01_cannon_F"],				// M2A4 Slammer
	["OPT_B_MBT_01_TUSK_F"],				// M2A4 SlammerUp
	["OPT_B_APC_Tracked_01_rcws_F"],		// IFV-6c Panther
	["OPT_B_APC_Tracked_01_AA_F"],			// IFV-6a Cheetah
	["OPT_B_MBT_01_Arty_F"],				// M4 Scorcher
	["OPT_B_MBT_01_mlrs_F"],				// M5 Sandstorm
// NATO supplies
    ["OPT_B_supplyCrate_F"],							// Transportkiste (leer)
	["OPT_Box_NATO_WpsSpecial_Diver_F"],				// Taucherkiste	
	["OPT_B_CargoNet_01_ammo_F"],						// Ausrüstungskiste
	["OPT_Box_NATO_Ammo_F"],            				// Munitionskiste
    ["OPT_Box_NATO_Grenades_F"],         				// Explosivkiste  	
	["OPT_Box_NATO_WpsSpecial_F"],						// PCML-M Raketenkiste
	["OPT_Box_NATO_WpsSpecial_AT_F"],					// PCML Raketenkiste
	["OPT_Box_NATO_WpsSpecial_AA_F"],					// AA Raketenkiste
	["OPT_Box_NATO_WpsLaunch_F"],						// HAT-Kiste	
	["OPT_FlexibleTank_01_forest_F"],					// Treibstoff-Fass
  	["OPT_B_Slingload_01_Fuel_F"],           			// Fuelcontainer
    ["OPT_B_Slingload_01_Ammo_F"],            			// Munitionscontainer
    ["OPT_B_Slingload_01_Repair_F"], 	       			// Reparaturcontainer
   	["OPT_B_Slingload_01_Medevac_F"],          			// Lazarettcontainer
	["OPT_B_UGV_01_F"],									// UGV Stomper
	["OPT_B_UAV_01_F"],									// Darter AR-2
	["OPT_B_static_AT_F"],								// Stand-AT
	["OPT_B_static_AA_F"],								// Stand-AA
	["OPT_B_HMG_01_high_F"],							// Stand-MG hoch
	["OPT_B_HMG_01_F"],									// Stand-MG niedrig
	["OPT_B_GMG_01_F"],									// Stand-GMG niedrig
	["OPT_B_GMG_01_high_F"],							// Stand-GMG hoch
	["OPT_B_Mortar_01_F"],								// MK6 - Mörser	
	["OPT_B_Boat_Transport_01_F"],						// Assault Boat
	["OPT_B_Boat_Armed_01_minigun_F"],					// Speedboat Minigun
	["OPT_B_SDV_01_F"],									// Submarine
	
// CSAT Vehicles
	["OPT_O_Quadbike_01_F"],					// Quadbike
	["OPT_O_G_Offroad_01_F"],					// Pickup
	["OPT_O_G_Offroad_01_armed_F"],				// Pickup HMG
	["OPT_O_MRAP_02_F"],						// Ifrit
	["OPT_O_MRAP_02_hmg_F"],					// Ifrit HMG
	["OPT_O_MRAP_02_gmg_F"],					// Ifrit GMG
	["OPT_O_Truck_03_covered_F"],				// Tempest Transport
	["OPT_O_Truck_03_repair_F"],				// Tempest Repair
	["OPT_O_Truck_03_ammo_F"],					// Tempest Ammo
	["OPT_O_Truck_03_fuel_F"],					// Tempest Fuel
	["OPT_O_Truck_03_medical_F"],				// Tempest Medical
	["OPT_O_APC_Wheeled_03_cannon_F"],			// AFV-4 Gorgon
	["OPT_O_APC_Wheeled_03_cannon_light_F"],	// AFV-4 Gorgon (Leicht)
	["OPT_O_APC_Wheeled_02_rcws_F"],			// MSE-3 Marid
// CSAT Helicopter
	["OPT_O_Heli_Light_02_unarmed_F"],		// PO-30 Orca	
	["OPT_O_Heli_Light_02_F"],				// PO-30 Orca (DAGR)
	["OPT_O_Heli_Light_02_v2_F"],			// PO-30 Orca (DAR)
	["OPT_O_Heli_Light_03_F"],				// WY-55 Hellcat (DAR)
	["OPT_O_Heli_Light_03_unarmed_F"],		// WY-55 Hellcat
	["OPT_O_Heli_Attack_02_F"],				// Mi-48 Kajman
	["OPT_O_Heli_Transport_04_covered_F"], 	// Mi-290 Taru (Transport)
	["OPT_O_Heli_Transport_04_F"],			// Mi-290 Taru (Lift)
	["OPT_O_Heli_Transport_04_bench_F"],	// Mi-290 Taru (Bench)
	["OPT_O_Plane_CAS_02_F"],				// To-199 Neophron
	["OPT_O_Plane_Fighter_03_AA_F"],		// A-143 Buzzard (AA)
	["OPT_O_Plane_Fighter_03_CAS_F"],		// A-143 Buzzard (CAS)
	["OPT_O_UAV_02_F"],						// Ababil Scarpel
	["OPT_O_UAV_02_CAS_F"],					// Ababil GBU-12
	["OPT_O_UAV_02_light_F"],				// Ababil unbewaffnet
// CSAT Armored
	["OPT_O_MBT_02_cannon_F"],					// T-100 Varsuk
	["OPT_O_APC_Tracked_02_cannon_F"],			// BTR-K Kamysh (Titan)
	["OPT_O_APC_Tracked_02_cannon_light_F"],	// BTR-K Kamysh (Leicht)
	["OPT_O_APC_Tracked_02_AA_F"],				// ZSU-39 Tigris
	["OPT_O_MBT_02_arty_F"],					// 2S9 Sochor
// CSAT Supplies
   	["OPT_O_supplyCrate_F"],							// Transportkiste
	["OPT_Box_East_Ammo_F"],            				// Munitionskiste
   	["OPT_Box_East_Grenades_F"],            			// Explosivkiste
	["OPT_Box_East_WpsSpecial_Diver_F"],					// Taucherkiste
	["OPT_Box_East_WpsSpecial_AA_F"],					// AA Raketenkiste
   	["OPT_Box_East_WpsSpecial_F"],            			// AT Raketenkiste
	["OPT_O_CargoNet_01_ammo_F"],						// Ausrüstungskiste
	["OPT_Box_East_WpsLaunch_F"],						// HAT-Kiste
	["OPT_FlexibleTank_01_sand_F"],						// Treibstoff-Fass
   	["OPT_Land_Pod_Heli_Transport_04_fuel_F"],			// Fuelcontainer
   	["OPT_Land_Pod_Heli_Transport_04_ammo_F"],			// Munitionscontainer
   	["OPT_Land_Pod_Heli_Transport_04_repair_F"],		// Reparaturcontainer
	["OPT_Land_Pod_Heli_Transport_04_medevac_F"],		// Lazarettcontainer
	["OPT_O_UGV_01_F"],									// UGV Saif
 	["OPT_O_UAV_01_F"],									// Tayran AR-2
	["OPT_O_static_AT_F"],								// Stand-AT
	["OPT_O_static_AA_F"],								// Stand-AA
	["OPT_O_HMG_01_high_F"],							// Stand-MG hoch
	["OPT_O_HMG_01_F"],									// Stand-MG niedrig
	["OPT_O_Mortar_01_F"],								// MK6 Mörser
	["OPT_O_GMG_01_high_F"],							// Stand-GMG hoch
	["OPT_O_GMG_01_F"],									// Stand-GMG niedrig
	["OPT_O_Boat_Transport_01_F"],						// Assault Boat
	["OPT_O_Boat_Armed_01_hmg_F"],						// Speedboat HMG
	["OPT_O_SDV_01_F"]									// Submarine	
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