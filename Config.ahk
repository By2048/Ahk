
; 默认屏幕数量
global screen_count := 3

; 初始化系统屏幕相关信息
SysGet, screen_count, MonitorCount

; 系统实际的屏幕设置 [2][1][3]
if (screen_count=1) {
    SysGet, Monitor1, Monitor
    SysGet, Monitor2, Monitor
    SysGet, Monitor3, Monitor
}

if (screen_count=3) {
    SysGet, Monitor1, Monitor, 3
    SysGet, Monitor2, Monitor, 1
    SysGet, Monitor3, Monitor, 2
}

global screen_1_zoom := 2
global screen_2_zoom := 1.5
global screen_3_zoom := 1

global screen_1_x  := Monitor1Left   + 0
global screen_1_y  := Monitor1Top    + 0
global screen_1_xx := Monitor1Right  + 0
global screen_1_yy := Monitor1Bottom + 0
global screen_1_w  := screen_1_xx    - screen_1_x
global screen_1_h  := screen_1_yy    - screen_1_y

global screen_2_x  := Monitor2Left   + 0
global screen_2_y  := Monitor2Top    + 0
global screen_2_xx := Monitor2Right  + 0
global screen_2_yy := Monitor2Bottom + 0
global screen_2_w  := screen_2_xx    - screen_2_x
global screen_2_h  := screen_2_yy    - screen_2_y

global screen_3_x  := Monitor3Left   + 0
global screen_3_y  := Monitor3Top    + 0
global screen_3_xx := Monitor3Right  + 0
global screen_3_yy := Monitor3Bottom + 0
global screen_3_w  := screen_3_xx    - screen_3_x
global screen_3_h  := screen_3_yy    - screen_3_y

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 工具类中使用的全局变量在此配置
; /Other/ /Tool/

; Init Config
global init_config_show_status := False

; 帮助信息
global help_text_show_status  := False
global help_image_show_status := False

; 键盘快捷键帮助
global key_map_show_status     := False

; 安卓应用
global software_android_rshift_loop    := [1,2,3,4,5]
global software_android_rshift_current := 0

; VSCode
global software_vscode_ralt := False

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 可执行文件
global WT          := "C:\Users\AM\AppData\Local\Microsoft\WindowsApps\wt.exe" ; Windows Terminal
global CMD         := "C:\Windows\System32\cmd.exe"
global TaskKill    := "C:\Windows\SysWOW64\taskkill.exe"
global Python      := "D:\Python\_python_\Scripts\python.exe"
global HuntAndPeck := "D:\HuntAndPeck\hap.exe"

; 截图软件配置
global Snipaste_EXE                    := "D:\Snipaste\Snipaste.exe"
global Snipaste_Auto_Save_File         := "E:\Snipaste\*.png"
global Snipaste_Screenshot_Path_Backup := "R:\Screens\"
global Snipaste_Screenshot_Path_Tmp    := "T:\"

; 手机向电脑写入的剪切板文件
global JQB_File := "T:\\JQB"

; 软件自定义名字替换
global Windows_Process_Name := []
Windows_Process_Name.Push( [ "code"                    , "VSCode"       ] )
Windows_Process_Name.Push( [ "pycharm64"               , "PyCharm"      ] )
Windows_Process_Name.Push( [ "chrome"                  , "Chrome"       ] )
Windows_Process_Name.Push( [ "firefox"                 , "FireFox"      ] )
Windows_Process_Name.Push( [ "vmware"                  , "VMware"       ] )
Windows_Process_Name.Push( [ "-----------------------" , "------------" ] )
Windows_Process_Name.Push( [ "cloudmusic"              , "CloudMusic"   ] )
Windows_Process_Name.Push( [ "wps"                     , "WPS"          ] )
Windows_Process_Name.Push( [ "fdm"                     , "FDM"          ] )
Windows_Process_Name.Push( [ "PotPlayerMini64"         , "PotPlayer"    ] )
Windows_Process_Name.Push( [ "FreeFileSync_x64"        , "FreeFileSync" ] )
Windows_Process_Name.Push( [ "7zFM"                    , "7-Zip"        ] )
Windows_Process_Name.Push( [ "-----------------------" , "------------" ] )
Windows_Process_Name.Push( [ "TenSafe"                 , "LOL"          ] )
Windows_Process_Name.Push( [ "TenSafe_1"               , "LOL"          ] )
Windows_Process_Name.Push( [ "LeagueClientUx"          , "LOL"          ] )
Windows_Process_Name.Push( [ "League of Legends"       , "LOL"          ] )
Windows_Process_Name.Push( [ "steam"                   , "Steam"        ] )
Windows_Process_Name.Push( [ "NemuPlayer"              , "Android"      ] )
Windows_Process_Name.Push( [ "ui32"                    , "Wallpaper"    ] )
Windows_Process_Name.Push( [ "-----------------------" , "------------" ] )
Windows_Process_Name.Push( [ "mstsc"                   , "Mstsc"        ] ) ;远程桌面
Windows_Process_Name.Push( [ "taskmgr"                 , "TaskMGR"      ] ) ;任务管理器
Windows_Process_Name.Push( [ "explorer"                , "Explorer"     ] ) ;资源管理器
Windows_Process_Name.Push( [ "SearchApp"               , "Search"       ] ) ;搜索
Windows_Process_Name.Push( [ "StartMenuExperienceHost" , "StartMenu"    ] ) ;开始菜单
Windows_Process_Name.Push( [ "-----------------------" , "------------" ] )
Windows_Process_Name.Push( [ "happ"                    , "TongHuaShun"  ] ) ;同花顺

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 在 Input.ahk Private.ahk 中定义的快捷输入
global Init_Config := []
Init_Config.Push( "-----------------------------------------------------------" )
Init_Config.Push( Format(" A_WorkingDir | {1}\ ", A_WorkingDir)                 )
Init_Config.Push( "-----------------------------------------------------------" )
Init_Config.Push( Format(" ScreenCount | {1} ", screen_count)                   )
Init_Config.Push( "-----------------------------------------------------------" )
if (screen_count>=1) {
    _format_ := " [1] x y xx yy | {1:5} {2:5} {3:5} {4:5} "
    _value_  := [ screen_1_x ,screen_1_y, screen_1_xx, screen_1_yy ]
    Init_Config.Push( Format( _format_, _value_*) )
}
if (screen_count>=2) {
    _format_ := " [2] x y xx yy | {1:5} {2:5} {3:5} {4:5} "
    _value_  := [ screen_2_x, screen_2_y, screen_2_xx, screen_2_yy ]
    Init_Config.Push( Format( _format_, _value_*) )
}
if (screen_count>=3) {
    _format_ := " [3] x y xx yy | {1:5} {2:5} {3:5} {4:5} "
    _value_  := [ screen_3_x, screen_3_y, screen_3_xx, screen_3_yy ]
    Init_Config.Push( Format( _format_, _value_*) )
}
Init_Config.Push( "-----------------------------------------------------------" )
if (screen_count>=1) {
    _format_ := " screen_1_zoom w*h | {1:3} {2:5}x{3} "
    _value_  := [ screen_1_zoom, screen_1_w, screen_1_h ]
    Init_Config.Push( Format( _format_, _value_*) )
}
if (screen_count>=2) {
    _format_ := " screen_2_zoom w*h | {1:3} {2:5}x{3} "
    _value_  := [ screen_2_zoom, screen_2_w, screen_2_h ]
    Init_Config.Push( Format( _format_, _value_*) )
}
if (screen_count>=3) {
    _format_ := " screen_3_zoom w*h | {1:3} {2:5}x{3} "
    _value_  := [ screen_3_zoom, screen_3_w, screen_3_h ]
    Init_Config.Push( Format( _format_, _value_*) )
}
Init_Config.Push( "-----------------------------------------------------------" )
Init_Config.Push( Format("  Screens | {1} ", Snipaste_Screenshot_Path_Backup)   )
Init_Config.Push( Format(" Snipaste | {1}" , Snipaste_EXE)                      )
Init_Config.Push( Format("   Python | {1}" , Python)                            )
Init_Config.Push( "-----------------------------------------------------------" )
Init_Config.Push( Format(" JQB | {1} ", JQB_File)                               )
Init_Config.Push( "-----------------------------------------------------------" )
Init_Config.Push( " date time datetime jqb pipjx "                              )
Init_Config.Push( "-----------------------------------------------------------" )
Init_Config.Push( " phone qq qq1 qq2 qmail qmail1 qmail2 gmail pwd aly "        )       
Init_Config.Push( " nc.download nc.rename "                                     )
Init_Config.Push( " bd.rename "                                                 )
Init_Config.Push( " bi.free bi.join bi.getname bi.rename "                      )
Init_Config.Push( " history screen camera weixin "                              )
Init_Config.Push( " py "                                                        )
Init_Config.Push( "-----------------------------------------------------------" )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; RShift快捷键帮助配置 快捷键图片对应关系
global Process_Hotkeys_Image := {}
Process_Hotkeys_Image[ "default"         ] := [ "Windows.png"                    ]
Process_Hotkeys_Image[ "Windows"         ] := [ "Windows.png"                    ]
Process_Hotkeys_Image[ "VSCode"          ] := [ "VSCode-Fxx.png", "VSCode.png"   ]
Process_Hotkeys_Image[ "Xshell"          ] := [ "Xshell.png"                     ]
Process_Hotkeys_Image[ "SumatraPDF"      ] := [ "SumatraPDF.png"                 ]
Process_Hotkeys_Image[ "PyCharm"         ] := [ "PyCharm-Fxx.png", "PyCharm.png" ]
Process_Hotkeys_Image[ "QuiteRSS"        ] := [ "QuiteRSS.png"                   ]
Process_Hotkeys_Image[ "Chrome"          ] := [ "Chrome.png"                     ]
Process_Hotkeys_Image[ "Chrome_Bilibili" ] := [ "Chrome-Bilibili.png"            ]
Process_Hotkeys_Image[ "PotPlayer"       ] := [ "PotPlayer.png"                  ]
Process_Hotkeys_Image[ "CloudMusic"      ] := [ "CloudMusic.png"                 ]
Process_Hotkeys_Image[ "Explorer"        ] := [ "Explorer.png"                   ]

; WPS Sheet 图片截图
; [1]System  [3]Windows [4]RCtrl [6]PyCharm [7]VScode [8]Xshell [9]Chrome
; [sheet, start[x], end[y], multi_line, image_file]
global WPS_Hotkeys_Image := []
WPS_Hotkeys_Image.Push( "4 A1 G22 0 E:\Sync\Ahk\Image\RCtrl.png"                  )
WPS_Hotkeys_Image.Push( "3 A1 J29 1 E:\Sync\Ahk\Image\RShift\Windows.png"         )
WPS_Hotkeys_Image.Push( "6 A1 K20 0 E:\Sync\Ahk\Image\RShift\PyCharm-Fxx.png"     )
WPS_Hotkeys_Image.Push( "6 L1 U31 0 E:\Sync\Ahk\Image\RShift\PyCharm.png"         )
WPS_Hotkeys_Image.Push( "8 A1 G26 0 E:\Sync\Ahk\Image\RShift\Xshell.png"          )
WPS_Hotkeys_Image.Push( "9 A1 I41 6 E:\Sync\Ahk\Image\RShift\Chrome.png"          )
WPS_Hotkeys_Image.Push( "9 J1 P26 2 E:\Sync\Ahk\Image\RShift\Chrome-Bilibili.png" )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 指定游戏进程
global Game_Process_Name := []
Game_Process_Name.Push( "LOL" )

; 循环任务忽略的进程
global Loop_Ignore_Process_Name := []
Loop_Ignore_Process_Name.Push( "LOL" )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 在软件中显示快捷键帮助（相对坐标（控件左上角
global Key_Map_Config := {}
Key_Map_Config["PyCharm_SunAwtDialog_PythonConsole"]:=[]
Key_Map_Config["PyCharm_SunAwtDialog_PythonConsole"].Push( [ 14, 72,  "!BS"  ] )
Key_Map_Config["PyCharm_SunAwtDialog_PythonConsole"].Push( [ 14, 123, "!+BS" ] )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 设置软件大小比例 [Mini,Main]
global Windows_MM := {}
Windows_MM["PotPlayer"]:=[]
Windows_MM["PotPlayer"].Push( [ 0.5, 0.5 ] )
Windows_MM["PotPlayer"].Push( [ 0.7, 0.7 ] )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

global Windows_Default_Position := {}

win_x := 10
win_y := 10
win_w := screen_1_w/2-10-10
win_h := screen_1_h-10-10
Windows_Default_Position["TIM"] := [win_x, win_y, win_w, win_h]

win_x := screen_1_w/2+10
win_y := 10+14
win_w := screen_1_w/2-10-10
win_h := screen_1_h-10-10-14-14
Windows_Default_Position["WeChat"] := [win_x, win_y, win_w, win_h]

win_w := screen_3_w*8/9
win_h := screen_3_h/2*5/6
win_x := screen_3_x+screen_3_w/2-win_w/2
win_y := screen_3_y+100
Windows_Default_Position["FDM"] := [win_x, win_y, win_w, win_h]

win_w := screen_1_w*4/6
win_h := screen_1_h*7/9
win_x := screen_1_x+screen_1_w/2-win_w/2
win_y := screen_1_y+screen_1_h/2-win_h/2
Windows_Default_Position["CloudMusic"] := [win_x, win_y, win_w, win_h]

win_w := 2020
win_h := 300
win_x := screen_3_x+screen_3_w/2-win_w/2
win_y := 2020
Windows_Default_Position["CloudMusic_DesktopLyrics"] := [win_x, win_y, win_w, win_h]

win_w := 1500
win_h := 1300
win_x := screen_1_x+screen_1_w/2-win_w/2
win_y := screen_1_y+screen_1_h/2-win_h/2
Windows_Default_Position["7-Zip"] := [win_x, win_y, win_w, win_h]

win_w := 2150
win_h := 1250
win_x := screen_1_x+screen_1_w/2-win_w/2
win_y := screen_1_y+screen_1_h/2-win_h/2
Windows_Default_Position["StartMenu"] := [win_x, win_y, win_w, win_h]

win_w := screen_3_w-6-6
win_h := screen_3_h/2-6-6
win_x := screen_3_x+6
win_y := screen_3_y+6
Windows_Default_Position["TaskMGR"] := [win_x, win_y, win_w, win_h]

win_x := 60
win_y := 30
win_w := screen_1_w-win_x*2+1
win_h := screen_1_h-win_y*2+1
Windows_Default_Position["PyCharm"] := [win_x, win_y, win_w, win_h]

win_w := 800
win_h := 1400
win_x := screen_1_x+screen_1_w/2-win_w/2
win_y := screen_1_y+screen_1_h/2-win_h/2
Windows_Default_Position["PyCharm_SunAwtDialog_OpenFileOrProject"] := [win_x, win_y, win_w, win_h]

win_w := 750
win_h := 1300
win_x := 20
win_y := screen_1_y+screen_1_h/2-win_h/2
Windows_Default_Position["PotPlayer__播放列表"] := [win_x, win_y, win_w, win_h]
