
RegisterHelp("FFRenamePro", FilePath(A_LineFile, "FFRenamePro.help"))


RegisterPosition("FFRenamePro" , Position(2100 , 1234))


; TConfigForm   参数设置
; TGoRenameOKForm   批量更名完成


#HotIf CheckWindowActive("FFRenamePro")

    Esc::
    CapsLock::{
        GetActiveWindowInfo(False)
        win_class := window.class
        win_title := window.title
        if win_class == "TFilterForm" ;对象过滤设置对象过滤设置
            Send "!c"
        else if win_class == "TFileNameEditorForm" ;文件名编辑器
            Send "!c"
    }

    ; 退出
    ^!x::Return
    <#BackSpace::Send "^!x"

    ; 参数设置
    ^s::Return
    !AppsKey::Send "^s"

    ; 添加文件或文件夹
    ^o::Return
    ![::Send "^o"

    ; 添加一个文件夹下的对象
    !]::Send "^g"

    ; 反选
    ^i::Return
    ^+a::Send "^i"

    ; 向上移动格
    ; 向下移动一格
    ; 上移到顶部
    ; 下移到底部
    ^u::Return
    ^d::Return
    ^!u::Return
    ^!d::Return
    !PgUp::Send "^u"
    !PgDn::Send "^d"
    !Home::Send "^!u"
    !End::Send "^!d"

    ; 隐藏所选项目
    ^h::Return
    !Delete::Send "^h"

    ; 结束当前命令 (插入空命令)
    F2::Return

    ; 文件信息查看
    F3::Return

    ; 文件名编辑器
    F4::Return
    !\::Send "{F4}"

    ; 刷新
    F5::Return
    ~RShift::F5

    ; 对象过滤设置工具
    F6::Return
    !/::F6

    ; 导出列表内容到文件
    F7::Return

    ; 默认布局
    F8::Return

    ; 预览更名结果
    F9::Return
    +Enter::Send "{F9}"

    ; 应用更名结果
    F10::Return
    !Enter::Send "{F10}"

    ; 定义用户自定义元变里<USER0>~<USER9>
    F11::Return
    !,::F11

    ; 查看用户自定义元变量<USER0>~<USER9>
    F12::Return
    !.::F12

#HotIf
