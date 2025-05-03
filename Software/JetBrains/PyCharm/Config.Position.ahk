
RegisterPosition( "PyCharm_SunAwtFrame" , Position( -13 ,  0 , 2584 , 1451 ) , "Default" )
RegisterPosition( "PyCharm_SunAwtFrame" , Position( 19  , 29 , 2522 , 1393 ) , "Backup"  )

RegisterPosition( "PyCharm__更改" , Position(-100 , -100) )
RegisterPosition( "PyCharm__变更" , Position(-10  , -30 ) )

RegisterPosition( "PyCharm__收藏夹"           , Position(900 , 1300) )
RegisterPosition( "PyCharm__设置同步"          , Position(900 , 1300) )
RegisterPosition( "PyCharm__插件同步"          , Position(900 , 1300) )
RegisterPosition( "PyCharm__回滚变更"          , Position(900 , 1300) )
RegisterPosition( "PyCharm__注册新文件类型关联" , Position(900 , 1300) )

RegisterPosition( "PyCharm__Python解释器" , Position(1000 , 1500) )
RegisterPosition( "PyCharm__书签"         , Position(1000 , 1500) )

RegisterPosition( "PyCharm__编辑宏" , Position(1300 , 1000) )

RegisterPosition( "PyCharm__编辑配置设置" , Position(888 , 1030) )

RegisterPosition( "PyCharm__指定检查范围" , Position(1500 , 1000) )
RegisterPosition( "PyCharm__将提交推送到" , Position(1500 , 1000) )

RegisterPosition( "PyCharm__自定义调试"     , Position(0.3 , 0.7)  )
RegisterPosition( "PyCharm__运行/调试配置"  , Position(0.46 , 0.73) )
RegisterPosition( "PyCharm__编辑运行配置"   , Position(0.5 , 0.75)  )

RegisterPosition( "PyCharm__选择要粘贴的内容" , Position(0.5 , 0.75) )

RegisterPosition( "PyCharm__插件更新" , Position(1500 , 1000) )

RegisterPosition( "PyCharm__断点" , Position(1500 , 1122) )

RegisterPosition( "PyCharm__问题"            , Position(900 , 1100) )
RegisterPosition( "PyCharm__远程主机"         , Position(1500 , 1122) )
RegisterPosition( "PyCharm__可用软件包"       , Position(1500 , 1122) )
RegisterPosition( "PyCharm__添加Python解释器" , Position(1500 , 1122) )
RegisterPosition( "PyCharm__评估"            , Position(1500 , 1122) )
RegisterPosition( "PyCharm__Python解释器"     , Position(1500 , 1122) )

RegisterPosition( "PyCharm__自定义主工具栏"      , Position(0.3 , 0.7) )
RegisterPosition( "PyCharm__添加操作"           , Position(0.3 , 0.7) )
RegisterPosition( "PyCharm__浏览图标"           , Position(0.3 , 0.7) )
RegisterPosition( "PyCharm__导航栏工具栏"        , Position(0.3 , 0.7) )
RegisterPosition( "PyCharm__选择路径"           , Position(0.3 , 0.7) )
RegisterPosition( "PyCharm__选择"               , Position(0.3 , 0.7) )
RegisterPosition( "PyCharm__打开文件或项目"      , Position(0.3 , 0.7) )
RegisterPosition( "PyCharm__将操作添加到快速列表" , Position(0.4 , 0.7) )

RegisterPosition( "PyCharm__宏" , Position(0.4 , 0.7) )

RegisterPosition( "PyCharm__提交更改" , Position(0.45 , 0.75) )
RegisterPosition( "PyCharm__回滚更改" , Position(0.45 , 0.75) )

win   := Position(0.66 , 0.77)
win.w := Mod(win.w, 2) ? win.w : win.w + 1
win.h := Mod(win.h, 2) ? win.h : win.h + 1
RegisterPosition( "PyCharm__设置" , Position( win.x, win.y, win.w, win.h ) )

RegisterPosition( "PyCharm__BigDataTools" , Position(0.2 , 0.8) )
RegisterPosition( "PyCharm__学习" , Position(0.3 , 0.8) )

RegisterPosition( "PyCharm__查找"     , Position(0.4 , 0.8) )
RegisterPosition( "PyCharm__拉取请求" , Position(0.4 , 0.8) )

RegisterPosition( "PyCharm__Python软件包" , Position(0.6 , 0.7) )
RegisterPosition( "PyCharm__AWS"          , Position(0.6 , 0.7) )
RegisterPosition( "PyCharm__单词本"        , Position(0.6 , 0.7) )

RegisterPosition( "PyCharm__TODO"        , Position(0.6 , 0.8) )
RegisterPosition( "PyCharm__JsonParser" , Position(0.6 , 0.8) )

RegisterPosition( "PyCharm__端点"        , Position(0.7 , 0.8) )
RegisterPosition( "PyCharm__Statistic" , Position(0.7 , 0.8) )

RegisterPosition( "PyCharm__GrepConsole" , Position(0.8 , 0.8) )

RegisterPosition( "PyCharm__数据库" , Position(0.8 , 0.8) )
RegisterPosition( "PyCharm__服务"    , Position(0.8 , 0.8) )

RegisterPosition( "PyCharm__运行" , Position(0.8 , 0.8) )
RegisterPosition( "PyCharm__终端" , Position(0.8 , 0.9) )
RegisterPosition( "PyCharm__调试" , Position(0.8 , 0.9) )
Try {
    x := Screens.2.x
    y := ( Screens.2.y + Screens.2.h ) / 2 - Screens.2.y / 2 - 200
    w := Screens.2.w
    h := Screens.2.h / 2
    RegisterPosition( "PyCharm__运行" , Position( x , y , w , h ) , "Backup" )
    RegisterPosition( "PyCharm__终端" , Position( x , y , w , h ) , "Backup" )
    RegisterPosition( "PyCharm__调试" , Position( x , y , w , h ) , "Backup" )
}

RegisterPosition( "PyCharm__Python控制台" , Position(0.9 , 0.9) )
RegisterPosition( "PyCharm__Git"          , Position(0.9 , 0.9) )

w := Screen.w * 0.33
h := Screen.h * 0.33
x := Screen.x + Screen.w - w - 80
y := Screen.y + Screen.h - h - 60
RegisterPosition( "PyCharm__通知" , Position(x, y, w, h) )
