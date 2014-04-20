_vehicle = _this select 0;
_image = getText(configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "picture");
_name = getText(configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "displayName");
_vehicle addAction [
format["<img size='2' color='#ffffff' image='%1'/><t color='#ffffff'>%2 Menu</t> ", _image, _name],
"vehicleManagementSystem\vehicleManagementSystem.sqf",
"",
0,
false,
true,
"",
"vehicle player == player"
];