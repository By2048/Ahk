
SetDefaultKeyboard(LocaleID){
	SPI_SETDEFAULTINPUTLANG := 0x005A
	SPIF_SENDWININICHANGE := 2
	Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
	VarSetCapacity(Lan%LocaleID%, 4, 0)
	NumPut(LocaleID, Lan%LocaleID%)
	DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "UPtr", &Lan%LocaleID%, "UInt", SPIF_SENDWININICHANGE)
	PostMessage 0x50, 0, %Lan%,  , A
}

; https://www.voidtools.com/support/everything/language_ids/

; zh
; SetDefaultKeyboard(0x0804)

; en
; SetDefaultKeyboard(0x0409)
