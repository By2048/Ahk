
#Include @.Tool.ahk


; https://support.google.com/chrome/answer/157179

#HotIf CheckWindowActive( " Chrome | Edge | Opera | FireFox " )

    ; 帮助
    F1::Return

    ; 重命名
    F2::Return

    ; 搜索
    F3::Return

    ; 重新加载
    ; 强制重新加载
    F5::Return
    +F5::Return
    ^r::Return
    ^+r::Return
    !r::Send "^r"
    !+r::Send "^+r"

    ; 切换焦点
    F6::Return
    +F6::Return
    !`::Send "{F6}"
    ^`::Send "+{F6}"

    ; 光标浏览模式
    F7::Return
    !i::Send "{F7}{Enter}"

    ; 全屏
    F11::Return
    #Enter::Send "{F11}"

    ; 开发者模式
    F12::Return
    ^+j::Return

    ; 开发者工具选择元素
    ^+c::Return

    ; 新标签页
    ^t::Return
    !t::Send "^t"

    ; 新窗口
    ; ^n::Return
    ; !n::Send ^n

    ; 新隐私窗口
    ; ^+n::Return
    ; !+n::Send ^+n

    ; 保存
    ; ^s::Return
    ; !s::Send ^s

    ; 定位
    ; ^g::Return
    ; !g::Send ^g
    ; ^+g::Return
    ; !+g::Send ^+g

    ; 清理浏览记录
    ; ^+Delete::Return

    ; 关闭窗口
    ^w::Return
    ^F4::Return
    ~!CapsLock::{
        Send "{Blind}{vkFF}"
        Send "^w"
    }

    ; 关闭所有窗口
    ^+w::Return

    ; 重新打开标签页
    ^+t::Return
    ~!+CapsLock::{
        Send "{Blind}{vkFF}"
        Send "^+t"
    }

    ; 切换标签页
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
    ^+Tab::Return

    ; 任务管理
    !Esc::Send "+{Esc}"
    +ESc::Return

    ; 切换标签页
    !Tab::Send "^{Tab}"
    !+Tab::Send "^+{Tab}"
    !Home::Send "^1"
    !End::Send "^9"

    ; 滚动
    ^PgUp::Return
    ^PgDn::Return
    !PgUp::Send "^+{Tab}"
    !PgDn::Send "^{Tab}"

    ; 切换书签栏显示隐藏状态
    ^+b::Return
    !v::Send "^+b"

    ; 打开文件
    ; ^o::Return

    ; 书签管理页面
    ^+o::Return
    !b::Send "^+o"

    ; 用户按钮
    ^+m::Return

    ; 使用Xxx搜索
    ^k::Return
    ^e::Return

    ; 历史记录
    ^h::Return
    !h::Send "^h"

    ; 下载页面
    ^j::Return
    !j::Send "^j"

    ; 打印 高级打印
    <^p::Return
    <^+p::Return
    !p::Send "^p"
    !+p::Send "^+p"

    ; 反馈
    !+i::Return

    ; 查看源码
    ^u::Return

    ; 打开Chrome菜单
    !f::Return
    !e::Return
    !AppsKey::!e

    ; 网页缩放
    ^WheelUp::Return
    ^WheelDown::Return
    ^0::Return
    ^-::Return
    ^=::Return

    ; 缩放
    #0::Send "^0"
    #-::Send "^{-}"
    #=::Send "^{=}"
    
    ; 源码 
    Insert & F10::Send "^u"
    
    ; 选择元素 
    Insert & F11::Send "^+c"
    
    ; 开发者
    Insert & F12::Send "{F12}"
    
    ; 主页
    Insert & Delete::Send "!{Home}"
    
    ; 新 窗口 标签
    Insert & BackSpace::Send "^t"
    Insert & \::Send "^n"
    Insert & Enter::Send "^+n"

    #Include *i @.Mouse.ahk
    #Include *i @.Joy.ahk

#HotIf
