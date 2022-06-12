
#If CheckWindowActive( "Q-Dir" )

    ;全屏
    F11::Return
    <#Enter::Send {F11}

    ; 退出
    !F4::Return

    ; 重新启动
    !F11::Return

    ; 状态栏历史
    F4::Return
    !/::Send {F4}

    ; 切换树
    ^e::Return
    !\::Send ^e
        ; Send {Ctrl Down}{e}{Ctrl Up}
        ; Send {b down}{b up}
        ; SendEvent ^e
    ; Return
    ; [CTRL+E]

    ; 刷新
    F5::Return
    \::
        Send {F5}
        Send \
    Return

    ; 打印
    F10::Return

    ;切换下一模式 列表 详情 。。。
    +F6::Return
    ; !\::Send +{F6}

    ; 标签页
    ^Tab::Return
    !Tab::Send ^{Tab}

    ^+Tab::Return
    !+Tab::Send ^+{Tab}

    F2::Return
    ^r::Send {F2}

    ; Error
    ; 关闭活动窗口
    ^w::Return
    !CapsLock::Send ^w
    
    ;  DPI设置 系统增强
    ;  1 #3277010->SysTreeView325   2 #327702->SysListView321   4 #327706->SysListView323
    ;  1 ^                          3 #327704->SysListView322   4 ^
    ;    650                          500 * dpi                   500+120+90 * dpi
    <#\::
        MoveWindowToDefaultPosition()

        cinfo  := window["controls"]["#327702"]
        cleft  := 650
        MoveControlUDLR(cinfo, , , cleft)

        GetActiveWindowInfo()

        cinfo  := window["controls"]["#327702"]
        cright := cinfo.x + (200+180+120)*2+50
        MoveControlUDLR(cinfo, , , , cright)

        cinfo  := window["controls"]["#327702"]
        cdown  := 800
        MoveControlUDLR(cinfo, , cdown)
    Return

#If




/*
     
[CTRL+X]         切
[CTRL+C]         复制
[CTRL+V]         粘贴
[CTRL+A]         全选。
[CTRL+T]         新标签
[CTRL+W]         最后一个标签关闭
[CTRL+SHIFT+T]         选择文件夹中的新标签
[CTRL+SHIFT+A]         反转选择。
[CTRL+TAB]         下一个标签
[CTRL+SHIFT+TAB]         上一个标签
[CTRL+E]         切换树
[CTRL+Z]         撤消
[CTRL+Q]         菜单快速链接
[CTRL+M]         选择过滤器开/关
[CTRL+N]         新建文件夹。
[CTRL+S]         程序启动器
[CTRL+?]         [?=Left/Right/Up/Down] 选择多个项目。
[CTRL+数字+]         自动调整列大小
     
[STRG + ALT + (Driver-Char)]         快速驱动器开关。
     
[删除]         删除
[退格]         查看上一级文件夹。
     
[F2]         切换仅重命名/重命名名称
[F3]         搜索文件或文件夹。
[F4]         在活动视图中显示地址栏列表。
[F5]         刷新活动窗口。
[F7]         显示桌面菜单。
[F8]         显示我的电脑菜单。
[F11]         全屏：开/关
[ESC键]         全屏：关闭
     
[ATL+S]         聚焦地址
[ALT + L]         屏幕放大。
[ALT + V] 或 [ALT + M]         将项目移至 ... 。
[ALT + K]         将项目复制到...。
[ALT + ENTER]         显示选定对象的属性。
[ALT+左]         回去。
[ALT+右]         直走。
[ALT+退格]         回去。
[ALT+SHIFT+Backspace]         直走。
     
[SHIFT+F5]         显示视图菜单
[SHIFT+F6]         下一个视图模式（详细信息，...）
[SHIFT+F10]         显示所选项目的快捷菜单。
[Shift+Delete]         永久删除所选项目而不将项目放入回收站。

一些特点             
     
收藏夹      :         快速访问最常用的文件夹。
拖放      :         通过在 Q 视图和其他程序（如 MS Explorer）中拖动来移动文件。
剪贴板      :         在 Q-Dir 目录视图和其他程序（如 MS Explorer）之间复制/粘贴。
文件夹类型      :         ZIP-、FTP-、机柜-、网络-、系统-文件夹、快捷方式...
观看次数      :         大图标、图块、列表、细节、缩略图（Vista：超大符号）。
出口      :         到 XLS、CSV、TXT、HTML。
弹出菜单      :         台式机，我的电脑。
屏幕放大镜      :         屏幕上的任何东西都可以放大。
滤色器      :         不同项目类型的不同颜色（例如 *.log;*.txt）。
突出显示过滤器      :         快速突出显示项目的有效方法。
文件过滤器      :         允许快速轻松地过滤项目。
列      :         所有列都支持和保存功能。
快速链接      :         用于快速文件夹访问。
文件夹选择      :         快速灵活的文件夹选择地址栏/桌面菜单/我的电脑菜单/...
多信息技术      :         Q-Dir 的几个 INI 文件。
树视图      :         简单和四重。
预览      :         允许快速预览。
便携的      :         从 2.77 开始是 Q-Dir 便携式。

*/
