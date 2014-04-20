Author: Ed! www.za-gamers.co.za
Credit to iniDB's creator!

To set this up:
****************************************************************************************************
In the init.sqf file in the main mission directory, add the following line at the bottom.
execVM "persistentscripts\init.sqf";

Then copy the persistentscripts folder in the mission directory.

Add the @inidb folder to your arma installation. (This is the inidb mod)

In your server mod parameters, make sure it has -mod=@inidb

For running multiple servers on the same machine - In the persistentscripts/init.sqf
change the PDB_ServerID value to a unique identifyer for each server's mission pbo.
Example: Server 1 is unchanged("") server 2 is "abc" server 3 is "three"

PS: I am not very active with the scripting because the university load is getting a bit heavy.