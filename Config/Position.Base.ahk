
WPD["qBittorrent"] := Position(3000 , 1500)
WPD["Maye"]        := Position(1175 , 1100)
WPD["Calibre"]     := Position(3000 , 1500)
WPD["Everything"]  := Position(2300 , 1700)
WPD["Android"]     := Position(3440 , 2110)
WPD["Wallpaper"]   := Position(3388 , 2000)
WPD["Sandboxie"]   := Position(2500 , 1300)  
WPD["VMware"]      := Position(2500 , 1600)
WPD["Zip"]         := Position(1800 , 1400)
WPD["FFRenamePro"] := Position(3300 , 1800)
WPD["BiliBili"]    := Position(2500 , 1650)

WPD["Word"]  := Position(3300 , 2000)
WPD["Excel"] := Position(3300 , 2000)
WPD["PPT"]   := Position(3300 , 2000)

WPD["FDM"]         := Position("[Center][1]" , 2000 , 1500)
WPD["FDM__%"]      := Position("[Center][3]" , 1300 , 1200)

; 火绒U盘工具
WPD["HipsTray_HRUSBTRAY"] := Position(-10, -10, 0, 0)  

WPD["CloudMusic"] := Position(2500,1700)
WPB["CloudMusic"] := Position("[Center][2]", 2500, 1700)
win_w := 3000
win_h := 250
win_x := Screens.1.x  + Screens.1.w/2 - win_w/2
win_y := Screens.1.yy - win_h       - 10
WPD["CloudMusic_DesktopLyrics"] := Position(win_x, win_y, win_w, win_h)
win_x := Screens.2.x  + Screens.2.w/2 - win_w/2
win_y := Screens.2.yy - win_h       - 10
WPB["CloudMusic_DesktopLyrics"] := Position(win_x, win_y, win_w, win_h)

WPD["FreeFileSync"]           := Position(3000, 1800)
WPB["FreeFileSync"]           := Position("[Center][2]", 3000, 1800)
WPD["FreeFileSync__同步设置"] := Position(1500, 1800)

WPD["PotPlayer"]           := Position(Screens.1.w * 4/6 , Screens.1.h * 4/6)
WPB["PotPlayer"]           := Position("[Center][2]", Screens.2.w * 4/6, Screens.2.h * 4/6 )
WPD["PotPlayer__播放列表"] := Position(10, "[Center][1]", 1000, 1500)
WPB["PotPlayer__播放列表"] := Position(Screens.2.xx - 1000 - 10, "[Center][2]", 1000, 1500)
WPD["PotPlayer_#32770"]    := Position(2020 , 1500)

WPD["Chrome"]           := Position("[Center][1]", 3300, 2000)
WPB["Chrome"]           := Position("[Center][2]", 3000, 1800)
WPD["Chrome__修改书签"] := Position(900, 1500)

WPD["v2rayN"] := Position("[Center][1]", 2800, 1600)
WPB["v2rayN"] := Position("[Center][1]", 2800, 1600)

WPD["Python__Anaconda"] := Position(2650, 1677)

WPD["Thunder"]               := Position(2500, 1600)
WPD["Thunder__新建任务面板"] := Position(1400, 1050)
WPD["Thunder__迅雷播放组件"] := Position("[Center][1]", 1920, 1080)
WPB["Thunder__迅雷播放组件"] := Position("[Center][2]", 1920, 1080)
