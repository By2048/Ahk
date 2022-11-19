
#Include %A_WorkingDir%\Tool\Change.ahk

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

Global Windows_Position := {}

; WPD Windows_Position_Default
; WPB Windows_Position_Backup

Global WPD := {}
Global WPB := {}

#Include %A_WorkingDir%\Config\Position\Base.ahk
#Include %A_WorkingDir%\Config\Position\Chat.ahk
#Include %A_WorkingDir%\Config\Position\IDE.ahk
#Include %A_WorkingDir%\Config\Position\Windows.ahk

Windows_Position["Default"] := WPD
Windows_Position["Backup" ] := WPB
