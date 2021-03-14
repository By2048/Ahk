
#include %A_WorkingDir%\Tool\Base.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs %A_ScriptFullPath%
}



global search_tool_show_status := False



RAlt & RWin::
    if (IsDesktops() or IsGame()) {
        Return
    } else {
        Send !{F4}
    }
return



$RAlt::
    if (WinActive("ahk_exe pycharm64.exe")) {
        return
    }
    if (IsGame()) {
        Return
    }
    if (not cnt) {
        cnt:=1
    } else {
        cnt+=1
    }
    ;全局搜索框
    SetTimer, timer, -500
return



timer:
    global search_tool_show_status
    if (cnt=1) {
        if (search_tool_show_status=True) {
            search_tool_show_status:=False
            Send ^!r
        }
    } else if (cnt=2) {
        search_tool_show_status:=True
        Send ^!r
    }
    cnt:=0
return
