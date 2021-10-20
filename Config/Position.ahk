
; Key
; [process_name]
; [process_name]_[class]
; []_[class]
; [process_name]_[title]
; [process_name]_[class]_[title]
; []_[class]_[title]
; []_[]_[title]

; Value
; 设置一些软件默认位置 [x,y,w,h]

global Windows_Position_Default := {}
global Windows_Position_Backup  := {}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

win_w := 900
win_h := 1500
win_x := screen_1_x + screen_1_w/2 - win_w/2
win_y := screen_1_y + screen_1_h/2 - win_h/2
Windows_Position_Default["_#32770_浏览文件夹"] := [win_x, win_y, win_w, win_h]

win_w := 1000
win_h := 1500
win_x := screen_1_x + screen_1_w/2 - win_w/2
win_y := screen_1_y + screen_1_h/2 - win_h/2
; 开启关闭 Windows 功能
Windows_Position_Default["OptionalFeatures_NativeHWNDHost"] := [win_x, win_y, win_w, win_h]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

win_x := 10
win_y := 10
win_w := screen_1_w/2 -10-10 +100
win_h := screen_1_h   -10-10
Windows_Position_Default["TIM"] := [win_x, win_y, win_w, win_h]

win_x := 10
win_y := 10
win_w := screen_1_w/2 -10-10 +100
win_h := screen_1_h   -10-10
Windows_Position_Default["DingDing"] := [win_x, win_y, win_w, win_h]

win_x := screen_1_w/2 +10    +100
win_y := 10 + 14
win_w := screen_1_w/2 -10-10 -100
win_h := screen_1_h   -10-10 -14-14
Windows_Position_Default["WeChat"] := [win_x, win_y, win_w, win_h]

win_w := screen_3_w   * 8/9
win_h := screen_3_h/2 * 5/6
win_x := screen_3_x + screen_3_w/2 - win_w/2
win_y := screen_3_y + 100
Windows_Position_Default["FDM"] := [win_x, win_y, win_w, win_h]

win_x := 176
win_y := 10
win_w := 3488
win_h := 2140
Windows_Position_Default["Android"] := [win_x, win_y, win_w, win_h]

win_w := 473
win_h := 210
win_x := screen_1_w - win_w - 10
win_y := screen_1_h - win_h - 10
; 火绒U盘工具
Windows_Position_Default["HipsTray_HRUSBTRAY"] := [win_x, win_y, win_w, win_h]

win_w := screen_1_w * 4/6
win_h := screen_1_h * 7/9
win_x := screen_1_x + screen_1_w/2 - win_w/2
win_y := screen_1_y + screen_1_h/2 - win_h/2
Windows_Position_Default["CloudMusic"] := [win_x, win_y, win_w, win_h]

win_w := screen_1_w * 4/6
win_h := screen_1_h * 4/6
win_x := screen_1_x + screen_1_w/2 - win_w/2
win_y := screen_1_y + screen_1_h/2 - win_h/2
Windows_Position_Default["PotPlayer"] := [win_x, win_y, win_w, win_h]

win_w := screen_2_w * 4/6
win_h := screen_2_h * 4/6
win_x := screen_2_x + screen_2_w/2 - win_w/2
win_y := screen_2_y + screen_2_h/2 - win_h/2
Windows_Position_Backup["PotPlayer"] := [win_x, win_y, win_w, win_h]

win_w := 1000
win_h := 1500
win_x := 30
win_y := screen_1_y + screen_1_h/2 - win_h/2
Windows_Position_Default["PotPlayer__播放列表"] := [win_x, win_y, win_w, win_h]

win_w := 2020
win_h := 300
win_x := screen_3_x + screen_3_w/2 - win_w/2
win_y := 2020
Windows_Position_Default["CloudMusic_DesktopLyrics"] := [win_x, win_y, win_w, win_h]

win_w := 2000
win_h := 1500
win_x := screen_1_x + screen_1_w/2 - win_w/2
win_y := screen_1_y + screen_1_h/2 - win_h/2
Windows_Position_Default["7-Zip"] := [win_x, win_y, win_w, win_h]

win_w := 2150
win_h := 1250
win_x := screen_1_x + screen_1_w/2 - win_w/2
win_y := screen_1_y + screen_1_h/2 - win_h/2
Windows_Position_Default["Start"] := [win_x, win_y, win_w, win_h]

win_w := screen_3_w   -6-6
win_h := screen_3_h/2 -6-6
win_x := screen_3_x + 6
win_y := screen_3_y + 6
Windows_Position_Default["TaskMGR"] := [win_x, win_y, win_w, win_h]

win_w := screen_1_w * 5/6
win_h := screen_1_h * 8/9
win_x := screen_1_x + screen_1_w/2 - win_w/2
win_y := screen_1_y + screen_1_h/2 - win_h/2
Windows_Position_Default["Chrome"] := [win_x, win_y, win_w, win_h]

win_w := screen_2_w * 5/6
win_h := screen_2_h * 8/9
win_x := screen_2_x + screen_2_w/2 - win_w/2
win_y := screen_2_y + screen_2_h/2 - win_h/2
Windows_Position_Backup["Chrome"] := [win_x, win_y, win_w, win_h]

win_w := 900
win_h := 1500
win_x := screen_1_x + screen_1_w/2 - win_w/2
win_y := screen_1_y + screen_1_h/2 - win_h/2
Windows_Position_Default["Chrome__修改书签"] := [win_x, win_y, win_w, win_h]

win_w := 2635
win_h := 1600
win_x := screen_2_x + screen_2_w/2 - win_w/2
win_y := screen_2_y + screen_2_h/2 - win_h/2
Windows_Position_Default["v2rayN"] := [win_x, win_y, win_w, win_h]

win_x := 300
win_y := 100
win_w := screen_1_w - win_x*2 + 1
win_h := screen_1_h - win_y*2 + 1
Windows_Position_Default["WindowsTerminal__WindowsPowerShell"] := [win_x, win_y, win_w, win_h]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

win_w := screen_1_w * 50/60
win_h := screen_1_h * 80/90
win_x := screen_1_x + screen_1_w/2 - win_w/2
win_y := screen_1_y + screen_1_h/2 - win_h/2
Windows_Position_Default["VSCode"] := [win_x, win_y, win_w, win_h]

win_w := screen_2_w * 50/60
win_h := screen_2_h * 80/90
win_x := screen_2_x + screen_2_w/2 - win_w/2
win_y := screen_2_y + screen_2_h/2 - win_h/2
Windows_Position_Backup["VSCode"] := [win_x, win_y, win_w, win_h]

win_w := screen_1_w * 45/60
win_h := screen_1_h * 70/90
win_x := screen_1_x + screen_1_w/2 - win_w/2
win_y := screen_1_y + screen_1_h/2 - win_h/2
Windows_Position_Default["Notepad++"] := [win_x, win_y, win_w, win_h]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

win_x := 60 
win_y := 30
win_w := screen_1_w - win_x*2 + 1
win_h := screen_1_h - win_y*2 + 1
Windows_Position_Default["PyCharm"] := [win_x, win_y, win_w, win_h]

win_w := 900  + 1
win_h := 1500 + 1
win_x := screen_1_x + screen_1_w/2 - win_w/2 + 1
win_y := screen_1_y + screen_1_h/2 - win_h/2 + 1
Windows_Position_Default["PyCharm__打开文件或项目"] := [win_x, win_y, win_w, win_h]
Windows_Position_Default["PyCharm__回滚变更"]      := [win_x, win_y, win_w, win_h]
Windows_Position_Default["PyCharm__选择路径"]      := [win_x, win_y, win_w, win_h]

win_w := 900  + 1
win_h := 1300 + 1
win_x := screen_1_x + screen_1_w/2 - win_w/2 + 1
win_y := screen_1_y + screen_1_h/2 - win_h/2 + 1
Windows_Position_Default["PyCharm__收藏夹"] := [win_x, win_y, win_w, win_h]

win_w := 1000 + 1
win_h := 1500 + 1
win_x := screen_1_x + screen_1_w/2 - win_w/2 + 1
win_y := screen_1_y + screen_1_h/2 - win_h/2 + 1
Windows_Position_Default["PyCharm__Python解释器"] := [win_x, win_y, win_w, win_h]


win_w := 1600 + 1
win_h := 1500 + 1
win_x := screen_1_x + screen_1_w/2 - win_w/2 + 1
win_y := screen_1_y + screen_1_h/2 - win_h/2 + 1
Windows_Position_Default["PyCharm__提交变更"] := [win_x, win_y, win_w, win_h]
Windows_Position_Default["PyCharm__查找"]    := [win_x, win_y, win_w, win_h]
Windows_Position_Default["PyCharm__检查"] := [win_x, win_y, win_w, win_h]

win_w := 1500 + 1
win_h := 1000 + 1
win_x := screen_1_x + screen_1_w/2 - win_w/2 + 1
win_y := screen_1_y + screen_1_h/2 - win_h/2 + 1
Windows_Position_Default["PyCharm__指定检查范围"] := [win_x, win_y, win_w, win_h]

win_w := 2000 + 1
win_h := 1500 + 1
win_x := screen_1_x + screen_1_w/2 - win_w/2 + 1
win_y := screen_1_y + screen_1_h/2 - win_h/2 + 1
Windows_Position_Default["PyCharm__设置"]            := [win_x, win_y, win_w, win_h]
Windows_Position_Default["PyCharm__添加Python解释器"] := [win_x, win_y, win_w, win_h]
Windows_Position_Default["PyCharm__TODO"]            := [win_x, win_y, win_w, win_h]
Windows_Position_Default["PyCharm__问题"]             := [win_x, win_y, win_w, win_h]
Windows_Position_Default["PyCharm__远程主机"]         := [win_x, win_y, win_w, win_h]

win_w := 2000 + 1
win_h := 1750 + 1
win_x := screen_1_x + screen_1_w/2 - win_w/2 + 1
win_y := screen_1_y + screen_1_h/2 - win_h/2 + 1
Windows_Position_Default["PyCharm__运行/调试配置"]     := [win_x, win_y, win_w, win_h]

win_w := 2300 + 1
win_h := 1700 + 1
win_x := screen_1_x + screen_1_w/2 - win_w/2 + 1
win_y := screen_1_y + screen_1_h/2 - win_h/2 + 1
Windows_Position_Default["PyCharm__评估"] := [win_x, win_y, win_w, win_h]


win_w := 2800 + 1
win_h := 1750 + 1
win_x := screen_1_x + screen_1_w/2 - win_w/2 + 1
win_y := screen_1_y + screen_1_h/2 - win_h/2 + 1
Windows_Position_Default["PyCharm__运行"] := [win_x, win_y, win_w, win_h]
Windows_Position_Default["PyCharm__调试"] := [win_x, win_y, win_w, win_h]
Windows_Position_Default["PyCharm__服务"] := [win_x, win_y, win_w, win_h]

win_w := 3000 + 1
win_h := 1700 + 1
win_x := screen_1_x + screen_1_w/2 - win_w/2 + 1
win_y := screen_1_y + screen_1_h/2 - win_h/2 + 1
Windows_Position_Default["PyCharm__终端"]       := [win_x, win_y, win_w, win_h]
Windows_Position_Default["PyCharm__Statistic"] := [win_x, win_y, win_w, win_h]
Windows_Position_Default["PyCharm__数据库"]     := [win_x, win_y, win_w, win_h]

win_w := 3300 + 1
win_h := 1800 + 1
win_x := screen_1_x + screen_1_w/2 - win_w/2 + 1
win_y := screen_1_y + screen_1_h/2 - win_h/2 + 1
Windows_Position_Default["PyCharm__Python控制台"] := [win_x, win_y, win_w, win_h]
Windows_Position_Default["PyCharm__Git"]         := [win_x, win_y, win_w, win_h]
