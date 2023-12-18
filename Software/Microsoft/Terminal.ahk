
RegisterProcess("WindowsTerminal" , "Terminal")

RegisterHelp("Terminal", "Software\Microsoft\Terminal.help | Config\Script.help")


#HotIf CheckWindowActive( "Terminal" )

    #Include ..\..\Key\Replace.ahk

    #Include *i Terminal.Private.ahk

    `::~
    +~::`

    #\::MoveWindowToPosition(Position(2200 , 1400))

    #+\::{
        pos := Position("[Center][2]" , 0 , 1600)
        MoveWindowToPosition(pos)
        MoveWindowToPosition(pos)
    }

    ; 关闭窗格
    !CapsLock::Send "{F13}"

    ; 关闭窗口
    !F4::Return

    ; 新建标签页
    ^+t::Return
    !t::Send "^+t"

    ; 新建窗口
    ^+n::Return
    ^n::Send "^+n"

    !Tab::Send "^{Tab}"
    !+Tab::Send "^+{Tab}"

    ; 复制标签页
    ^+d::Return

    ;结束运行
    !BackSpace::Send "^c"

    ;复制
    ^F1::Return
    ^c::Send "^{F1}"

    ; 查找
    ^+f::Return
    <^f::Send "^+f"

    ; 滚动至历史记录 顶部|底部
    ^+Home::Return
    ^+End::Return
    !Home::Send "^+{Home}"
    !End::Send "^+{End}"

    ; 全屏
    #Enter::Send "{F14}"

    ; 字号重置
    ^WheelUp::Return
    ^WheelDown::Return

#HotIf
