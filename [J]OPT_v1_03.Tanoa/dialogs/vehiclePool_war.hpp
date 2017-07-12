// Psycho: um Fahrzeuge zu deaktivieren: Kosten <= 0 setzen!

opt_vehiclesNato = [
	["OPT_B_Quadbike_01_F",1500],							// Quadbike, von 500
	["OPT_B_G_Offroad_01_F",0],								// Pickup,1000, ersetzt durch Prawler
	["OPT_B_G_Offroad_01_armed_F",0],						// Pickup HMG,4000, ersetzt durch Prawler
	["OPT_B_MRAP_01_F",5000],								// Hunter,4500
	["OPT_B_MRAP_01_hmg_F",25000],							// Hunter HMG,24500
	["OPT_B_MRAP_01_gmg_F",30000],							// Hunter GMG,30500
	["OPT_B_MRAP_03_F",0],									// Strider,6500 fliegt raus
	["OPT_B_MRAP_03_hmg_F",0],								// Strider HMG,26500 fliegt raus
	["OPT_B_MRAP_03_gmg_F",35000],							// Strider GMG,32500
	["OPT_B_Truck_01_covered_F",8000], 						// HEMTT Transport,8000
	["OPT_B_Truck_01_Repair_F",10000], 							// HEMTT Repair,10000 ersetzt durch Container
	["OPT_B_Truck_01_ammo_F",50000], 						// HEMTT Ammo,50000 ersetzt durch Container
	["OPT_B_Truck_01_fuel_F",10000], 							// HEMTT Fuel,10000 ersetzt durch Container
	["OPT_B_Truck_01_medical_F",10000], 					// HEMTT Medical,10000 ersetzt durch Container
	["B_Truck_01_mover_F",0], 								// HEMTT 2000 (für Radar Container, keine Sitze auf Ladefläche)
	["OPT_B_Truck_01_transport_F",2000], 					// HEMTT 2000 (für Radar Container, keine Sitze auf Ladefläche)
	["OPT_B_T_LSV_01_unarmed_F",3000], 						// Prowler unarmed, 2000
	["OPT_B_T_LSV_01_armed_F",4500] 						// Prowler armed, 4000
];
	
opt_choppersNato = [
	["OPT_B_Heli_Light_01_F",60000],						// MH-9 Hummingbird,70000
	["OPT_B_Heli_Light_01_armed_F",150000],					// AH-9 Pawnee,150000
	["OPT_B_Heli_Light_01_armed_2_F",0],					// AH-9 Pawnee DAGR,350000 - erstma raus wegen DAGR-problematik
	["OPT_B_Heli_Transport_01_F",90000],					// UH-80 Ghosthawk,130000
	["OPT_B_Heli_Transport_02_F",0],						// CH-49 Mohawk (Transport+Lift),150000
	["OPT_B_Heli_Attack_01_F",650000],						// AH-99 Blackfoot,750000
	["OPT_B_Heli_Transport_03_unarmed_F",150000],			// CH-67 Huron unarmed (Transport+Lift),150000
	["OPT_B_Heli_Transport_03_F",170000],					// CH-67 Huron armed (Transport+Lift),170000
	["OPT_B_Plane_CAS_01_F",550000],						// A-164 Wipeout,540000
	["OPT_B_UAV_02_light_F",300000],						// Greyhawk unbewaffnet,300000
	["OPT_B_UAV_02_CAS_F",400000],							// Greyhawk LGB,400000	
	["OPT_B_UAV_02_F",380000],								// Greyhawk Raketen,600000
	["OPT_B_UAV_02_AA_F",400000],								// Greyhawk AA-Raketen,400000	
	["OPT_B_T_UAV_03_dynamicLoadout_F",650000],									// MQ12-Falcon - noch in arbeit erstma nur testweise mit preis eingebaut
	["OPT_B_Plane_Fighter_AA_01_F",500000],					//  F/A-181 Black Wasp II (AA)
	["OPT_B_T_VTOL_01_infantry_F",180000],					// Blackfish (Inf-Transport)
	["OPT_B_T_VTOL_01_vehicle_F",180000],					// Blackfish (Fahrzeug-Transport)
	["OPT_B_T_VTOL_01_armed_F",700000]						// Blackfish BEWAFFNET
];
	
opt_armoredNato = [
	["OPT_B_APC_Wheeled_01_cannon_light_F",90000],			// AMV-7 Marshall (Leicht),70000
	["OPT_B_APC_Wheeled_01_cannon_F",150000],				// AMV-7 Marshall,120000
	["OPT_B_APC_Tracked_01_rcws_F",45000],					// IFV-6c Panther,45000
	["OPT_B_APC_tracked_03_cannon_F",100000],				// FV-720 Mora,100000
	["OPT_B_APC_Tracked_01_AA_F",275000],					// IFV-6a Cheetah,275000
	["OPT_B_MBT_01_cannon_F",340000],						// M2A4 Slammer,340000
	["OPT_B_MBT_01_TUSK_F",430000],							// M2A4 SlammerUp,430000
	["OPT_B_MBT_03_cannon_F",0],							// MBT-52 Kuma,500000 fliegt raus
	["OPT_B_MBT_01_mlrs_F",400000],							// M5 Sandstorm,600000	
	["OPT_B_MBT_01_Arty_F",400000]							// M4 Scorcher,650000 <-- Psycho, Preis runter solange es die zusätzliche Munition nicht gibt	
];

opt_suppliesNato = [
   	["OPT_B_supplyCrate_F",500],							// Transportkiste (leer),500
	["OPT_B_CargoNet_01_ammo_F",5000],						// Ausrüstungskiste,5000
	["OPT_Box_NATO_WpsSpecial_Diver_F",5000],				// Taucherkiste,5000	
	["OPT_Box_NATO_Ammo_F",40000],            				// Munitionskiste,40000
    ["OPT_Box_NATO_Grenades_F",75000],         				// Explosivkiste,75000
  	["OPT_Box_NATO_WpsSpecial_F",0],						// PCML-M Raketenkiste,30000
	["OPT_Box_NATO_WpsSpecial_AT_F",0],						// PCML Raketenkiste,100000
	["OPT_Box_NATO_WpsSpecial_AT2_F",30000],				// AT Raketenkiste (RPG-42),30000
	["OPT_Box_NATO_WpsSpecial_AA_F",40000],					// AA Raketenkiste,40000	
	["OPT_Box_NATO_WpsLaunch_F",0],							// HAT-Kiste (Titan),400000
	["OPT_B_HMG_01_F",10000],								// Stand-MG niedrig,10000
	["OPT_B_HMG_01_high_F",10000],							// Stand-MG hoch,10000
	["OPT_B_GMG_01_F",15000],								// Stand-GMG niedrig,15000
	["OPT_B_GMG_01_high_F",15000],							// Stand-GMG hoch,15000
	["OPT_B_static_AA_F",25000],							// Stand-AA,25000
	["OPT_B_static_AT_F",200000],							// Stand-AT,200000	
	["OPT_B_Mortar_01_F",200000],							// MK6 - Mörser,200000	
	["OPT_B_Static_Designator_01_F",10000],					// Remote Designator,10000
	["OPT_B_UGV_01_F",2000],								// UGV Stomper,2000
	["OPT_B_UAV_01_F",30000],								// Darter AR-2,30000
	["OPT_FlexibleTank_01_forest_F",0],						// Treibstoff-Fass
  	["OPT_B_Slingload_01_Fuel_F",8000],           			// Fuelcontainer,5000
    ["OPT_B_Slingload_01_Ammo_F",90000],            		// Munitionscontainer,50000
    ["OPT_B_Slingload_01_Repair_F",8000], 	       			// Reparaturcontainer,5000
	["OPT_B_Slingload_01_Repair_radar_F",1000], 	       	// Radar Container
   	["OPT_B_Slingload_01_Medevac_F",0],          			// Lazarettcontainer,5000			//psycho, dieser container verursacht Probleme mit den Load-Scripts und wird durch den weißen Container ersetzt welcher zum Lazarett ausgebaut werden kann
	["Land_Cargo20_white_F",0],								// weißer Container (Lazarett)
	["Land_BagFence_Round_F",0],							// runde sandsackecke!
	["Land_BagFence_Long_F",0],								// lange sandsackbarriere
	["Land_BagFence_Short_F",0],							// kurze sandsackbarriere
	["Land_HBarrier_5_F",0],								// H-barrier 5 blocks
	["Land_HBarrierBig_F",0],								// H-barrier 4 blocks
	["Land_HBarrier_3_F",0],								// H-Barrier 3 blocks
	["Land_Razorwire_F",0],									// Stacheldraht
	["Land_CncBarrier_F",0],								// beton barriere
	["Land_CncBarrierMedium_F",0],							// beton barriere (mittel)
	["Land_CncBarrierMedium4_F",0],							// beton barriere (mittel - lang)
	["Land_Mil_WiredFence_F",0],							// maschendrahtzaun
	["CamoNet_BLUFOR_big_Curator_F",0]						// Camonet zum testen!
];

opt_seaNato = [
	["OPT_B_Boat_Transport_01_F",500],						// Assault Boat,500
	["OPT_B_Boat_Armed_01_minigun_F",10000],				// Speedboat Minigun,10000
	["OPT_B_SDV_01_F",2000],									// Submarine,2000
	["OPT_B_C_Boat_Transport_02_F",7000]					// Rhib unbewaffnet,2000
];

opt_vehiclesCsat = [
	["OPT_O_T_Quadbike_01_ghex_F",1500],					// Quadbike,500
	["OPT_O_G_Offroad_01_F",0],								// Pickup,1000 ersetzt durch quilin
	["OPT_O_G_Offroad_01_armed_F",0],						// Pickup HMG,4000 ersetzt durch quilin
	["OPT_O_T_MRAP_02_ghex_F",5500],						// Ifrit,5000
	["OPT_O_T_MRAP_02_hmg_ghex_F",25500],					// Ifrit HMG,25000
	["OPT_O_T_MRAP_02_gmg_ghex_F",31000],					// Ifrit GMG,31000
	["OPT_O_T_Truck_03_covered_ghex_F",8000],				// Tempest Transport,8000
	["OPT_O_T_Truck_03_repair_ghex_F",10000],					// Tempest Repair,10000 ersetzt durch container
	["OPT_O_T_Truck_03_ammo_ghex_F",50000],					// Tempest Ammo,50000 ersetzt durch container
	["OPT_O_T_Truck_03_fuel_ghex_F",10000],						// Tempest Fuel,10000 ersetzt durch container
	["OPT_O_T_Truck_03_medical_ghex_F",10000],				// Tempest Medical,10000 ersetzt durch container
	["OPT_O_T_Truck_03_transport_ghex_F",2000],				// Tempest (für Radar, keine Sitze auf Ladefläche)
	["OPT_O_T_LSV_02_unarmed_F",3000], 						// Quilin unarmed
	["OPT_O_T_LSV_02_armed_F",4500] 						// Quilin armed
];

opt_choppersCsat = [
	["OPT_O_Heli_Light_03_unarmed_F",60000],					// WY-55 Hellcat,70000
	["OPT_O_Heli_Light_03_unarmed_green_F",0],			// WY-55 Hellcat,70000
	["OPT_O_Heli_Light_03_F",180000],							// WY-55 Hellcat (DAR),170000	
	["OPT_O_Heli_Light_03_green_F",0],					// WY-55 Hellcat (DAR),170000	
	["OPT_O_Heli_Light_02_unarmed_F",0],					// PO-30 Orca,100000
	["OPT_O_Heli_Light_02_unarmed_black_F",70000],			// PO-30 Orca,100000
	["OPT_O_Heli_Light_02_v2_F",0],							// PO-30 Orca (DAR),200000
	["OPT_O_Heli_Light_02_v2_black_F",190000],				// PO-30 Orca (DAR),200000
	["OPT_O_Heli_Light_02_F",0],							// PO-30 Orca (DAGR),400000 - erstma raus wegen DAGR-problematik
	["OPT_O_Heli_Light_02_black_F",0],					// PO-30 Orca (DAGR),400000 - erstma raus wegen DAGR-problematik
	["OPT_O_Heli_Transport_04_F",0],						// Mi-290 Taru (Lift),85000
	["OPT_O_Heli_Transport_04_black_F",85000],				// Mi-290 Taru (Lift),85000
	["OPT_O_Heli_Transport_04_bench_F",0],					// Mi-290 Taru (Bench),90000
	["OPT_O_Heli_Transport_04_bench_black_F",90000],		// Mi-290 Taru (Bench),90000
	["OPT_O_Heli_Transport_04_covered_F",0], 				// Mi-290 Taru (Transport),110000
	["OPT_O_Heli_Transport_04_covered_black_F",110000], 	// Mi-290 Taru (Transport),110000
	["OPT_O_Heli_Transport_02_F",0],					// CH-49 Mohawk (Transport+Lift),150000	
	["OPT_O_Heli_Attack_02_F",0],							// Mi-48 Kajman,800000	
	["OPT_O_Heli_Attack_02_black_F",680000],				// Mi-48 Kajman (Schwarz),800000	
	["OPT_O_Plane_Fighter_03_CAS_F",450000],				// A-143 Buzzard (CAS),450000
	["OPT_O_Plane_Fighter_03_AA_F",470000],					// A-143 Buzzard (AA),500000
	["OPT_O_Plane_CAS_02_AA_F",0],						// To-199 Neophron light,250000 - raus
	["OPT_O_Plane_CAS_02_F",550000],						// To-199 Neophron,560000
	["OPT_O_UAV_02_light_F",300000],						// Ababil unbewaffnet,300000
	["OPT_O_UAV_02_CAS_F",400000],							// Ababil GBU-12,400000
	["OPT_O_UAV_02_F",380000],								// Ababil Scarpel,600000
	["OPT_O_UAV_02_AA_F",400000],							// Ababil AA,600000
	["OPT_O_T_UAV_04_CAS_F",650000],							// KH-3A Fenghuan, 400000 - noch in arbeit erstma nur testweise mit preis eingebaut
	["OPT_O_Plane_Fighter_AA_02_F",500000],					// To-201 Shikra (AA)
	["OPT_O_T_VTOL_02_infantry_F",780000],					// Y-32 Xi'an (Inf-Transport), 180000
	["OPT_O_T_VTOL_02_vehicle_F",780000],					// Y-32 Xi'an (Fahrzeug-Transport), 200000
	["OPT_O_T_VTOL_02_infantry_unarmed_F",180000],			// Y-32 Xi'an (Inf-Transport), 180000
	["OPT_O_T_VTOL_02_vehicle_unarmed_F",180000]			// Y-32 Xi'an (Fahrzeug-Transport), 180000
];
	
opt_armoredCsat = [
	["OPT_O_T_APC_Wheeled_02_rcws_ghex_F",55000],			// MSE-3 Marid,55000
	["OPT_O_APC_Wheeled_03_cannon_light_F",90000],			// AFV-4 Gorgon (Leicht),70000
	["OPT_O_APC_Wheeled_03_cannon_F",150000],				// AFV-4 Gorgon,120000
	["OPT_O_T_APC_Tracked_02_cannon_ghex_light_F",130000],	// BTR-K Kamysh,100000
	["OPT_O_T_APC_Tracked_02_cannon_ghex_F",280000],		// BTR-K Kamysh (Titan),280000
	["OPT_O_T_APC_Tracked_02_AA_ghex_F",275000],			// ZSU-39 Tigris,275000
	["OPT_O_T_MBT_02_cannon_ghex_F",450000],				// T-100 Varsuk,450000	
	["OPT_O_T_MBT_02_arty_ghex_F",400000]					// 2S9 Sochor,650000 <-- Psycho, Preis runter solange es die zusätzliche Munition nicht gibt	
];

opt_suppliesCsat = [
   	["OPT_O_supplyCrate_F",500],							// Transportkiste,500
	["OPT_O_CargoNet_01_ammo_F",5000],						// Ausrüstungskiste,5000
	["OPT_Box_East_WpsSpecial_Diver_F",5000],				// Taucherkiste,5000
	["OPT_Box_East_WpsSpecial_AA_F",40000],					// AA Raketenkiste,40000
	["OPT_Box_East_WpsSpecial_F",30000],            		// AT Raketenkiste (RPG-42),30000
	["OPT_Box_East_Ammo_F",40000],            				// Munitionskiste,40000	
   	["OPT_Box_East_Grenades_F",75000],            			// Explosivkiste,75000	
	["OPT_Box_East_WpsLaunch_F",0],							// HAT-Kiste (Titan),400000	
	["OPT_O_HMG_01_F",10000],								// Stand-MG niedrig,10000	
	["OPT_O_HMG_01_high_F",10000],							// Stand-MG hoch,10000
	["OPT_O_GMG_01_F",15000],								// Stand-GMG niedrig,15000
	["OPT_O_GMG_01_high_F",15000],							// Stand-GMG hoch,15000	
	["OPT_O_static_AA_F",25000],							// Stand-AA,25000
	["OPT_O_static_AT_F",200000],							// Stand-AT,200000	
	["OPT_O_Mortar_01_F",200000],							// MK6 Mörser,200000
	["OPT_O_Static_Designator_02_F",10000],					// Remote Designator,10000
	["OPT_O_T_UGV_01_ghex_F",2000],							// UGV Saif,2000 	
	["OPT_O_UAV_01_F",30000],								// Tayran AR-2,30000
	["OPT_FlexibleTank_01_sand_F",0],						// Treibstoff-Fass
	["OPT_Land_Pod_Heli_Transport_04_fuel_F",0],			// Fuelcontainer,5000
	["OPT_Land_Pod_Heli_Transport_04_fuel_black_F",8000],	// Fuelcontainer (schwarz),5000
   	["OPT_Land_Pod_Heli_Transport_04_ammo_F",0],			// Munitionscontainer,50000
	["OPT_Land_Pod_Heli_Transport_04_ammo_black_F",73000],	// Munitionscontainer (Schwarz),50000
   	["OPT_Land_Pod_Heli_Transport_04_repair_F",0],			// Reparaturcontainer,5000
	["OPT_Land_Pod_Heli_Transport_04_repair_black_F",8000],	// Reparaturcontainer (schwarz),5000
	["OPT_Land_Pod_Heli_Transport_04_repair_black_radar_F",1000],	// Radar Container
	["OPT_Land_Pod_Heli_Transport_04_medevac_F",0],			// Lazarettcontainer,5000			//psycho, dieser container verursacht Probleme mit den Load-Scripts und wird durch den weißen Container ersetzt welcher zum Lazarett ausgebaut werden kann
	["Land_Cargo20_white_F",0],								// weißer Container (Lazarett)
	["Land_BagFence_Round_F",0],							// runde sandsackecke!
	["Land_BagFence_Long_F",0],								// lange sandsackbarriere
	["Land_BagFence_Short_F",0],							// kurze sandsackbarriere
	["Land_HBarrier_5_F",0],								// H-barrier 5 blocks
	["Land_HBarrierBig_F",0],								// H-barrier 4 blocks
	["Land_HBarrier_3_F",0],								// H-Barrier 3 blocks
	["Land_Razorwire_F",0],									// Stacheldraht
	["Land_CncBarrier_F",0],								// beton barriere
	["Land_CncBarrierMedium_F",0],							// beton barriere (mittel)
	["Land_CncBarrierMedium4_F",0],							// beton barriere (mittel - lang)
	["Land_Mil_WiredFence_F",0],							// maschendrahtzaun
	["CamoNet_BLUFOR_big_Curator_F",0]						// Camonet zum testen!
];

opt_seaCsat = [
	["OPT_O_Boat_Transport_01_F",500],						// Assault Boat,500
	["OPT_O_Boat_Armed_01_hmg_F",14000],					// Speedboat HMG,14000
	["OPT_O_C_Boat_Transport_02_F",7000],					// rhib unbewaffnet,7000	
	["OPT_O_SDV_01_F",2000]									// Submarine,2000	
];