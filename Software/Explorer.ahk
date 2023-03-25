
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
    AppsKey::MoveExplorerTray()
#HotIf

; 桌面
#HotIf CheckWindowActive( "Explorer" , "WorkerW" )
    F1::Run "D:\"
    F2::Run "E:\"
    F3::Run "F:\"
    F4::Run "N:\"
    F5::Return
    F6::Return
    F7::Return
    F8::Return
    F9::Return
    F10::Run VSCode . " -n " "E:\Config\Windows.yaml", A_InitialWorkingDir, "Hide"
    F11::Run "E:\Project\Demo\"
    F12::Run "E:\Project\Ahk\"
    >!Space::Run "D:\#Lnk\Everything.lnk"
#HotIf

#HotIf CheckWindowActive( "Explorer" )

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

    ; 帮助
    F1::Return

    ; 重命名
    F2::Return
    ^r::Send "{F2}"

    ; ----------------------------------------------------------------------

    ;切换输入焦点
    F6::Return
    +F6::Return
    /::
    +/::{
        if (A_ThisHotkey == "/") {
            Send "{F6}"
        }
        if (A_ThisHotkey == "+/") {
            Send "+{F6}"
        }
        win_class := WinGetClass("A")
        control_name := ControlGetFocus("A")
        control_text := ControlGetText(control_name, "A")
        if (win_class == "WorkerW") { ;桌面
            HelpText("`nDesktop`n", "Center", "Screen1", 100)
        }
        if (control_name == "ToolbarWindow321" and control_text == "导航按钮") {
            HelpText("`n导航按钮`n", "Center", "Screen1")
        }
        if (control_name == "SysTreeView321" and control_text == "树视图") {
            HelpText("`n树视图`n", "Center", "Screen1")
        }
        if (control_name == "DirectUIHWND3") {
            HelpText("`n文件目录`n", "Center", "Screen1")
        }
        if (control_name == "DirectUIHWND2") {
            HelpText("`n切换显示`n", "Center", "Screen1")
        }
        Sleep 300
        HelpText()
    }

    ; 功能区展开缩放
    ^F1::Return
    !/::Send "^{F1}"

    ; 刷新
    F5::Return
    \::Send "{F5}"

    ; 状态栏历史
    F4::Return
    >!Space::Send "{F4}"

    !\::{
        control_name := ControlGetFocus("A")
        if (control_name == "SysTreeView321" ) {
            ControlFocus "DirectUIHWND3", "A"
        }
        if (control_name == "DirectUIHWND3" ) {
            ControlFocus "SysTreeView321", "A"
        }
    }

    ; ----------------------------------------------------------------------

    ; 显示Alt快捷键帮助
    F10::Return
    RAlt::Send "{F10}"
    RAlt & RWin::Send "!{F4}"

    ; 全屏
    F11::Return
    #Enter::Send "{F11}"

    ; Ctrl+Shift+E 显示选定文件夹上的所有文件夹
    ^+e::Return

    ; Alt+向左键 查看上一个文件夹
    ; Alt+向右键 查看下一个文件夹
    ; Alt+向上键 查看该文件夹所在的文件夹

    ; 切换
    ; 排序方式
    ; 前进|返回|历史
    ; 切换到树状列表
    ; 文件夹列表
    !Tab::{
        Send "^+e" ;目录树定位到文件夹
        Send "{F6}" ;切换焦点
    }
    ^Tab::Return
    ^+Tab::Return

    ; Ctrl+W 关闭活动窗口
    ^w::Return
    !CapsLock::Send "^w"

    ; 属性对话框 !{Enter}

    ; 删除
    ^d::Return

    ; Ctrl+E 选择搜索框
    <^e::Return

    ; Ctrl+N 打开新窗口
    ; Ctrl+Shift+N 创建新文件夹
    ; Ctrl+N -> Ctrl+Shift+N
    ^+n::Return
    <^n::Send "^+n"

    ; Ctrl+鼠标滚轮 更改文件和文件夹图标的大小和外观
    ^WheelUp::Return
    ^WheelDown::Return

    <#\::
    <#+\::{
        total_width := 1960 , total_height := 1250
        total_left := 317  , offset_left := -6
        total_right := 411 , offset_right := 12
        input_check_width := 388 , input_move_width := 426 , input_offset := 4
        line_width := 26

        EC := Map( "File"     , "ItemNameDisplay:1150"
                 , "List"     , "ItemNameDisplay:999,Size:150"
                 , "Default"  , "ItemNameDisplay:800,ItemDate:200,Size:150"
                 , "Software" , "ItemNameDisplay:550,Comment:400,ItemDate:200"
                 , "Recover"  , "ItemNameDisplay:420,"
                                "Recycle.DeletedFrom:400,Recycle.DateDeleted:180,"
                                "Size:150"   )

        EC["D:\"]   := EC["Software"]
        EC["回收站"] := EC["Recover"]
        EC["T:\"]   := EC["List"]

        #Include *i Explorer.Private.ahk

        WPD["Explorer"] := Position(total_width , total_height)
        InitWindowArgs()

        GetActiveWindowInfo()
        origin_x := window.x
        origin_y := window.y
        origin_w := window.w
        origin_h := window.h

        MoveWindowToDefaultPosition()

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
            offset := -10
            MouseMove current_w/2, current_h + offset, 0
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

        command := Format("{1} {2} {3}"
                         , A_InitialWorkingDir . "\Lib\V1\Explorer.exe"
                         , "SetColumns"
                         , config )
        Run command

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
        if ( Abs(input_w - input_check_width) > Abs(input_offset) ) {
            MouseClickDrag "Left"
                           , input_x  + input_offset                        , input_y + input_h/2
                           , total_width - input_move_width  + input_offset , input_y + input_h/2
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
        if ( Abs(total_width - content_xx - total_right - line_width) > Abs(offset_right) ) {
            MouseClickDrag "Left"
                           , content_xx + offset_right                , content_yy/2 - content_y/2
                           , total_width - total_right - offset_right , content_yy/2 - content_y/2
                           , 0
        }
        MouseMove x_origin, y_origin, 0
    }

#HotIf
