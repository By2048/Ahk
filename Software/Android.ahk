
#if ( WindowsActive("Android") )
    
    Space::Send, {LButton 4}
    
    `::Send, {LButton}

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

    ^Tab::Return
    ^+Tab::Return
    !Tab::Send, ^{Tab}
    !+Tab::Send, ^+{Tab}

    ; 女巫流
    =::
        CoordMode, Mouse, Window
        MouseGetPos, xx, yy

        ; 战争机器
        Send, 9
        MouseClick, Left, %xx%, %yy%

        Sleep, 3000
        
        ; 第一个兵种
        Send, 0
        MouseClick, Left, %xx%, %yy%, 12
        
        Sleep, 100

        ; 战争机器 释放技能
        Loop, 4 {
            Send, 9
            txt:="   " A_Index "   "
            HelpText(txt,"center_down")
            if (A_Index<4) {
                Sleep, 15*1000
            } else {
                Sleep, 1000
                HelpText()
            }
        }
    return

    ; 降杯
    -::
        CoordMode, Mouse, Window

        Send, Q
        Sleep, 500
        Send, \
        Sleep, 500

        Send, Q
        Sleep, 500
        Send, R
        Sleep, 5000

        Send, 0
        Sleep, 500
        Send, \
        Sleep, 500

        y:=0
        Loop, 4 {
            y:=y+300
            MouseClick, Left, 300, %y%
            Sleep, 100
            MouseClick, Left, 1700, %y%
            Sleep, 100
            MouseClick, Left, 2800, %y%
            Sleep, 100
        }

        Send, A
        Sleep, 500
        Send, S
        Sleep, 500
        Send, D
        Sleep, 3000
        
        Send \
    Return

    ; 退出
    BackSpace::
        Send A
        Sleep, 100
        Send S
        Sleep, 2000
        Send D
        Sleep, 3000
        Send \
    Return

    Tab::
        Send, a
        Sleep, 100
        Send, s
        Sleep 1000
        Send, d
        Sleep, 3000

        Send, \
        Sleep, 100

        Send, z
        Sleep, 100
        Send, x
        Sleep, 100
        Send, c
        Sleep, 100
        Send, \
    Return

#if
