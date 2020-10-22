#include %A_WorkingDir%\Other\Base.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Mouse.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk
#include %A_WorkingDir%\Libs\Image.ahk

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



; 软件内无法进行处理的在此进行处理
#if WinActive("ahk_exe Code.exe")

    >!m::Send, !VM ;显示迷你地图

    !x::Send, ^x ; 剪切
    !c::Send, ^c ; 拷贝
    !v::Send, ^v ; 粘贴
    !z::Send, ^z ; 撤销
    !+z::Send ^+z ; 重做

    !BackSpace::Send, ^{BackSpace} ; 删除

#if



#if WinActive("ahk_exe pycharm64.exe")

    !F4::^!F4 ;Alt F4 -> Ctrl Alt F4

#if



#if WinActive("ahk_exe cloudmusic.exe") and WinActive("ahk_class OrpheusBrowserHost")

    `::MouseClickAndResetting(53,1008)
    1::MouseClickAndResetting(52,1073)
    2::MouseClickAndResetting(52,1137)
    3::MouseClickAndResetting(52,1202)
    4::MouseClickAndResetting(52,1267)
    5::MouseClickAndResetting(52,1327)
    6::MouseClickAndResetting(52,1391)

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
            MouseClick, Left, 57, 1765, 1, 0
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

    >!y::MouseClickImage("E:\Sync\Ahk\Image\Chrome\Y娱乐.png")
    >!z::MouseClickImage("E:\Sync\Ahk\Image\Chrome\Z资源.png")
    >!w::MouseClickImage("E:\Sync\Ahk\Image\Chrome\W文档.png")
    >!n::MouseClickImage("E:\Sync\Ahk\Image\Chrome\N资讯.png")

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



#if WinActive("ahk_class Listary_ServerWindow")

    RAlt::Send, {Esc}

#if
#if WinActive("ahk_class Listary_WidgetWin_0")

    RWin::Send, {Esc}

#if 



