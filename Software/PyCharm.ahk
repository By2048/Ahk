
#if ( WindowsActive("PyCharm") )
    
    ^F4::Return
    !f4::Send, ^{F4}

    ^]::Return
    !Tab::Send, ^]

    ^[::Return
    !+Tab::Send, ^[
    
    ; 关闭
    ^\::Return
    !CapsLock::Send, ^\

    ; 重新打开
    ^+\::Return
    !+CapsLock::Send, ^+\

    ^F1::Return
    LAlt & RAlt::Send, ^{F1}
    RAlt & LAlt::Send, {AppsKey}

#if



; 悬浮窗口
#if ( WindowsActive("PyCharm", "SunAwtDialog") )
  
    ~RAlt::
        WinSet, Transparent, 30, A
    Return

    ~RAlt Up::
        WinSet, Transparent, 255, A
    Return
 
#if



; MouseGetPos,  ,  , win_id
; WinGetClass, win_class, ahk_id %win_id%
; WinActivate, ahk_class %win_class%
