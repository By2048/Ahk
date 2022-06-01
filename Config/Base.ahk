
; 当前窗口信息缓存 处理同一进程重复窗口信息获取问题
Global Windows_Cache := {}


; 截图软件配置
Global Snipaste_EXE                    := "D:\Snipaste\Snipaste.exe"
Global Snipaste_Auto_Save_File         := "D:\Snipaste\#\*.png"
Global Snipaste_Screenshot_Path_Backup := "P:\Screen\"
Global Snipaste_Screenshot_Path_Tmp    := "T:\"


; 注册表信息保存位置
Global Reg_Path := "HKEY_CURRENT_USER\SOFTWARE\AutoHotkey"


; 手机<->电脑 剪切板文件
Global JQB_Phone   := "T:\\JQB_Phone"
Global JQB_Windows := "T:\\JQB_Windows"


; 设置软件大小比例 [ Mini , Main ]
Global Windows_Main_Mini := [ [ 3/5 , 3/4 ] , [ 5/6 , 8/9 ] ]


; HelpText Font Config
Global Font_Dpi  := 2
Global Font_Size := 25
Global Font_Type := "Courier New"
