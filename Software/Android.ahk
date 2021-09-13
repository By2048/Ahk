
#if ( WindowsActive("Android", "", "部落冲突") )

    ; 选择兵种
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

    ; Space::
    ;     CoordMode, Mouse, Window
    ;     MouseGetPos, xx, yy
        
    ;     Send {2}
    ;     Sleep 100
    ;     MouseClick, Left, %xx%, %yy%
    ;     Sleep 100
        
    ;     Send {3}
    ;     Sleep 100
    ;     MouseClick, Left, %xx%, %yy%
    ;     Sleep 100

    ;     Send {4}
    ;     Sleep 100
    ;     MouseClick, Left, %xx%, %yy%
    ;     Sleep 100

    ;     Send {2}
    ;     Send {3}
    ;     Send {4}
    ; Return

    `::Send {LButton}
    
    Tab::Send {LButton 4}

    b::
        CoordMode, Mouse, Window
        MouseGetPos, xx, yy

        HelpText("女巫流-快速","center_down","screen_1")

        ; 战争机器
        Send 9
        MouseClick, Left, %xx%, %yy%
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
        MouseClick, Left, %xx%, %yy%
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
            y:=y+300
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
            Sleep 1000

            Send 2
            Sleep 1000
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
        global software_android_rshift_current
        software_android_rshift_current:=0
    Return
    ~1::
        global software_android_rshift_current
        software_android_rshift_current:=1
    Return
    ~2::
        global software_android_rshift_current
        software_android_rshift_current:=2
    Return
    ~3::
        global software_android_rshift_current
        software_android_rshift_current:=3
    Return
    ~4::
        global software_android_rshift_current
        software_android_rshift_current:=4
    Return
    ~5::
        global software_android_rshift_current
        software_android_rshift_current:=5
    Return
    ~6::
        global software_android_rshift_current
        software_android_rshift_current:=6
    Return
    ~7::
        global software_android_rshift_current
        software_android_rshift_current:=7
    Return

    ; 按顺序切换兵种 6-1
    LShift::
        global software_android_rshift_loop
        global software_android_rshift_current
        if (software_android_rshift_current=0) {
            next_index:=software_android_rshift_loop.MaxIndex()
            software_android_rshift_current:=software_android_rshift_loop[next_index]
            Send %software_android_rshift_current%
            Return
        } else {
            for index,value in software_android_rshift_loop {
                if (value=software_android_rshift_current) {
                    if (index=1) {
                        next_index:=software_android_rshift_loop.MaxIndex()
                        software_android_rshift_current:=software_android_rshift_loop[next_index]
                        Send %software_android_rshift_current%
                        Return
                    } else {
                        software_android_rshift_current:=software_android_rshift_loop[index-1]
                        Send %software_android_rshift_current%
                        Return
                    }
                }
            }
        }
    Return

    ; 按顺序切换兵种 1-6
    LAlt::
        global software_android_rshift_loop
        global software_android_rshift_current
        if (software_android_rshift_current=0) {
            software_android_rshift_current:=1
            Send %software_android_rshift_current%
            Return
        } else {
            for index,value in software_android_rshift_loop {
                if (value=software_android_rshift_current) {
                    if (index=software_android_rshift_loop.MaxIndex()) {
                        software_android_rshift_current:=1
                        Send %software_android_rshift_current%
                        Return
                    } else {
                        software_android_rshift_current:=software_android_rshift_loop[index+1]
                        Send %software_android_rshift_current%
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

    ; 全屏
    F11::Return
    #Enter::Send {F11}

    ; 切换键鼠提示 
    ; F12

    ; 切换标签
    ^Tab::Return
    ^+Tab::Return
    !Tab::Send ^{Tab}
    !+Tab::Send ^+{Tab}

    ; 键鼠
    !1::Return

    ; 手柄
    !3::Return

    ; 截屏
    !q::Return
    PrintScreen::Send !q

#if
