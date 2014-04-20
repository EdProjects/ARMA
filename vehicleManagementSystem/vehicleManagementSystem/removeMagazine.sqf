_index = lbCurSel 21;
_index2 = lbCursel 24;
if !(_index >= 0 || _index2 >= 0) exitWith {hint "No valid magazine selected";};

_turretPath = (vehicleManagementSystemCurrentVehicleTurretsArray select _index) select 2;
_class = lbData [24, _index2];
vehicleManagementSystemCurrentVehicle removeMagazineTurret [_class, _turretPath];
execVM "VehicleManagementSystem\populateMagazines.sqf";