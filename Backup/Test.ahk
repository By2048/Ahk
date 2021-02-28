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



; Gui, ProgressWindows:Add, Progress, w200 h20 b cBlue vMyProgress, 0
; Sleep, 4000
; Progress, Off

; Gui, ProgressWindows:-Caption
; Gui, Show, Center


; }




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






Fxx()
{
    Progress Off
    CoordMode Pixel Screen
    CoordMode Mouse Screen

    FD:=FxxData["default"]

    ; 优先根据应用名进行查找
    for exe, fxxdata in FxxData {
        if WinActive("ahk_exe"+" "+exe) {
            FD:=fxxdata
        }
    }

    content .= Format("{1} {2} {3} {4}",  FD[1], FD[2], FD[3], FD[4])
    content .= " | "
    content .= Format("{1} {2} {3} {4}",  FD[5], FD[6], FD[7], FD[8])
    content .= " | "
    content .= Format("{1} {2} {3} {4}",  FD[9], FD[10], FD[11], FD[12])
    content .= data

    ; 屏幕1底部
    ; w:=screen_1_w*2/3
    ; h:=58
    ; x:=(screen_1_xx-w)/2
    ; y:=screen_1_h-h-3

    ; 屏幕3顶部
    w:=screen_3_w
    h:=58
    x:=screen_3_x
    y:=screen_3_y+100

    w:=w/2
    h:=h/2

    SetTitleMatchMode, 2
    title:="fxx_help_info"
    ; Progress, b zh0 fs18 c11 CWC0C0C0 ws1000 x%x% y%y% w%w% h%h%, %content%,  , %title%, "Source Code Pro"
    Progress, zh0 fs18 c11 CWC0C0C0 ws1000 x%x% y%y% w%w% h%h%, %content%,  , %title%, "Source Code Pro"
    
    WinSet, TransColor, %keyboard_transcolor% 220, ahk_id %k_ID%      
    ; WinSet, TransColor, F1ECED 25, %title%

}


; F12::Fxx()

