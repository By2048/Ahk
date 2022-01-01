
#If ( CheckWindowsActive( "Wallpaper" ) )

	F10::Return
	CapsLock::Send {F10}

	; 取消订阅
	; !CapsLock::
	; 	CoordMode, Mouse, Window
    ;     MouseGetPos, x, y
	; 	MouseClick, Right, %x%, %y%
	; 	Sleep, 300
	; 	xx:=x+100
	; 	yy:=y+87
	; 	MouseClick, Left, %xx%, %yy%
    ;     MouseMove %x%, %y%, 0
	; 	Sleep, 100
	; 	Send {Enter}
	; Return

	; 在资源管理器中打开
	; !Tab::
	; 	CoordMode, Mouse, Window
    ;     MouseGetPos, x, y
	; 	MouseClick, Right, %x%, %y%
	; 	Sleep, 300
	; 	xx:=x+100
	; 	yy:=y+374
	; 	MouseClick, Left, %xx%, %yy%
    ;     MouseMove %x%, %y%, 0
	; Return

	; 取消订阅
	!CapsLock::
		CoordMode, Mouse, Window
	    MouseGetPos, x_origin, y_origin
		MouseClick, Right, x_origin, y_origin
		Sleep 300
		x1 := x_origin
		y1 := y_y_origin - 400
		x2 := x_origin   + 80
		y2 := y_origin   + 800
		img_delete := A_WorkingDir "\Image\Software\Wallpaper_Delete.png"
		MouseClickImageXYWH(x1,y1,x2,y2,img_delete)
		Sleep 300
        MouseMove, x_origin, y_origin, 0
		Sleep 100
		Send {Enter}
	Return

	; 在资源管理器中打开
	!Tab::
		CoordMode, Mouse, Window
	    MouseGetPos, x_origin, y_origin
		MouseClick, Right, x_origin, y_origin
		Sleep 300
		x1 := x_origin
		y1 := y_y_origin - 400
		x2 := x_origin   + 80
		y2 := y_origin   + 800
		img_open := A_WorkingDir "\Image\Software\Wallpaper_Open.png"
		MouseClickImageXYWH(x1,y1,x2,y2,img_open)
        MouseMove, x_origin, y_origin, 0
	Return

#If
