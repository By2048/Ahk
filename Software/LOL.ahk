
#if ( WindowsActive("LOL") )

	; 涤魂圣枪 赛娜
	; CapsLock::
	; 	Loop, 5000Jq {
	; 		Send, +j
	; 		Send, q
	; 		Sleep, 500
    ;     	HelpText(" " A_Index " ", "center_down", "screen_1")
	; 	}
	; Return
	; CapsLock Up::SetCapsLockState Off

	]::
		SetDefaultKeyboard(0x0409)
		Sleep, 300

		Send {Enter}
		Sleep, 300
		Send /ff
		Sleep, 300
		Send {Enter}

		SetDefaultKeyboard(0x0804)
	Return

	[::
		SetDefaultKeyboard(0x0409)
		Sleep, 300

		Send {Enter}
		Sleep, 300
		Send /remake
		Sleep, 300
		Send {Enter}

		SetDefaultKeyboard(0x0804)
	Return

	\::
		; Send +{Enter}
		; Sleep, 300
		; Send ======================
		; Send {Enter}

		; Send+{Enter}
		; Sleep, 300
		; data:="= 已屏蔽所有人聊天和信号 ="
		; Send %data%
		; Send {Enter}

		; Send +{Enter}
		; Sleep, 300
		; Send ======================
		; Send {Enter}

		; Sleep, 300

		SetDefaultKeyboard(0x0409)
		Sleep, 300

		Send {Enter}
		Sleep, 300
		Send /mute all
		Sleep, 300
		Send {Enter}

		SetDefaultKeyboard(0x0804)
	Return
	
#If
