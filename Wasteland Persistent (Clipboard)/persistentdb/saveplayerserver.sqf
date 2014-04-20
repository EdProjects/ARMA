sleep 10;
persistentplayerlist = [];
while {true} do {
if(!isNil "savedpersistentobjects") then {
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Here you can use arma2net or any other applicable mod you like to process the savestring and write it to the files.
//I chose to use the copyToClipboard and a custom app I wrote because I am to lazy to install those mods.
copyToClipboard savedpersistentobjects;																	  
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
};
sleep 1;
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
persistentdbPlayerSave = [];

call compile (format["if(!isNil ""%2%1playersave"") then {
persistentdbPlayerSave = %2%1playersave;
};", _x select 1, _x select 0]);
_savestring = "[";
if(!isNil "persistentdbPlayerSave" and count(persistentdbPlayerSave) != 0) then {

for[{_i = 0}, {_i < count persistentdbPlayerSave}, {_i = _i + 1}] do {

if(_i == count persistentdbPlayerSave - 1) then {
_savestring = _savestring + format["%1]",persistentdbPlayerSave select _i];

} else {
_savestring = _savestring + format["%1,
",persistentdbPlayerSave select _i];
};

};
if(_savestring != "[" and _savestring != "") then {
_savestring = format["%2split%1splitplayersave = ", _x select 1, _x select 0] + _savestring;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Here you can use arma2net or any other applicable mod you like to process the savestring and write it to the files.
//I chose to use the copyToClipboard and a custom app I wrote because I am to lazy to install those mods.
copyToClipboard _savestring;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


};
};
sleep 1;
} foreach persistentplayerlist;
sleep 1;
};
