
#If ( CheckWindowsActive( "Android" ) )

    ; 全屏
    F11::Return
    #Enter::Send {F11}

    ; 切换键鼠提示 
    ; F12::Return

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
    PrintScreen::Send !q

#If



#If ( CheckWindowsActive( "Android" , "" , "部落冲突" ) )
    
    #Include %A_WorkingDir%\Software\Android.COC.Private.ahk

    `::Send {LButton}
    
    Tab::Send {LButton 4}

    b::
        CoordMode, Mouse, Screen
        MouseGetPos, xx, yy

        HelpText("女巫流-快速","center_down","screen_1")

        ; 战争机器
        Send 9
        MouseClick, Left, %xx%, %yy%, 1
        Sleep 100
        Send 9

        Sleep 1500

        ; 第一个兵种
        Send 0
        MouseClick, Left, %xx%, %yy%, 12
        Sleep 100

        HelpText()
    Return

    ; 女巫流
    =::
        HelpText("女巫流","center_down","screen_1")

        CoordMode, Mouse, Window
        MouseGetPos, xx, yy

        ; 战争机器
        Send 9
        MouseClick, Left, %xx%, %yy%, 1
        Sleep 3000
        
        ; 第一个兵种
        Send 0
        MouseClick, Left, %xx%, %yy%, 12
        Sleep 100
        
        ; 战争机器 释放技能
        Loop, 4 {
            Send 9
            txt:="   " A_Index "   "
            HelpText(txt,"center_down")
            if (A_Index<4) {
                Sleep, 15*1000
            } else {
                Sleep, 1000
                HelpText()
            }
        }
        
        HelpText("女巫流","center_down","screen_1",1000)
    return

    ; 降杯
    -::
        HelpText("降杯","center_down","screen_1")

        CoordMode, Mouse, Window

        Send Q
        Sleep 500
        Send \
        Sleep 500

        Send Q
        Sleep 500
        Send R
        Sleep 5000

        Send 0
        Sleep 500
        Send \
        Sleep 500

        y:=0
        Loop, 4 {
            y := y + 300
            MouseClick, Left, 300, %y%
            Sleep 100
            MouseClick, Left, 1700, %y%
            Sleep 100
            MouseClick, Left, 2800, %y%
            Sleep 100
        }

        Send A
        Sleep 500
        Send S
        Sleep 500
        Send D
        Sleep 3000
        
        Send \

        Sleep 500
        HelpText()
    Return

    ; 降杯
    0::
        CoordMode, Mouse, Window
        Loop, 10 {
            Send q
            Sleep 300
            Send w
            Sleep 3000

            Send 2
            Sleep 500
            MouseClick, Left, 117, 890
            Sleep 500
            
            Send a
            Sleep 100
            Send s
            Sleep 1000
            Send d
            Sleep 3000
        }
    Return

    ; 退出
    BackSpace::
        HelpText("BackSpace","center_down","screen_1")
        Send A
        Sleep 100
        Send S
        Sleep 2000
        Send D
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
    CapsLock Up::SetCapsLockState Off

    ; 兵种选择
    ~e::
        global Android_Rshift_Current
        Android_Rshift_Current:=0
    Return
    ~1::
        global Android_Rshift_Current
        Android_Rshift_Current:=1
    Return
    ~2::
        global Android_Rshift_Current
        Android_Rshift_Current:=2
    Return
    ~3::
        global Android_Rshift_Current
        Android_Rshift_Current:=3
    Return
    ~4::
        global Android_Rshift_Current
        Android_Rshift_Current:=4
    Return
    ~5::
        global Android_Rshift_Current
        Android_Rshift_Current:=5
    Return
    ~6::
        global Android_Rshift_Current
        Android_Rshift_Current:=6
    Return
    ~7::
        global Android_Rshift_Current
        Android_Rshift_Current:=7
    Return

    ; 按顺序切换兵种 6-1
    LShift::
        global Android_Rshift_Loop
        global Android_Rshift_Current
        if (Android_Rshift_Current=0) {
            next_index:=Android_Rshift_Loop.MaxIndex()
            Android_Rshift_Current:=Android_Rshift_Loop[next_index]
            Send %Android_Rshift_Current%
            Return
        } else {
            for index,value in Android_Rshift_Loop {
                if (value=Android_Rshift_Current) {
                    if (index=1) {
                        next_index:=Android_Rshift_Loop.MaxIndex()
                        Android_Rshift_Current:=Android_Rshift_Loop[next_index]
                        Send %Android_Rshift_Current%
                        Return
                    } else {
                        Android_Rshift_Current:=Android_Rshift_Loop[index-1]
                        Send %Android_Rshift_Current%
                        Return
                    }
                }
            }
        }
    Return

    ; 按顺序切换兵种 1-6
    LAlt::
        global Android_Rshift_Loop
        global Android_Rshift_Current
        if (Android_Rshift_Current=0) {
            Android_Rshift_Current:=1
            Send %Android_Rshift_Current%
            Return
        } else {
            for index,value in Android_Rshift_Loop {
                if (value=Android_Rshift_Current) {
                    if (index=Android_Rshift_Loop.MaxIndex()) {
                        Android_Rshift_Current:=1
                        Send %Android_Rshift_Current%
                        Return
                    } else {
                        Android_Rshift_Current:=Android_Rshift_Loop[index+1]
                        Send %Android_Rshift_Current%
                        Return
                    }
                }
            }
        }
    Return

    ; 删除护盾
    Delete::
        CoordMode, Mouse, Window
        
        MouseGetPos, x_origin, y_origin
        
        MouseClick, Left, 1759, 105
        Sleep 100
        MouseClick, Left, 2049, 753
        Sleep 100
        MouseClick, Left, 1988, 1246
        Sleep 100

        MouseMove %x_origin%, %y_origin%, 0
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

#If
