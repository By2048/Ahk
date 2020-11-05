#include %A_WorkingDir%\Other\Base.ahk
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



#if WinActive("ahk_exe Code.exe")

    >!m::Send, !VM ;显示迷你地图
    
    ; !x::Send, ^x ; 剪切
    ; !c::Send, ^c ; 拷贝
    ; !v::Send, ^v ; 粘贴
    ; !z::Send, ^z ; 撤销
    ; !+z::Send ^+z ; 重做

#if



#if WinActive("ahk_exe pycharm64.exe")

    !F4::^!F4

#if



