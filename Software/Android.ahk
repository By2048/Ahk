
#HotIf CheckWindowActive( "Android" )

    ; 全屏
    F11::Return
    #Enter::Send "{F11}"

    ; 切换键鼠提示
    ; F12::Return

    ; Mini模式
    !g::Return
    RAlt::Send "!g"

    ; 切换标签
    ^Tab::Return
    ^+Tab::Return
    !Tab::Send "^{Tab}"
    !+Tab::Send "^+{Tab}"

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
    Insert::Send "!q"

    #\::MoveWindowPosition(Position(2580 , 1583))

#HotIf

#Include *i Android.COC.Private.ahk
