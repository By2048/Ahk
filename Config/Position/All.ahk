
#Include %A_InitialWorkingDir%\Tool\Change.ahk

; Key
; [process_name]
; [process_name]_[class]
; []_[class]
; [process_name]_[title]
; [process_name]_[class]_[title]
; []_[class]_[title]
; []_[]_[title]

; Value
; 设置一些软件默认位置 [x,y,w,h]

; WPD Windows_Position_Default
; WPB Windows_Position_Backup
Windows_Position_Default := Map()
Windows_Position_Backup  := Map()
WPD := Windows_Position_Default
WPB := Windows_Position_Backup

#Include %A_InitialWorkingDir%\Config\Position\Base.ahk
#Include %A_InitialWorkingDir%\Config\Position\Chat.ahk
#Include %A_InitialWorkingDir%\Config\Position\IDE.ahk
#Include %A_InitialWorkingDir%\Config\Position\Windows.ahk
