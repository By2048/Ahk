
; https://www.jetbrains.com/toolbox-app/faq/#keyboard-navigation

RegisterProcess("jetbrains-toolbox", "JetBrainsToolBox")

#HotIf CheckWindowActive("JetBrainsToolBox")

    ^1::Return ; Tools tab
    ^2::Return ; Projects tab
    ^3::Return ; Services tab

    ^u::Return ; update all
    ^t::Return ; update the Toolbox App

    ; minimize/maximize Available Tools on the Tools tab
    ^h::Return
    !\::Send "^h"

    ; Space update the selected IDE

    ; 设置
    ^,::Return
    AppsKey::Send "^,"

    ; 检查更新
    ^r::Return
    \::Send "^r"

    ^Tab::Return
    !Tab::Send "^{Tab}"

    ^+Tab::Return
    !+Tab::Send "^+{Tab}"

    ; 上下移动
    ^+Up::Return
    !Up::Send "^+{Up}"

    ^+Down::Return
    !Down::Send "^+{Down}"

    ; 退出
    ^q::Return
    #BackSpace::Send "^q"

    CapsLock::{
        cmd := 'WT --focus  '
        cmd .= '--size "30,30" --pos "50,230"  '
        cmd .= 'PowerShell -NoProfile -WorkingDirectory T:\ -Command  '  ; -NoExit
        cmd .= '"D:\Python\#\Scripts\python.exe E:\Script\Tool\JetBrains.py"  '
        Run cmd
    }

    ; add/delete to/from favorites
    ; hide the project from the Toolbox App
    ; !=::Return
    ; !-::Return

#HotIf
