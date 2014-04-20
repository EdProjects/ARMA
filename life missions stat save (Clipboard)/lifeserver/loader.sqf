PlayerRetrieve = "";
'server globalchat "Stat Loader Started!"' call broadcast;
while {true} do {

PlayerRetrieve = "";
publicVariable "PlayerRetrieve";

sleep 1;

waitUntil{PlayerRetrieve != ""};
_uid = PlayerRetrieve;

{
if(isPlayer _x and (getPlayerUID _x == _uid)) then
{
loadcontenttemp = [];
loadcontent = [];
loadRewardBonus = 0;
donatorTier = 0;
for[{_i = 0},{_i < count(RewardArray)},{_i = _i + 1}] do {
if(RewardArray select _i == format["%1",_uid]) then {
donatorTier = donatorTier + 1;
loadRewardBonus = loadRewardBonus + RewardMultiplier;
};
};
call compile format["if(isNil ""%2%1playersave"") then {
loadcontenttemp = [0];
execVM ""lifeserver\%2\%1.sqf"";};
sleep 1;
if(!isNil ""%2%1playersave"") then {
loadcontenttemp = %2%1playersave;
};
", getPlayerUID _x, side _x];
if(typeName loadcontenttemp == "STRING") then {
call compile format["loadcontenttemp = %2%1playersavear", getPlayerUID _x, side _x];
};
loaderretrieve1 = _uid;
PlayerRetrieve1 = format["%1go", getPlayerUID _x];
loadcontent = loadcontenttemp;
(owner _x) publicVariableClient "loadcontent";
(owner _x) publicVariableClient "PlayerRetrieve1";
(owner _x) publicVariableClient "loadRewardBonus";
//format["server globalChat ""Loading Stats for %1.""", name _x] call broadcast;
//format["server globalChat ""%1 is a tier %2 donator.""", name _x, donatorTier] call broadcast;
};
}foreach playableUnits;
sleep 1;
};