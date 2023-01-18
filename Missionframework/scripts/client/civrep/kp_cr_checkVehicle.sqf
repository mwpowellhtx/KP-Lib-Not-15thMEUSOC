params [
    ["_unit",objNull, [objNull]]
    , ["_role", "", [""]]
    , ["_vehicle",objNull, [objNull]]
    , "_turret"
];

if (KP_liberation_civrep_debug > 0) then {
    private _text = format ["[KP LIBERATION] [CIVREP] checkVehicle [name _unit, typeOf _vehicle, _role]: %1", [name _unit, typeOf _vehicle, _role]];
    _text remoteExec ["diag_log", 2];
};

if (isNil "KP_liberation_cr_vehicles") then {
    KP_liberation_cr_vehicles = [];
};

if ((typeOf _vehicle in civilian_vehicles) && !(_vehicle in KP_liberation_cr_vehicles)) then {
    // Yes making a log of this one to encourage better behavior
    if (true) then {
        private _text = format ["[KP LIBERATION] [CIVREP] Vehicle %1 was stolen by %2 (role: %3, uid: %4)", typeOf _vehicle, name _unit, _role, getPlayerUID _unit];
        _text remoteExec ["diag_log",2];
    };
    [0] remoteExec ["F_cr_globalMsg"];
    [KP_liberation_cr_vehicle_penalty, true] remoteExec ["F_cr_changeCR", 2];

    KP_liberation_cr_vehicles pushBackUnique _vehicle;
    publicVariable "KP_liberation_cr_vehicles";

    stats_civilian_vehicles_seized = stats_civilian_vehicles_seized + 1;
    publicVariable "stats_civilian_vehicles_seized";
};

if (KP_liberation_civrep_debug > 0) then {
    private _text = format ["[KP LIBERATION] [CIVREP] checkVehicle finished on: stolen vehicle list: %2", KP_liberation_cr_vehicles];
    _text remoteExec ["diag_log", 2];
};
