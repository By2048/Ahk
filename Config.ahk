
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 可执行文件
global WT     := "C:\Users\AM\AppData\Local\Microsoft\WindowsApps\wt.exe" ; Windows Terminal
global CMD    := "C:\Windows\System32\cmd.exe"
global Python := "D:\Python\_python_\Scripts\python.exe"

; 截图软件配置
global Snipaste_EXE             := "D:\Snipaste\Snipaste.exe"
global Snipaste_Auto_Save_File  := "E:\Snipaste\*.png"
global Snipaste_Screenshot_Path := "R:\Screens\"

; PyCharm中一些界面大小配置
global PyCharm_Main := [   5/6 , 5.7/7 ]
global PyCharm_Mini := [ 1.8/3 ,   3/4 ]
global PyCharm_Open_XXX_Main := [ 1/5 , 2/3 ]
global PyCharm_Open_XXX_Mini := [ 1/5 , 2/3 ]

; 手机向电脑写入的剪切板文件
global JQB_File := "T:\\JQB"

; 软件自定义名字替换
global Windows_Process_Name := []
Windows_Process_Name.Push( [ "code"              , "VSCode"       ] )
Windows_Process_Name.Push( [ "chrome"            , "Chrome"       ] )
Windows_Process_Name.Push( [ "firefox"           , "FireFox"      ] )
Windows_Process_Name.Push( [ "cloudmusic"        , "CloudMusic"   ] )
Windows_Process_Name.Push( [ "pycharm64"         , "PyCharm"      ] )
Windows_Process_Name.Push( [ "wps"               , "WPS"          ] )
Windows_Process_Name.Push( [ "explorer"          , "Explorer"     ] )
Windows_Process_Name.Push( [ "fdm"               , "FDM"          ] )
Windows_Process_Name.Push( [ "PotPlayerMini64"   , "PotPlayer"    ] )
Windows_Process_Name.Push( [ "LeagueClientUx"    , "LOL"          ] )
Windows_Process_Name.Push( [ "League of Legends" , "LOL"          ] )
Windows_Process_Name.Push( [ "NemuPlayer"        , "Android"      ] )
Windows_Process_Name.Push( [ "ui32"              , "Wallpaper"    ] )
Windows_Process_Name.Push( [ "steam"             , "Steam"        ] )
Windows_Process_Name.Push( [ "mstsc"             , "Mstsc"        ] )
Windows_Process_Name.Push( [ "FreeFileSync_x64"  , "FreeFileSync" ] )
Windows_Process_Name.Push( [ "happ"              , "THS"          ] )

; RShift快捷键帮助配置 快捷键图片对应关系
global Process_Hotkeys_Image := {}
Process_Hotkeys_Image[ "default"         ] := [ "Windows.png"                    ]
Process_Hotkeys_Image[ "Windows"         ] := [ "Windows.png"                    ]
Process_Hotkeys_Image[ "VSCode"          ] := [ "VSCode-Fxx.png", "VSCode.png"   ]
Process_Hotkeys_Image[ "Xshell"          ] := [ "Xshell.png"                     ]
Process_Hotkeys_Image[ "SumatraPDF"      ] := [ "SumatraPDF.png"                 ]
Process_Hotkeys_Image[ "PyCharm"         ] := [ "PyCharm.png", "PyCharm-Fxx.png" ]
Process_Hotkeys_Image[ "QuiteRSS"        ] := [ "QuiteRSS.png"                   ]
Process_Hotkeys_Image[ "Chrome"          ] := [ "Chrome.png"                     ]
Process_Hotkeys_Image[ "Chrome_Bilibili" ] := [ "Chrome-Bilibili.png"            ]
Process_Hotkeys_Image[ "PotPlayer"       ] := [ "PotPlayer.png"                  ]
Process_Hotkeys_Image[ "CloudMusic"      ] := [ "CloudMusic.png"                 ]

; 指定游戏进程
global Game_Process_Name := []
Game_Process_Name.Push( "LOL" )

; 设置一些软件默认位置 [x,y,w,h,offset,step]
global Windows_Default_Position := {}
Windows_Default_Position["TIM"   ] := [ 10, 10, screen_1_w/2-10-10, screen_1_h-10-10                       ]
Windows_Default_Position["WeChat"] := [ screen_1_w/2+10, 10+14, screen_1_w/2-10-10, screen_1_h-10-10-14-14 ]

; WPS Sheet 图片截图
; [1]System  [3]Windows [4]RCtrl [6]PyCharm [7]VScode [8]Xshell [9]Chrome
; [sheet, start[x], end[y], multi_line, image_file]
global WPS_Hotkeys_Image := []
WPS_Hotkeys_Image.Push( "3 A1 J27 1 E:\Sync\Ahk\Image\RShift\Windows.png"         )
WPS_Hotkeys_Image.Push( "4 A1 G26 0 E:\Sync\Ahk\Image\RCtrl.png"                  )
WPS_Hotkeys_Image.Push( "8 A1 G25 0 E:\Sync\Ahk\Image\RShift\Xshell.png"          )
WPS_Hotkeys_Image.Push( "9 A1 I41 6 E:\Sync\Ahk\Image\RShift\Chrome.png"          )
WPS_Hotkeys_Image.Push( "9 K1 Q26 2 E:\Sync\Ahk\Image\RShift\Chrome-Bilibili.png" )
