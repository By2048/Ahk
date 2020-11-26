#include %A_WorkingDir%\Libs\Base.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Mouse.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk
#include %A_WorkingDir%\Tool\Image.ahk
#SingleInstance Force
#NoTrayIcon


if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



MouseIsOver(WinTitle) {
    MouseGetPos,  ,  , Win
    return WinExist(WinTitle . " ahk_id " . Win)
}
#if MouseIsOver("ahk_class Shell_TrayWnd")
    WheelUp::Send {Volume_Up}
    WheelDown::Send {Volume_Down}
#if



#if WinActive("ahk_exe cloudmusic.exe") and WinActive("ahk_class OrpheusBrowserHost")

    `::MouseClickAndResetting(53,1118)
    1::MouseClickAndResetting(52,1206)
    2::MouseClickAndResetting(52,1282)
    3::MouseClickAndResetting(52,1363)
    4::MouseClickAndResetting(52,1444)
    5::MouseClickAndResetting(52,1526)
    6::MouseClickAndResetting(52,1604)

    Space:: 
        CoordMode Mouse Window
        CoordMode Pixel Window
        x_origin:=0
        y_origin:=0
        x_find:=0
        y_find:=0

        MouseGetPos, x_origin, y_origin

        image=%A_WorkingDir%\Image\Software\CloudMusic_CloseDetail.png
        size:=GetImageSize(image)
        w:=size[1]
        h:=size[2]

        ; 将搜索区域设置为窗口右上方
        WinGetPos, wx, wy, ww, wh, A
        x1:=wx+ww/2
        y1:=wy
        x2:=x1+ww/2
        y2:=y1+wh

        ImageSearch, x_find, y_find, x1, y1, x2, y2, *%w% *%h% *20 %image%

        if (x_find and y_find) {
            x_find:=x_find+w/2
            y_find:=y_find+h/2
            MouseClick, Left, x_find, y_find, 1, 0
        } else {
            MouseClick, Left, 71, 1846, 1, 0
        }

        MouseMove x_origin, y_origin, 0
    Return


    \::Send !\

    [::Send ![
    ]::Send !]
    =::Send !=
    -::Send !-

    Left::Send ![
    Right::Send !]
    Up::Send !=
    Down::Send !-

#if



#if WinActive("ahk_exe chrome.exe")

    >!y::MouseClickImage("E:\Sync\Ahk\Image\Software\Y.png")
    >!z::MouseClickImage("E:\Sync\Ahk\Image\Software\Z.png")
    >!w::MouseClickImage("E:\Sync\Ahk\Image\Software\W.png")
    >!n::MouseClickImage("E:\Sync\Ahk\Image\Software\N.png")

#if



#if WinActive("ahk_exe wps.exe")

    >![:: ;无框线
        MouseGetPos, x_origin, y_origin
        MouseClick, left, 536, 118, 1, 0
        CoordMode Mouse Window
        Send N
        MouseClick, left, 507, 117, 1, 0
        MouseMove x_origin, y_origin, 0
    Return

    >!]:: ;粗框线
        MouseGetPos, x_origin, y_origin
        CoordMode Mouse Window
        MouseClick, left, 536, 118, 1, 0
        Send T
        MouseClick, left, 507, 117, 1, 0
        MouseMove x_origin, y_origin, 0
    Return

#if



#if WinActive("ahk_exe FSViewer.exe")

    \:: ;移动到收藏
        Send m
        Sleep 100
        Send 1
        Sleep 100
        Run D:\Python\_python_\Scripts\pythonw.exe E:\Git\_python_\_script_\_image_rename_.py
    Return

    /:: ;删除
        Send {Delete}
        Sleep 100
        Send {Enter}
    Return

    ]::
        Send {Right}
    Return

    [::
        Send {Left}
    Return

#If



#if WinActive("ahk_exe NemuPlayer.exe")
    
    Space::Send, {LButton 4}
    
    `::Send, {LButton}

    ; 女巫流
    =::
        CoordMode, Mouse, Window
        MouseGetPos, xx, yy

        ; 战争机器
        Send, 7 
        MouseClick, Left, %xx%, %yy%

        Sleep, 3000
        
        ; 第一个兵种
        Send, 1        
        MouseClick, Left, %xx%, %yy%, 12
        
        Sleep, 100

        ; 战争机器 释放技能
        Loop, 4 {
            Send, 7
            txt:="   " A_Index "   "
            HelpText(txt,"center_down")
            if (A_Index<4) {
                Sleep, 15*1000
            } else {
                Sleep, 1000
                HelpText()
            }
        }
    return

    ; 降杯
    -::
        CoordMode, Mouse, Window

        Send, Q
        Sleep, 500
        Send, /
        Sleep, 500

        Send, Q
        Sleep, 500
        
        Send, R
        Sleep, 5000

        Send 1
        Sleep, 500
        Send /
        Sleep, 500

        y:=0
        Loop, 4 {
            y:=y+300
            MouseClick, Left, 300, %y%
            Sleep, 100
            MouseClick, Left, 1700, %y%
            Sleep, 100
            MouseClick, Left, 2800, %y%
            Sleep, 100
        }

        Send, A
        Sleep, 500
        Send, S
        Sleep, 500
        Send, D
        Sleep, 3000
        
        Send /
    Return

    ; 退出
    BackSpace::
        Send A
        Sleep, 200
        Send S
        Sleep, 1000
        Send D
        Sleep, 3000
        Send /

        Send, Q
        Sleep, 500
        Send, /     
    Return

    Tab::
        Send a
        Sleep, 200
        Send s
        Sleep, 1000
        Send d
        Sleep, 3000

        Send z
        Sleep, 300
        Send x
        Sleep, 300
        Send c
        Sleep, 300

        Send /
    Return

#if

