
#If ( CheckWindowActive("XshellCore", "#32770", "自定义按键对应") )
    <#\::
        _name  := "SysListView321"
        _width := {  1 : 300   ;组合键
                  ,  2 : 150   ;类型
                  ,  3 : 400   ;操作
                  ,  4 : 200 } ;参数
        SetColumnWidth(_name, _width)
    Return
#If



#If ( CheckWindowActive("Xshell") )

    #Include %A_WorkingDir%\Software\#\Fxx\F1_F12_Ctrl.ahk

    <#Enter::Send ^!{F12}
    <#+Enter::Send ^!+{F12}

    ;下一个选项卡
    ^]::Return
    !Tab::Send ^]

    ;上一个选项卡
    ^[::Return
    !+Tab::Send ^[

    ;结束运行
    !BackSpace::Send ^c

    ;复制
    ^c::Send ^{F1}

    ;清屏
    ^/::Return
    !Esc::Send ^/

    ;关闭窗口
    ^\::Return
    !CapsLock::Send ^\

    ;关闭所有窗口
    ^+\::Return
    !+CapsLock::Send ^+\

#If
