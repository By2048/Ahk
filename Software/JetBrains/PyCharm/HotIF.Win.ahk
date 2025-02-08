
#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "设置")
    ; 快捷键 搜索按钮
    AppsKey::MouseClickTool(1558, 240)
    `::MouseClickTool(1595, 238, "Window", "Left")
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "删除")
    Insert::Send "{Enter}"
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "运行/调试配置")
    !F1::Esc
    CapsLock::Esc
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "终端|运行|调试")
    ~RAlt::WinSetTransparent(99, "A")
    ~RAlt Up::WinSetTransparent(255, "A")
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "断点")
    !F2::Esc
    CapsLock::Esc
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "评估")
    !Enter::Send "^{Enter}"
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "文档")
    RWin::MoveWindowPosition(Position(1600 , 1100))
    Esc::
    CapsLock::{
        MouseClickTool(10, 25, "Window", "Right")
        Sleep 99
        Send "{Down 5}"
        Sleep 33
        Send "{Enter}"
    }
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "Python 控制台")
    ;ReRun
    +BackSpace::MouseClickTool(34, 92)
    ;StopConsole
    !BackSpace::MouseClickTool(34, 142)
#HotIf


#HotIf CheckWindowActive("PyCharm", "SunAwtDialog", "书签")
    $CapsLock::^CapsLock
#HotIf
