vehicleManagementSystemActionRunning = false;
_vehicle = _this select 0;
_hitparts = [];
_vClass = typeOf _vehicle;
_hitpartCfg = configFile >> "cfgVehicles" >> _vClass >> "HitPoints";
if(count(_hitpartCfg) == 0) then
{
	hint parseText "<t>This vehicle does not support the repair System due to an ARMA bug.</t><br/>
<t color='#ff0000'> http://feedback.arma3.com/view.php?id=11158 </t>";
};
_picture = getText(configFile >> "cfgVehicles" >> _vClass >> "icon");
_description = getText(configFile >> "cfgVehicles" >> _vClass >> "displayName");
for "_i" from 0 to (count(_hitpartCfg) - 1) do
{
	_cfg = _hitpartCfg select _i;
	_class = configName(_cfg);
	_name = getText(_cfg >> "name");
	_hitparts = _hitparts + [[_class, _name]];
};

if !(vehicleManagementSystemDialogRunning) then
{
	vehicleManagementSystemCurrentVehicle = _vehicle;
	vehicleManagementSystemDialog = createDialog "vehicleManagementSystemDialog"; 
	vehicleManagementSystemDialogRunning = true;
	((findDisplay 481) displayCtrl 1) ctrlSetText _description;
	((findDisplay 481) displayCtrl 2) ctrlSetText _picture; 	
	_count = 0;
	{
		
		_r = _vehicle getHitPointDamage (_x select 0);
		_g = 1 - (_vehicle getHitPointDamage (_x select 0));	
		
		_text = format["%1", [_x select 0, "Hit", ""] call ED_strings_replace];
		lbAdd [3 , _text];
		lbSetColor [3 , _count, [_r, _g, 0, 1]];
		lbSetData [3, _count, _x select 0];
		_count = _count + 1;
	} foreach _hitparts;
	
	((findDisplay 481) displayCtrl 10) progressSetPosition (fuel vehicleManagementSystemCurrentVehicle);
		
	waitUntil { !dialog };
	vehicleManagementSystemCurrentVehicleTurretsArray = null;
	vehicleManagementSystemDialog = objNull;
	vehicleManagementSystemCurrentVehicle = objNull;
	vehicleManagementSystemDialogRunning = false;
};