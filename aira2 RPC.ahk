#Requires AutoHotkey v2.0
;;将aria2-RPC.conf作为配置文件隐藏运行aria2c.exe，若正在运行则弹窗提醒
if (PID := ProcessExist("aria2c.exe"))	{
	Result := MsgBox("aria2c.exe 正在运行，PID = " PID "`n重新启动 aria2 RPC ？",,"YesNo")
	if (Result = "Yes") {
		ProcessClose PID
		Run "aria2c.exe --conf-path=aria2-RPC.conf",,"hide"
	}
}
else
	Run "aria2c.exe --conf-path=aria2-RPC.conf",,"hide"
