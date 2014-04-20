if (vehicleManagementSystemActionRunning) exitWith {hint "You are already busy performing an action on this vehicle.";};
vehicleManagementSystemActionRunning = true;
_doLoop = true;
_index = lbCurSel 3;
_part = lbData [3, _index];
_i = floor((1 - (vehicleManagementSystemCurrentVehicle getHitPointDamage _part)) * 100);
_hitpartCfg = configFile >> "cfgVehicles" >> (typeOf vehicleManagementSystemCurrentVehicle) >> "HitPoints";
_indexCtrl = 0;
for "_j" from 0 to (count(_hitpartCfg) - 1) do
{
	_cfg = _hitpartCfg select _j;
	_class = configName(_cfg);
	if(_class == _part) then
	{
		_indexCtrl = _j;
	};
	_name = getText(_cfg >> "name");
};
while {_doLoop && vehicleManagementSystemDialogRunning} do
{
	_i = _i + 1;
	((findDisplay 481) displayCtrl 4) progressSetPosition (_i  / 100);
	vehicleManagementSystemCurrentVehicle setHitPointDamage [_part, 1 - (_i / 100)]; 
	_r = vehicleManagementSystemCurrentVehicle getHitPointDamage _part;
	_g = 1 - (vehicleManagementSystemCurrentVehicle getHitPointDamage _part);	
	lbSetColor [3 , _indexCtrl, [_r, _g, 0, 1]];
	if(_i >= 100 && (alive vehicleManagementSystemCurrentVehicle)) then
	{
		((findDisplay 481) displayCtrl 4) progressSetPosition 0;
		_doLoop = false;
	};	
	sleep VehicleManagementSystemActionRate;
};
vehicleManagementSystemActionRunning = false;