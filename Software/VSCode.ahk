
#if ( CheckWindowsActive("VSCode") )

    ; 软件设置{f1}
    LAlt & RAlt::Send {F13}

    ; 右键菜单{AppsKey}
    RAlt & LAlt::Send {AppsKey}

    ; 切换标签页{f2}
    !Tab::Send !{F14}
    !+Tab::Send !+{F14}

    ; 关闭标签页{f3}
    !CapsLock::Send !{F15}
    !+CapsLock::Send !+{F15}

    ; 特殊按键覆盖{f4}
    ^F4::Return
    ^+F4::Return
    !F4::Send !{F16}
    !+F4::Send !+{F16}


    ; f1-f19 正常

    ;快速命令 
    >!Space::
        ; global software_vscode_ralt
        ; if (software_vscode_ralt=True) {
        ;     software_vscode_ralt:=False
        ;     Send {Esc}
        ; } else {
        ;     software_vscode_ralt:=True
        ; }
        Send {f17}
    Return

    ; if (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<500) {
#if


#if ( CheckWindowsActive( "VSCode" , "" , ".md" ) )

    !\::
        result    := GetActiveWindowsInfo()
	    win_title := result.win_title
        script    := "E:/Project/script/note/setup.py"
        command   := Format("{} {} {}", Python, script, win_title)
        Run, %command%
        HelpText(win_title, "center_down",  , 1000)
    Return

#if
