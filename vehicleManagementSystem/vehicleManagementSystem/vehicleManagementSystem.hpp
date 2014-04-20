#define true 1 
#define false 0 
#define FontM "EtelkaNarrowMediumPro"

class VMSStaticHeader
{
	type = 0;
	colorBackground[] = {0.40234375, 0.54296875, 0.60546875, 1}; 
	colorText[] = { 1, 1, 1, 1 };
	colorFrame[] = {1,1,1,1}; 
	style = 0x00;
	font = FontM;
};

class VMSListBox
{
	type = 5; 
	style = 0; 
	font = FontM; 
	colorDisabled[] = {0.3, 0.3, 0.3, 1};
	colorText[] = {1,1,1,1}; 
	colorScrollbar[] = {1,1,1,1}; 
	colorSelect[] = {1,1,1,1}; 
	colorSelect2[] = {1,1,1,1}; 
	colorSelectBackground[] = {0,0,1,0.5}; 
	colorSelectBackground2[] = {0,0,1,1}; 
	colorBackground[] = {0,0,0,1}; 
	maxHistoryDelay = 1.0; 
	soundSelect[] = {"",0.1,1}; 
	period = 1; 
	autoScrollSpeed = -1; 
	autoScrollDelay = 5; 
	autoScrollRewind = 0; 
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)"; 
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)"; 
	shadow = 0; 
	class ScrollBar 
	{ 
		color[] = {1,1,1,0.6}; 
		colorActive[] = {1,1,1,1}; 
		colorDisabled[] = {1,1,1,0.3}; 
		thumb = "#(argb,8,8,3)color(1,1,1,1)"; 
		arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)"; 
		arrowFull = "#(argb,8,8,3)color(1,1,1,1)"; 
		border = "#(argb,8,8,3)color(1,1,1,1)"; 
		shadow = 0; 
	}; 
};

class VMSComboBox 
{ 
	type = 4; 
	style = 0; 
	font = FontM; 
	sizeEx = 0.03; 
	rowHeight = 0.05; 
	wholeHeight = 0.3;
	rows=1;
	colorDisabled[] = {0.3, 0.3, 0.3, 1};
	colorText[] = {1,1,1,1}; 
	colorScrollbar[] = {1,1,1,1}; 
	colorSelect[] = {1,1,1,1}; 
	colorSelect2[] = {1,1,1,1}; 
	colorSelectBackground[] = {0,0,0,1}; 
	colorSelectBackground2[] = {0,0,0,1}; 
	colorBackground[] = {0,0,0,1}; 
	maxHistoryDelay = 1.0; 
	soundSelect[] = {"",0.1,1}; 
	period = 1; 
	autoScrollSpeed = -1; 
	autoScrollDelay = 5; 
	autoScrollRewind = 0; 
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)"; 
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)"; 
	shadow = 0; 
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	class ScrollBar 
	{ 
		color[] = {1,1,1,0.6}; 
		colorActive[] = {1,1,1,1}; 
		colorDisabled[] = {1,1,1,0.3}; 
		thumb = "#(argb,8,8,3)color(1,1,1,1)"; 
		arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)"; 
		arrowFull = "#(argb,8,8,3)color(1,1,1,1)"; 
		border = "#(argb,8,8,3)color(1,1,1,1)"; 
		shadow = 0; 
	}; 
};

class VMSButton 
{ 
	type = 1; 
	style = 0x00; 
	font = FontM; 
	sizeEx = 0.04; 
	colorText[] = {0,0,0,1}; 
	colorDisabled[] = {0.3,0.3,0.3,1}; 
	colorBackground[] = {0.8,0.8,0.8,1}; 
	colorBackgroundDisabled[] = {0.6,0.6,0.6,1}; 
	colorBackgroundActive[] = {0.8,0.8,1,1}; 
	offsetX = 0.004; 
	offsetY = 0.004; 
	offsetPressedX = 0.002; 
	offsetPressedY = 0.002; 
	colorFocused[] = {0,0,0,1}; 
	colorShadow[] = {1,1,1,0}; 
	shadow = 0; 
	colorBorder[] = {0,0,0,1}; 
	borderSize = 0; 
	soundEnter[] = {"",0.1,1}; 
	soundPush[] = {"",0.1,1}; 
	soundClick[] = {"",0.1,1}; 
	soundEscape[] = {"",0.1,1}; 
};




class vehicleManagementSystemDialog 
{ 
	idd = 481;
	movingEnable = false;
	enableSimulation = true;
	controlsBackground[] = { container };
	objects[] = { };
	controls[] = { header , vehicleDescription , vehiclePicture, hitListLabel , hitVMSListBox , progressBarLabel, progressBar , hitVMSButton , fuelBar, fuelBarLabel , fuelVMSButton , ammoVMSButton , cargoVMSButton};
	
	
	
	class container
	{
		idc = -1;
		type = 0;
		colorBackground[] = { 0, 0, 0, 0.7 }; 
		colorText[] = { 1, 1, 1, 1 };
		colorFrame[] = {1,1,1,1}; 
		text = "";
		style = 0x02;
		font = FontM;
		sizeEx = 0.1;
		x = 0.1;
		y = 0.1;
		w = 0.8;
		h = 0.8;
	};
	class header : VMSStaticHeader
	{
		idc = -1;
		text = "Vehicle Management System";
		sizeEx = 0.05;
		x = 0.1;
		y = 0.1;
		w = 0.8;
		h = 0.05;
	};
	class vehicleDescription : VMSStaticHeader
	{
		access = 1;
		idc = 1;
		text = "Vehicle Name";
		sizeEx = 0.03;
		x = 0.1;
		y = 0.15;
		w = 0.3;
		h = 0.05;
	};
	
	class vehiclePicture
	{
		access = 1;
		idc = 2;
		type = 0;
		colorBackground[] = { 0, 0, 0, 1}; 
		colorText[] = { 1, 1, 1, 1 };
		colorFrame[] = {1,1,1,1}; 
		text = "#(argb,8,8,3)color(1,1,0,1)";
		style = 48;
		font = FontM;
		sizeEx = 0.02;
		x = 0.1;
		y = 0.2;
		w = 0.3;
		h = 0.3;
	};
	
	class hitListLabel : VMSStaticHeader
	{
		access = 0;
		idc = -1;
		text = "Vehicle Parts";
		sizeEx = 0.03;
		x = 0.5;
		y = 0.15;
		w = 0.4;
		h = 0.05;
	};
	
	class hitVMSListBox : VMSListBox
	{
		access = 1;
		idc = 3; 
		x = 0.5;
		y = 0.2;
		w = 0.4;
		h = 0.35;		
		sizeEx = 0.03; 
		rowHeight = 0.05; 
		rows=1;		
	};
	
	class progressBarLabel : VMSStaticHeader
	{
		access = 0;
		idc = -1;
		text = "Progress";
		sizeEx = 0.04;
		x = 0.1;
		y = 0.85;
		w = 0.15;
		h = 0.05;	
	};
	
	class progressBar
	{
		idc = 4;
		access = 1; 
		type = 8; 
		style = 0; 
		colorFrame[] = {1,1,1,1}; 
		colorBar[] = {1,1,1,1}; 
		texture = "#(argb,8,8,3)color(1,1,1,1)"; 
		x = 0.25;
		y = 0.85;
		w = 0.65; 
		h = 0.05; 
		shadow = 0;
	};
	
	class fuelBarLabel : VMSStaticHeader
	{
		access = 0;
		idc = -1;
		text = "Fuel";
		sizeEx = 0.03;
		x = 0.10;
		y = 0.50;
		w = 0.10;
		h = 0.05;	
	};
	
	class fuelBar
	{
		idc = 10;
		access = 1; 
		type = 8; 
		style = 0; 
		colorFrame[] = {0.3,0.7,0,1}; 
		colorBar[] = {0.54,0.62,0.08,1}; 
		texture = "#(argb,8,8,3)color(0.3,0.7,0,1)"; 
		x = 0.20;
		y = 0.50;
		w = 0.20; 
		h = 0.05; 
		shadow = 0;
	};
	
	class hitVMSButton : VMSButton
	{ 
		idc = -1;
		access = 0;
		action = "execVM 'vehicleManagementSystem\repairVehicle.sqf'";
		x = 0.5;
		y = 0.55;
		w = 0.4;
		h = 0.05;		
		text = "Repair Part"; 
	};
	
	class fuelVMSButton : VMSButton
	{ 
		idc = -1;
		access = 0;
		action = "execVM 'vehicleManagementSystem\refuelVehicle.sqf'";
		x = 0.1; 
		y = 0.55; 
		w = 0.3; 
		h = 0.05; 
		text = "Refuel"; 
	};
	
	class ammoVMSButton : VMSButton
	{ 
		idc = -1;
		access = 0;
		action = "execVM 'vehicleManagementSystem\ammoSystem.sqf'";
		x = 0.1; 
		y = 0.65; 
		w = 0.3; 
		h = 0.05; 
		text = "Ammo"; 
	};
	
	class cargoVMSButton : VMSButton
	{ 
		idc = -1;
		access = 0;
		action = "execVM 'vehicleManagementSystem\cargoSystem.sqf'";
		x = 0.1; 
		y = 0.75; 
		w = 0.3; 
		h = 0.05; 
		text = "Cargo"; 
	};
};

class vehicleManagementSystemDialogAmmo
{ 
	idd = 482;
	movingEnable = false;
	enableSimulation = true;
	controlsBackground[] = { container };
	objects[] = { };
	controls[] = { header , TurretLabel, TurretVMSComboBox, TurretWeaponLabel , TurretWeaponVMSListBox , TurretMagazinesLabel, TurretMagazinesVMSComboBox, addMagazineVMSButton , progressBar , progressBarLabel , currentLoadoutLabel , currentLoadoutVMSListBox , removeMagazineVMSButton};	
	
	class container
	{
		idc = -1;
		type = 0;
		colorBackground[] = { 0, 0, 0, 0.7 }; 
		colorText[] = { 1, 1, 1, 1 };
		colorFrame[] = {1,1,1,1}; 
		text = "";
		style = 0x02;
		font = FontM;
		sizeEx = 0.1;
		x = 0.1;
		y = 0.1;
		w = 0.8;
		h = 0.8;
	};
	
	class header : VMSStaticHeader
	{
		idc = -1;
		text = "Vehicle Management System";
		sizeEx = 0.05;
		x = 0.1;
		y = 0.1;
		w = 0.8;
		h = 0.05;
	};
	
	class TurretLabel : VMSStaticHeader
	{
		access = 0;
		idc = -1;
		text = "Turrets";
		sizeEx = 0.03;
		x = 0.10;
		y = 0.15;
		w = 0.40;
		h = 0.05;	
	};
	
	class TurretVMSComboBox : VMSListBox
	{ 
		access = 1; 
		idc = 21;
		w = 0.4; 
		h = 0.15; 
		x = 0.10;
		y = 0.20;
		font = FontM; 
		sizeEx = 0.03; 
		rowHeight = 0.05; 
		wholeHeight = 0.3;
		rows=1;
	};
	
	class TurretWeaponLabel : VMSStaticHeader
	{
		access = 0;
		idc = -1;
		text = "Turret Weapons";
		sizeEx = 0.03;
		w = 0.4; 
		h = 0.05; 
		x = 0.10;
		y = 0.40;	
	};
	
	class TurretWeaponVMSListBox : VMSListBox
	{
		access = 1;
		idc = 22; 
		w = 0.4; 
		h = 0.20; 
		x = 0.10;
		y = 0.45;	
		sizeEx = 0.03; 
		rowHeight = 0.05; 
		rows=1;
	};
	
	class TurretMagazinesLabel : VMSStaticHeader
	{
		access = 0;
		idc = -1;
		text = "Magazines";
		sizeEx = 0.03;
		x = 0.10;
		y = 0.70;
		w = 0.40;
		h = 0.05;	
	};
	
	class TurretMagazinesVMSComboBox : VMSComboBox
	{ 
		access = 1; 
		idc = 23;
		w = 0.4; 
		h = 0.05; 
		x = 0.10;
		y = 0.75;
		font = FontM; 
		sizeEx = 0.03; 
		rowHeight = 0.05; 
		wholeHeight = 0.3;
		rows=1;
	};
	
	class addMagazineVMSButton : VMSButton
	{ 
		idc = -1;
		access = 0;
		action = "execVM 'vehicleManagementSystem\addMagazine.sqf'";
		w = 0.3; 
		h = 0.04; 
		x = 0.10;
		y = 0.80; 
		text = "Add Magazine"; 
	};
	
	class progressBarLabel : VMSStaticHeader
	{
		access = 0;
		idc = -1;
		text = "Progress";
		sizeEx = 0.04;
		x = 0.1;
		y = 0.85;
		w = 0.15;
		h = 0.05;	
	};
	
	class progressBar
	{
		idc = 4;
		access = 1; 
		type = 8; 
		style = 0; 
		colorFrame[] = {1,1,1,1}; 
		colorBar[] = {1,1,1,1}; 
		texture = "#(argb,8,8,3)color(1,1,1,1)"; 
		x = 0.25;
		y = 0.85;
		w = 0.65; 
		h = 0.05; 
		shadow = 0;
	};
	
	class currentLoadoutLabel :VMSStaticHeader
	{
		access = 0;
		idc = -1;
		text = "Current Loadout";
		sizeEx = 0.03;
		x = 0.5;
		y = 0.15;
		w = 0.4;
		h = 0.05;	
	};
	
	class currentLoadoutVMSListBox : VMSListBox
	{
		access = 1;
		idc = 24; 
		w = 0.4; 
		h = 0.60; 
		x = 0.50;
		y = 0.20;	
		sizeEx = 0.02; 
		rowHeight = 0.05; 
		rows=1;
	};
	
	class removeMagazineVMSButton : VMSButton
	{ 
		idc = -1;
		access = 0;
		action = "execVM 'vehicleManagementSystem\removeMagazine.sqf'";
		w = 0.3; 
		h = 0.04; 
		x = 0.50;
		y = 0.80; 
		text = "Remove Magazine"; 
	};
};

class vehicleManagementSystemDialogCargo
{ 
	idd = 483;
	movingEnable = false;
	enableSimulation = true;
	controlsBackground[] = { container };
	objects[] = { };
	controls[] = { header , currentCargoLabel , currentCargoListBox};
	
	class container
	{
		idc = -1;
		type = 0;
		colorBackground[] = { 0, 0, 0, 0.7 }; 
		colorText[] = { 1, 1, 1, 1 };
		colorFrame[] = {1,1,1,1}; 
		text = "";
		style = 0x02;
		font = FontM;
		sizeEx = 0.1;
		x = 0.1;
		y = 0.1;
		w = 0.8;
		h = 0.8;
	};
	
	class header : VMSStaticHeader
	{
		idc = -1;
		text = "Vehicle Management System";
		sizeEx = 0.05;
		x = 0.1;
		y = 0.1;
		w = 0.8;
		h = 0.05;
	};
	
	class currentCargoLabel : VMSStaticHeader
	{
		idc = -1;
		text = "Current Cargo";
		sizeEx = 0.05;
		x = 0.1;
		y = 0.15;
		w = 0.8;
		h = 0.05;
	};
	
	class currentCargoListBox : VMSListBox
	{
		access = 1;
		idc = 31; 
		w = 0.8; 
		h = 0.60; 
		x = 0.10;
		y = 0.20;	
		sizeEx = 0.02; 
		rowHeight = 0.05; 
		rows=1;
	};
};