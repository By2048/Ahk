#include %A_WorkingDir%\Other\Base.ahk
; #Include %A_WorkingDir%\Tool\Mouse.ahk
#include %A_WorkingDir%\Tool\Windows.ahk


#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



Loop {

    ; 文件选择窗口居中
    if WinActive("ahk_class #32770") {
        WinGetPos, x, y, w, h, A 
        result:=GetWindowsCenterPos()
        xx:=result[1]
        yy:=result[2]
        SetWindows(xx,yy,w,h,False,70)
    }

    ; 文件复制移动窗口 (移动到屏幕3上部分)
    if WinActive("ahk_exe explorer.exe") and WinActive("ahk_class OperationStatusWindow") {
        WinGetPos, x, y, w, h, A 
        xx:=screen_3_x+(screen_3_xx-screen_3_x)/2-w/2
        yy:=screen_3_y+500
        SetWindows(xx,yy)
    }

    if WinActive("ahk_exe fdm.exe") {
        ww:=screen_3_xx-screen_3_x-100-100
        hh:=1500
        xx:=screen_3_x+(screen_3_xx-screen_3_x)/2-ww/2
        yy:=screen_3_y+100
        SetWindows(xx,yy,ww,hh,True)
    }
    
    if WinActive("ahk_exe cloudmusic.exe") and WinActive("ahk_class OrpheusBrowserHost") {
        ww:=(screen_1_xx-screen_1_x)*5/6
        hh:=(screen_1_yy-screen_1_y)*8/9
        xx:=screen_1_x+(screen_1_xx-screen_1_x)/2-ww/2
        yy:=screen_1_y+(screen_1_yy-screen_1_y)/2-hh/2
        SetWindows(xx,yy,ww,hh)
    }

    ; if WinActive("ahk_exe happ.exe") {
        ; WinGetTitle, title, A
        ; HelpText(title, , ,1000)
        ; if (title="退出窗") {
            ; image=%A_WorkingDir%\Image\Software\Happ_Exit.png
            ; HelpText(image)
            ; MouseClickImage(image)
        ; }
    ; }


    Sleep, 1000

}
