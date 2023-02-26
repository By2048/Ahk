
WPD["qBittorrent"] := Position4K(3000 , 1500)
WPD["Calibre"]     := Position4K(3000 , 1500)
WPD["Everything"]  := Position4K(2300 , 1700)
WPD["Android"]     := Position4K(3440 , 2110)
WPD["Wallpaper"]   := Position4K(3388 , 2000)
WPD["Sandboxie"]   := Position4K(2500 , 1300)
WPD["FFRenamePro"] := Position4K(3300 , 1800)
WPD["BiliBili"]    := Position4K(2500 , 1650)

WPD["Maye"] := Position(1172 , 1100)

WPD["VMware"] := Position(1800 , 1200)
WPD["VMware_#32770_浏览ISO映像"] := Position(1520 , 1100)

WPD["Xshell"] := Position(2200 , 1200)
WPD["Xftp"]   := Position(2200 , 1200)

WPD["Zip"]         := Position(1380 , 1050)
WPD["QQMusic"]     := Position(1800 , 1100)

WPD["Scrcpy"] := Position(        1032, 2064)
WPB["Scrcpy"] := Position(48, 48, 1032, 2064)

WPD["Word"]  := Position(3300 , 2000)
WPD["Excel"] := Position(3300 , 2000)
WPD["PPT"]   := Position(3300 , 2000)

WPD["FDM"]    := Position("[Center][1]" , 2000 , 1500)
WPD["FDM__%"] := Position("[Center][3]" , 1300 , 1200)

; 火绒U盘工具
WPD["HipsTray_HRUSBTRAY"] := Position(-10, -10, 0, 0)

WPD["CloudMusic"] := Position(2000 , 1200)
win_w := 2333
win_h := 190
win_x := Screen.x  + Screen.w/2 - win_w/2
win_y := Screen.yy - win_h      - 10
WPD["CloudMusic_DesktopLyrics"] := Position(win_x, win_y, win_w, win_h)

WPD["FreeFileSync"]          := Position(2500, 1600)
WPD["FreeFileSync__同步设置"] := Position(1500, 1800)

WPD["PotPlayer"]          := Position(Screen.w * 4/6 , Screen.h * 4/6)
WPD["PotPlayer__播放列表"] := Position(10, "[Center][1]", 700, 1000)
WPD["PotPlayer_#32770"]   := Position(2020 , 1500)
WPB["PotPlayer"]          := Position("[Center][2]", Screens.2.w * 4/6, Screens.2.h * 4/6 )
WPB["PotPlayer__播放列表"] := Position(Screens.2.xx - 1000 - 10, "[Center][2]", 1000, 1500)

If (InStr(Screen.Name, "4K")) {
    WPD["Chrome"] := Position(3300, 2000)
    WPD["Chrome__修改书签"] := Position(900, 1500)
}
If (InStr(Screen.Name, "2K")) {
    WPD["Chrome"] := Position(2500, 1400)
    WPD["Chrome__修改书签"] := Position(700, 1000)
}

WPD["v2rayN"] := Position4K(2800, 1600)

WPD["Python__Anaconda"] := Position(2650, 1677)

WPD["Thunder"]             := Position4K(2500, 1600)
WPD["Thunder__新建任务面板"] := Position4K(1400, 1050)
WPD["Thunder__迅雷播放组件"] := Position4K(1920, 1080)
