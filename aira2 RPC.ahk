#Requires AutoHotkey v2.0
#SingleInstance Force

Persistent()	;托盘图标
A_IconTip := "Aria2 RPC"
A_TrayMenu.Delete()
A_TrayMenu.Add("打开AriaNg", (*) => Run("index.html"))
A_TrayMenu.Add("重启", (*) => RestartAria2())
A_TrayMenu.Add("退出", (*) => ExitAria2())

PID := 0
if (FileExist("pid.txt")) {	;检查读取上次运行记录
	PID := FileRead("pid.txt")
}
if (ProcessExist(PID)) {	;检查上次运行的 aria2c.exe 是否关闭
	name := ProcessGetName(PID)
	if (name = "aria2c.exe") {
		Result := MsgBox("已存在正在运行的aria2c.exe，是否重新启动？",,"YesNo")
		if (Result = "Yes") {
			RestartAria2()
		}
	}
	else {
		RunAria2()
	}
}
else {
	RunAria2()
}

RunAria2(*) {	;运行 Aria2 后端
	global PID
	if !(FileExist("aria2.session")) {
		FileAppend("", "aria2.session")
	}
	Run("aria2c.exe --conf-path=aria2-RPC.conf",,"hide",&PID)
	if (FileExist("pid.txt")) {	;记录aria2c.exe PID
		FileDelete("pid.txt")
	}
	FileAppend(PID, "pid.txt")
}
RestartAria2(*) {	;重启 Aria2 后端
	if (ProcessExist(PID)) {
		name := ProcessGetName(PID)
		if (name = "aria2c.exe") {
			ProcessClose PID
		}
	}
	RunAria2()
}
ExitAria2(*) {	;退出 Aria2 后端
	if (ProcessExist(PID)) {
		name := ProcessGetName(PID)
		if (name = "aria2c.exe") {
			ProcessClose PID
		}
	}
	ExitApp()
}
