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



; #if WinActive("ahk_exe chrome.exe")

;     F1::Return

;     F11::Return
;     !Enter::Send, {F11}

;     ^Tab::Return
;     !Tab::Send, ^{Tab}

;     !Esc::Send, +{Esc}
;     ^Esc::Return
    
;     ^!Tab::Return
;     !+Tab::Send, ^!{Tab}

;     ^p::Return
;     !p::Send, ^p

;     ^+p::Return
;     !+p::Send, ^+p

;     ^+m::Return

;     F3::Return
;     ^f::Return
;     !f::Send, ^f

;     F5::Return
;     ^r::Return
;     !r::Send, {F5}


;     F12::Return
;     ^+j::Return
;     !\::Send, {F12}

;     ^s::Return
;     !s::Send, ^s

;     ^u::Return
;     !u::Send, ^u

;     ^+Delete::Return
;     !+Delete::Send, ^+{Delete}

;     ^w::Return
;     !w::Send, ^w

;     ^h::Return
;     !h::Send, ^h

;     ^j::Return
;     !j::Send, ^j

;     ; ^w::Return
;     ; !w::Send, ^w

;     ; ^+b::Return
;     ; !b::Send, ^+b

;     ^0::Return
;     !0::Send, ^0
;     ^-::Return
;     !-::Send, ^-
;     ^=::Return
;     !=::Send, ^=

;     ^g::Return
;     ^+g::Return
;     ![::Send, ^g
;     !]::Send, ^+g

; #if



