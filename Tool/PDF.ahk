#include %A_WorkingDir%\Tool\Help.ahk



PDF_Main() {
    CoordMode Mouse Windows
    page_count:=250
    delete_x:=1840
    delete_y:=1864
    Loop, %page_count% {
        HelpText("   " A_Index "   ","center_down")
        MouseClick, Left, %delete_x%, %delete_y%, 1, 0
        Send, {Delete}
        MouseClick, Left, 1016, 138, 1, 0 ; 下一页
    }
    HelpText()
}
