
; {"keys": "f13","command": {"action": "quakeMode"}}

#if ( WindowsActive("WindowsTerminal") )

    ; 上一个选项卡
    ^+Tab::Return
    !+Tab::Send ^+{Tab}

    ; 下一个选项卡
    ^Tab::Return
    !Tab::Send ^{Tab}
   
    ; 关闭窗格
    ^+w::Return
    !CapsLock::Send !+w

    ; 关闭窗口
    !F4::Return

    ; 新建标签页
    ^+t::Return
    !t::Send ^+t

    ; 新建窗口
    ^+n::Return
    ^n::Send ^+n

    ; 复制标签页
    ^+d::Return

    ; 查找
    ^+f::Return
    ^f::Send ^+f

    ; 滚动至历史记录底部
    ; 滚动至历史记录顶部
    ^+Home::Return
    !Home::Send ^+{Home}
    ^+End::Return
    !End::Send ^+{End}
    
    ; 全屏
    F11::Return
    <#Enter::Send {F11}

    ; 字号 重置、加、减
    ^0::Return
    ^NumpadAdd::Return
    ^NumpadSub::Return
    ^WheelUp::Return
    ^WheelDown::Return
    !0::Send ^0
    !=::Send ^{NumpadAdd}
    !-::Send ^{NumpadSub}

    ; 设置
    ^,::Return 

    ; 新建标签页
    ^+1::Return
    ^+2::Return
    ^+3::Return
    ^+4::Return
    ^+5::Return
    ^+6::Return
    ^+7::Return
    ^+8::Return
    ^+9::Return

    ; 切换选项卡
    ^!1::Return
    ^!2::Return
    ^!3::Return
    ^!4::Return
    ^!5::Return
    ^!6::Return
    ^!7::Return
    ^!8::Return

#if
