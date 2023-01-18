sleep 5;

if ([] call KP_liberation_victoryCheck && GRLIB_endgame != 1) then {
    GRLIB_endgame = 1;
    publicVariable "GRLIB_endgame";
    {_x allowDamage false; (vehicle _x) allowDamage false;} forEach allPlayers;

    private _rabbits = round (random 69) + round (random 69);

    publicstats = [];
    publicstats pushback stats_ammo_produced;
    publicstats pushback stats_ammo_spent;
    publicstats pushback stats_blufor_soldiers_killed;
    publicstats pushback stats_blufor_soldiers_recruited;
    publicstats pushback stats_blufor_teamkills;
    publicstats pushback stats_blufor_vehicles_built;
    publicstats pushback stats_blufor_vehicles_killed;
    publicstats pushback stats_civilian_buildings_destroyed;
    publicstats pushback stats_civilian_vehicles_killed;
    publicstats pushback stats_civilian_vehicles_killed_by_players;
    publicstats pushback stats_civilian_vehicles_seized;
    publicstats pushback stats_civilians_healed;
    publicstats pushback stats_civilians_killed;
    publicstats pushback stats_civilians_killed_by_players;
    publicstats pushback stats_fobs_built;
    publicstats pushback stats_fobs_lost;
    publicstats pushback stats_fuel_produced;
    publicstats pushback stats_fuel_spent;
    publicstats pushback stats_hostile_battlegroups;
    publicstats pushback stats_ieds_detonated;
    publicstats pushback stats_opfor_killed_by_players;
    publicstats pushback stats_opfor_soldiers_killed;
    publicstats pushback stats_opfor_vehicles_killed;
    publicstats pushback stats_opfor_vehicles_killed_by_players;
    publicstats pushback stats_player_deaths;
    publicstats pushback stats_playtime;
    publicstats pushback stats_prisoners_captured;
    publicstats pushback stats_readiness_earned;
    publicstats pushback stats_reinforcements_called;
    publicstats pushback stats_resistance_killed;
    publicstats pushback stats_resistance_teamkills;
    publicstats pushback stats_resistance_teamkills_by_players;
    publicstats pushback stats_secondary_objectives;
    publicstats pushback stats_sectors_liberated;
    publicstats pushback stats_sectors_lost;
    publicstats pushback stats_spartan_respawns;
    publicstats pushback stats_supplies_produced;
    publicstats pushback stats_supplies_spent;
    publicstats pushback stats_vehicles_recycled;
    publicstats pushback _rabbits;

    publicstats remoteExec ["remote_call_endgame"];

    private _playtime_days = floor (stats_playtime / 86400);
    private _playtime_hours = floor ((stats_playtime % 86400) / 3600);
    private _playtime_minutes = floor ((stats_playtime % 3600) / 60);
    private _playtime_seconds = stats_playtime % 60;

    diag_log text "[KP LIBERATION] [MISSION END] ------------------------------------";
    diag_log text format ["[KP LIBERATION] [MISSION END] Playtime: %1 days, %2 hours, %3 minutes, %4 seconds", _playtime_days, _playtime_hours, _playtime_minutes, _playtime_seconds];
    diag_log text format ["[KP LIBERATION] [MISSION END] OPFOR infantry killed: %1", stats_opfor_soldiers_killed];
    diag_log text format ["[KP LIBERATION] [MISSION END] OPFOR infantry killed by players: %1", stats_opfor_killed_by_players];
    diag_log text format ["[KP LIBERATION] [MISSION END] OPFOR vehicles destroyed: %1", stats_opfor_vehicles_killed];
    diag_log text format ["[KP LIBERATION] [MISSION END] OPFOR vehicles destroyed by players: %1", stats_opfor_vehicles_killed_by_players];
    diag_log text format ["[KP LIBERATION] [MISSION END] BLUFOR infantry recruited: %1", stats_blufor_soldiers_recruited];
    diag_log text format ["[KP LIBERATION] [MISSION END] BLUFOR infantry killed: %1", stats_blufor_soldiers_killed];
    diag_log text format ["[KP LIBERATION] [MISSION END] BLUFOR vehicles built: %1", stats_blufor_vehicles_built];
    diag_log text format ["[KP LIBERATION] [MISSION END] BLUFOR vehicles destroyed: %1", stats_blufor_vehicles_killed];
    diag_log text format ["[KP LIBERATION] [MISSION END] Player deaths: %1", stats_player_deaths];
    diag_log text format ["[KP LIBERATION] [MISSION END] BLUFOR friendly fire incidents: %1", stats_blufor_teamkills];
    diag_log text format ["[KP LIBERATION] [MISSION END] Resistance fighters killed: %1", stats_resistance_killed];
    diag_log text format ["[KP LIBERATION] [MISSION END] Resistance fighters (friendly) killed: %1", stats_resistance_teamkills];
    diag_log text format ["[KP LIBERATION] [MISSION END] Resistance fighters (friendly) killed by players: %1", stats_resistance_teamkills_by_players];
    diag_log text format ["[KP LIBERATION] [MISSION END] Civilians killed: %1", stats_civilians_killed];
    diag_log text format ["[KP LIBERATION] [MISSION END] Civilians killed by players: %1", stats_civilians_killed_by_players];
    diag_log text format ["[KP LIBERATION] [MISSION END] Civilians healed: %1", stats_civilians_healed];
    diag_log text format ["[KP LIBERATION] [MISSION END] Civilian vehicles destroyed: %1", stats_civilian_vehicles_killed];
    diag_log text format ["[KP LIBERATION] [MISSION END] Civilian vehicles destroyed by players: %1", stats_civilian_vehicles_killed_by_players];
    diag_log text format ["[KP LIBERATION] [MISSION END] Civilian vehicles seized: %1", stats_civilian_vehicles_seized];
    diag_log text format ["[KP LIBERATION] [MISSION END] Civilian buildings destroyed: %1", stats_civilian_buildings_destroyed];
    diag_log text format ["[KP LIBERATION] [MISSION END] Vehicles recycled: %1", stats_vehicles_recycled];
    diag_log text format ["[KP LIBERATION] [MISSION END] Ammunition units produced: %1", stats_ammo_produced];
    diag_log text format ["[KP LIBERATION] [MISSION END] Ammunition units spent: %1", stats_ammo_spent];
    diag_log text format ["[KP LIBERATION] [MISSION END] Fuel units produced: %1", stats_fuel_produced];
    diag_log text format ["[KP LIBERATION] [MISSION END] Fuel units spent: %1", stats_fuel_spent];
    diag_log text format ["[KP LIBERATION] [MISSION END] Supply units produced: %1", stats_supplies_produced];
    diag_log text format ["[KP LIBERATION] [MISSION END] Supply units spent: %1", stats_supplies_spent];
    diag_log text format ["[KP LIBERATION] [MISSION END] Sectors liberated: %1", stats_sectors_liberated];
    diag_log text format ["[KP LIBERATION] [MISSION END] Sectors lost: %1", stats_sectors_lost];
    diag_log text format ["[KP LIBERATION] [MISSION END] FOBs built: %1", stats_fobs_built];
    diag_log text format ["[KP LIBERATION] [MISSION END] FOBs lost: %1", stats_fobs_lost];
    diag_log text format ["[KP LIBERATION] [MISSION END] Secondary objectives accomplished: %1", stats_secondary_objectives];
    diag_log text format ["[KP LIBERATION] [MISSION END] Prisoners captured: %1", stats_prisoners_captured];
    diag_log text format ["[KP LIBERATION] [MISSION END] Hostile battlegroups called: %1", stats_hostile_battlegroups];
    diag_log text format ["[KP LIBERATION] [MISSION END] Hostile reinforcements called: %1", stats_reinforcements_called];
    diag_log text format ["[KP LIBERATION] [MISSION END] Total combat readiness raised: %1", round stats_readiness_earned];
    diag_log text format ["[KP LIBERATION] [MISSION END] IEDs detonated: %1", stats_ieds_detonated];
    diag_log text format ["[KP LIBERATION] [MISSION END] Number of Warhorse 3-1 losses: %1", stats_spartan_respawns];
    diag_log text format ["[KP LIBERATION] [MISSION END] Rabbits killed: %1", _rabbits];
    diag_log text "[KP LIBERATION] [MISSION END] ------------------------------------";

    sleep 20;

    {if !(isPlayer _x) then {deleteVehicle _x;}} forEach allUnits;
};
