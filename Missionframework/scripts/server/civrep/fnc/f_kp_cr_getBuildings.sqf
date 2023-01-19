params ["_sector"];

if (KP_liberation_civrep_debug > 0) then {
    private _text = format ["[KP LIBERATION] [CIVREP] getBuildings called on: %1 - Sector: %2", debug_source, markerText _sector];
    _text remoteExec ["diag_log", 2];
};

private _candidates = nearestObjects [getMarkerPos _sector, ["House"], 1.5 * GRLIB_capture_size];

// Ensuring that what we are counting as 'buildings' actually support spawn positions
private _buildings = if (KP_liberation_cr_param_buildings) then {
    _candidates select { (damage _x == 0) && !(typeOf _x in KP_liberation_cr_ign_buildings); };
} else {
    _candidates select { (alive _x) && !(typeOf _x in KP_liberation_cr_ign_buildings); };
};

// https://community.bistudio.com/wiki/BIS_fnc_buildingPositions
private _return = ({ ([_x] call BIS_fnc_buildingPositions) isNotEqualTo []; } count _buildings);

if (KP_liberation_civrep_debug > 0) then {
    private _text = format ["[KP LIBERATION] [CIVREP] getBuildings finished on: %1 - Return: %2", debug_source, _return];
    _text remoteExec ["diag_log", 2];
};

_return;
