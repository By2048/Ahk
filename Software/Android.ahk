
#if ( WindowsActive("Android", "", "部落冲突") )

    `::Send {LButton}

    Space::Send {LButton 4}

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

        HelpText()
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
    Tab::
        HelpText("Tab","center_down","screen_1")

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

    ~e::
        global software_android_rshift_current
        software_android_rshift_current:=0
    Return

    ; 按顺序切换兵种 5-1
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

    ; 按顺序切换兵种 1-5
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

    ; 全屏
    F11::Return
    !Enter::Send {F11}

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
    CapsLock::Send !q
    CapsLock Up::SetCapsLockState off

#if
