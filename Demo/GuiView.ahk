#include %A_WorkingDir%\Tool\Windows.ahk



F11::
    Gui, Destroy 
Return



F12::

    ; HelpImage()
    ; InitConfig()
    ; MoveWindowsToDefaultPosition()

    ; HelpText("女巫流-快速","center_down","screen_1")

    ; MoveWindowsToDefaultPosition()

    result := GetActiveWindowsInfo()

    win_w := result.win_w + 20
    win_h := result.win_h + 20

    win_x := Screen1.x + Screen1.w/2 - win_w/2
    win_y := Screen1.y + Screen1.h/2 - win_h/2

    Gui, -DPIScale +Disabled +Owner -SysMenu -Caption
    Gui, +Border
    Gui, Margin, 0, 0

    max_length := result["win_controls"].Count()

    for key, value in result["win_controls"] {
        name := key
        x:=value["x"]
        y:=value["y"]
        w:=value["w"]
        h:=value["h"]
        if (x and y and w and h) {
            x:=x+3 + 10
            y:=y+3 + 10
            w:=w-6 
            h:=h-6
            Gui, Add, Text, vG%A_Index% X%x% Y%y% W%w% H%h% +Center +Border, %name%
            Gui, Submit
        }
    }
    Gui, Show, X%win_x% Y%win_y% W%win_w% H%win_h%

    Loop %max_length% {
        GuiControl, Hide, G%A_Index%
    }

    Loop %max_length% {
        GuiControl, Show, G%A_Index%
        Sleep 1000
    }

Return

