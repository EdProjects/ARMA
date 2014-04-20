Author: {ZAG}Ed! - www.za-gamers.co.za
Please do not claim this as your own or sell it.

I used the copy to clipboard method since I can do in an external program like I want and 
am not bound to what some mods have to offer.

You can use arma2 net or any other mod you want to save the stats however you like.

To use our method follow theses steps:

1 - copy the persistentdb folder to your arma 2 installation folder(server only).
2 - copy the persistentscripts folder to your wasteland v 2.7 mission folder(decompile the pbo if you don't have the folder).
3 - put    execVM "persistentscripts\init.sqf";   at the bottom of the init.sqf file in your mission folder.
4 - compile your mission folder into a .pbo.
5 - put the mission into your mpmissions folder.
6 - run the server with the mission.
7 - run the WasteLand PersistentDB.exe from inside the persistentdb folder.(make a shortcut to desktop).

On the next server restart. Close the arma server and then click Stop on the stat save app. Then click Flush.
Run the server. And click Start on the app.


You can use these scripts as you like as long as you remember me and the 
long hours I spent on creating this when you claim my work as your own.

This is a very early release and there are many bugs and features still missing.




if you don't have a remote desktop connection to manage your server, then add -flush to your shortcut or batch
"path\to\persistentdb\WasteLand PersistentDB.exe" -flush

when you kill the arma 2 server, you can kill the save app. then start the app with the above parameter and it should flush first and then do the saving.
it will also disable pop up messages which indicates errors and successful flushes.

Perhaps in this way you can make it automated.
I don't know batch stuff, so I am just going to give an idea.

run "path\to\persistentdb\WasteLand PersistentDB.exe" -flush
run arma 2 server
wait 24 hours
kill arma 2 server
kill WasteLand PersistentDB.exe
jump to start