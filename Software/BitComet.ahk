
RegisterHelpInfo("BitComet", FilePath(A_LineFile, "BitComet.help"))


#HotIf CheckWindowActive("BitComet", "#32770", "BitComet")
    AppsKey::
    NumLock::
    NumpadHome::{
        Try WinClose("A")
    }
#HotIf


#HotIf CheckWindowActive("BitComet", "#32770", "删除任务确认")
    Delete::{
        Send "{Esc}"
    }
    Insert::{
        ControlClick("Button1", "A")
        Send "{Enter}"
    }
    BackSpace::{
        ControlClick("Button2", "A")
        Sleep 99
        Send "{Enter}"
    }
#HotIf


#HotIf CheckWindowActive("BitComet", "#32770", "选项*")
    #\::MoveWindowPosition(Position(1500 , 1000))
#HotIf


#HotIf CheckWindowActive("BitComet", "#32770", "通知")
    AppsKey::    
    NumLock::    
    NumpadHome::{
        Try WinClose("A")
    }
    NumpadEnd::
    RWin::
    #\::{
        MoveWindowPosition(Position(800, 750))
        cfg := " 1:空:50  2:时间:250  3:消息:400 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321" , cfg)
    }
#HotIf


#HotIf CheckWindowActive("BitComet", "#32770", "新建BT任务")

    BTSetListView() {
        cfg := " 1:名称:999  2:大小:111  3:%:77 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321" , cfg)
        SetColumnWidth("SysListView322" , cfg)
        cfg := " 1:下载顺序:111  2:文件名称:777  3:大小:123 4:%:77 5:当前优先级:123 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView323" , cfg)
    }

    [::ControlSetText("V:\", "Edit1", "A")
    ]::ControlSetText("T:\", "Edit1", "A")
    \::ControlClick("Button2", "A")
    
    ; 选择下载文件夹
    MButton::{
        ControlClick("Button2", "A")
    }

    ; 复制下载名
    ^+c::{
        text := ControlGetText("Edit2", "A")
        A_Clipboard := text
        ClipWait()
        HelpText("`n" text "`n", "Center", "Screen", 666)
    }

    ; 立即下载
    `::
    !Enter::
    +Enter::
    NumLock::{
        ControlClick("Button27", "A")
    }

    NumpadHome::{
        Try WinClose("A")
    }
    
    ; 设置位置 文件名称排序 设置列 设置路径
    NumpadEnd::{
        MoveWindowPosition(Position(1300,1000))
        BTSetListView()
        ControlClick("SysHeader321", "A")
        ControlSetText(Folders.Temp, "Edit1", "A")
        Sleep 99
        ControlGetPos(&x, &y, &w, &h, "SysListView321", "A")
        CoordMode("Mouse", "Client")
        MouseClickTool(x + 11, y + 44, "Client", "Right")
        Send "{Down 2}{Enter}"
    }

    ; 快速选择路径
    NumpadPgUp::
    NumpadPgDn::{
        SetControlDelay(-1)
        paths := [ Folders.Ram , Folders.Temp ]
        path  := ControlGetText("Edit1", "A")
        if ( InStr(A_ThisHotkey, "PgUp") )
            path := LoopList(paths, path, -1)
        if ( InStr(A_ThisHotkey, "PgDn") )
            path := LoopList(paths, path, +1)
        ControlSetText(path, "Edit1", "A")
    }

    ; 文件大小排序
    NumpadIns::{
        MouseClickTool(1094, 404, "Window")
    }
    
    ; 全选
    NumpadDel::{
        ControlSetChecked(True, "Button5", "A")
    }

    !Tab::^Tab
    !+Tab::^+Tab
    
#HotIf


#HotIf CheckWindowActive("BitComet", "#32770", "批量下载种子")
    NumpadDel::
    #\::{
        MoveWindowPosition(Position(1300, 700))
        cfg := " 1:名称:999  2:大小:130  3:发表日期:100 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321" , cfg)
    }
#HotIf


#HotIf CheckWindowActive("BitComet")

    MButton::{
        ControlClick( "Static155" , "A" )
        Sleep 999
        ControlClick( "SysLink2"  , "A" )
        Sleep 999
        Try WinClose("ahk_exe BitComet.exe ahk_class #32770 通知")
    }

    NumpadIns::Send "!{F4}"

    ^n::Send "^u"
    ^+n::Send "^n"

    NumpadDel::
    #\::{
        Send "{Blind}{vkFF}"
        
        total_width  := 2333
        total_height := 999
        left_width   := 255

        MoveWindowPosition(Position(total_width , total_height))

        GetActiveWindowInfo()

        ; 左边栏大小
        info := window.controls.SysListView321
        if ( Abs(info.x - left_width) > 10 ) {
            MouseGetPos(&x_origin, &y_origin)
            MouseMove info.x , info.y + info.h / 2
            offset := GetOffset("X")
            MoveControlUDLR(info, "Left", left_width, offset)
            MouseMove(x_origin, y_origin, 0)
        }

        _1 := " 1     12     2     3     9        8        6        4         7       5         10       11     "
        _2 := " 名称  文件夹  大小   进度  剩余大小  剩余时间   下载速度  下载大小   上传速度  上传大小   种子/用户 分享率  "
        _3 := " 666   180    180   77    110     110       120      110       120     110       177      77     "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView321" , config)

        #Include *i BitComet.Private.ahk
    }

    ; 复制名称
    ^+c::{
        Send "{AppsKey}"
        Send "{Up 3}"
        Send "{Enter}"
        Send "{Enter}"
    }

    ; 取消代理
    ![::{
        Send "^p"
        Send "^+{Tab 5}"
        Send "^{Tab}"
        Send "{Tab}"
        Send "{Left 5}"
        Send "^{Enter}"
        HelpText("`n   Off   `n", "Center", "Screen", 666)
    }

    ; 设置代理
    !]::{
        Send "^p"
        Send "^+{Tab 5}"
        Send "^{Tab}"
        Send "{Tab}"
        Send "{Right 5}"
        Send "{Left}"
        Send "^{Enter}"
        HelpText("`n   On   `n", "Center", "Screen", 666)
    }

    #BackSpace::{
        Send "!f"
        Send "{Up}"
        Send "{Enter}"
    }

    ; 显示详细信息
    NumLock::{
        Send "!v"
        Send "{Down 4}"
        Send "{Enter}"
    }

    ^AppsKey::{
        MouseGetPos(&x, &y, &win_id, &win_control)
        A_Clipboard := win_control
        ClipWait()
        HelpText(win_control, "CenterDown", "Screen", "900")
    }

    ^!AppsKey::Reload
    
#HotIf
