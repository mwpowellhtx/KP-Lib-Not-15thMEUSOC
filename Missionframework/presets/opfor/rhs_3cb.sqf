/*
Needed Mods:
- RHS AFRF
- 3CB Factions

Optional Mods:
- None
*/

// Enemy infantry classes
opfor_officer = "rhs_vmf_flora_officer";									//Officer
opfor_squad_leader = "rhs_vmf_flora_sergeant";								//Squad Leader
opfor_team_leader = "rhs_vmf_flora_efreitor";								//Team Leader
opfor_sentry = "rhs_vmf_flora_rifleman_lite";								//Rifleman (Lite)
opfor_rifleman = "rhs_vmf_flora_rifleman";									//Rifleman
opfor_rpg = "rhs_vmf_flora_LAT";											//Rifleman (LAT)
opfor_grenadier = "rhs_vmf_flora_grenadier";								//Grenadier
opfor_machinegunner = "rhs_vmf_recon_arifleman";							//Autorifleman
opfor_heavygunner = "rhs_vmf_flora_machinegunner";							//Heavy Gunner
opfor_marksman = "rhs_vmf_flora_marksman";									//Marksman
opfor_at = "rhs_vmf_flora_at";												//AT Specialist
opfor_aa = "rhs_vmf_flora_aa";												//AA Specialist
opfor_medic = "rhs_vmf_flora_medic";										//Combat Life Saver
opfor_engineer = "rhs_vmf_flora_engineer";									//Engineer
opfor_paratrooper = "rhs_vmf_flora_RShG2";									//Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "rhs_tigr_msv";											//GAZ-233011
opfor_mrap_armed = "rhs_tigr_sts_msv";									//GAZ-233014 (Armed)
opfor_transport_helo = "RHS_Mi8mt_Cargo_vvsc";							//Mi-8MT (Cargo)
opfor_transport_truck = "RHS_Ural_MSV_01";								//Ural-4320 Transport (Covered)
opfor_ammobox_transport = "RHS_Ural_Open_MSV_01";						//Ural-4320 Transport (Open) -> Has to be able to transport resource crates!
opfor_fuel_truck = "RHS_Ural_Fuel_MSV_01";								//Ural-4320 Fuel
opfor_ammo_truck = "rhs_gaz66_ammo_msv";								//GAZ-66 Ammo
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";				//Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";				//Taru Ammo Pod
opfor_flag = "rhs_Flag_Russia_F";										//Russian Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
	"rhs_vmf_flora_rifleman",												//Rifleman
	"rhs_vmf_flora_rifleman",												//Rifleman
	"rhs_vmf_flora_LAT",													//Rifleman (AT)
	"rhs_vmf_flora_machinegunner",											//Machinegunner
	"rhs_vmf_flora_marksman",												//Marksman
	"rhs_vmf_flora_medic",													//Medic
	"rhs_vmf_flora_engineer",												//Engineer
	"rhs_vmf_flora_aa",														//AA Specialist
	"rhs_vmf_flora_at",														//AT Specialist
	"rhs_vmf_flora_grenadier"												//Grenadier
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders.
militia_vehicles = [
	"rhs_tigr_sts_msv",													//GAZ-233014 (Armed)
	"rhs_btr70_msv",													//BTR-70
	"rhs_bmp2d_msv"														//BMP-2D
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
	"rhs_tigr_sts_msv",													//GAZ-233014 (Armed)
	"rhs_bmp2d_vmf",													//BMP-2D
	"rhs_bmp2k_vmf",													//BMP-2K
	"rhs_bmp1k_vmf",													//BMP-1K
	"rhs_zsu23_vmf",													//ZSU-23-4V
	"UK3CB_CW_SOV_O_EARLY_Ural_Zu23",									//Ural-ZU23
	"UK3CB_CW_SOV_O_LATE_T55",											//T-55A
	"rhs_t72bc_tv",														//T72B 1989
	"rhs_t80",															//T80
	"rhs_t80bv",														//T80BV
	"rhs_t90a_tv"														//T90A
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
	"rhs_tigr_sts_msv",													//GAZ-233014 (Armed)
	"rhs_tigr_sts_msv",													//GAZ-233014 (Armed)
	"UK3CB_CW_SOV_O_LATE_T55",											//T-55A
	"rhs_btr70_msv",													//BTR-70
	"rhs_btr80_msv",													//BTR-80
	"rhs_btr80a_msv"													//BTR-80A
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
	"rhs_tigr_sts_msv",													//GAZ-233014 (Armed)
	"rhs_tigr_sts_msv",													//GAZ-233014 (Armed)
	"rhs_tigr_sts_msv",													//GAZ-233014 (Armed)
	"RHS_Ural_Open_MSV_01",												//Ural-4320 Transport
	"RHS_Ural_MSV_01",													//Ural-4320 Transport (Covered)
	"rhs_btr70_msv",													//BTR-70
	"rhs_btr80_msv",													//BTR-80
	"rhs_btr80a_msv",													//BTR-80A
	"rhs_bmp2d_msv",													//BMP-2D
	"rhs_bmp2k_msv",													//BMP-2K
	"rhs_brm1k_msv",													//BRM-1K
	"rhs_zsu234_aa",													//ZSU-23-4V
	"rhs_zsu234_aa",													//ZSU-23-4V
	"UK3CB_CW_SOV_O_LATE_T55",											//T-55A
	"rhs_t80",															//T80
	"rhs_t80bv",														//T80BV
	"rhs_t72bc_tv",														//T72B
	"UK3CB_CW_SOV_O_LATE_Su25SM",										//Su-25
	"UK3CB_CW_SOV_O_LATE_Su25SM_KH29",									//Su-25 (KH29)
	"UK3CB_CW_SOV_O_LATE_MIG29S",										//Mig 29S
	"RHS_Mi24P_AT_vvsc",												//Mi-24P (AT)
	"RHS_Mi24V_AT_vvsc",												//Mi-24V (AT)
	"RHS_Mi8mt_Cargo_vvsc",												//Mi-8MT (Cargo)
	"RHS_Ka52_vvsc"														//Ka-52
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
	"rhs_tigr_msv",														//GAZ-233011
	"rhs_tigr_sts_msv",													//GAZ-233014 (Armed)
	"rhs_tigr_sts_msv",													//GAZ-233014 (Armed)
	"RHS_Ural_Open_MSV_01",												//Ural-4320 Transport
	"rhs_btr70_msv",													//BTR-70
	"rhs_btr80_msv",													//BTR-80
	"rhs_btr80a_msv",													//BTR-80A
	"UK3CB_CW_SOV_O_LATE_T55",											//T-55A
	"rhs_zsu234_aa",													//ZSU-23-4V
	"RHS_Mi24P_AT_vvsc",												//Mi-24P (AT)
	"RHS_Mi24V_AT_vvsc",												//Mi-24V (AT)
	"RHS_Mi8mt_Cargo_vvsc"												//Mi-8MT (Cargo)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.	*/
opfor_troup_transports = [
	"RHS_Ural_Open_MSV_01",												//Ural-4320 Transport
	"RHS_Ural_MSV_01",													//Ural-4320 Transport (Covered)
	"rhs_btr80_msv",													//BTR-80
	"rhs_btr80a_msv",													//BTR-80A
	"rhs_bmp2d_msv",													//BMP-2D
	"RHS_Mi8mt_Cargo_vvsc",												//Mi-8MT (Cargo)
	"RHS_Mi24P_AT_vvsc",												//Mi-24P (AT)
	"RHS_Mi24V_AT_vvsc"													//Mi-24V (AT)
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
	"RHS_Mi8mt_Cargo_vvsc",												//Mi-8MT (Cargo)
	"RHS_Mi24P_AT_vvsc",												//Mi-24P (AT)
	"RHS_Mi24V_AT_vvsc",												//Mi-24V (AT)
	"RHS_Ka52_vvsc"														//Ka-52
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
	"UK3CB_CW_SOV_O_LATE_Su25SM",										//Su-25
	"UK3CB_CW_SOV_O_LATE_Su25SM_KH29",									//Su-25 (KH29)
	"UK3CB_CW_SOV_O_LATE_MIG29S"										//Mig 29S
];
