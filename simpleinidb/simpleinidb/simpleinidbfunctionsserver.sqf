/*
Requires iniDB and it's function scripts
*/


SiniDB_buildSaveString = 
{
	/*
This function receives an array in the format 
[["variable name", variable value],["variable name", variable value]]
and builds a string which will be saved in the inidb.
This is just as good as the "format" function, but without the 2000 character limit.
*/
	private ["_saveAr","_saveStr","_tmpElement","_index","_count","_tmpVal1up"];
	_saveAr = _this;
	_saveStr = "[";
	_index = [];
	//Loop through main elements in array.
	for "_i" from 0 to (count(_saveAr) - 1) do
	{
		_tmpElement = _saveAr select _i;
		_saveStr = _saveStr + "[""" + (_tmpElement select 0) + """,";
		_tmpVal = _tmpElement select 1;
		
		if(typeName(_tmpVal) == "ARRAY") then
		{
			_saveStr = _saveStr +  "[";
			_notDone = true;
			_count = 0;
			//Loop through nested arrays			
			while{_count < count(_tmpVal)} do
			{
				if(typeName(_tmpVal select _count) == "ARRAY") then
				{
					_index = _index + [_count];
					_saveStr = _saveStr +  "[";
					_tmpVal = _tmpVal select _count;
					_count = 0;
				}
				else
				{
					if(typeName(_tmpVal select _count) == "STRING") then
					{
						_saveStr = _saveStr + """" +(_tmpVal select _count) + """";
					}
					else
					{
						_saveStr = _saveStr +  format["%1", _tmpVal select _count];
					};
					if(_count == count(_tmpVal) - 1) then
					{
						_saveStr = _saveStr +  "]";
						if(count(_index) > 0) then
						{							
							_count = (_index select (count(_index) - 1));
							
							_index set [(count(_index) - 1), "DEL"];
							_index = _index - ["DEL"];
							
							//check if parent array was at last element
							_tmpVal1up = _tmpElement select 1;
							for "_ind" from 0 to (count(_index)-1) do
							{
								_tmpVal1up = _tmpVal1up select (_index select _ind);
							};
							
							if((count(_tmpVal1up) - 1) == _count) then
							{
								_saveStr = _saveStr + "]";
							}
							else
							{
								_saveStr = _saveStr + ",";
							};
							
							
							if(count(_index) > 0) then
							{
								_index set [count(_index) - 1, (_index select (count(_index) - 1)) + 1];						
								_saveStr = _saveStr + "]";
							};
						};
						_tmpVal = _tmpElement select 1;
						for "_ind" from 0 to (count(_index)-1) do
						{
							_tmpVal = _tmpVal select (_index select _ind);
						};

						_count = _count + 1;
					}
					else
					{
						_saveStr = _saveStr +  ",";
						_count = _count + 1;
					};
				};
			};
		}
		else
		{
			if(typeName(_tmpVal) == "STRING") then
			{
				_saveStr = _saveStr +  """" + _tmpVal + """";
			}
			else
			{
				_saveStr = _saveStr +  format["%1", (_tmpVal)];
			};
		};
		_saveStr = _saveStr + "]";
		if(_i < count(_saveAr) - 1) then
		{
			_saveStr = _saveStr + ",";
		};
	};
	_saveStr = _saveStr + "]";
	_saveStr;
};


SiniDB_cutStr = {
//splits the string in an array of smaller strings to avoid the data limit of ~4000 characters being sent to the dll(inidb)
	private ["_mainStr", "_strAr", "_count", "_strToAr", "_tmpStrAr"];
	_mainStr = _this;
	_strAr = [];
	_strToAr = toArray(_mainStr);
	_tmpStrAr = [];
	_count = 0;
	for "_i" from 0 to (count(_strToAr) - 1) do
	{
		_count = _count + 1;
		_tmpStrAr = _tmpStrAr + [_strToAr select _i];
		if(_count >= 199) then
		{
			_count = 0;
			_strAr = _strAr + [toString(_tmpStrAr)];
			_tmpStrAr = [];
		};
	};
	_strAr = _strAr + [toString(_tmpStrAr)];
	_strAr;
};



SiniDB_saveDB = 
{
/*
Saves data using inidb
example use: 
[
"PLAYERID",
"SIDE",
[
["name","John"],
["friends", ["Pete", "Adam", "Joe"]]
]
] call SiniDB_saveDB;
*/
	private ["_file", "_key", "_data", "_count", "_tmpStrAr"];
	_file = _this select 0;
	_key = _this select 1;
	_data = _this select 2;
	_tmpStrAr = (_data call SiniDB_buildSaveString) call SiniDB_cutStr;
	_count = count(_tmpStrAr);
	[_file, _key, "count", _count] call iniDB_write;
	for "_i" from 0 to (_count - 1) do
	{
		[_file, _key, format["part%1", _i], _tmpStrAr select _i] call iniDB_write;
	};
};

SiniDB_loadDB = 
{
/*
Loads data using inidb
example use:
[
"PLAYERID",
"SIDE"
] call SiniDB_loadDB;
*/
	private ["_file", "_key", "_data", "_count"];
	_file = _this select 0;
	_key = _this select 1;
	_data = "";
	if(_file call iniDB_exists) then
	{
		_count = parseNumber([_file, _key, "count"] call iniDB_readRaw);
		for "_i" from 0 to (_count - 1) do
		{
			_data = _data + ([_file, _key, format["part%1", _i]] call iniDB_readRaw);
		};
	}
	else
	{
		_data = "[]";
	};
	_data;
};