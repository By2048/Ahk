#SingleInstance Force
#NoTrayIcon
#include %A_ScriptDir%\Tool.ahk



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
        WinGet, w_id, ID, A
        WinGetPos, x, y, w, h, ahk_id %w_id%
        xx:=screen_3_x+(screen_3_xx-screen_3_x)/2-w/2
        yy:=screen_3_y+500
        ; ���㴰�ڵ�����λ�����ȡ��ʵ��λ�ã�����΢Сƫ��
        if (Abs(x-xx)>5 or Abs(y-yy)>5) {
            WinMove, ahk_id %w_id%, , %xx%, %yy%
        }
    }

    if WinActive("ahk_exe fdm.exe") {
        WinGet, w_id, ID, A
        WinGetPos, x, y, w, h, ahk_id %w_id%
        ww:=screen_3_xx-screen_3_x-100-100
        hh:=1500
        xx:=screen_3_x+(screen_3_xx-screen_3_x)/2-ww/2
        yy:=screen_3_y+100
        if (Abs(xx-x)>5 or Abs(yy-y)>5 or Abs(ww-w)>5 or Abs(hh-h)>5) {
            ; ��ͬ�ֱ�����Ļ֮���ƶ����� �����δ��� �����ݣ�
            WinMove, ahk_id %w_id%, , %xx%, %yy%,     ,     
            WinMove, ahk_id %w_id%, ,     ,     , %ww%, %hh%
        }
    }

    Sleep, 1000

}





   




