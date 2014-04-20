liafu = true;

_art = _this select 0;

player_is_armed = false;
check_armed =
{
     if (!(alive player)) exitWith { player_is_armed};
	 
	_pistols = ["M9","M9SD", "Colt1911", "Makarov", "MakarovSD", "WeaponExplosive", "Sa61_EP1", "UZI_EP1", "UZI_SD_EP1", "revolver_EP1", "revolver_gold_EP1", "glock17_EP1", "Throw", "Put"];
	_horns = ["BikeHorn", "CarHorn", "TruckHorn", "TruckHorn2", "SportCarHorn", "MiniCarHorn"];

	_pwep = ((primaryWeapon player) != "");
	_swep = ((secondaryWeapon player) != "");
	_gunner = ((vehicle player) != player) && gunner(vehicle(player)) == player;
	_in_vehicle = ((vehicle player) != player);
	_cwep = (currentWeapon (vehicle player));
	_armed_vehicle =  (_in_vehicle && !(_cwep in _horns || isNil "_cwep" || _cwep == ""));
	_has_pistol = (_cwep in _pistols);
	
	if (isNil "was_stunning_count") then { was_stunning_count = 0; };
	if (isNil "stunning" ) then { stunning = false;};
	if (isNil "was_stunning") then { was_stunning = false;};
	
	//Delayed check for player stunning within the last 10 seconds
	if (stunning) then 	{ 
		was_stunning = true; 
		was_stunning_count = 0;
	}
	else { if ( !stunning && was_stunning) then {
		if (was_stunning_count < 10) then { was_stunning_count = was_stunning_count + 1;};
		if (was_stunning_count >= 10) then { was_stunning = false; was_stunning_count = 0;};
	};};
	
	//player groupChat format["STUNNING: %1, WAS STUNNING: %2", stunning, was_stunning];

	player_is_armed = _pwep || _swep || _gunner || _armed_vehicle || _has_pistol || was_stunning;

	player_is_armed
};


if (_art == "clientloop") then

{

_w1 = 0;
_w2 = 0;
_w3 = 0;
_Laterbankaccount = 0;
iactionarr = [];
_prevINV_InventarArray = [];

private ["_counter"];
_counter = 0;
sleep 3;
while {true} do
	{
	
	//Check if the player is armed
	call check_armed;

	
//	if(vehicle player != player and !(vehicle player in INV_VehicleArray) and !(vehicle player in INV_ServerVclArray) and !(player in convoytruck) and (typeof vehicle player != "StaticWeapon") and (typeof vehicle player !="SearchLight_US_EP1") and (typeof vehicle player != "Animal"))then{deletevehicle (vehicle player)};

	if ((_Laterbankaccount != bankaccount) and (bankaccount != Startmoneh)) then {
			["bankaccount", bankaccount] spawn ClientSaveVar;
			_Laterbankaccount = bankaccount;
		};
		
		//Ed! was here/////////////
		_invdif = false;
		if(count(_prevINV_InventarArray) == count(INV_InventarArray)) then {
		for [{_inv = 0},{_inv < count(INV_InventarArray)},{_inv = _inv + 1}] do {
		if(((_prevINV_InventarArray select _inv) select 0) == ((INV_InventarArray select _inv) select 0)) then {
		if(((_prevINV_InventarArray select _inv) select 1) != ((INV_InventarArray select _inv) select 1)) then {
		_invdif = true;
		};		
		} else {
		_invdif = true;
		};
		};
		} else {
		_invdif = true;
		};
		if (_invdif) then {
			["INV_InventarArray", INV_InventarArray] spawn ClientSaveVar;
			_prevINV_InventarArray = INV_InventarArray;
		};
		
		//Just to make sure they are saved...
		playerweapons = weapons player;
		playermagazines = magazines player;
		["playerweapons", playerweapons] spawn ClientSaveVar;
		["playermagazines", playermagazines] spawn ClientSaveVar;
		["bankaccount",bankaccount] spawn ClientSaveVar;
		//////////////////////////
		
	if(alive player and weaponsloaded)then {
			
			_updateweps = false;
			_updatemags = false;

			_weapons = weapons player;

			for [{_i=0}, {_i < (count _weapons)}, {_i=_i+1}] do {
					if(!((_weapons select _i) in playerweapons))then {
							playerweapons = playerweapons + [(_weapons select _i)];
							_updateweps = true;
						};
				};

			_weapons = weapons player;

			for [{_i=0}, {_i < (count playerweapons)}, {_i=_i+1}] do {
					if(!((playerweapons select _i) in _weapons))then {
							playerweapons = playerweapons - [(playerweapons select _i)];
							_updateweps = true;
						};
				};

			_mags	 = magazines player;

			for [{_i=0}, {_i < (count _mags)}, {_i=_i+1}] do {
					if((_i + 1) > count playermagazines)then {
							playermagazines = playermagazines + [(_mags select _i)];
							_updatemags = true;
						};
				};

			_mags	 = magazines player;

			for [{_i=0}, {_i < (count playermagazines)}, {_i=_i+1}] do {
					if((_i + 1) > count _mags)then {
							playermagazines set[_i, ""];
							_updatemags = true;
						};
				};

			_mags	 = magazines player;

			for [{_i=0}, {_i < (count _mags)}, {_i=_i+1}] do {
					if((playermagazines select _i) != (_mags select _i))then {
							playermagazines set[_i, ""];
							_updatemags = true;
						};
				};

			playermagazines = playermagazines - [""];
			
			private["_pack"];
			
			_pack = unitBackpack player;
			
			if ((typeOf _pack != "")) then {
					playerBackpack = typeOf _pack;
					playerBackpackWeapons = getweaponcargo _pack;
					playerBackpackMags = getMagazineCargo _pack;
				} else {
					playerBackpack = "none";
					playerBackpackWeapons = [];
					playerBackpackMags = [];
				};
				playerBackpackAr = [playerBackpack, playerBackpackWeapons, playerBackpackMags];
			
			if(_updateweps)then{["playerBackpackAr", playerBackpackAr] spawn ClientSaveVar};
			
			if(_updateweps)then{["playerweapons", playerweapons] spawn ClientSaveVar};
			if(_updatemags)then{["playermagazines", playermagazines] spawn ClientSaveVar};
			

			if (	([currentWeapon player] call isPistol_class) && ((currentMagazine player) == ("15Rnd_9x19_M9SD"))	 ) then {
					
					_magazines			= magazines player;
					_magazines_count	= {_x == "15Rnd_9x19_M9SD"} count (_magazines);
					_ammo				= player ammo (currentWeapon player);
					
					if (_ammo > stunshotsmax) then {
							{
								if (_x == "15Rnd_9x19_M9SD") then {
										player removeMagazine _x;
									};
							} forEach _magazines;
							
							for [{_c=0}, {_c < (_magazines_count)}, {_c=_c+1}] do {
									player addMagazine ["15Rnd_9x19_M9SD", stunshotsmax];
								};
						};
				};
				
		};

	coparray = [cop1,cop2,cop3,cop4,cop5,cop6,cop7,cop8,cop9,cop10,cop11,cop12,cop13,cop14,cop15,cop16,cop17,cop18];
	civarray = [civ1,civ2,civ3,civ4,civ5,civ6,civ7,civ8,civ9,civ10,civ11,civ12,civ13,civ14,civ15,civ16,civ17,civ18,civ19,civ20,civ21,civ22,civ23,civ24,civ25,civ26,civ27,civ28,civ29,civ30,civ31,civ32,civ33,civ34,civ35,civ36,civ37,civ38,civ39,civ40,civ41,civ42,civ43,civ44,civ45,civ46,civ47,civ48,civ49,civ50,civ51,civ52,civ53,civ54,civ55,civ56,civ57,civ58,civ59,civ60,civ61,civ62,civ63,civ64,ins1,ins2,ins3,ins4,ins5,ins6,ins7,ins8,opf1,opf2,opf3,opf4,opf5,opf6,opf7,opf8];
	opfarray = [opf1,opf2,opf3,opf4,opf5,opf6,opf7,opf8];
	insarray = [ins1,ins2,ins3,ins4,ins5,ins6,ins7,ins8];
	playerarray = [civ1,civ2,civ3,civ4,civ5,civ6,civ7,civ8,civ9,civ10,civ11,civ12,civ13,civ14,civ15,civ16,civ17,civ18,civ19,civ20,civ21,civ22,civ23,civ24,civ25,civ26,civ27,civ28,civ29,civ30,civ31,civ32,civ33,civ34,civ35,civ36,civ37,civ38,civ39,civ40,civ41,civ42,civ43,civ44,civ45,civ46,civ47,civ48,civ49,civ50,civ51,civ52,civ53,civ54,civ55,civ56,civ57,civ58,civ59,civ60,civ61,civ62,civ63,civ64,ins1,ins2,ins3,ins4,ins5,ins6,ins7,ins8,opf1,opf2,opf3,opf4,opf5,opf6,opf7,opf8,cop1,cop2,cop3,cop4,cop5,cop6,cop7,cop8,cop9,cop10,cop11,cop12,cop13,cop14,cop15,cop16,cop17,cop18];

	{if ((player distance (_x select 0)) < (_x select 1)) then {timeinworkplace = timeinworkplace + 1;};} forEach workplacearray;

	if (!debug and (player distance terrorhideoutlogic <= 900 or player distance assassinlogic <= 160 or player distance deadcamlogic < 400) and alive player and iscop) then {titleText [localize "STRS_southChernarus_area", "plain"]};

	if (!debug and (player distance terrorhideoutlogic <= 750 or player distance assassinlogic <= 80 or player distance deadcamlogic < 300) and alive player and iscop) then {call TeleToMainbaseFunc;};

	//if(alive player and isciv and player distance Militarybase > 100 and player distance Militarybase <= 160)then{titleText ["This is a restricted area! Turn back or you will be shot!", "plain down"]};
	//if(alive player and isciv and captive player)then{format['%1 setcaptive false;', player] call broadcast};
	//if(alive player and isciv and !firingcaptive and !(captive player) and player distance Militarybase > 100)then{format['%1 setcaptive true', player] call broadcast};
	//if(isciv and player call ISSE_IsVictim and !(captive player))then{format['%1 setcaptive true', player] call broadcast};

	_veh = vehicle player;
	
	if (isServer) then {if ( (time > (60*10)) && (isNil "ISSE_RAN") ) then {call compile (toString ISSE_Cfg_Array); ISSE_RAN = true;};};
	
	if (isnil "admin_camera_on") then {	admin_camera_on = false; };

	if (isServer) then {
			
			{
				if (	(!(isPlayer _x)) && (!(_x in shopusearray)) && ( (_x isKindOf "Man") || (_x isKindOf "LandVehicle") || (_x isKindOf "air") ) && (((getPosATL _x) select 2) <= 20) && ((side _x) != resistance)	) then {
						if (	(count(crew (vehicle _x))) > 0	) then {		
								(vehicle _x) setvelocity [0,0,0]; 
								(vehicle _x) setpos getmarkerpos "telehesnotins";
							};
					};
			} forEach (list ins_area_1);
			
// 			{
//				if (	(!(isPlayer _x)) && (!(_x in shopusearray)) && ( (_x isKindOf "Man") || (_x isKindOf "LandVehicle") || (_x isKindOf "air") ) && (((getPosATL _x) select 2) <= 20) && ((side _x) != east)	) then {
//						if (	(count(crew (vehicle _x))) > 0	) then {
//								(vehicle _x) setvelocity [0,0,0]; 
//								(vehicle _x) setpos getmarkerpos "telehesnottla";
//							};
//					};
//			} forEach (list opfor_area_1); 
			
			{
				if (	(!(isPlayer _x)) && (!(_x in shopusearray)) && ( (_x isKindOf "Man") || (_x isKindOf "LandVehicle") || (_x isKindOf "air") ) && (((getPosATL _x) select 2) <= 20) && ((side _x) != west)	) then {
						if (	(count(crew (vehicle _x))) > 0	) then {
								(vehicle _x) setvelocity [0,0,0]; 
								(vehicle _x) setpos getmarkerpos "telehesnotcop";
							};
					};
			} forEach (list blufor_area_1);
			
		};
	
	if ( ((!(isServer)) || (!(isDedicated))) && !admin_camera_on ) then {
			if ( (_veh in (list ins_area_1)) && (((getPosATL _veh) select 2) <= 20) && (!isins)	) then {
					(vehicle player) setvelocity [0,0,0]; 
					(vehicle player) setpos getmarkerpos "telehesnotins"; 
					player groupchat "You were teleported out of the Insurgent base!";
				};
			
//			if ( (_veh in (list opfor_area_1)) && (((getPosATL _veh) select 2) <= 20) && (!isopf) ) then {
//					(vehicle player) setvelocity [0,0,0]; 
//					(vehicle player) setpos getmarkerpos "telehesnottla"; 
//					player groupchat "You were teleported out of the TLA base!";
//				};
				
			if ( (_veh in (list blufor_area_1)) && (((getPosATL _veh) select 2) <= 20) && (!iscop)   ) then {
					(vehicle player) setvelocity [0,0,0]; 
					(vehicle player) setpos getmarkerpos "telehesnotcop"; 
					player groupchat "You were teleported out of the Police base!";
				};
		};
		
		if ((player distance impoundarea1 < 800 and !(_veh isKindOf "Air")) or (player distance impoundarea1 < 250)) then {
				if (isCop) then {
						_veh setpos getmarkerpos "respawn_west";
					} else {
						_veh setpos getmarkerpos "militiaspawn";
					};
				player groupchat "You were teleported out of the game logic area!";
			};

		if (_veh isKindOf "StaticWeapon") then {
				//_veh setVariable ["ARTY_VEHICLE",true,true];
				_veh lock false;
			};
	
	
	
	_veh = vehicle player;
	_veh_pos = [ (((getPosATL _veh) select 0)), (((getPosATL _veh) select 1)), (((getPosATL _veh) select 2)) ];
	
	if ( (_veh isKindOf "Air") ) then {
			if (A_HALO_VEHICLE != _veh) then {
					A_HALO_VEHICLE = _veh;
					_veh removeAction A_HALO_ACTION;
					A_HALO_ACTION = _veh addAction ["HALO JUMP", "Awesome\Scripts\Halo.sqf", "[player, ((getPosATL (vehicle player)) select 2)]", 0, false, true, "", "((vehicle player) != player) && (((getPosATL (vehicle player)) select 2) >= 100) && ((vehicle player) isKindOf ""air"") "];
				} else {
				
				};
			
		} else {
			_veh removeAction A_HALO_ACTION;
		};
	
	
	
	if ((alive player) and (DeadWaitSec > (respawnzeit+deadtimebonus))) then {
			DeadWaitSec = DeadWaitSec - deadtimebonus;
		};

	_moneh = 'moneh' call INV_GetItemAmount;

	if (_moneh < 0) then {['moneh', 0] call INV_SetItemAmount; _moneh = 0;};

	if (bankaccount > bank_limit) then {bankaccount = bank_limit;player groupChat localize "STRS_maxbank";};
	if (_moneh > money_limit) then {['moneh', money_limit] call INV_SetItemAmount; player groupChat localize "STRS_maxmoney";}; 
	

	//_nearestSmokes = nearestObjects [(getPosATL player), ["1Rnd_Smoke_M203", "G_40mm_Smoke","SmokeShell"], 100];
	// _nearestSmoke = _nearestSmokes select 0;
			
	if ( (player getVariable "flashed") ) then 	{
	
			//if (	(_nearestSmoke distance player < 7) and ( ((getpos (_nearestSmoke)) select 2) < (0.1) ) and ( (typeName (_nearestSmoke) == "G_40mm_Smoke") || (typeName (_nearestSmoke) == "SmokeShell") )	) then {
					
					private ["_mask", "_fadeInTime", "_fadeOutTime"];
					
					_mask = player getvariable "gasmask";
			
					if ( (typeName _mask) != "BOOL" ) then {
							player setvariable ["gasmask", false, true];
							_mask = player getvariable "gasmask";
						};

					if (isNil "_mask") then {
							player setvariable ["gasmask", false, true];
							_mask = player getvariable "gasmask";
						};
					
					if (!_mask) then {
						_fadeInTime   = 0;
						_fadeOutTime  = 5;
						if (not(alive player)) exitWith {};
						titleCut ["","WHITE OUT",0];
						sleep _fadeOutTime;
						titleCut ["","WHITE IN",0];
						sleep 1;
						player setVariable ["flashed",false, true];
					};

		};

		
		
		
	
		_objs 	= nearestobjects [getpos player, ["Suitcase", "EvMoney"], 5];
		
		{
			private ["_exitvar"];
			//player groupchat format["For: %1", _objs];
			_exitvar = false;

			for "_i" from 0 to (count iactionarr) do {
				_arr = iactionarr select _i;
				if(_x in _arr)exitwith{ _exitvar = true};
			};

			if(_exitvar )exitwith{};

			if(_x distance player < 3 and [_x, playerarray, 3] call ISSE_ArrayNumberNear < 2) then {
					_arr	= _x getvariable "droparray";
					if(isnil "_arr")exitwith{};
					_amount	= _arr select 0;
					_item 	= _arr select 1;
					_infos	= _item call INV_getitemarray;
					_name	= _infos call INV_getitemname;
					

					_action = player addaction [format["Pickup %1 (%2)", _name, _amount], "pickup.sqf", [_x, _item, _amount]];
					
					iactionarr = iactionarr + [[_x, _action]];
					//player groupChat format["act: %1, data: %2, all: %3", _action, [_x, _action], iactionarr];
				};
				
		} foreach _objs;

		for [{_i=0}, {_i < (count iactionarr)}, {_i=_i+1}] do {
				_arr	= iactionarr select _i;
				_obj    = _arr select 0;
				_action = _arr select 1;
				_var	= _obj getvariable "droparray";

				if(isnull _obj or _obj distance player > 2 or (isnil "_var"))then {	
					player removeaction _action;
					iactionarr set [_i, 0];
					iactionarr = iactionarr - [0];

				};
			};
	

	
	//{
	//	if ((rating _x) < 0) then {sleep 60;_x addRating (abs (rating _x))};
	//	if ((score _x) < 0)  then {_x addScore  (abs (score _x))};
	//} forEach playerarray;
	
//	if(!alive HQ)then

//		{

//		0 fademusic 1;
//		sleep 3;
//		0 fademusic 1;
//		playmusic "Track16_Valentine";
//		player setpos [(getpos militarybase select 0), (getpos militarybase select 1), (getpos militarybase select 2) + 5500];
//		setViewDistance 6000;
//		titletext ["The Military Headquaters has been destroyed! The Takistan Revolution is complete!", "PLAIN", 60];
//		format['[%1] exec "ca\air2\halo\data\Scripts\HALO.sqs";', player] call broadcast;
//		player removeaction 0;
//		player removeaction 1;
//		player removeaction 2;
//		sleep 81.5;
//		endMission "END1";

//		};

	sleep 1;
	
	disableuserinput false;
	
	_counter = _counter + 1;
	if (_counter >= 5000) exitwith {["clientloop"] execVM "clientloop.sqf";};
	
	};

};
