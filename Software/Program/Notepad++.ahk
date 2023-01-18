
#HotIf CheckWindowActive("Notepad++")

    #Include %A_InitialWorkingDir%\Software\#\Fxx\F1_F12_Ctrl.ahk

    ; !Esc::Send ^{F1}
    ; !+Esc::Send ^+{F1}

    ; 便签模式 全屏
    #Enter::Send "^{F1}"
    #+Enter::Send "^+{F1}"

    ; 切换正 切换逆 关闭 重新打开 标签页
    <!Tab::Send "^{F2}"
    <!+Tab::Send "^+{F2}"
    <!CapsLock::Send "^{F3}"
    <!+CapsLock::Send "^+{F3}"

    ; 特殊按键覆盖{f4}
    !F4::Send "^{F4}"
    !+F4::Send "^+{F4}"

    ; 软件设置{f1}
    LAlt & RAlt::Send "{F13}"
    ; 右键菜单{AppsKey}
    RAlt & LAlt::Send "{AppsKey}"

    ; Tmp
    F12::MouseClickAndResetting(601, 1157)

#HotIf
