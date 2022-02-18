
#Include %A_WorkingDir%\Tool\Global.ahk

; 初始化系统屏幕相关信息

Global Screens            := {}
Global Screens_Software   := {}
Global Screens_System     := {}
Global Screens_SystemPlus := {}

Global Screen1, Screen2, Screen3, Screen4, Screen5

Global Screens_Dpi_Keys   := [ "Software", "System", "SystemPlus", "" ]
; 与Tool\Screen.ahk中属性同步
Global Screens_Attr_Keys  := [ "index", "name", "dpi", "x", "y", "w", "h", "xx", "yy", "str" ]

For _, dpi In Screens_Dpi_Keys {
    screen_var_name := dpi ? "Screens_" . dpi : "Screens"
    if (screen_var_name.Count() == Screen_Count) {
        continue
    } else {
        %screen_var_name% := {}
    }
    index := 0
    Loop %Screen_Count% {
        index := A_Index
        Screen%index% := {}
        if (dpi) {
            section_name  := "Screen" . index . "." . dpi
        } else {
            section_name  := "Screen" . index
        }
        for _, key in Screens_Attr_Keys {
            Screen%index%[key] := GlobalGet(section_name, key) 
        }
        %screen_var_name%[index] := Screen%index%
    }
}
