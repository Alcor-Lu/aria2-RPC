#Requires AutoHotkey v2.0

PID := ProcessExist("aria2c.exe")
if (PID = 0)
	Run "aria2c.exe --conf-path=aria2-RPC.conf",,"hide"
Run "index.html"
