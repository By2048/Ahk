
#if ( WindowsActive("CloudMusic", "OrpheusBrowserHost") )

    Space::
        MoveWindowsToDefaultPosition()
        Sleep, 300
        MouseClickAndResetting(74,1608,"Window")
    Return

    \::Send !\

    [::Send ![
    ]::Send !]
    =::Send !=
    -::Send !-

    ; 列表上一首
    PgUp::
        MoveWindowsToDefaultPosition()
        Sleep, 300
        MouseClickAndResetting(1076,1584,"Window")
        Sleep, 300
        Send ![
        Sleep, 300
        MouseClickAndResetting(1076,1584,"Window",3)
    Return

    ; 列表下一首
    PgDn::
        MoveWindowsToDefaultPosition()
        Sleep, 300
        MouseClickAndResetting(1076,1584,"Window")
        Sleep, 300
        Send !]
        Sleep, 300
        MouseClickAndResetting(1076,1584,"Window",3)
    Return

#if



; Space:: 
;     CoordMode Mouse Window
;     CoordMode Pixel Window
;     x_origin:=0
;     y_origin:=0
;     x_find:=0
;     y_find:=0

;     MouseGetPos, x_origin, y_origin

;     image=%A_WorkingDir%\Image\Software\CloudMusic_CloseDetail.png
;     size:=GetImageSize(image)
;     w:=size[1]
;     h:=size[2]

;     ; 将搜索区域设置为窗口右上方
;     WinGetPos, wx, wy, ww, wh, A
;     x1:=wx+ww/2
;     y1:=wy
;     x2:=x1+ww/2
;     y2:=y1+wh

;     ImageSearch, x_find, y_find, x1, y1, x2, y2, *%w% *%h% *20 %image%

;     if (x_find and y_find) {
;         x_find:=x_find+w/2
;         y_find:=y_find+h/2
;         MouseClick, Left, x_find, y_find, 1, 0
;     } else {
;         MouseClick, Left, 71, 1846, 1, 0
;     }

;     MouseMove x_origin, y_origin, 0
; Return
