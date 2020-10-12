#Include %A_ScriptDir%\Tool.ahk
#SingleInstance Force
#NoTrayIcon

if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



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





#if WinActive("ahk_exe cloudmusic.exe")

    `::MouseClickAndResetting(53,1008)
    1::MouseClickAndResetting(52,1073)
    2::MouseClickAndResetting(52,1137)
    3::MouseClickAndResetting(52,1202)
    4::MouseClickAndResetting(52,1267)
    5::MouseClickAndResetting(52,1327)
    6::MouseClickAndResetting(52,1391)

    =::Send !=
    -::Send !-

    /::Send !/
    \::Send !\

    [::Send ![
    ]::Send !]

    l::Send !l
    m::Send !m

    Up::Send !=
    Down::Send !-
    Left::Send ![
    Right::Send !]

#if



#if WinActive("ahk_exe chrome.exe")

    >!y::ClickImage("E:\Sync\Ahk\Image\Chrome\Y娱乐.png")
    >!z::ClickImage("E:\Sync\Ahk\Image\Chrome\Z资源.png")
    >!w::ClickImage("E:\Sync\Ahk\Image\Chrome\W文档.png")
    >!n::ClickImage("E:\Sync\Ahk\Image\Chrome\N资讯.png")

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




;;;;;;;;;;;;;;;;;;;;
; 软件/窗口 特殊位置 ;
;;;;;;;;;;;;;;;;;;;;

