
RegisterProcess("pycharm64", "PyCharm")
RegisterHelp("PyCharm", "Software\JetBrains\PyCharm | Software\JetBrains\PyCharm.Fxx | Software\JetBrains\PyCharm.CapsLock")


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "运行/调试配置")
    !F1::Esc
    CapsLock::Esc
#HotIf

#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "断点")
    !F2::Esc
    CapsLock::Esc
#HotIf

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
