
#include %A_WorkingDir%\Config\Screen.ahk
#include %A_WorkingDir%\Config\Software.ahk

; 在 Input.ahk Private.ahk 中定义的快捷输入

global Init_W := 750
global Init_H := 900

global Init_Config := []

NewLine()
{
    global Init_Config    
    line := ""
    length := Init_W/10
    Loop, %length% {
        line := line "-"
    }
    Init_Config.Push(line)
}

NewLine()

Init_Config.Push( Format(" A_WorkingDir | {1}\ ", A_WorkingDir)                    )

NewLine()
if (screen_count>=1) {
    _format_ := " [1] xy|dpi|wh | {1:5} {2:5} {3:5} {4:5}|{5:4}| {6}*{7}"
    _value_  := []
    _value_.Push( screen_1.x, screen_1.y, screen_1.xx, screen_1.yy )
    _value_.Push( screen_1.dpi, screen_1.w, screen_1.h             )
    Init_Config.Push( Format( _format_, _value_*) )
}
if (screen_count>=2) {
    _format_ := " [2] xy|dpi|wh | {1:5} {2:5} {3:5} {4:5}|{5:4}| {6}*{7}"
    _value_  := []
    _value_.Push( screen_2.x, screen_2.y, screen_2.xx, screen_2.yy )
    _value_.Push( screen_2.dpi, screen_2.w, screen_2.h             )
    Init_Config.Push( Format( _format_, _value_*) )
}
if (screen_count>=3) {
    _format_ := " [3] xy|dpi|wh | {1:5} {2:5} {3:5} {4:5}|{5:4}| {6}*{7}"
    _value_  := []
    _value_.Push( screen_3.x, screen_3.y, screen_3.xx, screen_3.yy )
    _value_.Push( screen_3.dpi, screen_3.w, screen_3.h             )
    Init_Config.Push( Format( _format_, _value_*) )
}
NewLine()

Init_Config.Push( Format("     Snipaste | {1} " , Snipaste_EXE)                    )
Init_Config.Push( Format("    Auto_Save | {1} " , Snipaste_Auto_Save_File)         )
Init_Config.Push( Format("  Path_Backup | {1} " , Snipaste_Screenshot_Path_Backup) )
Init_Config.Push( Format("     Path_Tmp | {1} " , Snipaste_Screenshot_Path_Tmp)    )
NewLine()

Init_Config.Push( Format("          WT | {1}" , WT)                                )
Init_Config.Push( Format("      Chrome | {1}" , Chrome)                            )
Init_Config.Push( Format("         CMD | {1}" , CMD)                               )
Init_Config.Push( Format("    TaskKill | {1}" , TaskKill)                          )
Init_Config.Push( Format("         Ahk | {1}" , Ahk)                               )
Init_Config.Push( Format("      Python | {1}" , Python)                            )
Init_Config.Push( Format(" HuntAndPeck | {1}" , HuntAndPeck)                       )
NewLine()

Init_Config.Push( Format(" JQB | {1} ", JQB_Phone)                                  )
Init_Config.Push( Format(" JQB | {1} ", JQB_Windows)                                  )
NewLine()

Init_Config.Push( " [date]         [time]         [datetime]                    "  )
NewLine()

Init_Config.Push( " 使用方式 \***\                                               "  )
Init_Config.Push( " phone          qq             qq1            qq2            "  )
Init_Config.Push( " qmail          qmail1         qmail2         gmail          "  )
Init_Config.Push( " pwd            aly            sfz                           "  )
NewLine()
Init_Config.Push( " py  py3  py.exe  py3.exe  gitx  pipjx  `-  `#  `;           "  )
NewLine()
Init_Config.Push( " nicotv         bi.free        bi.join        bi.getname     "  )
Init_Config.Push( " rename         history        screen         camera         "  )
Init_Config.Push( " scrcpy         update-icon    host           ssh            "  )
NewLine()
