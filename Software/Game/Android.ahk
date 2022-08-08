
#If CheckWindowActive( "Android" )

    ; 全屏
    F11::Return
    #Enter::Send {F11}

    ; 切换键鼠提示 
    ; F12::Return

    ; Mini模式
    !g::Return
    RAlt::Send !g

    ; 切换标签
    ^Tab::Return
    ^+Tab::Return
    !Tab::Send ^{Tab}
    !+Tab::Send ^+{Tab}

    ^1::Return
    ^2::Return
    ^3::Return
    ^4::Return
    ^5::Return
    ^6::Return
    ^7::Return
    ^8::Return
    ^9::Return
    ^0::Return

    ; 键鼠
    !1::Return

    ; 手柄
    !3::Return

    ; 截屏
    !q::Return
    Insert::Send !q

#If



#If CheckWindowActive( "Android" , "" , "部落冲突" )
    
    #Include %A_WorkingDir%\Software\Game\Android.COC.Private.ahk

    Init_Coc_Args:
        Global Android_COC_Loop := [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 ]
    Return

    F12::ListVars

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
    LAlt::
        GoSub Init_Coc_Args
        Global Android_COC_Current
        if (not Android_COC_Current) {
            Android_COC_Current := 1
            Send %Android_COC_Current%
            Return
        }
        for index, value in Android_COC_Loop {
            if (value == Android_COC_Current) {
                if (index == Android_COC_Loop.MaxIndex()) {
                    Android_COC_Current := 1
                    Send %Android_COC_Current%
                    Return
                } else {
                    Android_COC_Current := Android_COC_Loop[index + 1]
                    Send %Android_COC_Current%
                    Return
                }
            }
        }
    Return

    ; 按顺序切换兵
    LShift::
        GoSub Init_Coc_Args
        Global Android_COC_Current
        if (not Android_COC_Current) {
            next_index := Android_COC_Loop.MaxIndex()
            Android_COC_Current := Android_COC_Loop[next_index]
            Send %Android_COC_Current%
            Return
        }
        for index, value in Android_COC_Loop {
            if (value == Android_COC_Current) {
                if (index == 1) {
                    next_index := Android_COC_Loop.MaxIndex()
                    Android_COC_Current := Android_COC_Loop[next_index]
                    Send %Android_COC_Current%
                    Return
                } else {
                    Android_COC_Current := Android_COC_Loop[index - 1]
                    Send %Android_COC_Current%
                    Return
                }
            }
        }
    Return

    ; 删除护盾
    Delete::
        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin
        Send, p
        Sleep 100
        MouseClick, Left, 2049, 753
        Sleep 100
        MouseClick, Left, 1988, 1246
        Sleep 100
        MouseMove %x_origin%, %y_origin%, 0
        Send /
    Return

    ;阵形1
    F1::
        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin
        MouseClick, Left, 3373, 1401
        Sleep 300
        MouseClick, Left, 665, 1129
        Sleep 500
        MouseClick, Left, 2274, 1907
        Sleep 500
        MouseClick, Left, 3360, 190
        Sleep 100
        MouseMove %x_origin%, %y_origin%, 0
    Return
    
    ;阵形2
    F2::
        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin
        MouseClick, Left, 3373, 1401
        Sleep 300
        MouseClick, Left, 1729, 1103
        Sleep 500
        MouseClick, Left, 2274, 1907
        Sleep 500
        MouseClick, Left, 3360, 190
        Sleep 100
        MouseMove %x_origin%, %y_origin%, 0
    Return
    
    ;阵形3
    F3::
        CoordMode, Mouse, Window
        MouseGetPos, x_origin, y_origin
        MouseClick, Left, 3373, 1401
        Sleep 300
        MouseClick, Left, 2786, 1103
        Sleep 500
        MouseClick, Left, 2274, 1907
        Sleep 500
        MouseClick, Left, 3360, 190
        Sleep 100
        MouseMove %x_origin%, %y_origin%, 0
    Return

    ; 部署栏拖动
    >!\::
        MouseClickDrag, Left,  ,  , 500, 0, 11, R
    Return

#If
