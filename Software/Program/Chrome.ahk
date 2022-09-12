
; https://support.google.com/chrome/answer/157179

#If CheckWindowActive( "Chrome" , "Chrome_WidgetWin_1" , "书签" )
    F2::Return
    ^r::Send {F2}
#If



#If CheckWindowActive( "Chrome" , "Chrome_WidgetWin_1" , "修改书签" )

    ; 收藏
    !Enter::Send {Tab 4}{Enter}

    ; 取消收藏
    !Esc::
        Send {Esc}
        Send ^d
        Send {Tab 4}
        Send {Enter}
    Return

#If



#If CheckWindowActive( "Chrome" , "Chrome_WidgetWin_1" , "DevTools" )

#If



#If CheckWindowActive( "Chrome" , "Chrome_WidgetWin_1" )

    Redirect(url) {
        tmp := Clipboard
        Clipboard := url
        Send !d
        Send ^v
        Send {Enter}
        Clipboard := tmp
    }

     !F1::Redirect("https://cn.bing.com/")
     !F2::Redirect("https://www.baidu.com/")
     !F3::Redirect("https://yandex.com/")
     !F4::Redirect("https://stackoverflow.com/")

     !F5::Redirect("https://wyagd001.github.io/zh-cn/docs/AutoHotkey.htm")
     !F6::Redirect("https://tool.oschina.net/uploads/apidocs/jquery/regexp.html")
     !F7::Redirect("https://www.jetbrains.com/help/pycharm/quick-start-guide.html")
     !F8::Redirect("https://docs.python.org/zh-cn/3/")

     !F9::Redirect("http://www.nicotv.me/dongman")
    !F10::Redirect("https://www.bd2020.com/movies/index.htm")
    !F11::Redirect("https://www.zhihu.com/hot")
    !F12::Redirect("https://t.bilibili.com/?tab=8")

#If



#If CheckWindowActive( "Chrome" )

    LAlt::Send {F10}

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
    !r::Send ^r
    !+r::Send ^+r

    ;切换焦点
    F6::Return
    +F6::Return
    !`::Send {F6}
    +`::Send +{F6}

    ;光标浏览模式
    F7::Return
    !i::Send {F7}{Enter}

    ;全屏
    F11::Return
    #Enter::Send {F11}

    ;开发者模式
    F12::Return
    ^+j::Return
    <^AppsKey::Send {F12}

    ; 书签第一个
    <!\::
    <!+\::
        shift_status := GetKeyState("Shift", "P")
        Send {F6 3}
        if (shift_status) {
            Send {Left}
        }
    Return

    CapsLock::
        Send {F10 2}
        SetCapsLockState Off
    Return

    ~LShift::
        if (cnt > 0) {
            cnt += 1
            return
        } else {
            cnt := 1
        }
        SetTimer, ChromeTimer, -300
    Return
    ChromeTimer:
        if (cnt != 2) {
            cnt := 0
            Return
        }
        jqb := Clipboard

        Send !d
        Send ^c
        url_origin := Clipboard
        url_result := ""

        ; www.google.com/search?q=Xxx
        if (InStr(url_origin, "google.com/search?q=")) {
            keyword := RegExReplace(url_origin, "(http.*)(search\?q\=)(.*?)(&.*)", "$3")
            url_result := "https://cn.bing.com/search?q=" . keyword
        }

        ; https://www.zhihu.com/question/xxx/answer/xxx
        if ( InStr(url_origin, "zhihu.com/question") and InStr(url_origin, "answer") ) {
            qid := RegExReplace(url_origin, "(http.*)(/question/)(\d+)(/answer/)(\d+)", "$3")
            url_result := "https://www.zhihu.com/question/" . qid
        }

        if (url_result) {
            Clipboard := url_result
            Send ^v
            Send {Enter}
        } else {
            Send {F10 2}
        }
        Clipboard := jqb
        cnt := 0
    Return

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
    !CapsLock::
        Send ^w
        SetCapsLockState off
    Return

    ;关闭所有窗口
    ^+w::Return

    ;将焦点放置在Chrome工具栏中的第一项上
    !+t::Return
    ![::
        if (not alt_shift_t) {
            alt_shift_t := True
            Send !+t
        } else {
            alt_shift_t := False
            Send {Esc}
        }
    Return

    ;将焦点放置在Chrome工具栏中最右侧的那一项上
    F10::Return
    !]::Send {F10}

    ;重新打开标签页
    ^+t::Return
    +CapsLock::
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
    ^+Tab::Return
    +Tab::Return

    ;主页
    !BackSpace::Send !{Home}

    !Tab::Send ^{Tab}
    !+Tab::Send ^+{Tab}
    !Home::Send ^1
    !End::Send ^9

    ;滚动
    ^PgUp::Return
    ^PgDn::Return
    !PgUp::Send ^+{Tab}
    !PgDn::Send ^{Tab}

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
    ^e::Return

    ;历史记录
    ^h::Return
    !h::Send ^h

    ;下载页面
    ^j::Return
    !j::Send ^j

    ;收藏 取消收藏
    ^d::Return
    ^+d::Return
    !d::
        Send ^d
        Send {Tab 2}
        Send {Enter}
        MoveWindowToDefaultPosition()
    Return
    !+d::
        Send ^d
        Send {Tab 4}
        Send {Enter}
    Return

    ;打印 高级打印
    <^p::Return
    <^+p::Return
    !p::Send ^p
    !+p::Send ^+p


    ; 反馈
    !+i::Return

    ;查看源码
    ^u::Return
    !u::Send ^u

    ;打开Chrome菜单
    !f::Return
    !e::Return
    !/::!e

    !Space::
        if (not alt_space) {
            alt_space := True
            Send !d
        } else {
            alt_space := False
            Send {F6 3}
        }
    Return

    ;网页缩放
    ^WheelUp::Return
    ^WheelDown::Return
    ^0::Return
    ^-::Return
    ^=::Return
    !0::Send ^0
    !-::Send ^{-}
    !=::Send ^{=}

    ; 前进后退
    ~Lbutton & RButton::
        Send !{Right}
    Return
    ~RButton & Lbutton::
        Send !{Left}
        Sleep 250
        Send {Esc}
    Return

    ; >!y::MouseClickImage(A_WorkingDir "\Image\Software\Chrome\Y.png")
    ; >!z::MouseClickImage(A_WorkingDir "\Image\Software\Chrome\Z.png")
    ; >!w::MouseClickImage(A_WorkingDir "\Image\Software\Chrome\W.png")
    ; >!n::MouseClickImage(A_WorkingDir "\Image\Software\Chrome\N.png")

#If
