
#Include .\Screen.ahk

#SingleInstance Ignore


^!AppsKey::ExitApp()


font_size     := 55
font_color    := "8000FF"
font_style    := "Bookman Old Style"
font_border_x := 33
font_border_y := 1

;--------------------------------------------------------------------------------;

; 1s 1m 1h
config := ""

if ( A_Args.Length == 1 )
    config := A_Args[1]

If ( ! config )
    ExitApp()


time_start := A_Now
time_end   := A_Now

if ( InStr(config, "s") )
    time_end := DateAdd(time_start, StrReplace(config, "s", ""), "Seconds")
else if ( InStr(config, "m") )
    time_end := DateAdd(time_start, StrReplace(config, "m", ""), "Minutes")
else if ( InStr(config, "h") )
    time_end := DateAdd(time_start, StrReplace(config, "h", ""), "Hours")
else
    time_end := DateAdd(time_start, config, "Minutes")

time_display := "00:00"
time_space   := DateDiff(time_end, A_Now, "Minutes")
if ( time_space >= 0 && time_space < 99 )
    time_display := "00:00"
if ( time_space >= 100 )
    time_display := "00:00:00"


G := Gui()
G.Opt("+AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale")
G.BackColor := "1e1e1e"
G.MarginX := 0
G.MarginY := 0
G.SetFont(Format("c{} s{}", font_color, font_size), font_style)
GText := G.Add("Text", Format("-Center -Border x{} y{}", font_border_x, font_border_y), time_display)
GText.GetPos(&_, &_, &text_w, &text_h)

gui_w := text_w + font_border_x * 2
gui_h := text_h + font_border_y
gui_x := Screens.Backup.x + Screens.Backup.w/2 - gui_w/2
gui_y := Screens.Backup.y + Screens.Backup.h/3 - gui_w/2

G.Show(Format("NA x{1} y{2} w{3} h{4}", gui_x, gui_y, gui_w, gui_h))

SetTimer(Timer, 500)

Timer() {
    seconds := DateDiff(time_end, A_Now, "Seconds")
    GText.Text := Fmt(seconds)
    if ( ! seconds ) {
        Sleep(500)
        GText.Text := " Over "
        Sleep(500)
        SetTimer( , 0)
    }
}

Fmt(seconds) {
    time_hou  := seconds // 60 // 60
    time_min  := seconds // 60 - time_hou * 60
    time_sec  := Mod(seconds, 60)
    time_text := ""
    if ( time_hou ) {
        if ( time_hou < 10 )
            time_text := time_text . "0" . time_hou . ":"
        else
            time_text := time_text . "" . time_hou . ":"
    }
    if ( time_min ) {
        if ( time_min < 10 )
            time_text := time_text . "0" . time_min . ":"
        else
            time_text := time_text . "" . time_min . ":"
    } else {
        time_text := time_text . "00:"
    }
    if ( time_sec ) {
        if ( time_sec < 10 )
            time_text := time_text . "0" . time_sec
        else
            time_text := time_text . "" . time_sec
    } else {
        time_text := time_text . "00"
    }
    return time_text
}

