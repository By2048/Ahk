
; Software\Android.ahk
Global Software_Android_Rshift_Loop    := [ 1, 2, 3, 4, 5, 6, 7 ]
Global Software_Android_Rshift_Current := 0


; Software\LOL.ahk
Global Software_LOL_XY        := []
Global Software_LOL_Hero      := []
Global Software_LOL_Equipment := []
Software_LOL_Hero[1] := [ 55 , 400 ]
Software_LOL_Hero[2] := [ 55 , 550 ]
Software_LOL_Hero[3] := [ 55 , 710 ]
Software_LOL_Hero[4] := [ 55 , 880 ]


; Software\CloudMusic.ahk
Global Software_Cloud_Music_Volume := -1


; Software\Wallpaper.ahk
Global Software_Wallpaper_State := -1
Global Software_Wallpaper_Theme := "Black"


; Software\WPS.ahk
; WPS Sheet 图片截图 [1]System [3]Windows [4]RCtrl [6]PyCharm [7]VScode [8]Xshell [9]Chrome
; [sheet, start[x], end[y], multi_line, image_file]
Global Software_WPS_Hotkeys_Image := []
Software_WPS_Hotkeys_Image.Push( "3 A1 J31 0 E:\Project\Ahk\Image\RShift\Windows.png"         )
Software_WPS_Hotkeys_Image.Push( "4 A1 J21 0 E:\Project\Ahk\Image\RCtrl.png"                  )
Software_WPS_Hotkeys_Image.Push( "6 A1 K20 0 E:\Project\Ahk\Image\RShift\PyCharm-Fxx.png"     )
Software_WPS_Hotkeys_Image.Push( "6 L1 U31 0 E:\Project\Ahk\Image\RShift\PyCharm.png"         )
Software_WPS_Hotkeys_Image.Push( "8 A1 G27 0 E:\Project\Ahk\Image\RShift\Xshell.png"          )
Software_WPS_Hotkeys_Image.Push( "9 A1 I41 6 E:\Project\Ahk\Image\RShift\Chrome.png"          )
Software_WPS_Hotkeys_Image.Push( "9 J1 P26 2 E:\Project\Ahk\Image\RShift\Chrome-Bilibili.png" )


; 文件管理器显示列设置
Global Explorer_Config := {}
Explorer_Config["Default"]   := [ [ "System.ItemNameDisplay" , 999 ]
                                , [ "System.ItemDate"        , 250 ]
                                , [ "System.Size"            , 200 ] ]

Explorer_Config["Software"]  := [ [ "System.ItemNameDisplay" , 800 ]
                                , [ "System.Comment"         , 400 ]
                                , [ "System.ItemDate"        , 250 ] ]

Explorer_Config["Recover"]   := [ [ "System.ItemNameDisplay"     , 500 ]
                                , [ "System.Recycle.DeletedFrom" , 500 ]
                                , [ "System.Recycle.DateDeleted" , 250 ]
                                , [ "System.Size"                , 200 ] ]

Explorer_Config["D:\"]       := Explorer_Config["Software"]
Explorer_Config["D:\Python"] := Explorer_Config["Software"]
Explorer_Config["回收站"]     := Explorer_Config["Recover"]
