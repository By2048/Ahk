
; https://support.google.com/chrome/answer/157179

#HotIf CheckWindowActive( "Chrome" , "Chrome_WidgetWin_1" , "书签" )
    F2::Return
    ^r::Send "{F2}"
#HotIf



#HotIf CheckWindowActive( "Chrome" , "Chrome_WidgetWin_1" , "修改书签" )

    ; 收藏
    !Enter::Send "{Tab 4}{Enter}"

    ; 取消收藏
    !Esc::{
        Send "{Esc}"
        Send "^d"
        Send "{Tab 4}"
        Send "{Enter}"
    }

#HotIf



#HotIf CheckWindowActive( "Chrome" , "Chrome_WidgetWin_1" , "DevTools" )

#HotIf



#HotIf CheckWindowActive( "Chrome" , "Chrome_WidgetWin_1" )

    Redirect(url) {
        tmp := A_Clipboard
        A_Clipboard := url
        ClipWait
        Send "!d"
        Send "^v"
        Send "{Enter}"
        Sleep 99
        A_Clipboard := tmp
        ClipWait
    }

     !F1::Redirect("https://cn.bing.com/")
     !F2::Redirect("https://www.deepl.com/zh/translator")
     !F3::Redirect("https://translate.google.com/?sl=en&tl=zh-CN&op=translate")
     !F4::Redirect("https://fanyi.baidu.com/")

     !F5::Redirect("https://wyagd001.github.io/v2/docs/")
     !F6::Redirect("https://tool.oschina.net/uploads/apidocs/jquery/regexp.html")
     !F7::Redirect("https://www.jetbrains.com/help/pycharm/quick-start-guide.html")
     !F8::Redirect("https://docs.python.org/zh-cn/3/")

     !F9::Redirect("https://vcb-s.com")
    !F10::Redirect("http://www.bd4399.com")
    !F11::Redirect("https://www.zhihu.com/hot")
    !F12::Redirect("https://t.bilibili.com/?tab=8")

#HotIf


Expand := False
#HotIf ( CheckWindowActive( "Chrome" ) And Expand == True )
    Tab::{
        Send "{Right 3}"
    }
    LShift::{
        Send "{Left 3}"
    }
    CapsLock::{
        global Expand
        Send "{F10 2}"
        Expand := False
    }
#HotIf


#HotIf CheckWindowActive( "Chrome" )

    #Include *i Chrome.LShift.ahk

    AppsKey::Send "{F10}"

    ;帮助
    F1::Return

    ;重命名
    F2::Return

    ;搜索
    F3::Return

    ;重新加载
    ;强制重新加载
    F5::Return
    +F5::Return
    ^r::Return
    ^+r::Return
    !r::Send "^r"
    !+r::Send "^+r"

    ;切换焦点
    F6::Return
    +F6::Return
    !`::Send "{F6}"
    ^`::Send "+{F6}"

    ;光标浏览模式
    F7::Return
    !i::Send "{F7}{Enter}"

    ;全屏
    F11::Return
    #Enter::Send "{F11}"

    ;开发者模式
    F12::Return
    ^+j::Return
    <^AppsKey::Send "{F12}"

    ; 书签第一个
    <!\::
    <!+\::{
        shift_status := GetKeyState("Shift", "P")
        Send "{F6 3}"
        if (shift_status) {
            Send "{Left}"
        }
    }

    CapsLock::{
        Send "{F10 2}"
        SetCapsLockState "Off"
    }

    ;任务管理
    ^Esc::Return
    !Esc::Send "+{Esc}"

    ;删除联想
    ;删除搜索历史记录
    ; +Delete::Return
    ; !Delete::Send +{Delete}
    !Delete::{
        Send "{Esc}"
        Send "{LButton}"
        Send "{Down}"
        Send "+{Delete 9}"
        Send "{Esc}"
    }

    ;清理浏览记录
    ^+Delete::Return
    ^!Delete::Send "^+{Delete}"

    ;新标签页
    ^t::Return
    !t::Send "^t"

    ; 新窗口
    ; ^n::Return
    ; !n::Send ^n

    ; 新隐私窗口
    ; ^+n::Return
    ; !+n::Send ^+n

    ;保存
    ; ^s::Return
    ; !s::Send ^s

    ;定位
    ; ^g::Return
    ; !g::Send ^g
    ; ^+g::Return
    ; !+g::Send ^+g

    ;关闭窗口
    ^w::Return
    ^F4::Return
    !CapsLock::{
        Send "{Blind}{vkFF}"
        Send "^w"
        SetCapsLockState "Off"
    }

    ;关闭所有窗口
    ^+w::Return

    ;将焦点放置在Chrome工具栏中的第一项上
    !+t::Return
    alt_shift_t := False
    ![::{
        global alt_shift_t
        if (not alt_shift_t) {
            alt_shift_t := True
            Send "!+t"
        } else {
            alt_shift_t := False
            Send "{Esc}"
        }
    }

    ;将焦点放置在Chrome工具栏中最右侧的那一项上
    F10::Return
    !]::Send "{F10}"

    ;重新打开标签页
    ^+t::Return
    +CapsLock::
    !+CapsLock::{
        Send "^+t"
        SetCapsLockState "Off"
    }

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
    ^+Tab::Return
    +Tab::Return

    ;主页
    !BackSpace::Send "!{Home}"

    ; 切换标签页
    !Tab::{
        Send "{Blind}{vkFF}"
        Send "^{Tab}"
    }
    !+Tab::{
        Send "{Blind}{vkFF}"
        Send "^+{Tab}"
    }
    !Home::Send "^1"
    !End::Send "^9"

    ; 滚动
    ^PgUp::Return
    ^PgDn::Return
    !PgUp::Send "^+{Tab}"
    !PgDn::Send "^{Tab}"

    ;切换书签栏显示隐藏状态
    ^+b::Return
    !v::Send "^+b"

    ;打开文件 ^o

    ;书签管理页面
    ^+o::Return
    !b::Send "^+o"

    ;切换用户
    ^+m::Return

    ;使用Google搜索
    ^k::Return
    ^e::Return

    ;历史记录
    ^h::Return
    !h::Send "^h"

    ;下载页面
    ^j::Return
    !j::Send "^j"

    ;收藏 取消收藏
    ^d::Return
    ^+d::Return
    !d::{
        Send "^d"
        Send "{Tab 2}"
        Send "{Enter}"
        if (InStr(Screen.Name, "4K")) {
            MoveWindowToPosition(Position(900, 1500))
        } else if (InStr(Screen.Name, "2K")) {
            MoveWindowToPosition(Position(700, 1000))
        }
    }
    !+d::{
        Send "^d"
        Send "{Tab 4}"
        Send "{Enter}"
    }

    ;打印 高级打印
    <^p::Return
    <^+p::Return
    !p::Send "^p"
    !+p::Send "^+p"

    ; 反馈
    !+i::Return

    ;查看源码
    ^u::Return
    !u::Send "^u"

    ;打开Chrome菜单
    !f::Return
    !e::Return
    !/::!e

    alt_space := False
    !Space::{
        global alt_space
        if (not alt_space) {
            alt_space := True
            Send "!d"
        } else {
            alt_space := False
            Send "{F6 3}"
        }
    }

    ;网页缩放
    ^WheelUp::Return
    ^WheelDown::Return
    ^0::Return
    ^-::Return
    ^=::Return
    !0::Send "^0"
    !-::Send "^{-}"
    !=::Send "^{=}"

    <#\::{
        if (InStr(Screen.Name, "4K")) {
            MoveWindowToPosition(Position(3300, 2000))
        } else if (InStr(Screen.Name, "2K")) {
            MoveWindowToPosition(Position(2500, 1400))
        }
    }

    ; 前进后退
    ~Lbutton & RButton::{
        Send "!{Right}"
    }
    ~RButton & Lbutton::{
        Send "!{Left}"
        Sleep 250
        Send "{Esc}"
    }

    ; 拓展程序界面
    LAlt & RShift::{
        global Expand
        Send "{F10}"
        Send "{Left 4}"
        Send "{Down 3}"
        Expand := True
    }

    ; >!y::MouseClickImage(A_InitialWorkingDir "\Image\Software\Chrome\Y.png")
    ; >!z::MouseClickImage(A_InitialWorkingDir "\Image\Software\Chrome\Z.png")
    ; >!w::MouseClickImage(A_InitialWorkingDir "\Image\Software\Chrome\W.png")
    ; >!n::MouseClickImage(A_InitialWorkingDir "\Image\Software\Chrome\N.png")

#HotIf
