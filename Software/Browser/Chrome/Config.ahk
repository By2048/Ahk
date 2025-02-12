
RegisterSoftware( "chrome" , "Chrome" )

RegisterHelpInfo( "Chrome" , "Software\Browser\Help\@.help"        )
RegisterHelpInfo( "Chrome" , "Software\Browser\Help\Vimium.help"   )
RegisterHelpInfo( "Chrome" , "Software\Browser\Help\Search.help"   )
RegisterHelpInfo( "Chrome" , "Software\Browser\Help\ZhiHu.help"    )
RegisterHelpInfo( "Chrome" , "Software\Browser\Help\Bilibili.help" )

win_w   := 2500
win_h   := 1400
win     := Position(win_w, win_h)
win_x   := win.x
win_y   := win.y + (30-20)/2  ;坐标修正
win_pos := Position( win_x , win_y , win_w , win_h )
RegisterPosition( "Chrome" , win_pos , "Default" )

win_pos := Position( "[Center][2]" , 0 , 1600 )
RegisterPosition( "Chrome" , win_pos , "Backup" )
