
#Include %A_WorkingDir%\Config\Screen.ahk
#Include %A_WorkingDir%\Config\Software.ahk

; 在 Input.ahk Private.ahk 中定义的快捷输入

global Init := {}

Init["width"]  := 750
Init["height"] := 950
Init["config"] := []



AddInitLine()
{
    global Init
    line := ""
    length := Init["width"] / 10
    Loop %length% {
        line := line "-"
    }
    Init["config"].Push(line)
}



GetInitConfig()
{

    global Init

    AddInitLine()
    Init["config"].Push( " A_WorkingDir | "  A_WorkingDir )
    AddInitLine()
    
    if (Screen_Count>=1) {
        _format_ := " [1] xy|dpi|wh | {1:5} {2:5} {3:5} {4:5}|{5:4}| {6}*{7}"
        _value_  := []
        _value_.Push( Screen1.x, Screen1.y, Screen1.xx, Screen1.yy )
        _value_.Push( Screen1.dpi, Screen1.w, Screen1.h             )
        Init["config"].Push( Format( _format_, _value_*) )
    }
    if (Screen_Count>=2) {
        _format_ := " [2] xy|dpi|wh | {1:5} {2:5} {3:5} {4:5}|{5:4}| {6}*{7}"
        _value_  := []
        _value_.Push( Screen2.x, Screen2.y, Screen2.xx, Screen2.yy )
        _value_.Push( Screen2.dpi, Screen2.w, Screen2.h             )
        Init["config"].Push( Format( _format_, _value_*) )
    }
    if (Screen_Count>=3) {
        _format_ := " [3] xy|dpi|wh | {1:5} {2:5} {3:5} {4:5}|{5:4}| {6}*{7}"
        _value_  := []
        _value_.Push( Screen3.x, Screen3.y, Screen3.xx, Screen3.yy )
        _value_.Push( Screen3.dpi, Screen3.w, Screen3.h             )
        Init["config"].Push( Format( _format_, _value_*) )
    }
    AddInitLine()

    Init["config"].Push( Format("     Snipaste | {1} " , Snipaste_EXE)                    )
    Init["config"].Push( Format("    Auto_Save | {1} " , Snipaste_Auto_Save_File)         )
    Init["config"].Push( Format("  Path_Backup | {1} " , Snipaste_Screenshot_Path_Backup) )
    Init["config"].Push( Format("     Path_Tmp | {1} " , Snipaste_Screenshot_Path_Tmp)    )
    AddInitLine()

    ; Init["config"].Push( Format("          WT | {1}" , WT)                                )
    ; Init["config"].Push( Format("      Chrome | {1}" , Chrome)                            )
    Init["config"].Push( Format("         CMD | {1}" , CMD)                               )
    Init["config"].Push( Format("    TaskKill | {1}" , TaskKill)                          )
    Init["config"].Push( Format("         Ahk | {1}" , Ahk)                               )
    Init["config"].Push( Format("      Python | {1}" , Python)                            )
    Init["config"].Push( Format(" HuntAndPeck | {1}" , HuntAndPeck)                       )
    AddInitLine()

    Init["config"].Push( Format(" JQB | {1} ", JQB_Phone)                                  )
    Init["config"].Push( Format(" JQB | {1} ", JQB_Windows)                                  )
    AddInitLine()

    Init["config"].Push( " [date]         [time]         [datetime]                    "  )
    AddInitLine()

    Init["config"].Push( " 使用方式 \***\                                               "  )
    Init["config"].Push( " phone          qq             qq1            qq2            "  )
    Init["config"].Push( " qmail          qmail1         qmail2         gmail          "  )
    Init["config"].Push( " pwd            aly            sfz                           "  )
    AddInitLine()
    Init["config"].Push( " py  py3  py.exe  py3.exe  gitx  pipjx  `-  `#  `;           "  )
    AddInitLine()
    Init["config"].Push( " nicotv         bi.free        bi.join        bi.getname     "  )
    Init["config"].Push( " rename         history        screen         camera         "  )
    Init["config"].Push( " scrcpy         update-icon    host           ssh            "  )
    AddInitLine()

}



GetInitConfig()
