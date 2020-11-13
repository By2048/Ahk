#include %A_WorkingDir%\Libs\Base.ahk
; #include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Screen.ahk
; #include %A_WorkingDir%\Tool\Mouse.ahk
; #include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk
; #include %A_WorkingDir%\Tool\Image.ahk
#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



global fxx_help_software:=""


FxxHelp()
{
    Progress, Off
    CoordMode Pixel Screen
    CoordMode Mouse Screen

    global screen_3_w
    global screen_3_h

    content .= Format("{1} {2} {3} {4}",  "D:\", "E:\", "F:\", "R:\")
    content .= " | "
    content .= Format("{1} {2} {3} {4}",  "F1", "F2", "F3", "F4")
    content .= " | "
    content .= Format("{1} {2} {3} {4}",  "F1", "F2", "F3", "F4")
    content .= " | "
    content .= Format("{1} {2} {3} {4}",  "F1", "F2", "F3", "F4")
    content .= data

    w:=screen_3_w
    x:=screen_3_x
    y:=screen_3_y
    w:=w/2

    Progress, b zh0 fs18 c11 ws1000 x%x% y%y% w%w% , %content%, , , Source Code Pro
}



#if WinActive("ahk_exe explorer.exe")
    ; F1::Run, D:\\
    ; F2::Run, E:\\
    ; F3::Run, F:\\
    ; F4::Run, R:\\
#if


#if WinActive("ahk_exe Code.exe")
#if


