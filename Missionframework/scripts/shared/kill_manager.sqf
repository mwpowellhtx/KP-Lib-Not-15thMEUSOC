params [
    ["_unit",objNull, [objNull]]
    , ["_killer",objNull, [objNull]]
];

// Either the KILLER directly or the unit responsible, whichever was the player
_killer = vehicle _killer;
if (!isPlayer _killer && isPlayer leader _killer) then {
    _killer = leader _killer;
};

private _surrender = _unit getVariable ["KPLIB_surrender", false];

if (isServer) then {

    if (KP_liberation_kill_debug > 0) then {diag_log format ["[KP LIBERATION] [KILL] Kill Manager executed - _unit: %1 (%2) - _killer: %3 (%4)", typeOf _unit, _unit, typeOf _killer, _killer];};

    // Get Killer, when ACE enabled, via lastDamageSource
    if (KP_liberation_ace) then {
        if (local _unit) then {
            _killer = _unit getVariable ["ace_medical_lastDamageSource", _killer];
            if (KP_liberation_kill_debug > 0) then {diag_log format ["[KP LIBERATION] [KILL] _unit is local to %1", debug_source];};
        } else {
            if (KP_liberation_kill_debug > 0) then {diag_log format ["[KP LIBERATION] [KILL] _unit is not local to %1", debug_source];};
            if (isNil "KP_liberation_ace_killer") then {KP_liberation_ace_killer = objNull;};
            waitUntil {sleep 0.5; !(isNull KP_liberation_ace_killer)};
            if (KP_liberation_kill_debug > 0) then {diag_log format ["[KP LIBERATION] [KILL] KP_liberation_ace_killer received on %1", debug_source];};
            _killer = KP_liberation_ace_killer;
            KP_liberation_ace_killer = objNull;
            publicVariable "KP_liberation_ace_killer";
        };
    };

    // Failsafe if something gets killed before the save manager is finished
    if (isNil "infantry_weight") then {infantry_weight = 33};
    if (isNil "armor_weight") then {armor_weight = 33};
    if (isNil "air_weight") then {air_weight = 33};

    // BLUFOR Killer handling
    if ((side _killer) == GRLIB_side_friendly) then {

        // Increase combat readiness for kills near a capital.
        private _nearby_bigtown = sectors_bigtown select {!(_x in blufor_sectors) && (_unit distance (markerpos _x) < 250)};
        if (count _nearby_bigtown > 0) then {
            combat_readiness = combat_readiness + (0.5 * GRLIB_difficulty_modifier);
            stats_readiness_earned = stats_readiness_earned + (0.5 * GRLIB_difficulty_modifier);
            if (combat_readiness > 100.0 && GRLIB_difficulty_modifier < 2) then {combat_readiness = 100.0};
        };

        // Weights adjustments depending on what vehicle the BLUFOR killer used
        if (_killer isKindOf "Man") then {
            infantry_weight = infantry_weight + 1;
            armor_weight = armor_weight - 0.66;
            air_weight = air_weight - 0.66;
        } else {
            if ((typeof (vehicle _killer)) in land_vehicles_classnames) then  {
                infantry_weight = infantry_weight - 0.66;
                armor_weight = armor_weight + 1;
                air_weight = air_weight - 0.66;
            };
            if ((typeof (vehicle _killer)) in air_vehicles_classnames) then  {
                infantry_weight = infantry_weight - 0.66;
                armor_weight = armor_weight - 0.66;
                air_weight = air_weight + 1;
            };
        };

        // Keep within ranges
        infantry_weight = 0 max (infantry_weight min 100);
        armor_weight = 0 max (armor_weight min 100);
        air_weight = 0 max (air_weight min 100);
    };

    // Player was killed
    if (isPlayer _unit) then {
        stats_player_deaths = stats_player_deaths + 1;
        // Disconnect UAV from player on death
        _unit connectTerminalToUAV objNull;
        // Eject Player from vehicle
        if (vehicle _unit != _unit) then {moveOut _unit;};
    };

    // Check for Man or Vehicle
    if (_unit isKindOf "Man") then {

        // OPFOR casualty
        if (side (group _unit) == GRLIB_side_enemy) then {
            // Killed by BLUFOR
            if (side _killer == GRLIB_side_friendly) then {
                stats_opfor_soldiers_killed = stats_opfor_soldiers_killed + 1;
            };

            // Killed by a player
            if (isplayer _killer) then {
                stats_opfor_killed_by_players = stats_opfor_killed_by_players + 1;
            };
        };

        // BLUFOR casualty
        if (side (group _unit) == GRLIB_side_friendly) then {
            stats_blufor_soldiers_killed = stats_blufor_soldiers_killed + 1;

            // Killed by BLUFOR
            if (side _killer == GRLIB_side_friendly) then {
                stats_blufor_teamkills = stats_blufor_teamkills + 1;
            };
        };

        // Resistance casualty
        if (side (group _unit) == GRLIB_side_resistance) then {
            KP_liberation_guerilla_strength = KP_liberation_guerilla_strength - 1;
            stats_resistance_killed = stats_resistance_killed + 1;

            // Resistance is friendly to BLUFOR
            if ((GRLIB_side_friendly getFriend GRLIB_side_resistance) >= 0.6) then {

                // Killed by BLUFOR
                if (side _killer == GRLIB_side_friendly && isPlayer _killer) then {
                    // Yes we want to log no matter what, and we want the detail, including STEAM ID
                    if (true) then {
                        diag_log format ["[KP LIBERATION] [ASYMMETRIC] Guerilla named %1 killed by %2 (uid: %3)", name _unit, name _killer, getPlayerUID _killer];
                    };
                    [3, [_unit, _killer]] remoteExec ["F_cr_globalMsg"];
                    stats_resistance_teamkills = stats_resistance_teamkills + 1;
                    [KP_liberation_cr_resistance_penalty, true] spawn F_cr_changeCR;
                };

                // Killed by a player
                if (isplayer _killer) then {
                    stats_resistance_teamkills_by_players = stats_resistance_teamkills_by_players + 1;
                };
            };
        };

        // Civilian casualty
        if (side (group _unit) == GRLIB_side_civilian) then {
            stats_civilians_killed = stats_civilians_killed + 1;

            // Killed by BLUFOR, excluding 'KPLIB_surrender' i.e. enemy which may have 'switched' to setCaptive i.e. 'civ'
            if (!_surrender &&  side _killer == GRLIB_side_friendly && isPlayer _killer) then {
                // Yes we want to log no matter what, and we want the detail, including STEAM ID
                if (true) then {
                    diag_log format ["[KP LIBERATION] [CIVREP] Civilian %1 killed by %2 (uid: %3)", name _unit, name _killer, getPlayerUID _killer];
                };
                [2, [_unit, _killer]] remoteExec ["F_cr_globalMsg"];
                [KP_liberation_cr_kill_penalty, true] spawn F_cr_changeCR;
            };

            // Killed by a player
            if (isPlayer _killer) then {
                stats_civilians_killed_by_players = stats_civilians_killed_by_players + 1;
            };
        };
    } else {
        // Enemy vehicle casualty
        if (typeof _unit in all_hostile_classnames) then {
            stats_opfor_vehicles_killed = stats_opfor_vehicles_killed + 1;

            // Destroyed by player
            if (isplayer _killer) then {
                stats_opfor_vehicles_killed_by_players = stats_opfor_vehicles_killed_by_players + 1;
            };
        } else {
            // Civilian vehicle casualty
            if (typeOf _unit in civilian_vehicles) then {
                stats_civilian_vehicles_killed = stats_civilian_vehicles_killed + 1;

                // Destroyed by player
                if (isplayer _killer) then {
                    stats_civilian_vehicles_killed_by_players = stats_civilian_vehicles_killed_by_players + 1;
                };
            } else {
                // It has to be a BLUFOR vehicle then
                stats_blufor_vehicles_killed = stats_blufor_vehicles_killed + 1;
            };
        };
    };
} else {
    // Get Killer and send it to server, when ACE enabled, via lastDamageSource
    if (KP_liberation_ace && local _unit) then {
        if (KP_liberation_kill_debug > 0) then {private _text = format ["[KP LIBERATION] [KILL] _unit is local to: %1", debug_source];_text remoteExec ["diag_log",2];};
        KP_liberation_ace_killer = _unit getVariable ["ace_medical_lastDamageSource", _killer];
        publicVariable "KP_liberation_ace_killer";
    };
};

// Body/Wreck deletion after cleanup delay
if (isServer && !isplayer _unit) then {
    sleep GRLIB_cleanup_delay;
    hidebody _unit;
    sleep 10;
    deleteVehicle _unit;
};
