
#if ( WindowsActive("FFRenamePro") )

    ; 退出
    ^!x::Return
    <#BackSpace::Send ^!x

    ; 参数设置
    ^s::Return

    ; 反选
    ^i::Return
    ^+a::Send ^i

    ; 向上移动格
    ; 向下移动一格
    ; 上移到顶部
    ; 下移到底部
    ^u::Return
    ^d::Return
    ^!u::Return
    ^!d::Return
    PgUp::Send ^u
    PgDn::Send ^d
    Home::Send ^!u
    End::Send ^!d

    ; 隐藏所选项目
    ^h::Return
    Delete::Send ^h

    ; 文件信息查看
    F3::Return

    ; 文件名编辑器
    F4::Return
    /::Send {F4}

    ; 刷新
    F5::Return
    \::Send {F5}

    ; 导出列表内容到文件
    F7::Return

    ; 默认布局
    F8::Return
    
    ; 预览更名结果
    F9::Return
    +Enter::Send {F9}

    ; 应用更名结果
    F10::Return
    !Enter::Send {F10}

#if

; 文件名编辑器
#if ( WindowsActive("FFRenamePro" , "TFileNameEditorForm") )
    Esc::Send !c
#if

; 参数设置
#if ( WindowsActive("FFRenamePro" , "TConfigForm") )
    Esc::Send !c
#if

; 批量更名完成
#if ( WindowsActive("FFRenamePro" , "TGoRenameOKForm") )
    Esc::Send !c
#if