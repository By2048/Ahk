
#if ( CheckWindowsActive("LOL_Game") )

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

	#include %A_WorkingDir%\Software\LOL.Ignore.ahk
	
	; 截图
	F12::Return

	PrintScreen::Screenshot("screen1","tmp")

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
