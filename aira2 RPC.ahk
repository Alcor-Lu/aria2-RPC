#Requires AutoHotkey v2.0

if (PID := ProcessExist("aria2c.exe"))	{
	Result := MsgBox("aria2c.exe 正在运行，PID = " PID "`n重新启动 aria2 RPC ？",,"YesNo")
	if (Result = "Yes") {
		ProcessClose PID
		Run "aria2c.exe --conf-path=aria2-RPC.conf",,"hide"
	}
}
else
	Run "aria2c.exe --conf-path=aria2-RPC.conf",,"hide"
