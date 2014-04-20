while {true} do {
persistentdbretrieve = "";
persistentdbretrieve1 = "";

publicVariable "persistentdbretrieve1";

waituntil{persistentdbretrieve != ""};
_uid = persistentdbretrieve;
{
if(isPlayer _x and (getPlayerUID _x == _uid)) then
{

call compile format["if(isNil ""%2%1playersave"") then {execVM ""persistentdb\%2\%1.sqf"";};", getPlayerUID _x, side _x];
sleep 1;
persistentdbretrieve1 = _uid;

call compile format["if(isNil ""%2%1playersave"") then {%2%1playersave = [];};", getplayerUID _x, side _x];
owner _x publicVariableClient format["%2%1playersave", getPlayerUID _x, side _x];
publicVariable "persistentdbretrieve1";

};
}foreach playableUnits;
sleep 1;
};