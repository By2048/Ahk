whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.Open("GET", "https://autohotkey.com/download/1.1/version.txt")
whr.Send()
whr.WaitForResponse()
version := whr.ResponseText
MsgBox, % version






UrlDownloadToFile, http://ahkscript.org/logos/ahk_logo.png, T:\test.png
