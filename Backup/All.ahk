
#Include %A_ScriptDir%\Tool.ahk
#SingleInstance Force
#NoTrayIcon


Reload
ExitApp

/*
#	Win
!	Alt
^	Ctrl
+	Shift
<	左
>	右
*/

~Delete::Send {Delete}
~Esc::Send {Esc}

Esc & Delete::
    if (IsDesktops()) {
        Return
    }
    WinGet, win_id, ID, A
    WinKill, ahk_id %win_id%
Return

Delete & Esc::
    if (IsDesktops()) {
        Return
    }
    WinGet, win_name, ProcessName, A
    Process, Close, %win_name%
Return

BackSpace::BackSpace
BackSpace & PrintScreen::Send ^!{PrintScreen}
BackSpace & Pause::Send ^!{Pause}

\::Send \
+\::Send |
\ & BackSpace::
    if (GetKeyState("Ctrl","P")) {
        Send ^{Delete}
    } else if (GetKeyState("Shift","P")) {
        Send +{Delete}
    } else {
        Send {Delete}
    }
Return

~LControl & WheelUp::
    Send {LWin Down}{Ctrl Down}{Left}{Ctrl Up}{LWin Up}
return
~LControl & WheelDown::
    Send {LWin Down}{Ctrl Down}{Right}{Ctrl Up}{LWin Up}
return



;脚本高优先级
Process, Priority,,high 

;窗口标题模糊匹配
SetTitleMatchMode 2 

; 不显示任何菜单
Menu, Tray, NoStandard 


; if (not A_IsAdmin) {
;     Run *RunAs %A_ScriptFullPath% 
;     ExitApp
; }

Format("{:U}, {:L} and {:T}", "upper", "LOWER", "title")

FileMove, T:\vscode.png, T:\VSCode.png


Run "::{645FF040-5081-101B-9F08-00AA002F954E}::" ; 回收站

size:=GetImageSize(image)
w:=size[1]
h:=size[2]
x:=A_ScreenWidth/2-w/2
y:=A_ScreenHeight/2-h/2

SplashImage, %image%, X%x% Y%y% H%h% W%w% B1   ;  全屏幕居中
SplashImage, %image%, B1  ; 去除任务栏屏幕居中


WinGet, active_id, ID, A
WinMaximize, ahk_id %active_id%
MsgBox, The active window's ID is "%active_id%".


LCtrl & Tab::AltTab
Shift::ShiftAltTab


WinSet, Style, ^0xC00000, A



;Win+L
;a new purpose for Win+L
#l::MsgBox, % "a new purpose for Win+L"

;Ctrl+Win+Alt+L
;lock workstation (note: requires 2 'run as admin' registry writes)
^#!l:: 


;enable 'lock workstation' (and enable Win+L hotkey):
RegRead, vIsDisabled, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation
if vIsDisabled
	try RunWait, % "*RunAs " A_ComSpec " /c REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableLockWorkstation /t REG_DWORD /d 0 /f",, Hide ;enable Win+L
	;RegWrite, REG_DWORD, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 0 ;enable Win+L

;lock workstation:
DllCall("user32\LockWorkStation")

;disable 'lock workstation' (and disable Win+L hotkey):
RegRead, vIsDisabled, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation
if !vIsDisabled
	try RunWait, % "*RunAs " A_ComSpec " /c REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableLockWorkstation /t REG_DWORD /d 1 /f",, Hide ;disable Win+L
	;RegWrite, REG_DWORD, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 1 ;disable Win+L
return



<#Tab::AltTab



content .= "`n"
content .= Format("{1} | {2:-25}`n", "Snipaste", "D:\Snipaste\Snipaste.exe")
content .= Format("{1} | {2:-25}`n", "Screens", "R:\Screens")
content := StrReplace(content," ","  ")

content := StrReplace(content," ","  ")


if (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<300){
}

SetCapsLockState % !GetKeyState("CapsLock", "T") 


 Shift::
#Shift::
~Shift::
    if (not cnt) {
        cnt:=1
    } else {
        cnt++
    }
    SetTimer, timer, -300
return

timer:
    if (cnt=1) {

    } else if (cnt=2) {

    }
return
          



; 简单替换
s .= Format("{2}, {1}!`r`n", "World", "Hello")
; 填充空格
s .= Format("|{:-10}|`r`n|{:10}|`r`n", "Left", "Right")
; 十六进制
s .= Format("{1:#x} {2:X} 0x{3:x}`r`n", 3735928559, 195948557, 0)
; 浮点数
s .= Format("{1:0.3f} {1:.10f}", 4*ATan(1))

ListVars  ; 用 AutoHotkey 的主窗口显示等宽文本.
WinWaitActive ahk_class AutoHotkey
ControlSetText Edit1, %s%
WinWaitClose


; if (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<500) {
; } else {
; }



; Ctrl+Alt+Shift+Win opens the new Office app
; REG ADD HKCU\Software\Classes\ms-officeapp\Shell\Open\Command /t REG_SZ /d rundll32



Space:: 
    CoordMode, Mouse, Window
    CoordMode, Pixel, Window
    x_origin:=0
    y_origin:=0
    x_find:=0
    y_find:=0
    MouseGetPos, x_origin, y_origin
    image:="E:\Sync\Ahk\Image\Software\CloudMusicCloseDetail.png"
    size:=GetImageSize(image)
    w:=size[1]
    h:=size[2]
    CoordMode, Pixel, Screen
    ImageSearch, x_find, y_find, 0, 0, A_ScreenWidth, A_ScreenHeight, %image%
    MsgBox, %x_find% | %y_find%
    MsgBox, %A_ScreenWidth% | %A_ScreenHeight%
    if (x_find and y_find) {
        x_find:=x_find+w/2
        y_find:=y_find+h/2
        MouseClick, Left, x_find, y_find, 1, 0
    } else {
        MouseClick, Left, 57, 1765, 1, 0
    }
    CoordMode, Pixel, Window
    MouseMove x_origin, y_origin, 0
Return



Progress, 2: Off
Progress, 2: b zh0 fs18 c11 ws1000 x%x% y%y% w%w% h%h%, %content%,  ,  , "Source Code Pro"



Progress, b w200, My SubText, My MainText, My Title
Progress, 50 ; 设置进度条的位置为 50%.
Sleep, 4000
Progress, Off




Gui,Color,Black,000000
Gui, -Caption +AlwaysOnTop

height:=A_ScreenHeight/2.5
width:=A_ScreenWidth/2.5

Gui,Show, h%height% w%width%
; Gui,Show, h100 w100
Gui,Font,Tahoma s9
Gui,Add, Text,cWhite w500 x25 y100,Some Text Here
sleep 2000
; exitapp




Esc:: ; 在按下时触发。
    If StartTime
        return
    StartTime := A_TickCount
return

Esc up:: ; 在弹起时触发。
    TimeLength := A_TickCount - StartTime
    if (TimeLength < 200) {
        MsgBox, 您按住退出键不到 200 毫秒。
    } else if (TimeLength < 1500) {
        MsgBox, 您按住退出键 1 秒左右。
    }
    StartTime := ""
return







array := {ten: 10, twenty: 20, thirty: ["1","2","3"]}
MsgBox %array["thirty"][1]%
data:=array["ten"]
data:=array["thirty"].MaxIndex()
data:=array["twenty"].MaxIndex()
MsgBox %data%
For key, value in array {
    MsgBox %key% = %value%
}



Gui, ProgressWindows:Add, Progress, w200 h20 b cBlue vMyProgress, 0
Sleep, 4000
Progress, Off

Gui, ProgressWindows:-Caption
Gui, Show, Center


; run
; 更新 ms-settings:windowsupdate
; 备份	ms-settings:backup
; 针对开发人员	ms-settings:developers

