
WPD["PyCharm_SunAwtFrame"] := [ -13 ,   0 , 2584 , 1451 ]
WPB["PyCharm_SunAwtFrame"] := [ 19  ,  29 , 2522 , 1393 ]

WPD["PyCharm__更改"] := Position(-100 , -100)
WPD["PyCharm__变更"] := Position(-100 , -100)

WPD["PyCharm__收藏夹"]   := Position(900 , 1300)
WPD["PyCharm__设置同步"] := Position(900 , 1300)
WPD["PyCharm__插件同步"] := Position(900 , 1300)
WPD["PyCharm__回滚变更"] := Position(900 , 1300)
WPD["PyCharm__注册新文件类型关联"] := Position(900 , 1300)

WPD["PyCharm__Python解释器"] := Position(1000 , 1500)
WPD["PyCharm__书签"] := Position(1000 , 1500)

WPD["PyCharm__编辑宏"] := Position(1300 , 1000)

WPD["PyCharm__编辑配置设置"] := Position(1300 , 1600)

WPD["PyCharm__指定检查范围"] := Position(1500 , 1000)
WPD["PyCharm__将提交推送到"] := Position(1500 , 1000)

WPD["PyCharm__自定义调试"] := Position(0.3 , 0.7)

WPD["PyCharm__编辑运行配置"] := Position(0.5 , 0.8)
WPD["PyCharm__运行/调试配置"] := Position(0.5 , 0.8)

; WPD["PyCharm__查找"]     := Position4K(1600 , 1500)
; WPD["PyCharm__检查"]     := Position4K(1600 , 1500)
; WPD["PyCharm__提交变更"] := Position4K(1600 , 1500)

WPD["PyCharm__插件更新"] := Position(1500 , 1000)

WPD["PyCharm__断点"] := Position(1500 , 1122)

WPD["PyCharm__问题"]             := Position(900 , 1100)
WPD["PyCharm__远程主机"]         := Position(1500 , 1122)
WPD["PyCharm__可用软件包"]       := Position(1500 , 1122)
WPD["PyCharm__添加Python解释器"] := Position(1500 , 1122)
WPD["PyCharm__评估"]             := Position(1500 , 1122)
WPD["PyCharm__Python解释器"]     := Position(1500 , 1122)

WPD["PyCharm__自定义主工具栏"] := Position(0.3 , 0.7)
WPD["PyCharm__添加操作"]      := Position(0.3 , 0.7)
WPD["PyCharm__浏览图标"]      := Position(0.3 , 0.7)
WPD["PyCharm__导航栏工具栏"]  := Position(0.3 , 0.7)
WPD["PyCharm__选择路径"]      := Position(0.3 , 0.7)
WPD["PyCharm__选择"]         := Position(0.3 , 0.7)
WPD["PyCharm__打开文件或项目"] := Position(0.3 , 0.7)

WPD["PyCharm__提交更改"] := Position(0.45 , 0.75)
WPD["PyCharm__回滚更改"] := Position(0.45 , 0.75)

WPD["PyCharm__设置"] := Position(0.65 , 0.77)
WPB["PyCharm__设置"] := Position(0.76 , 0.88)

WPD["PyCharm__BigDataTools"] := Position(0.2 , 0.8)
WPD["PyCharm__学习"] := Position(0.3 , 0.8)

WPD["PyCharm__查找"]    := Position(0.4 , 0.8)
WPD["PyCharm__拉取请求"] := Position(0.4 , 0.8)

WPD["PyCharm__Python软件包"] := Position(0.6 , 0.7)
WPD["PyCharm__AWS"]         := Position(0.6 , 0.7)
WPD["PyCharm__单词本"]       := Position(0.6 , 0.7)

WPD["PyCharm__TODO"]       := Position(0.6 , 0.8)
WPD["PyCharm__JsonParser"] := Position(0.6 , 0.8)

WPD["PyCharm__端点"]       := Position(0.7 , 0.8)
WPD["PyCharm__Statistic"] := Position(0.7 , 0.8)

WPD["PyCharm__GrepConsole"] := Position(0.8 , 0.8)

WPD["PyCharm__数据库"] := Position(0.8 , 0.8)
WPD["PyCharm__服务"]   := Position(0.8 , 0.8)

WPD["PyCharm__终端"] := Position(0.8 , 0.9)
WPD["PyCharm__运行"] := Position(0.8 , 0.9)
WPD["PyCharm__调试"] := Position(0.8 , 0.9)
try {
    x := Screens.2.x
    y := Screens.2.yy / 2 - Screens.2.y / 2 - 200
    w := Screens.2.w
    h := Screens.2.h / 2
    WPB["PyCharm__调试"] := [x, y, w, h]
}

WPD["PyCharm__Python控制台"] := Position(0.9 , 0.9)
WPD["PyCharm__Git"]         := Position(0.9 , 0.9)

w := 800
h := 500
x := Screen.xx - w - 70
y := Screen.yy - h - 60
WPD["PyCharm__通知"] := [x, y, w, h]
