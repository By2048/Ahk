
; Software\Android.ahk
Global Android_COC_Loop    := [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 ]
Global Android_COC_Current := -1


; Software\LOL.ahk
Global LOL_X := 0
Global LOL_Y := 0

Global LOL_Hero := [ [ 55 , 400 ] 
                   , [ 55 , 550 ] 
                   , [ 55 , 710 ] 
                   , [ 55 , 880 ] ]

Global LOL_Mini_Map := { x  : 3110 ;
                       , y  : 1428 ;
                       , w  : 724  ;
                       , h  : 724  }

LOL_Mini_Map.xx := LOL_Mini_Map.x + LOL_Mini_Map.w
LOL_Mini_Map.yy := LOL_Mini_Map.y + LOL_Mini_Map.h


; Software\CloudMusic.ahk
Global Cloud_Music_Volume := -1


; Software\Wallpaper.ahk
Global Wallpaper_State := -1
Global Wallpaper_Theme := "Black"


; Software\Excel.ahk
; Excel Sheet 图片截图 [1]System [3]Windows [4]RCtrl [6]PyCharm [7]VScode [8]Xshell [9]Chrome
; [sheet, start[x], end[y], multi_line, image_file]
Global Excel_Hotkeys_Image := []
Excel_Hotkeys_Image.Push( "2 A1 M32 0 E:\Project\Ahk\Image\RShift\Windows.png"         )
Excel_Hotkeys_Image.Push( "3 A1 G22 0 E:\Project\Ahk\Image\RCtrl.png"                  )
; Excel_Hotkeys_Image.Push( "6 A1 K20 0 E:\Project\Ahk\Image\RShift\PyCharm-Fxx.png"     )
; Excel_Hotkeys_Image.Push( "6 L1 U31 0 E:\Project\Ahk\Image\RShift\PyCharm.png"         )
; Excel_Hotkeys_Image.Push( "8 A1 G27 0 E:\Project\Ahk\Image\RShift\Xshell.png"          )
; Excel_Hotkeys_Image.Push( "9 A1 I41 6 E:\Project\Ahk\Image\RShift\Chrome.png"          )
; Excel_Hotkeys_Image.Push( "9 J1 P26 2 E:\Project\Ahk\Image\RShift\Chrome-Bilibili.png" )


; 文件管理器显示列设置
Global Explorer_Config := {}
Explorer_Config["Default"]  := [ [ "System.ItemNameDisplay" , 999 ]
                               , [ "System.ItemDate"        , 250 ]
                               , [ "System.Size"            , 200 ] ]

Explorer_Config["Software"] := [ [ "System.ItemNameDisplay" , 800 ]
                                , [ "System.Comment"         , 400 ]
                                , [ "System.ItemDate"        , 250 ] ]

Explorer_Config["Recover"]  := [ [ "System.ItemNameDisplay"     , 500 ]
                               , [ "System.Recycle.DeletedFrom" , 500 ]
                               , [ "System.Recycle.DateDeleted" , 250 ]
                               , [ "System.Size"                , 200 ] ]
    
Explorer_Config["D:\"]       := Explorer_Config["Software"]
Explorer_Config["D:\Python"] := Explorer_Config["Software"]
Explorer_Config["回收站"]    := Explorer_Config["Recover"]
