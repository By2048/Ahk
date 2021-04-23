
#if ( WindowsActive("LOL") )

	; 装备
	; 2167,2005,
	; 2231,2008,
	; 2297,2015,
	; 
	; 2171,2073,
	; 2236,2073,
	; 2299,2073,

	; 撤销
	; 1279,1666,

    CoordMode, Mouse, Screen



	; 涤魂圣枪 赛娜
	; CapsLock::
	; 	Loop 5000 {
	; 		Send +j  ;刷新龙
	; 		Send q
	; 		Sleep 500
	; 		HelpText(" " A_Index " ", "center_down", "screen_1")
	; 	}
	; 	HelpText()
	; Return



	; 女神泪BUG
	; CapsLock::
	; 	Loop, 30 {
	; 		MouseClick, Right,    2167,2005,    1, 0
	; 		Sleep, 300
	; 		MouseClick, Left,     1279,1666,    1, 0
	; 		HelpText(" " A_Index " ", "center_down", "screen_1")
	; 	} 
	; 	HelpText()
	; Return



	CapsLock Up::SetCapsLockState Off

	; 截图
	F12::Return
	PrintScreen::
		Screenshot("screen1","tmp")
	Return

	]::
		EN()

		Send {Enter}
		Sleep 300
		SendInput /ff
		Sleep 300
		Send {Enter}

		ZH()
	Return

	[::
		EN()

		Send {Enter}
		Sleep 300
		SendInput /remake
		Sleep 300
		Send {Enter}

		ZH()
	Return

	\::
		EN()

		; Send +{Enter}
		; Sleep 300
		; Send ======================
		; Send {Enter}

		; Send +{Enter}
		; Sleep 300
		; Send = 已屏蔽所有人聊天和信号 =
		; Send {Enter}

		; Send +{Enter}
		; Sleep 300
		; Send ======================
		; Send {Enter}
		; Sleep 300

		Send {Enter}
		Sleep 300
		SendInput /mute all
		Sleep 300
		Send {Enter}
		Sleep 100

		ZH()
	Return
	
#If
