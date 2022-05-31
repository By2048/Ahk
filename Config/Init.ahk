
#Include %A_WorkingDir%\Config\Screen.ahk
#Include %A_WorkingDir%\Config\Software.ahk

; 在 Input.ahk Private.ahk 中定义的快捷输入

Global Init := {}

Init["width"]  := 650
Init["height"] := 900
Init["config"] := []
Init["file"]   := A_WorkingDir "\Config\Init.txt"



AddInitLine()
{
    global Init
    line := ""
    length := Init["width"] / 10
    Loop %length% {
        line := line . "-"
    }
    Init["config"].Push(line)
}



GetInitConfig()
{

    global Init

    AddInitLine()
    Init["config"].Push( " A_WorkingDir | "  A_WorkingDir )
    AddInitLine()
    
    ; if (Screen_Count>=1) {
    ;     _format_ := " [1] xy|dpi|wh | {1:5} {2:5} {3:5} {4:5}|{5:4}| {6}*{7}"
    ;     _value_  := []
    ;     _value_.Push( Screens.1.x, Screens.1.y, Screens.1.xx, Screens.1.yy )
    ;     _value_.Push( Screens.1.dpi, Screens.1.w, Screens.1.h             )
    ;     Init["config"].Push( Format( _format_, _value_*) )
    ; }
    ; if (Screen_Count>=2) {
    ;     _format_ := " [2] xy|dpi|wh | {1:5} {2:5} {3:5} {4:5}|{5:4}| {6}*{7}"
    ;     _value_  := []
    ;     _value_.Push( Screens.2.x, Screens.2.y, Screens.2.xx, Screens.2.yy )
    ;     _value_.Push( Screens.2.dpi, Screens.2.w, Screens.2.h             )
    ;     Init["config"].Push( Format( _format_, _value_*) )
    ; }
    ; if (Screen_Count>=3) {
    ;     _format_ := " [3] xy|dpi|wh | {1:5} {2:5} {3:5} {4:5}|{5:4}| {6}*{7}"
    ;     _value_  := []
    ;     _value_.Push( Screens.3.x, Screens.3.y, Screens.3.xx, Screens.3.yy )
    ;     _value_.Push( Screens.3.dpi, Screens.3.w, Screens.3.h             )
    ;     Init["config"].Push( Format( _format_, _value_*) )
    ; }
    ; AddInitLine()

    Init["config"].Push( Format("     Snipaste | {1} " , Snipaste_EXE)                    )
    Init["config"].Push( Format("    Auto_Save | {1} " , Snipaste_Auto_Save_File)         )
    Init["config"].Push( Format("  Path_Backup | {1} " , Snipaste_Screenshot_Path_Backup) )
    Init["config"].Push( Format("     Path_Tmp | {1} " , Snipaste_Screenshot_Path_Tmp)    )
    AddInitLine()

    Init["config"].Push( Format("         CMD | {1}" , CMD)                               )
    Init["config"].Push( Format("    TaskKill | {1}" , TaskKill)                          )
    Init["config"].Push( Format("         Ahk | {1}" , Ahk)                               )
    Init["config"].Push( Format("      Python | {1}" , Python)                            )
    Init["config"].Push( Format(" HuntAndPeck | {1}" , HuntAndPeck)                       )
    AddInitLine()

    Init["config"].Push( Format(" JQB | {1} ", JQB_Phone)                                  )
    Init["config"].Push( Format(" JQB | {1} ", JQB_Windows)                                )
    AddInitLine()

    Init["config"].Push( " [date]         [time]         [datetime]    [chrome]        " )
    AddInitLine()

    Init["config"].Push( " phone          qq             qq1            qq2            " )
    Init["config"].Push( " qmail          qmail1         qmail2         gmail          " )
    Init["config"].Push( " pwd            aly            sfz            3              " )
    Init["config"].Push( "                                                             " )
    Init["config"].Push( " py             py.exe         pipjx          \              " )
    Init["config"].Push( " `-              `#              `;                          " )
    Init["config"].Push( "                                                             " )
    Init["config"].Push( " scrcpy                                                      " )
    AddInitLine()

    init_file := Init["file"]
    FileRead, init_file_config, %init_file%
    Init["config"].Push( init_file_config )

    AddInitLine()
    
}



GetInitConfig()
