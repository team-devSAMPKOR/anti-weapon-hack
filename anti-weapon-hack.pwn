public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid){
    if(issuerid == INVALID_PLAYER_ID) return 1;
    if(isRejectWeapon(weaponid)) return antiDamage(playerid, amount);

    return 1;
}

stock antiDamage(playerid, Float:amount){
    new Float:life[2];

    GetPlayerHealth(playerid,life[0]);
    GetPlayerArmour(playerid,life[1]);

    if(life[1] <= 0.0) SetPlayerHealth(playerid,(life+amount));

    else if(life[1] < amount) SetPlayerHealth(playerid, 100.0), SetPlayerArmour(playerid,(life[0]+amount)-100);
    else SetPlayerArmour(playerid, life[1]+amount);
}

stock isRejectWeapon(weaponid){
    new result;
    switch(weaponid){
        case 18,35,36,37,38 : result =1;
        default : result =0;
    }
    return result;
}