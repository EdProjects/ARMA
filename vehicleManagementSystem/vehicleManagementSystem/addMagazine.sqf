if (vehicleManagementSystemActionRunning) exitWith {hint "You are already busy performing an action on this vehicle.";};
_index1 = lbCurSel 21;
_index2 = lbCurSel 22;
_index3 = lbCurSel 23;
if (_index1 < 0 || _index2 < 0 || _index3 < 0) exitWith {hint "Invalid magazine selection."};
vehicleManagementSystemActionRunning = true;
_doLoop = true;
_turretPath = vehicleManagementSystemCurrentVehicleTurretsArray select _index1 select 2;
_magazineClass = vehicleManagementSystemCurrentVehicleTurretsArray select _index1 select 1 select _index2 select 1 select _index3 select 0;
_i = 0;
while {_doLoop && vehicleManagementSystemDialogRunning} do
{
	_i = _i + 1;
	((findDisplay 482) displayCtrl 4) progressSetPosition (_i  / 100);
	if(_i >= 100 && (alive vehicleManagementSystemCurrentVehicle)) then
	{
		((findDisplay 482) displayCtrl 4) progressSetPosition 0;
		_doLoop = false;
		vehicleManagementSystemCurrentVehicle addMagazineTurret [_magazineClass, _turretPath];
		execVM "VehicleManagementSystem\populateMagazines.sqf";
		
	};	
	sleep VehicleManagementSystemActionRate;
};
vehicleManagementSystemActionRunning = false;