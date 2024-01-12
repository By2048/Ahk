
RegisterProcess("explorer" , "Explorer")

RegisterHelp("Explorer_CabinetWClass" , "Software\Microsoft\Explorer.help")

RegisterHelp("Explorer_WorkerW" , "| Key\Win.help                         "
                                . "| Key\Win.Other.help                   "
                                . "| Software\Microsoft\Explorer.Fxx.help "
                                . "| Config\Mouse.help "                  )


; 控制面板\所有控制面板项\Windows Defender 防火墙\允许的应用
#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" , "防火墙\允许的应用" )
    Delete::{
        Send "!m"
        Send "!y"
    }
#HotIf

#HotIf CheckWindowActive( "Explorer" , "OperationStatusWindow" , "删除文件" )
    !Enter::{
        Send "!a"
        Send "!y"
    }
#HotIf

#HotIf CheckWindowActive( "Explorer" , "#32770" , "删除多个项目" )
    !y::Return
    !n::Return
#HotIf


#HotIf CheckWindowActive( "Explorer" , "#32770" , "属性" )
    ; 修改文件图标
    \::{
        Send "^+{Tab}"
        Sleep 500
        Send "!i"
        Sleep 500
        Send "!r"
        Sleep 500
        Send "!a"
        Sleep 500
        Send "{Enter}"
    }
#HotIf

#HotIf CheckWindowActive( "Explorer" , "#32770" )
    ^Tab::Return
    ^+Tab::Return
    !Tab::Send "^{Tab}"
    !+Tab::Send "^+{Tab}"
    !CapsLock::Send "!{F4}"
#HotIf

; 任务栏
#HotIf CheckWindowActive( "Explorer" , "Shell_TrayWnd" )
    PgUp::Send "{Volume_Up}"
    PgDn::Send "{Volume_Down}"
    =::
    Home::{
        Send "{Volume_Up 5}"
    }
    -::
    End::{
        Send "{Volume_Down 5}"
    }
    RAlt & RWin::Return
#HotIf


; 文件管理器
#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" )

    ; Ctrl+F 选择搜索框
    ; Alt+D 选择地址栏
    ; Alt+P 显示预览面板
    ; Backspace 查看上一个文件夹

    ; End  显示活动窗口底部
    ; Home 显示活动窗口顶部
    ; Right 显示当前选择内容（如果已折叠） 或选择第一个子文件夹
    ; Left  折叠当前选择内容（如果已展开） 或选择该文件夹所在的文件夹

    ; Num Lock + 星号 (*) 显示选定文件夹下的所有子文件夹
    ; Num Lock + 加号 (+) 显示选定文件夹中的内容
    ; Num Lock + 减号 (-) 折叠选定文件夹

    ; 功能区展开缩放
    !`::Send "^{F1}"
    ^F1::Return

    ; 快捷键帮助
    F10::Return

    ; 全屏
    F11::Return
    #Enter::Send "{F11}"

    ; 快速删除
    Insert & Delete::{
        Send "{Delete}"
        Sleep 333
        Send "!{y}"
    }

    !/::ControlFocus "SysTreeView321", "A"
    !\::{
        ControlFocus "DirectUIHWND3", "A"
        Send "{PgDn}{PgUp}"
    }

    ; Alt+向左键 查看上一个文件夹
    ; Alt+向右键 查看下一个文件夹
    ; Alt+向上键 查看该文件夹所在的文件夹

    ; 切换
    ; 排序方式
    ; 前进|返回|历史
    ; 切换到树状列表
    ; 文件夹列表
    ; !Tab::{
    ;     Send "^+e" ;目录中定位到文件夹
    ;     Send "{F6}" ;切换焦点
    ; }
    ^Tab::Return
    ^+Tab::Return

    ; Ctrl+W 关闭活动窗口
    ^w::Return
    !CapsLock::Send "^w"

    ; 属性对话框 !{Enter}

    ; Ctrl+鼠标滚轮 更改文件和文件夹图标的大小和外观
    ^WheelUp::Return
    ^WheelDown::Return

    ; 打开主右键菜单设置
    !AppsKey::{
        windows   := GetActiveWindowInfo(False)
        info      := window.controls.DirectUIHWND3
        content_x := info.x
        content_y := info.y
        content_w := info.w
        content_h := info.h
        x := content_x + 20
        y := content_y + content_h - 13
        MouseGetPos &x_origin, &y_origin
        MouseClick "Right", x, y, 1, 0
        MouseMove x_origin, y_origin, 0
    }

    #\::
    #+\::{
        total_width  := 1960
        total_height := 1250

        check_offset := 30

        tree_width := 325

        preview_width := 411

        input_move_width   := 426
        input_check_width  := 388

        ; "ItemNameDisplay:800 ItemDate:200 Size:150"
        ; "ItemNameDisplay:1000 Size:150"
        Cfg := Map( "FileInfo"   , "ItemNameDisplay:1000 Size:150"
                  , "FileList"   , "ItemNameDisplay:1150"
                  , "FolderInfo" , "ItemNameDisplay:500 Comment:450 ItemDate:200"
                  , "FolderList" , "ItemNameDisplay:575 Comment:575"
                  , "Recover"    , "ItemNameDisplay:420 "
                                   "Recycle.DeletedFrom:400 Recycle.DateDeleted:180 "
                                   "Size:150" )

        ; 设置 文件夹选项 查看 在标题栏中显示完整路径
        Cfg["Default"] := Cfg["FileInfo"]
        Cfg["回收站"]   := Cfg["Recover"]

        #Include *i Explorer.Columns.Private.ahk

        MouseGetPos &x_origin, &y_origin

        WinGetPos &origin_win_x, &origin_win_y, &origin_win_w, &origin_win_h, "A"

        MoveWindowToPosition(Position(total_width , total_height))

        GetActiveWindowInfo(False)

        ; 通过鼠标移动移动窗口,通过此操作Window可以在下次启动时使用修改后的位置
        if (   origin_win_x != window.x or origin_win_y != window.y
            or origin_win_w != window.w or origin_win_h != window.h ) {
            MouseMove window.position_client.w/2 , window.position_client.h , 0
            MouseClickDrag "Left", 0, 0, 0, -50, 0, "R"
            MouseClickDrag "Left", 0, 0, 0,  50, 0, "R"
        }

        config := ""
        if A_ThisHotkey == "#\"
            config := Cfg.Get(window.title, Cfg["Default"])
        if A_ThisHotkey == "#+\"
            config := Cfg["FileList"]

        #Include Explorer.Columns.Tool.ahk
        SetExplorerColumns(config)

        ; 搜索框
        GetActiveWindowInfo(False)
        info := window.controls.DirectUIHWND1
        if ( Abs(info.w - input_check_width) > check_offset ) {
            MouseMove info.x , info.y + info.h / 2
            offset := GetOffset("X")
            MouseMove info.x + offset , info.y + info.h / 2
            MoveControlUDLR(info, "Left", total_width - input_move_width, offset)
        }

        ; 左侧树状信息
        GetActiveWindowInfo(False)
        info := window.controls.SysTreeView321
        if ( Abs(info.w - tree_width) > check_offset * 1 ) {
            MouseMove info.x + info.w , info.y + info.h / 2
            offset := GetOffset("X")
            MouseMove info.x + info.w + offset , info.y + info.h / 2
            MoveControlUDLR(info, "Right", tree_width, offset)
        }

        ; 右侧预览
        GetActiveWindowInfo(False)
        info := window.controls.DirectUIHWND3
        if ( Abs(total_width - (info.x + info.w) - preview_width) > check_offset * 2 ) {
            MouseMove info.x + info.w , info.y + info.h / 2
            offset := GetOffset("X")
            MouseMove info.x + info.w + offset , info.y + info.h / 2
            MoveControlUDLR(info, "Right", info.x + info.w + preview_width, offset)
        }

        MouseMove x_origin, y_origin, 0
    }

    CapsLock & Enter::{
        path := " E:\Project\Ahk\Software\Microsoft\Explorer.Columns.Private.ahk "
        Run VSCode . path
    }

#HotIf

; 通用设置
#HotIf CheckWindowActive( "Explorer" )

    #IncludeAgain Explorer.Key.ahk

#HotIf

; 打开的窗口
#HotIf CheckWindowActive( "" , "#32770" , "打开|打开文件|更改图标|选择文件|选择文件夹|另存为|浏览" )

    ; 文件名修改框
    /::ControlFocus "Edit1", "A"

    CapsLock::{
        Send "{Esc}"
        SetCapsLockState "Off"
    }

    #IncludeAgain Explorer.Key.ahk

    !/::ControlFocus "SysTreeView321", "A"
    !\::{
        ControlFocus "DirectUIHWND2", "A"
        Send "{Home}"
    }

    ; 默认位置
    #\::{
        MoveWindowToDefaultPosition()
        GetActiveWindowInfo(False)
        try {
            info := window.controls.DirectUIHWND2  ;左侧信息栏
        } catch {
            return
        }
        MoveControlUDLR(info, "Left", 300, 6)
        Send "^!7"  ;平铺模式
    }

#HotIf


#Include Explorer.Fxx.ahk
