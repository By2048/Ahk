#Include %A_ScriptDir%\Tool.ahk
#SingleInstance Force
#NoTrayIcon




; Reload
; ExitApp


F12::
    Progress, b w200, My SubText, My MainText, My Title
    Progress, 50 ; ���ý�������λ��Ϊ 50%.
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



;     Esc:: ; �ڰ���ʱ������
; If StartTime
;     return
; StartTime := A_TickCount
; return

; Esc up:: ; �ڵ���ʱ������
; TimeLength := A_TickCount - StartTime
; if (TimeLength < 200)
; {
;     MsgBox, ����ס�˳������� 200 ���롣
; }
; else if (TimeLength < 1500 and TimeLength >= 200) ; ��һ����ʵ���Ƕ���ģ�����ֻ��Ϊ�˸�������
; {
;     MsgBox, ����ס�˳��� 1 �����ҡ�
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
; ����	ms-settings:backup
; ��Կ�����Ա	ms-settings:developers

; #Tab::MsgBox ʱ�䵽1��

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
; <	��
; >	��
; ^Up::PgUp
; ^Down::PgDn


