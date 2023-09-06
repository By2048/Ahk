
#HotIf CheckWindowActive("Xftp")
    <#\::{
        MoveWindowToPosition(Position(2200 , 1200))
    }
#HotIf


#HotIf CheckWindowActive("XshellCore", "#32770", "自定义按键对应")
    <#\::{
        _name  := "SysListView321"
        _width := Map( 1 , 200   ;组合键
                     , 2 , 150   ;类型
                     , 3 , 300   ;操作
                     , 4 , 150 ) ;参数
        SetColumnWidth(_name, _width)
    }
#HotIf


#HotIf CheckWindowActive("XshellCore", "#32770", "会话")
    <#\::{
        width  := 1100
        height := 660
        MoveWindowToPosition(Position(width , height))
        ; 主界面
        index  := " 1    2    3    4    5     6    7        "
        name   := " 名称 主机  端口  协议 用户名 说明  修改时间  "
        width  := " 170  200  90   90   100   170   200     "
        config := GetColumnConfig(index, name, width)
        SetColumnWidth("SysListView321" , config)
    }
#HotIf


#HotIf CheckWindowActive("Xshell")

    ;下一个选项卡
    ^]::Return
    !Tab::Send "^]"

    ;上一个选项卡
    ^[::Return
    !+Tab::Send "^["

    ;结束运行
    !BackSpace::Send "^c"

    ;复制
    ^c::Send "^{F1}"

    ;清屏
    ^/::Return
    !Esc::Send "^/"

    ;关闭窗口
    ^\::Return
    !CapsLock::Send "^\"

    ;关闭所有窗口
    ^+\::Return
    !+CapsLock::Send "^+\"

    <#\::{
        MoveWindowToPosition(Position(2200 , 1200))
    }

    <#Enter::Send "^!{F12}"
    <#+Enter::Send "^!+{F12}"

#HotIf
