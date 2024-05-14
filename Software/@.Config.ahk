
RegisterHelp("Default", "Key\Win.help"      )
RegisterHelp("Default", "Key\Win.Other.help")

RegisterPosition("_#32770"          , Position(1522 , 1122) )
RegisterPosition("_#32770_浏览"      , Position(1522 , 1122) )
RegisterPosition("_#32770_打开"      , Position(1522 , 1122) )
RegisterPosition("_#32770_另存为"     , Position(1522 , 1122) )
RegisterPosition("_#32770_打开文件"   , Position(1522 , 1122) )
RegisterPosition("_#32770_选择文件夹"  , Position(1522 , 1122) )
RegisterPosition("_#32770_浏览文件夹"  , Position(666 , 1122) )
RegisterPosition("_#32770_浏览计算机"  , Position(666 , 1122) )

RegisterProcess( "fdm" , "FDM" )
RegisterPosition( "FDM" , Position(1500 , 1111) , "Default" )
RegisterPosition( "FDM" , Position("[Center][2]" , 0.9 , 1000) , "Backup"  )

RegisterProcess( "SandMan" , "Sandboxie" )
RegisterPosition( "Sandboxie" , Position(0.7 ,  0.7) )

RegisterPosition( "qBittorrent" , Position(0.9 ,  0.8) )

RegisterPosition( "Calibre" , Position(0.8 ,  0.8) )

RegisterProcess( "哔哩哔哩" , "BiliBili" )
RegisterPosition( "BiliBili" , Position(0.7 , 0.88) )

RegisterPosition( "Maye" , Position(1172 , 1100) )

RegisterPosition( "DouYin" , Position(2333 , 1333) )

RegisterPosition( "Office Tool Plus" , Position(1900 , 1100) )

RegisterPosition( "Python__Anaconda" , Position(2666, 1666) )

RegisterPosition( "Thunder"             , Position(0.7 , 0.8) )
RegisterPosition( "Thunder__新建任务面板" , Position(0.3 , 0.4) )

RegisterPosition( "OneCommander" , Position(-9 , -9) )

; 开启关闭 Windows 功能
RegisterPosition( "OptionalFeatures_NativeHWNDHost" , Position(800 , 1000) )

; 搜索
RegisterProcess( "SearchApp" , "Search" )
RegisterProcess( "SearchUI" , "Search" )

; 开始菜单
RegisterProcess( "ShellExperienceHost" , "Start" )
RegisterProcess( "StartMenuExperienceHost" , "Start" )
RegisterPosition( "Start" , Position(488 , 600) )

; 画图
RegisterPosition( "MsPaint" , Position(0.62 , 0.82) )

; 资源监视器
RegisterProcess( "perfmon" , "SystemMonitor" )
RegisterPosition( "SystemMonitor" , Position(2250 , 1350) )

#Include *i @.Config.Private.ahk
