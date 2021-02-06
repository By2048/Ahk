
#if WinActive("ahk_exe League of Legends.exe")
	[::
		SetDefaultKeyboard(0x0409)

		Send, {Enter}
		Sleep, 300
		Send, /surrender
		Sleep, 300
		Send, {Enter}
	Return

	]::
		SetDefaultKeyboard(0x0409)

		Send, {Enter}
		Sleep, 300
		Send, /remake
		Sleep, 300
		Send, {Enter}
	Return

	\::
		SetDefaultKeyboard(0x0409)
		
		Send, {Enter}
		Sleep, 300
		Send, /ignore all
		Sleep, 300
		Send, {Enter}

		Sleep, 300

		Send, {Enter}
		Sleep, 300
		Send, /fullmute all
		Sleep, 300
		Send, {Enter}
	Return
#If
