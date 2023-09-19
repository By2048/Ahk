
#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "评估")
    !Enter::Send "^{Enter}"
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "文档")
    RWin::MoveWindowToPosition(Position(1600 , 1100))

    Esc::
    CapsLock::{
        MouseClickAndResetting(10, 25, "Window", "Right")
        Sleep 99
        Send "{Down 5}"
        Sleep 33
        Send "{Enter}"
    }
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "Python 控制台")
    ;ReRun
    +BackSpace::MouseClickAndResetting(34, 92)

    ;StopConsole
    !BackSpace::MouseClickAndResetting(34, 142)
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "书签")
    $CapsLock::{
        Send "^{CapsLock}"
    }
#HotIf
