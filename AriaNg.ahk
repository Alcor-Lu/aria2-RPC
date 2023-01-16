#Requires AutoHotkey v2.0
;;打开AriaNg，若aira2c.exe未运行则将aria2-RPC.conf作为配置文件隐藏运行aria2c.exe
PID := ProcessExist("aria2c.exe")
if (PID = 0)
	Run "aria2c.exe --conf-path=aria2-RPC.conf",,"hide"
Run "index.html"
