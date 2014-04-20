if (vehicleManagementSystemActionRunning) exitWith {hint "You are already busy performing an action on this vehicle.";};
vehicleManagementSystemActionRunning = true;
_doLoop = true;
_i = floor((fuel vehicleManagementSystemCurrentVehicle) * 100);
while {_doLoop && vehicleManagementSystemDialogRunning} do
{
	_i = _i + 1;
	((findDisplay 481) displayCtrl 4) progressSetPosition (_i  / 100);
	((findDisplay 481) displayCtrl 10) progressSetPosition (_i  / 100);
	vehicleManagementSystemCurrentVehicle setFuel (_i  / 100);
	if(_i >= 100 && (alive vehicleManagementSystemCurrentVehicle)) then
	{
		((findDisplay 481) displayCtrl 4) progressSetPosition 0;
		_doLoop = false;
	};	
	sleep VehicleManagementSystemActionRate;
};
vehicleManagementSystemActionRunning = false;