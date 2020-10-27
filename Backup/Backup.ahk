
; Process, Priority,,high ;脚本高优先级
; SetTitleMatchMode 2 ;窗口标题模糊匹配
; Menu, Tray, NoStandard ; 不显示任何菜单


if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%" 
    ExitApp
}


WinGet, active_id, ID, A
WinMaximize, ahk_id %active_id%
MsgBox, The active window's ID is "%active_id%".


LCtrl & Tab::AltTab
Shift::ShiftAltTab



;Win+L
#l:: ;a new purpose for Win+L
MsgBox, % "a new purpose for Win+L"
return

;Ctrl+Win+Alt+L
^#!l:: ;lock workstation (note: requires 2 'run as admin' registry writes)
;tested with Windows 7

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


~RWin::
$RWin::
    if (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<300)
    {}
return

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
          


WinGet, wid, ID, A
WinGetPos, x, y, w, h, ahk_id %wid%




WinGetPos, x, y, w, h, A 


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



; Ctrl+Alt+Shift+Win opens the new Office app
; REG ADD HKCU\Software\Classes\ms-officeapp\Shell\Open\Command /t REG_SZ /d rundll32



    Space:: 
        CoordMode Mouse Window
        CoordMode Pixel Window
        x_origin:=0
        y_origin:=0
        x_find:=0
        y_find:=0
        MouseGetPos, x_origin, y_origin
        image:="E:\Sync\Ahk\Image\Software\CloudMusicCloseDetail.png"
        size:=GetImageSize(image)
        w:=size[1]
        h:=size[2]
        CoordMode Pixel Screen
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
        CoordMode Pixel Window
        MouseMove x_origin, y_origin, 0
    Return