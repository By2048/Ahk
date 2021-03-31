
#if ( WindowsActive("Wallpaper") )

	; 取消订阅
	!Delete::
		CoordMode, Mouse, Window
        MouseGetPos, x, y
		MouseClick, Right, %x%, %y%
		Sleep, 300
		xx:=x+100
		yy:=y+87
		MouseClick, Left, %xx%, %yy%
        MouseMove %x%, %y%, 0
		Sleep, 100
		Send {Enter}
	Return

	; 在资源管理器中打开
	!Enter::
		CoordMode, Mouse, Window
        MouseGetPos, x, y
		MouseClick, Right, %x%, %y%
		Sleep, 300
		xx:=x+100
		yy:=y+374
		MouseClick, Left, %xx%, %yy%
        MouseMove %x%, %y%, 0
	Return

#If
