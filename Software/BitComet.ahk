﻿
RegisterHelp("BitComet", FilePath(A_LineFile, "BitComet.help"))


#HotIf CheckWindowActive("BitComet", "#32770", "选项*")
    #\::MoveWindowPosition(Position(1500 , 1000))
#HotIf


#HotIf CheckWindowActive("BitComet", "#32770", "通知")
    #\::{
        MoveWindowPosition(Position(800, 750))
        cfg := " 1:空:50  2:时间:250  3:消息:400 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321" , cfg)
    }
#HotIf


#HotIf CheckWindowActive("BitComet", "#32770", "新建BT任务")

    ; 立即下载
    NumLock::
    CapsLock::{
        SetControlDelay(-1)
        ControlClick("Button27", "A")
    }

    SetListView() {
        cfg := " 1:名称:999  2:大小:111  3:%:77 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321" , cfg)
        cfg := " 1:下载顺序:111  2:文件名称:777  3:大小:111 4:%:77 5:当前优先级:111 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView323" , cfg)
    }

    #\::{
        MoveWindowPosition(Position(1300, 1000))
        SetListView()
    }

    !Tab::^Tab
    !+Tab::^+Tab

    #Include *i BitComet.Mouse.ahk

#HotIf


#HotIf CheckWindowActive("BitComet", "#32770", "批量下载种子")
    #\::{
        MoveWindowPosition(Position(1300, 700))
        cfg := " 1:名称:999  2:大小:130  3:发表日期:100 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321" , cfg)
    }
#HotIf


#HotIf CheckWindowActive("BitComet")

    NumpadIns::WinClose("A")

    NumpadDel::
    #\::{
        total_width  := 2333
        total_height := 1222
        left_width   := 255

        MoveWindowPosition(Position(total_width , total_height))

        GetActiveWindowInfo()

        ; 左边栏大小
        info := window.controls.SysListView321
        if Abs(info.x - left_width) > 10 {
            MouseGetPos &x_origin, &y_origin
            MouseMove info.x , info.y + info.h / 2
            offset := GetOffset("X")
            MoveControlUDLR(info, "Left", left_width, offset)
            MouseMove x_origin, y_origin, 0
        }

        _1 := " 1     12     2     3     9        8        6        4         7       5         10       11     "
        _2 := " 名称  文件夹  大小   进度  剩余大小  剩余时间   下载速度  下载大小   上传速度  上传大小   种子/用户 分享率  "
        _3 := " 700   150    200   77    110     110       120      110       120     110       150      77     "
        config := GetColumnConfig(_1, _2, _3)
        SetColumnWidth("SysListView321" , config)

        #Include *i BitComet.Private.ahk
    }

    ^+c::{
        Send "{AppsKey}"
        Send "{Up 3}"
        Send "{Enter}"
        Send "{Enter}"
    }

    #BackSpace::{
        Send "!{f}"
        Sleep 99
        Send "{Up}"
        Send "{Enter}"
    }

    ; 显示详细信息
    NumLock::
    CapsLock::{
        Send "!{V}{Down 4}{Enter}"
    }

    ^AppsKey::{
        MouseGetPos(&x, &y, &win_id, &win_control)
        A_Clipboard := win_control
        ClipWait()
        HelpText(win_control, "CenterDown", "Screen", "900")
    }
    
#HotIf
