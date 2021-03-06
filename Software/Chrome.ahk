﻿
#if ( WindowsActive("Chrome") )

    ;帮助
    F1::Return
    
    ; 重命名
    F2::Return
    ^r::Send {F2}

    ;搜索
    F3::Return

    ;重新加载
    F5::Return
    !r::Send ^r

    ;关闭标签
    ^F4::Return

    ;强制重新加载
    +F5::Return
    ^+r::Return
    !+r::Send ^+r

    ;切换焦点
    F6::Return 
    !`::Send {F6}
    
    ;切换焦点到最右侧
    F10::Return
    !+`::Send {F10}

    ;光标浏览模式
    F7::Return 
    !i::Send {F7}

    ;全屏
    F11::Return
    #Enter::Send {F11}

    ;开发者模式
    F12::Return
    ^+j::Return
    !\::Send {F12}

    ;打开设置
    !e::Return
    !/::!e

    ;任务管理
    ^Esc::Return
    !Esc::Send +{Esc}

    ;删除联想
    +Delete::Return
    !Delete::Send +{Delete}

    ;清理浏览记录
    ^+Delete::Return
    !+Delete::Send ^+{Delete}

    ;新标签页
    ^t::Return
    !t::Send ^t

    ;新窗口
    ; ^n::Return
    ; !n::Send ^n

    ;新隐私窗口
    ; ^+n::Return
    ; !+n::Send ^+n
    
    ;关闭窗口
    ^w::Return
    !CapsLock::
        Send ^w
        SetCapsLockState off
    Return
    
    ;关闭所有窗口
    ^+w::Return

    ;重新打开标签页
    ^+t::Return 
    !+CapsLock::
        Send ^+t
        SetCapsLockState off
    Return

    ;切换标签页
    ^1::Return
    ^2::Return
    ^3::Return
    ^4::Return
    ^5::Return
    ^6::Return
    ^7::Return
    ^8::Return
    ^9::Return
    ^Tab::Return
    !Tab::Send ^{Tab}
    ^+Tab::Return
    !+Tab::Send ^+{Tab}
    !Home::Send ^1
    !End::Send ^9

    ; 主页
    !BackSpace::Send !{Home}

    ;滚动
    ^PgUp::Return
    !PgUp::WheelUp
    ^PgDn::Return
    !PgDn::WheelDown

    ;切换书签栏显示隐藏状态
    ^+b::Return
    !v::Send ^+b

    ;打开文件 ^o

    ;书签管理页面
    ^+o::Return
    !b::Send ^+o
    
    ;切换用户
    ^+m::Return 

    ;使用Google搜索
    ^k::Return 
    ;使用Google搜索
    ^e::Return 

    ;历史记录
    ^h::Return
    !h::Send ^h

    ;下载页面
    ^j::Return
    !j::Send ^j

    ;收藏 （原本是定位地址栏
    ;取消收藏
    ^d::Return
    ^+d::Return
    !d::
        Send ^d
        Send {Tab 2}
        Send {Enter}
        Sleep 100
        MoveWindowsToDefaultPosition()
    Return
    !+d::
        Send ^d
        Send {Tab 4}
        Send {Enter}
    Return

    ;打印
    ^p::Return
    !p::Send ^p
    ^+p::Return
    !+p::Send ^+p

    ;保存
    ^s::Return
    !s::Send ^s

    ;定位
    ^g::Return
    !g::Send ^g
    ^+g::Return
    !+g::Send ^+g

    ; 反馈
    !+i::Return

    ;查看源码
    ^u::Return
    !u::Send ^u

    ; 设置
    !f::Return

    ;网页缩放
    ^0::Return
    !0::Send ^0
    ^-::Return
    !-::Send ^-
    ^=::Return
    !=::Send ^=

    ; >!y::MouseClickImage(A_WorkingDir "\Image\Software\Y.png")
    ; >!z::MouseClickImage(A_WorkingDir "\Image\Software\Z.png")
    ; >!w::MouseClickImage(A_WorkingDir "\Image\Software\W.png")
    ; >!n::MouseClickImage(A_WorkingDir "\Image\Software\N.png")

#if



#if ( WindowsActive("Chrome", "", "修改书签") )

    ; 收藏
    Enter::
        Send {Tab 4}
        Send {Enter}
    Return

    ; 取消收藏
    Esc::
        Send {Esc}
        Send ^d
        Send {Tab 4}
        Send {Enter}
    Return

#if
