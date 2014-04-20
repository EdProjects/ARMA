//Author: {ZAG}Ed!
//Do not claim this as your own work or sell it.
persistentplayerlist = [];
while{true} do {
{
if(isPlayer _x) then {
_found = false;
for[{_i = 0}, {_i < count persistentplayerlist}, {_i = _i + 1}] do {
if((persistentplayerlist select _i) select 0 == format["%1", side _x]) then {
if((persistentplayerlist select _i) select 1 == format["%1", getPlayerUID _x]) then {
_found = true;
};
};
};
if(!_found) then {
persistentplayerlist = persistentplayerlist + [[format["%1", side _x]] + [format["%1", getPlayerUID _x]]];
};
};
}foreach playableUnits;
{
_playerside = _x select 0;
_playerid = _x select 1;
call compile format['
if(typeName %1%2playersave == "STRING") then {
copyToClipboard ("%1split%2splitplayersave = " + %1%2playersave);
};
',_playerside,_playerid];
sleep 1;
} foreach persistentplayerlist;
sleep 1;
};