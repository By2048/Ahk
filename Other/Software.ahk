#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Init.ahk
#include %A_WorkingDir%\Tool\Mouse.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



; ������޷����д�����ڴ˽��д���
#if WinActive("ahk_exe Code.exe")

    >!m::Send, !VM ;��ʾ�����ͼ

    !x::Send, ^x ; ����
    !c::Send, ^c ; ����
    !v::Send, ^v ; ճ��
    !z::Send, ^z ; ����
    !+z::Send ^+z ; ����
    !BackSpace::Send, ^{BackSpace} ; ɾ��

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

    Space:: 
        CoordMode Mouse Window
        CoordMode Pixel Window
        x_origin:=0
        y_origin:=0
        x_find:=0
        y_find:=0

        MouseGetPos, x_origin, y_origin

        image=%A_WorkingDir%\Image\Software\CloudMusicCloseDetail.png
        size:=GetImageSize(image)
        w:=size[1]
        h:=size[2]

        ; ��������������Ϊ�������Ϸ�
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

    >!y::MouseClickImage("E:\Sync\Ahk\Image\Chrome\Y����.png")
    >!z::MouseClickImage("E:\Sync\Ahk\Image\Chrome\Z��Դ.png")
    >!w::MouseClickImage("E:\Sync\Ahk\Image\Chrome\W�ĵ�.png")
    >!n::MouseClickImage("E:\Sync\Ahk\Image\Chrome\N��Ѷ.png")

#if



#if WinActive("ahk_exe wps.exe")

    >![:: ;�޿���
        MouseGetPos, x_origin, y_origin
        MouseClick, left, 536, 118, 1, 0
        CoordMode Mouse Window
        Send N
        MouseClick, left, 507, 117, 1, 0
        MouseMove x_origin, y_origin, 0
    Return

    >!]:: ;�ֿ���
        MouseGetPos, x_origin, y_origin
        CoordMode Mouse Window
        MouseClick, left, 536, 118, 1, 0
        Send T
        MouseClick, left, 507, 117, 1, 0
        MouseMove x_origin, y_origin, 0
    Return

#if



#if WinActive("ahk_exe FSViewer.exe")

    \:: ;�ƶ����ղ�
        Send m
        Sleep 100
        Send 1
        Sleep 100
        Run D:\Python\_python_\Scripts\pythonw.exe E:\Git\_python_\_script_\_image_rename_.py
    Return

    /:: ;ɾ��
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
; ���/���� ����λ�� ;
;;;;;;;;;;;;;;;;;;;;

