#Include %A_ScriptDir%\Tool.ahk
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

    `::MouseClick(53,1008)
    1::MouseClick(52,1073)
    2::MouseClick(52,1137)
    3::MouseClick(52,1202)
    4::MouseClick(52,1267)
    5::MouseClick(52,1327)
    6::MouseClick(52,1391)

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

    >!y::ClickImage("E:\Sync\Ahk\Image\Chrome\Y����.png")
    >!z::ClickImage("E:\Sync\Ahk\Image\Chrome\Z��Դ.png")
    >!w::ClickImage("E:\Sync\Ahk\Image\Chrome\W�ĵ�.png")
    >!n::ClickImage("E:\Sync\Ahk\Image\Chrome\N��Ѷ.png")

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



#if WinActive("ahk_exe explorer.exe") and WinActive("ahk_class OperationStatusWindow")
   
    ; �����ļ����� ���ƶ�������Ļ���Ͻǣ�
    RWin::
        WinGet, w_id, ID, A
        WinGetPos, x, y, w, h, ahk_id %w_id%
        xx:=screen_3_x+(screen_3_xx-screen_3_x)/2-w/2
        yy:=y+200
        WinMove, ahk_id %w_id%, , %xx%, %yy%
    Return

#if



#if WinActive("ahk_exe fdm.exe")

    RWin::
        WinGet, w_id, ID, A
        WinGetPos, x, y, w, h, ahk_id %w_id%
        ww:=screen_3_xx-screen_3_x-100-100
        hh:=1500
        xx:=screen_3_x+(screen_3_xx-screen_3_x)/2-ww/2
        yy:=screen_3_y+100
        WinMove, ahk_id %w_id%, , %xx%, %yy%,     ,     
        WinMove, ahk_id %w_id%, ,     ,     , %ww%, %hh%
    Return

#If