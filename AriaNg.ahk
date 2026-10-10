#Requires AutoHotkey v2.0
 
if ! ProcessExist("aria2c.exe")
	Run "Aria2 RPC.ahk"
Run "index.html"
