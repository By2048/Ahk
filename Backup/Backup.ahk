
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