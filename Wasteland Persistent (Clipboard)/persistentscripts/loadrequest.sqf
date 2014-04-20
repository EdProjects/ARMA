//Request & Load Stats
//Author: {ZAG}Ed!
sleep 0.1;
waitUntil{respawnDialogActive};
_playerid = getPlayerUID player;
persistentdbretrieve1 = "";
while{persistentdbretrieve1 != _playerid} do {
sleep 1;
persistentdbretrieve1 = "";
persistentdbretrieve = _playerid;
publicVariableServer "persistentdbretrieve";
waitUntil {persistentdbretrieve1 != ""};
};

player globalChat "Stats Saved by ZA-Gamers.";
/*
                     /"\
                    |\./|
                    |   |
                    |   |
                    |>~<|
                    |   |
                 /'\|   |/'\..
             /~\|   |   |   | \
            |   =[@]=   |   |  \
            |   |   |   |   |   \
            | ~   ~   ~   ~ |`   )
            |                   /
             \                 /
              \               /
               \    _____    /
                |--//''`\--|
                | (( +==)) |
                |--\_|_//--|
				
To you who use our scripts without giving credit and denying that you are using it.
*/

call compile format["
waitUntil{!isNil ""%2%1playersave""};
if(count(%2%1playersave) != 0) then 
{mypersistentdb = %2%1playersave;};"
, getPlayerUID player, side player];
waitUntil{!respawnDialogActive};


if(isNil "mypersistentdb") exitWith {hint "No found profile on this team. You have to start new.";persistentstatsloaded = true;};
hint "Profile found. Loading.";
sleep 0.5;
persistentstatsloaded = true;
if(count(mypersistentdb select 0) >= 1) then {
player setVariable ["cmoney",(mypersistentdb select 0) select 0,true] ;
};
if(count(mypersistentdb select 0) >= 2) then {
player setVariable ["canfood",(mypersistentdb select 0) select 1,true] ;
};
if(count(mypersistentdb select 0) >= 3) then {
player setVariable ["medkits",(mypersistentdb select 0) select 2,true] ;
};
if(count(mypersistentdb select 0) >= 4) then {
player setVariable ["water",(mypersistentdb select 0) select 3,true] ;
};
if(count(mypersistentdb select 0) >= 5) then {
player setVariable ["fuel",(mypersistentdb select 0) select 4,true] ;
};
if(count(mypersistentdb select 0) >= 6) then {
player setVariable ["repairkits",(mypersistentdb select 0) select 5,true] ;
};
if(count(mypersistentdb select 0) >= 7) then {
player setVariable ["fuelFull",(mypersistentdb select 0) select 6,true] ;
};
if(count(mypersistentdb select 0) >= 8) then {
player setVariable ["fuelEmpty",(mypersistentdb select 0) select 7,true] ;
};
if(count(mypersistentdb select 0) >= 9) then {
player setVariable ["bombs",(mypersistentdb select 0) select 8,true] ;
};
if(count(mypersistentdb select 0) >= 10) then {
player setVariable ["spawnBeacon",(mypersistentdb select 0) select 9,true] ;
};
if(count(mypersistentdb select 0) >= 11) then {
player setVariable ["camonet",(mypersistentdb select 0) select 10,true] ;
};
if(count(mypersistentdb select 0) >= 12) then {
hungerLevel = (mypersistentdb select 0) select 11;
};
if(count(mypersistentdb select 0) >= 13) then {
thirstLevel = (mypersistentdb select 0) select 12;
};

removeAllWeapons player;

_pos = (mypersistentdb select 1) select 0;
player setPos _pos;
_dir = (mypersistentdb select 1) select 1;
player setDir _dir;



_weapons = mypersistentdb select 2 select 0;
for[{_i = 0},{_i < count _weapons},{_i = _i + 1}] do {
player addWeapon format["%1",_weapons select _i];
};


_magazines = mypersistentdb select 2 select 1;
for[{_i = 0},{_i < count _magazines},{_i = _i + 1}] do {
player addMagazine format["%1",_magazines select _i];
};

call compile format["player setDamage %1",mypersistentdb select 3];
