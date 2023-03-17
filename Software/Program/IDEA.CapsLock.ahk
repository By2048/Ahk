
#HotIf CheckWindowActive("IDEA")


    ;窗口全屏
    <#Enter::{
        Send "^!{NumLock}"
        SetNumLockState "Off"
    }
    ;Zen模式
    <#+Enter::{
        Send "^!+{NumLock}"
        SetNumLockState "Off"
    }

    #Include *i %A_InitialWorkingDir%\Software\Program\IDEA.CapsLock.ahk

#HotIf
