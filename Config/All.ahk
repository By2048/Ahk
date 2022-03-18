
#Include %A_WorkingDir%\Config.ahk
#Include %A_WorkingDir%\Config\Screen.ahk

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 当前窗口信息缓存 处理同一进程重复窗口信息获取问题
Global Windows_Cache := {}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 截图软件配置
Global Snipaste_EXE                    := "D:\Snipaste\Snipaste.exe"
Global Snipaste_Auto_Save_File         := "D:\Snipaste\#\*.png"
Global Snipaste_Screenshot_Path_Backup := "P:\Screen\"
Global Snipaste_Screenshot_Path_Tmp    := "T:\"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 手机<->电脑 剪切板文件
Global JQB_Phone   := "T:\\JQB_Phone"
Global JQB_Windows := "T:\\JQB_Windows"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 设置软件大小比例 [ Mini , Main ]
Global Windows_MM          := {}
Windows_MM["Default"]      := [ [ 3/5 , 3/4 ] , [ 5/6 , 8/9 ] ]
Windows_MM["PotPlayer"]    := [ [ 0.6 , 0.6 ] , [ 0.8 , 0.8 ] ]
Windows_MM["FreeFileSync"] := [ [ 0.6 , 0.6 ] , [ 0.7 , 0.8 ] ]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#Include %A_WorkingDir%\Config\Init.ahk
#Include %A_WorkingDir%\Config\KeyMap.ahk
#Include %A_WorkingDir%\Config\Message.ahk
#Include %A_WorkingDir%\Config\Position.ahk
#Include %A_WorkingDir%\Config\Private.ahk
#Include %A_WorkingDir%\Config\Software.ahk

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
