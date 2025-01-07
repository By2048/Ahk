
#HotIf CheckWindowActive( "MMC" , "#32770" , "添加或删除管理单元" )
    RShift::
    #\::{
        SetColumnWidth( "SysListView321" , Map( 1,125 , 2,135) )
    }
#HotIf


#HotIf CheckWindowActive( "MMC" , "MMCMainFrame" , "*[Windows]*" )
    !BackSpace::
    ~NumLock::{
        Send "!fxn"
    }
#HotIf


#HotIf CheckWindowActive( "MMC" , "MMCMainFrame" , "*共享文件夹*" )
    #\::{
        GetActiveWindowInfo()
        title := window.title
        name  := "SysListView321"
        width := Map()
        if InStr(title, "本地)\共享") {
            width := Map( 1 , 250   ;共享名
                        , 2 , 300   ;文件夹路径
                        , 3 , 111   ;类型
                        , 4 , 111   ;客户端链接
                        , 5 , 111 ) ;描述
        } else if InStr(title, "本地)\会话") {
            width := Map( 1 , 150   ;用户
                        , 2 , 150   ;计算机
                        , 3 , 111   ;类型
                        , 4 , 111   ;打开文件
                        , 5 , 111   ;链接时间
                        , 6 , 111   ;空闲时间
                        , 7 , 111 ) ;来宾
        } else if InStr(title, "本地)\打开的文件") {
            width := Map( 1 , 500   ;打开文件
                        , 2 , 111   ;访问者
                        , 3 , 111   ;类型
                        , 4 , 111   ;锁定
                        , 5 , 111 ) ;打开模式
        }
        SetColumnWidth(name, width)
    }
#HotIf



#HotIf CheckWindowActive( "MMC" , "MMCMainFrame" , "*服务*" )
    CapsLock::F5
    #\::{
        MoveWindowPosition(Position(1888 , 1222))
        name  := "SysListView321"
        width := Map( 1 , 350   ;名称
                    , 2 , 500   ;描述
                    , 3 , 77    ;状态
                    , 4 , 111   ;启动类型
                    , 5 , 70  ) ;登录为
        SetColumnWidth(name, width)
    }
#HotIf



#HotIf CheckWindowActive( "MMC" , "MMCMainFrame" , "*事件查看器*" )
    #\::{
        ; 管理事件的摘要
        name  := "WindowsForms10.SysListView32.app.0.ef627a_r64_ad31"
        width := Map( 1 , 99    ;事件类型
                    , 2 , 77    ;事件ID
                    , 3 , 250   ;来源
                    , 4 , 400   ;日志
                    , 5 , 77    ;1h
                    , 6 , 77    ;24h
                    , 7 , 77  ) ;7d
        SetColumnWidth(name, width)

        ; 最近查看的节点
        name  := "WindowsForms10.SysListView32.app.0.ef627a_r64_ad32"
        width := Map( 1 , 222   ;名称
                    , 2 , 333   ;描述
                    , 3 , 150   ;修改时间
                    , 4 , 150 ) ;创建时间
        SetColumnWidth(name, width)

        ; 日志摘要
        name  := "WindowsForms10.SysListView32.app.0.ef627a_r64_ad33"
        width := Map( 1 , 500   ;日志名称
                    , 2 , 130   ;大小
                    , 3 , 130   ;修改时间
                    , 4 , 77    ;已启用
                    , 5 , 222 ) ;保留策略
        SetColumnWidth(name, width)
    }
#HotIf



RegisterPosition( "MMC" , Position(2000 , 1222) )
#HotIf CheckWindowActive( "MMC" )
    #\::{
        MoveWindowPosition(Position(2000 , 1222))
        tree_width   := 333
        check_offset := 22
        move_offset  := 13
        GetActiveWindowInfo(False)
        info := window.controls.SysTreeView321
        if ( Abs(info.w - tree_width) > check_offset ) {
            MouseGetPos(&x_origin, &y_origin)
            MouseMove info.x + info.w + move_offset , info.y + info.h / 2
            MoveControlUDLR(info, "Right", tree_width, move_offset)
            MouseMove x_origin, y_origin
        }
    }
#HotIf
