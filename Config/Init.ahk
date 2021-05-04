
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
    _value_.Push( screen_1_x, screen_1_y, screen_1_xx, screen_1_yy )
    _value_.Push( screen_1_dpi, screen_1_w, screen_1_h             )
    Init_Config.Push( Format( _format_, _value_*) )
}
if (screen_count>=2) {
    _format_ := " [2] xy|dpi|wh | {1:5} {2:5} {3:5} {4:5}|{5:4}| {6}*{7}"
    _value_  := []
    _value_.Push( screen_2_x, screen_2_y, screen_2_xx, screen_2_yy )
    _value_.Push( screen_2_dpi, screen_2_w, screen_2_h             )
    Init_Config.Push( Format( _format_, _value_*) )
}
if (screen_count>=3) {
    _format_ := " [3] xy|dpi|wh | {1:5} {2:5} {3:5} {4:5}|{5:4}| {6}*{7}"
    _value_  := []
    _value_.Push( screen_3_x, screen_3_y, screen_3_xx, screen_3_yy )
    _value_.Push( screen_3_dpi, screen_3_w, screen_3_h             )
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

Init_Config.Push( Format(" JQB | {1} ", JQB_File)                                  )
NewLine()

Init_Config.Push( " [date] [time] [datetime] "                                     )
NewLine()

Init_Config.Push( " \***\ "                                                        )
Init_Config.Push( " phone qq qq1 qq2 "                                             )
Init_Config.Push( " qmail qmail1 qmail2 gmail "                                    )
Init_Config.Push( " pwd aly "                                                      )
Init_Config.Push( " nicotv "                                                       )
Init_Config.Push( " bi.free bi.join bi.getname "                                   )
Init_Config.Push( " history screen camera "                                        )
Init_Config.Push( " py pipjx scrcpy "                                              )
NewLine()
