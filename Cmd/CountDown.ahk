
#Include .\Screen.ahk

config := ""

if ( A_Args.Length == 1 )
    config := A_Args[1]

G := Gui()

Font := {
    size     : 55 ,
    color    : "8000FF" ,
    style    : "Bookman Old Style" ,
    border_x : 40 ,
    border_y : 1
}


font_size     := 55
font_color    := "8000FF"
font_style    := "Bookman Old Style"
font_border_x := 40
font_border_y := 1

time_display := "00:00"
time_space_min  := 0


; 1s 1m 1h
; 300 秒
CountDown(config := "3m")
{
    if ( not config )
        return

    time_start := A_Now
    time_end   := A_Now

    if ( InStr(config, "s") )
        time_end := DateAdd(time_start, StrReplace(config, "s", ""), "Seconds")
    else if ( InStr(config, "m") )
        time_end := DateAdd(time_start, StrReplace(config, "m", ""), "Minutes")
    else if ( InStr(config, "h") )
        time_end := DateAdd(time_start, StrReplace(config, "h", ""), "Hours")
    else
        time_end := DateAdd(time_start, config, "Hours")

    time_space_min := DateDiff(time_end, A_Now, "Minutes")
    if ( time_space_min >= 0 and time_space_min < 99 )
        time_display := "00:00"
    if ( time_space_min >= 100 )
        time_display := "00:00:00"

    G.Opt("+AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale")
    G.MarginX := 0
    G.MarginY := 0
    G.SetFont(Format("c{} s{}", Font.color, Font.size), Font.style)
    GText := G.Add("Text", Format("vTextContent -Center -Border x{} y{}", Font.border_x, Font.border_y), time_display)
    G["TextContent"].GetPos(&_, &_, &text_w, &text_h)

    gui_w := text_w + Font.border_x * 2
    gui_h := text_h + Font.border_y
    gui_x := Screens.Backup.x + Screens.Backup.w/2 - gui_w/2
    gui_y := Screens.Backup.y + Screens.Backup.h/3 - gui_w/2

    G.Show(Format("NA x{1} y{2} w{3} h{4}", gui_x, gui_y, gui_w, gui_h))

    SetTimer(Timer, 500)

    Timer() {
        seconds := DateDiff(time_end, A_Now, "Seconds")
        GText.Text := Fmt(seconds)
        if ( not seconds ) {
            Sleep(500)
            ExitApp()
        }
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


If ( config )
    CountDown(config)


^!AppsKey::ExitApp()
