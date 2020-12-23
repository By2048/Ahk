#include %A_WorkingDir%\Libs\Base.ahk
; #include %A_WorkingDir%\Tool\Help.ahk
; #include %A_WorkingDir%\Tool\Other.ahk
; #include %A_WorkingDir%\Tool\Mouse.ahk
; #include %A_WorkingDir%\Tool\Windows.ahk
; #include %A_WorkingDir%\Tool\Image.ahk
#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



#if WinActive("ahk_exe chrome.exe")

    F1::Return
    F3::Return
    F5::Return
    ^r::Return
    !r::Send, ^r
    +F5::Return
    ^+r::Return
    !+r::Send, ^+r

    F6::Return ;切换焦点
    !`::Send, {F6}
    F10::Return ;切换焦点
    !+`::Send, {F10}

    F7::Return ;光标浏览模式
    !i::Send, {F7}

    ; F11::Return
    !Enter::Send, {F11}

    F12::Return
    ^+j::Return
    !\::Send, {F12}

    !e::Return
    !+t::Return

    ^Esc::Return
    !Esc::Send, +{Esc}
    +Delete::Return
    !Delete::Send, +{Delete}
    ^+Delete::Return
    !+Delete::Send, ^+{Delete}

    ^Tab::Return
    ^PgUp::Return
    !Tab::Send, ^{Tab}
    ^+Tab::Return
    ^PgDn::Return
    !+Tab::Send, ^+{Tab}
    !PgDn::Send, ^{Tab}
    !PgUp::Send, ^+{Tab}
    !Home::Send, ^1
    !End::Send, ^9

    ^+m::Return
    ^+w::Return
    ^+b::Return
    !+b::Send, ^+b
    ^+o::Return
    !+o::Send, ^+o
    !+d::Return
    ^+t::Return
    !+w::Send, ^+t
    !z::Send, ^+t

    ^o::Return
    ^k::Return
    ^e::Return
    ^h::Return
    !h::Send, ^h
    ^j::Return
    !j::Send, ^j
    ^d::Return
    !d::Send, ^d
    ^p::Return
    !p::Send, ^p
    ^+p::Return
    !+p::Send, ^+p
    ^s::Return
    !s::Send, ^s
    ^g::Return
    !g::Send, ^g
    ^+g::Return
    !+g::Send, ^+g
    ^u::Return
    !u::Send, ^u
    ^t::Return
    !t::Send, ^t
    ^n::Return
    !n::Send, ^n
    ^+n::Return
    !+n::Send, ^+n
    ^w::Return
    !w::Send, ^w
    ^f::Return
    !f::Send, ^f

    ^0::Return
    !0::Send, ^0
    ^-::Return
    !-::Send, ^-
    ^=::Return
    !=::Send, ^=

    ^1::Return
    ^2::Return
    ^3::Return
    ^4::Return
    ^5::Return
    ^6::Return
    ^7::Return
    ^8::Return
    ^9::Return

#if



