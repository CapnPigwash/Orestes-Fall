[player, [missionNamespace, "inventory_var"]] call BIS_fnc_loadInventory;

_killstam = {
    for "_x" from 1 to 20 do {
        player enableFatigue false;
        sleep 10;
    };
};
[] spawn _killstam;