
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

    #Include *i IDEA.CapsLock.ahk

#HotIf
