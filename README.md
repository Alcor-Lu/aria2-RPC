# aria2-RPC
利用AutoHotkye v2.0脚本后台运行aria2作为RPC服务器，用于浏览器插件等。

后台运行aria2并打开AriaNg。
# 安装方法：
1.安装AutoHotkey v2.0版本。项目地址：

AutoHotkey：https://github.com/AutoHotkey/AutoHotkey

2.将aria2和AriaNg的最新发行版解压与脚本和配置文件放入同一路径下。项目地址：

aria2：https://github.com/aria2/aria2

AriaNg：https://github.com/mayswind/AriaNg
# 内容：
aria2 RPC.ahk和AriaNg.ahk为可执行脚本，在安装了AutoHotkey v2.0后可直接执行。

aria2 RPC.ahk后台运行aria2，如果已经运行则弹窗提醒是否重启。

AriaNg.ahk打开AriaNg，如果aria2未启动则先后台运行aria2。

aria2-RPC.conf为aria2的配置文件。首次使用前建议先阅读说明（见文档内）并配置bt-tracker。修改配置文件后需重启aria2生效！

aria2.session为空文件，作为aria2-RPC.conf指定的状态保存文件。由于默认配置文件指定了启动时读取该文件保存的状态信息，因此不存在时会导致aria2无法启动。如果修改了相关配置则可以不需要。
