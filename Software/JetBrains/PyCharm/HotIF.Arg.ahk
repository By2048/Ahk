
#HotIf CheckWindowActive( "PyCharm" ) 
       && ( PyCharm.ClickKey == "LWin" ) && ( PyCharm.ClickCnt == 2 )
    Esc::
    LWin::
    CapsLock::{
        Send "{Esc 2}"
        PyCharm.DoubleEsc     := True
        PyCharm.CapsLockToEsc := True
        PyCharm.ClickKey      := ""
        PyCharm.ClickCnt      := 0
    }
#HotIf


#HotIf CheckWindowActive( "PyCharm" )
       && ( PyCharm.ClickKey == "LCtrl" || PyCharm.ClickKey == "LShift" )
       && ( PyCharm.ClickCnt == 2 )
    Esc::
    CapsLock::{
        Send "{Esc}"
        PyCharm.ClickKey := ""
        PyCharm.ClickCnt := 0
    }
    RWin::{
        Send "{Blind}{vkFF}"
        JBCenterWindow(1000, 1000)
    }
#HotIf


#HotIf CheckWindowActive("PyCharm") && ( PyCharm.DoubleEsc == True )
    ~Esc::{
        Send "{Esc}"
        PyCharm.DoubleEsc := False
    }
#HotIf


#HotIf CheckWindowActive("PyCharm") && ( PyCharm.CapsLockToEsc == True )
    ~CapsLock::{
        Send "{Esc 3}"
        PyCharm.CapsLockToEsc := False
        PyCharm.CapsLockActivate := False
    }
#HotIf


; AppsKey Esc 一次性返回问题修复
#HotIf CheckWindowActive("PyCharm") && ( PyCharm.AppsKeyActivate == True )
    $Enter::{
        Send "{Enter}"
        PyCharm.AppsKeyEnterCount := PyCharm.AppsKeyEnterCount + 1
    }
    $Esc::
    $CapsLock::{
        if ( PyCharm.AppsKeyEnterCount > 1 ) {
            Send "{Left}"
            PyCharm.AppsKeyEnterCount := PyCharm.AppsKeyEnterCount - 1
        } else if ( PyCharm.AppsKeyEnterCount == 1 ) {
            Send "{Esc}"
            PyCharm.AppsKeyActivate   := False
            PyCharm.AppsKeyEnterCount := 0
        }
    }
#HotIf


; 主菜单 动态调整位置
#HotIf CheckWindowActive("PyCharm") && ( PyCharm.FloatWindow.Length > 0 )

    JBFloatWindows()
    {
        length := PyCharm.FloatWindow.Length
        config := []
        loop length 
            config.Push(PyCharm.FloatWindow.Pop())
        PyCharm.FloatWindow := []

        win_left := 0
        loop length {
            win := config[A_Index]
            if ( A_Index == 1 )
                win.x := Screen.x + Screen.w/2 - win.w/2
            else
                win.x := win_left - win.w - A_Index * 2
            win.y := Screen.y + Screen.h/2 - win.h/2
            PyCharm.FloatWindow.InsertAt(1, win)
            win_left := win.x
        }
        loop length {
            win := PyCharm.FloatWindow[A_Index]
            WinMove(win.x, win.y, win.w, win.h, AID(win.id))
        }
    }

    \::{
        Send "{Blind}{vkFF}"
        JBFloatWindows()
    }

    Enter::{
        Send "{Enter}"
        win := JBGetWindow()
        if ( ! ObjOwnPropCount(win) ) {
            PyCharm.FloatWindow := []
            return
        } else {
            PyCharm.FloatWindow.Push(win)
            JBFloatWindows()
        }
    }

    Esc::
    RShift::
    CapsLock::{
        Send "{Esc}"
        PyCharm.FloatWindow.Pop()
        JBFloatWindows()
    }

#HotIf
