#include %A_WorkingDir%\Tool\Screen.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



Loop {

    ; �ļ�ѡ�񴰿ھ���
    if WinActive("ahk_class #32770") {
        MoveWindowsCenter()
    }

    ; �ļ������ƶ����� (�ƶ�����Ļ3�ϲ���)
    if WinActive("ahk_exe explorer.exe") and WinActive("ahk_class OperationStatusWindow") {
        WinGetPos, x, y, w, h, A 
        xx:=screen_3_x+(screen_3_xx-screen_3_x)/2-w/2
        yy:=screen_3_y+500
        SetWindows(xx,yy)
    }

    if WinActive("ahk_exe fdm.exe") {
        HelpText("ahk_exe fdm.exe","center_down")
        ww:=screen_3_xx-screen_3_x-100-100
        hh:=1500
        xx:=screen_3_x+(screen_3_xx-screen_3_x)/2-ww/2
        yy:=screen_3_y+100
        SetWindows(xx,yy,ww,hh,True)
    }
    
    if WinActive("ahk_exe cloudmusic.exe") {
        ww:=(screen_1_xx-screen_1_x)*5/6
        hh:=(screen_1_yy-screen_1_y)*8/9
        xx:=screen_1_x+(screen_1_xx-screen_1_x)/2-ww/2
        yy:=screen_1_y+(screen_1_yy-screen_1_y)/2-hh/2
        SetWindows(xx,yy,ww,hh)
    }

    Sleep, 1000

}


