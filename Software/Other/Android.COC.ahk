
#If CheckWindowActive( "Android" , "" , "部落冲突" )

    #Include %A_WorkingDir%\Software\Other\Android.COC.Private.ahk

    Init_Coc_Args:
        Global Android_COC_Loop := [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 ]
    Return

    `::Send {LButton}

    Tab::Send {LButton 4}

    PgUp::
        Send {m Down}
        Send {.}
        Send {m Up}
    Return

    PgDn::
        Send {m Down}
        Send {, 3}
        Send {m Up}
    Return

    ; 退出
    BackSpace::
        HelpText("BackSpace","center_down","screen_1")
        Send a
        Sleep 100
        Send s
        Sleep 2000
        Send d
        Sleep 3000
        Send \
        Sleep 500
        HelpText()
    Return

    ; 补兵
    CapsLock::
        HelpText("CapsLock", "center_down", "screen_1")

        Send a
        Sleep 100
        Send s
        Sleep 1000
        Send d
        Sleep 3000

        Send \
        Sleep, 100

        Send z
        Sleep 100
        Send x
        Sleep 100
        Send c
        Sleep 100

        Send \
        Sleep 500

        HelpText()
    Return
    CapsLock Up::
        SetCapsLockState Off
    Return

    ; 兵种选择
    ~e::
        Android_COC_Current := -1
    Return

    ~1::
    ~2::
    ~3::
    ~4::
    ~5::
    ~6::
    ~7::
    ~8::
    ~9::
    ~0::
        index := StrReplace(A_ThisHotkey, "~", "")
        index := index + 0
        Android_COC_Current := index
    Return

    ; 按顺序切换兵种 1-6
    ; LAlt::
    ;     GoSub Init_Coc_Args
    ;     Global Android_COC_Current
    ;     if (not Android_COC_Current) {
    ;         Android_COC_Current := 1
    ;         Send %Android_COC_Current%
    ;         Return
    ;     }
    ;     for index, value in Android_COC_Loop {
    ;         if (value == Android_COC_Current) {
    ;             if (index == Android_COC_Loop.MaxIndex()) {
    ;                 Android_COC_Current := 1
    ;                 Send %Android_COC_Current%
    ;                 Return
    ;             } else {
    ;                 Android_COC_Current := Android_COC_Loop[index + 1]
    ;                 Send %Android_COC_Current%
    ;                 Return
    ;             }
    ;         }
    ;     }
    ; Return

    ; 按顺序切换兵
    ; LShift::
    ;     GoSub Init_Coc_Args
    ;     Global Android_COC_Current
    ;     if (not Android_COC_Current) {
    ;         next_index := Android_COC_Loop.MaxIndex()
    ;         Android_COC_Current := Android_COC_Loop[next_index]
    ;         Send %Android_COC_Current%
    ;         Return
    ;     }
    ;     for index, value in Android_COC_Loop {
    ;         if (value == Android_COC_Current) {
    ;             if (index == 1) {
    ;                 next_index := Android_COC_Loop.MaxIndex()
    ;                 Android_COC_Current := Android_COC_Loop[next_index]
    ;                 Send %Android_COC_Current%
    ;                 Return
    ;             } else {
    ;                 Android_COC_Current := Android_COC_Loop[index - 1]
    ;                 Send %Android_COC_Current%
    ;                 Return
    ;             }
    ;         }
    ;     }
    ; Return

    ;阵形1
    F1::
    F2::
    F3::
        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin
        MouseClick, Left, 2321, 950
        Sleep 300
        Switch A_ThisHotkey {
            Case "F1" : MouseClick, Left, 477,  758
            Case "F2" : MouseClick, Left, 1196, 759
            Case "F3" : MouseClick, Left, 1915, 752
        }
        Sleep 500
        MouseClick, Left, 1566, 1300
        Sleep 500
        Send {Esc}
        Sleep 100
        MouseMove x_origin, y_origin, 0
    Return

    ; 删除兵种
    F5::
        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin
        MouseClick, Left, 588,  484, 1, 0
        MouseClick, Left, 855,  482, 1, 0
        MouseClick, Left, 1127, 484, 1, 0
        MouseClick, Left, 1395, 484, 1, 0
        MouseClick, Left, 1665, 484, 1, 0
        MouseClick, Left, 1934, 484, 1, 0
        MouseMove %x_origin%, %y_origin%, 0
        Send /
    Return

    ; 删除护盾
    F8::
        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin
        Send p
        Sleep 100
        MouseClick, Left, 1409, 505
        Sleep 100
        MouseClick, Left, 1379, 848
        Sleep 100
        MouseMove %x_origin%, %y_origin%, 0
        Sleep 100
        Send /
    Return

    ; 部署栏拖动
    >!\::
        Send {LButton Down}
        MouseMove, -150, 0, 11, R
        MouseMove,  500, 0, 11, R
        Send {LButton Up}
    Return

    !q::
        images := [ A_WorkingDir . "\Image\Software\COC\gbl.png"
                  , A_WorkingDir . "\Image\Software\COC\gbl_small.png" ]
        CocSelect(images)
    Return

#If