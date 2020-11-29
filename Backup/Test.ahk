#Include %A_ScriptDir%\Tool.ahk
#SingleInstance Force
#NoTrayIcon




; Reload
; ExitApp


F12::
    Progress, b w200, My SubText, My MainText, My Title
    Progress, 50 ; 设置进度条的位置为 50%.
    Sleep, 4000
    Progress, Off
return




F2::
    Gui,Color,Black,000000
    Gui, -Caption +AlwaysOnTop

    height:=A_ScreenHeight/2.5
    width:=A_ScreenWidth/2.5

    Gui,Show, h%height% w%width%
    ; Gui,Show, h100 w100
    Gui,Font,Tahoma s9
    Gui,Add, Text,cWhite w500 x25 y100,Some Text Here
    sleep 2000
    ; exitapp
return



;     Esc:: ; 在按下时触发。
; If StartTime
;     return
; StartTime := A_TickCount
; return

; Esc up:: ; 在弹起时触发。
; TimeLength := A_TickCount - StartTime
; if (TimeLength < 200)
; {
;     MsgBox, 您按住退出键不到 200 毫秒。
; }
; else if (TimeLength < 1500 and TimeLength >= 200) ; 后一条件实际是多余的，加上只是为了更清晰。
; {
;     MsgBox, 您按住退出键 1 秒左右。
; }
; StartTime := ""
; return




    
    ; image_path:=get_image_path()
    ; count:=image_path.MaxIndex()
    ; MsgBox, %count%
    ; For index, value in image_path
    ; MsgBox % "Item " index " is '" value "'"
    ; MsgBox,%image_path%
    
    ; array := {ten: 10, twenty: 20, thirty: ["1","2","3"]}
    ; MsgBox %array["thirty"][1]%
    ; data:=array["ten"]
    ; data:=array["thirty"].MaxIndex()
    ; data:=array["twenty"].MaxIndex()
    ; MsgBox %data%
    ; For key, value in array 
    ; MsgBox %key% = %value%
    
    ; fun()
    

; ~*RCtrl::Return


; RShift::
;     sleep, 1000
;     Progress, b w200 h20 cbBlack p0
;     count:=10
;     Loop {
;         if not GetKeyState("RShift", "P")
;         {
;             Progress, Off
;             break
;         }
;         Progress, %count%
;         sleep 50
;         count:=count+10
;         if count>=100
;         {
;             Progress, Off
;             help()
;             break
;         }
;     }
; Return
;
; RShift Up::
;     Progress, Off
; return

; Gui, ProgressWindows:Add, Progress, w200 h20 b cBlue vMyProgress, 0
; Sleep, 4000
; Progress, Off

; Gui, ProgressWindows:-Caption
; Gui, Show, Center


; }

;<
; {
;     Space::
;         Loop
;         {
;             if not GetKeyState("Space", "P")
;                 break
;              Send, Some text.{Enter}
;         }
;     return
; }

; RCtrl::Run T:\\HuntAndPeck\\hap.exe /hinth


; ms-settings:windowsupdate
; 备份	ms-settings:backup
; 针对开发人员	ms-settings:developers

; #Tab::MsgBox 时间到1！

; #z::reload

; https://ahkcn.github.io/docs/commands/_IfWinActive.htm

; WheelLeft::Send {Q}
; Return

; WheelRight::Send {Wheeldown}
; Return

; XButton1::
; MsgBox, You pressed browser back.
; Return

; XButton2::
; MsgBox, You pressed browser forward.
; Return

; #	Win
; !	Alt
; ^	Ctrl
; +	Shift
; <	左
; >	右
; ^Up::PgUp
; ^Down::PgDn


;计时器
; #c::
; InputBox UserInput, Counter, Enter a number(minutes):
; IfEqual, Errorlevel, 0
; {
;     sleep UserInput * 1000
;     SoundBeep
;     MsgBox 时间到！
; }
; return




; MouseGetPos, xpos, ypos
; if (xpos!=screen1_x) and (ypos!=screen1_y) {
;     DllCall("SetCursorPos", "int", screen1_x, "int", screen1_y)
; } else if (xpos=screen1_x) and (ypos=screen1_y) {
;     DllCall("SetCursorPos", "int", screen2_x, "int", screen2_y)
; } else if (xpos=screen2_x) and (ypos=screen2_y) {
;     DllCall("SetCursorPos", "int", screen2_x, "int", screen2_y)
; }





; test_help_text()
; {
;     HelpText("right_down","right_down","screen1")
;     Sleep, 2000
    
;     HelpText("center","center","screen1")
;     Sleep, 2000
    
;     HelpText("center_up","center_up","screen1")
;     Sleep, 2000
    
;     HelpText("center_down","center_down","screen1")
;     Sleep, 2000



;     HelpText("right_down","right_down","screen2")
;     Sleep, 2000

;     HelpText("center","center","screen2")
;     Sleep, 2000

;     HelpText("center_up","center_up","screen2")
;     Sleep, 2000

;     HelpText("center_down","center_down","screen2")
;     Sleep, 2000



;     HelpText("right_down","right_down","screen3")
;     Sleep, 2000

;     HelpText("center","center","screen3")
;     Sleep, 2000

;     HelpText("center_up","center_up","screen3")
;     Sleep, 2000

;     HelpText("center_down","center_down","screen3")
;     Sleep, 2000

;     HelpText()
; }




; Progress, 2: Off
; Progress, 2: b zh0 fs18 c11 ws1000 x%x% y%y% w%w% h%h%, %content%,  ,  , "Source Code Pro"
