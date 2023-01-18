
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
    F10::Run VSCode . " -n " "E:\Config\Windows.yaml", A_WorkingDir, "Hide"
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
        ; 4K
            ; 2520  1700
            ; D:\\   | 树 426 | 名称800  备注400    日期250             | 预览 550
            ; 回收站  | 树 426 | 名称500  原位置500  删除日期250  大小200  | 预览 550
            ; 其他    | 树 426 | 名称999   日期250    大小200            | 预览 550
        ; 2K
            ; 1890	1275
            ; D:\\   | 树 426 | 名称800  备注400    日期250             | 预览 550
            ; 回收站  | 树 426 | 名称500  原位置500  删除日期250  大小200  | 预览 550
            ; 其他    | 树 426 | 名称999   日期250    大小200            | 预览 550

        if ( InStr(Screen.Name, "4K") ) {
            total_width  := 2520
            total_height := 1700
            left_length  := 426
            right_length := 550
            line_width   := 14
            offset       := 9

            EC := Map( "File"     , "ItemNameDisplay:1450"
                     , "Default"  , "ItemNameDisplay:999,ItemDate:250,Size:200"
                     , "List"     , "ItemNameDisplay:1250,Size:200"
                     , "Software" , "ItemNameDisplay:800,Comment:400,ItemDate:250"
                     , "Recover"  , "ItemNameDisplay:500,"
                                    "Recycle.DeletedFrom:500,Recycle.DateDeleted:250,"
                                    "Size:200" )
        }

        if ( InStr(Screen.Name, "2K") ) {
            total_width  := 1929
            total_height := 1250
            left_length  := 305
            right_length := 378
            line_width   := 14
            offset       := 5
            EC := Map( "File"     , "ItemNameDisplay:1133"
                     , "Default"  , "ItemNameDisplay:800,ItemDate:180,Size:140"
                     , "List"     , "ItemNameDisplay:980,Size:140"
                     , "Software" , "ItemNameDisplay:510,Comment:430,ItemDate:180"
                     , "Recover"  , "ItemNameDisplay:420," .
                                    "Recycle.DeletedFrom:400,Recycle.DateDeleted:180," .
                                    "Size:140" )
        }

        WPD["Explorer"] := Position(total_width , total_height)
        MoveWindowToDefaultPosition()

        win_title := window.title

        EC["D:\"]       := EC["Software"]
        EC["D:\Python"] := EC["Software"]
        EC["D:\Go"]     := EC["Software"]
        EC["D:\Java"]   := EC["Software"]
        EC["回收站"]     := EC["Recover"]
        EC["T:\"]       := EC["List"]

        config := ""
        if EC.Has(win_title) {
            config := EC[win_title]
        }
        if (not config) {
            if (A_ThisHotkey == "<#+\") {
                config := EC["File"]
            } else if (A_ThisHotkey == "<#\") {
                config := EC["Default"]
            }
        }

        command := Format("{1} {2} {3}"
                         , A_InitialWorkingDir . "\Lib\V1\Explorer.exe"
                         , "SetColumns"
                         , config )
        Run command

        CoordMode "Mouse", "Window"
        MouseGetPos &x_origin, &y_origin

        GetActiveWindowInfo("Window")
        win_id := window.id
        win_xx := window.xx
        cinfo  := window.controls.DirectUIHWND3
        x      := cinfo.x
        y      := cinfo.y
        w      := cinfo.w
        h      := cinfo.h
        xx     := cinfo.xx
        yy     := cinfo.yy
        CoordMode "Mouse", "Window"
        check_width := window.controls.SysTreeView321.w
        if ( Abs(check_width - left_length ) > offset * 2 ) {
            max_left := left_length + line_width
            MouseClickDrag "Left", x-offset,  (yy-y)/2, max_left+offset,  (yy-y)/2, 0
            max_right := win_xx - right_length + line_width
            MouseClickDrag "Left", xx+offset, (yy-y)/2, max_right-offset, (yy-y)/2, 0
        }
        MouseMove x_origin, y_origin, 0

    }

#HotIf
