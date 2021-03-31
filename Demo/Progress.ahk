;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance

Gui, Font, s20
Gui, Add, Edit, w60  number right ReadOnly
Gui, Add, UpDown, vMinutes Range0-59 wrap, 3
Gui, Add, Text, ys, Minutes
Gui, Add, Edit, w60  ys number right ReadOnly
Gui, Add, UpDown, vSeconds Range0-59 wrap, 0
Gui, Add, Text, ys, Seconds
Gui, Add, Progress, w400 h20 vMyProgress xs
Gui, Add, Button, section, Start



ButtonStart:
    Gui, Submit, NoHide
    TotalSec := (Minutes*60+Seconds)
    StopTime := A_TickCount + (TotalSec*1000)

    Loop {
        Sleep 1000
        TimeLeft := (StopTime - A_TickCount)/1000
        ProgressBar := 100-(TimeLeft/TotalSec*100)
        Minutes := Floor(TimeLeft/60)
        Seconds := Round(Mod(TimeLeft,60))
        If TimeLeft >= 0
        {
            GuiControl,, Edit1, %Minutes%    
            GuiControl,, Edit2, %Seconds%
            }  
        GuiControl,, MyProgress, %ProgressBar%    
        If (A_TickCount >= Stoptime)
        {
            Break
        }
    }

    SoundBeep,,300
    ComObjCreate("SAPI.SpVoice").Speak("Your eggs are ready!")     
    MsgBox, 4096, Egg Timer, Your eggs are ready!

Return



^F12::
    Gui, Show, , Egg Timer
Return



\::
    sleep, 100
    Progress, b w200 h20 cbBlack p0
    count:=10
    Loop {
        if not GetKeyState("\", "P") {
            Progress, Off
            break
        }
        Progress, %count%
        sleep 50
        count:=count+10
        if count>=100
        {
            Progress, Off
            break
        }
    }
Return

\ Up::
    Progress, Off
return
