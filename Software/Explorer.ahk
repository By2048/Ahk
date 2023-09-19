
; 控制面板\所有控制面板项\Windows Defender 防火墙\允许的应用
#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" , "防火墙\允许的应用" )
    Delete::{
        Send "!m"
        Send "!y"
    }
#HotIf

#HotIf CheckWindowActive( "Explorer" , "OperationStatusWindow" , "删除文件" )
    !y::Return
    !n::Return
    \::Send "!a"
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

; 桌面
#HotIf CheckWindowActive( "Explorer" , "WorkerW" )
     F1::Run "C:\"
     F2::Run "D:\"
     F3::Run "E:\"
     F4::Run "F:\"
     F5::Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\"
     F6::Run "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\"
     F7::Run "E:\GitX\"
     F8::Run "E:\GitPy\"
     F9::Run "E:\Doc\"
    F10::Run "E:\Xxxx\"
    F11::Run "V:\"
    F12::Run "T:\"
    RAlt & RWin::Return
    ; ^r::Send "{F2}"
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
        windows := GetActiveWindowInfo()
        info := window.controls.DirectUIHWND3
        content_x  := info.x
        content_y  := info.y
        content_w  := info.w
        content_h  := info.h
        content_xx := info.xx
        content_yy := info.yy
        x := content_x  + 10
        y := content_yy - 10
        MouseGetPos &x_origin, &y_origin
        MouseClick "Right", x, y, 1, 0
        MouseMove x_origin, y_origin, 0
    }

    <#\::
    <#+\::{
        total_width := 1960 , total_height := 1250 , offset_down := -8
        total_left := 317  , offset_left := -6
        total_right := 411 , right_line_width := 26 , offset_right := 12
        input_check_width := 388 , input_move_width := 426 , offset_input := 4

        EC := Map( "File"     , "ItemNameDisplay:1150"
                 , "Default"  , "ItemNameDisplay:800 ItemDate:200 Size:150"
                 , "Software" , "ItemNameDisplay:500 Comment:450 ItemDate:200"
                 , "Recover"  , "ItemNameDisplay:420 "
                                "Recycle.DeletedFrom:400 Recycle.DateDeleted:180 "
                                "Size:150" )

        ; 设置 文件夹选项 查看 在标题栏中显示完整路径
        EC["D:\"]   := EC["Software"]
        EC["回收站"] := EC["Recover"]

        #Include *i Explorer.Private.ahk

        WinGetPos &origin_x, &origin_y, &origin_w, &origin_h, "A"

        MoveWindowToPosition(Position(total_width , total_height))

        InitWindowArgs()
        GetActiveWindowInfo()
        current_x := window.x
        current_y := window.y
        current_w := window.w
        current_h := window.h

        CoordMode "Mouse", "Window"
        MouseGetPos &x_origin, &y_origin

        ; 通过鼠标移动移动窗口,通过此操作Window可以在下次启动时使用修改后的位置
        if (   origin_x != current_x
            or origin_y != current_y
            or origin_w != current_w
            or origin_h != current_h ) {
            MouseMove current_w/2, current_h + offset_down, 0
            ; Todo 根据鼠标样式进行判断
            MouseClickDrag "Left", 0, 0, 0, -30, 0, "R"
            MouseClickDrag "Left", 0, 0, 0,  30, 0, "R"
        }


        config := ""
        if (!EC.Has(window.title)) {
            if (A_ThisHotkey == "<#+\") {
                config := EC["File"]
            } else if (A_ThisHotkey == "<#\") {
                config := EC["Default"]
            }
        } else {
            config := EC[window.title]
        }

        #Include Explorer.Tool.ahk
        SetExplorerColumns(config)

        GetActiveWindowInfo("Window")
        win_id := window.id
        win_xx := window.xx

        try {
            info := window.controls.DirectUIHWND1
            input_x  := info.x
            input_y  := info.y
            input_w  := info.w
            input_h  := info.h
            input_xx := info.xx
            input_yy := info.yy
        } catch {
            return
        }

        try {
            info := window.controls.DirectUIHWND3
            content_x  := info.x
            content_y  := info.y
            content_w  := info.w
            content_h  := info.h
            content_xx := info.xx
            content_yy := info.yy
        } catch {
            return
        }

        try {
            info := window.controls.SysTreeView321
            tree_width := info.w
        } catch {
            return
        }

        ; 搜索框
        if ( Abs(input_w - input_check_width) > Abs(offset_input) ) {
            MouseClickDrag "Left"
                           , input_x     + offset_input                    , input_y + input_h/2
                           , total_width - input_move_width + offset_input , input_y + input_h/2
                           , 0
        }
        ; 左侧树状信息
        if ( Abs(tree_width - total_left) > Abs(offset_left) ) {
            MouseClickDrag "Left"
                           , content_x  - offset_left     , content_yy/2 - content_y/2
                           , total_left - offset_left * 2 , content_yy/2 - content_y/2
                           , 0
        }
        ; 右侧预览
        if ( Abs(total_width - content_xx - total_right - right_line_width) > Abs(offset_right) ) {
            MouseClickDrag "Left"
                           , content_xx  + offset_right               , content_yy/2 - content_y/2
                           , total_width - total_right - offset_right , content_yy/2 - content_y/2
                           , 0
        }
        MouseMove x_origin, y_origin, 0
    }

#HotIf

; 通用设置
#HotIf CheckWindowActive( "Explorer" )

    #Include *i Explorer.Base.ahk

#HotIf

; 打开的窗口
#HotIf CheckWindowActive( "" , "#32770" , "打开|打开文件|更改图标|选择文件|选择文件夹|另存为|浏览" )

    ; 文件名修改框
    /::ControlFocus "Edit1", "A"

    #Include *i Explorer.Base.ahk

    !/::ControlFocus "SysTreeView321", "A"
    !\::{
        ControlFocus "DirectUIHWND2", "A"
        Send "{Home}"
    }

    ; 默认位置
    <#\::{
        MoveWindowToDefaultPosition()
        InitWindowArgs()
        GetActiveWindowInfo("Window")
        try {
            info := window.controls.DirectUIHWND2 ;左侧信息栏
        } catch {
            return
        }
        MoveControlUDLR(info, 0, 0, 300, 0, 6)
        Send "^!7" ;平铺模式
    }

#HotIf
