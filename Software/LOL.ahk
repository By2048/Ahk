
#if ( WindowsActive("LOL") )

	; 涤魂圣枪 赛娜
	; CapsLock::
	; 	Loop 5000Jq {
	; 		Send +j
	; 		Send q
	; 		Sleep 500
    ;   	HelpText(" " A_Index " ", "center_down", "screen_1")
	; 	}
	; Return
	; CapsLock Up::SetCapsLockState Off

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
