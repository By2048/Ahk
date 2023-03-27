
; 正在使用的键盘

keyboard_border     := 3
keyboard_h          := 30
keyboard_font_size  := 5
keyboard_font_name  := "Verdana"
keyboard_font_style := "Bold"
keyboard_transcolor := "F1ECED"

kl1 := [["Esc"],["F1"],["F2"],["F3"],["F4"],["F5"],["F6"],["F7"],["F8"],["F9"],["F10"],["F11"],["F12"],["Insert"],["Delete"],["Apps Key"]]
kl2 := [["~ ``"],["! 1"],["@ 2"],["# 3"],["$ 4"],["% 5"],["^ 6"],["&& 7"],["* 8"],["( 9"],[") 0"],["_ -"],["+ ="],["BackSpace",2],["Home"]]
kl3 := [["Tab",1.5],["Q"],["W"],["E"],["R"],["T"],["Y"],["U"],["I"],["O"],["P"],["{ ["],["} ]"],["| \",1.5],["Page Up"]]
kl4 := [["CapsLock",1.75],["A"],["S"],["D"],["F"],["G"],["H"],["J"],["K"],["L"],[": `;"],["`" '"],["Enter",2.25],["Page Down"]]
kl5 := [["Shift",2.25],["Z"],["X"],["C"],["V"],["B"],["N"],["M"],["< ,"],["> ."],["? /"],["Shift",1.75],["Up"],["End"]]
kl6 := [["LCtrl",1.25],["LWin",1.25],["LAlt",1.25],["Space",5.5],["RAlt",1.25],["RWin",1.25],["RCtrl",1.25],["Left"],["Down"],["Right"]]
keyboard_lines := [ kl1, kl2, kl3, kl4, kl5, kl6 ]

keyboard_show_status := False


KeyboardGUI()
{
    global keyboard_show_status
    global G

    if (keyboard_show_status) {
        keyboard_show_status := False
        G.Destroy()
        return
    }

    last_win_id := WinGetID("A")

    G := Gui()

    G.MarginX := keyboard_border
    G.MarginY := keyboard_border
    G.SetFont( Format("s{} {}", keyboard_font_size, keyboard_font_style), keyboard_font_name )
    G.Opt("-Caption +E0x200 +ToolWindow +DPIScale")
    G.BackColor := keyboard_transcolor

    keyboard_x := keyboard_border
    keyboard_y := keyboard_border
    for index, data in keyboard_lines {
        for index, item in data {
            keyboard_txt := item[1]
            keyboard_txt := StrReplace(keyboard_txt, " ", "`n")
            if (item.Length == 2) {
                width := item[2]
            } else {
                width := 1
            }
            keyboard_w := keyboard_h * width + ( width - 1 )
            xywh := Format("x{} y{} w{} h{}", keyboard_x, keyboard_y, keyboard_w, keyboard_h)
            g.Add("Button", xywh, keyboard_txt)
            keyboard_x := keyboard_x + keyboard_w + 1
        }
        keyboard_x := keyboard_border
        keyboard_y := keyboard_y + 30 + 1
    }

    G.Show("NA")

    win_id := G.Hwnd
    rule := Format("ahk_id {}", win_id)

    ; 移动窗口到中下位置
    WinGetPos &x, &y, &w, &h, rule
    x := A_ScreenWidth/2 - w/2
    y := A_ScreenHeight - h - 5
    WinMove x, y, w, h, rule

    ; 透明度 最上层
    WinSetAlwaysOnTop 1, rule
    WinSetTransColor keyboard_transcolor, rule
    WinSetTransparent 255, rule

    keyboard_show_status := True
}



; KeyboardClick(keys)
; {
;     global keyboard_win_id
;     keys := StrReplace(keys, " ", "`n")
;     ControlClick, %keys%, ahk_id %keyboard_win_id%,  , Left, 1, D
;     Sleep, 100
;     ControlClick, %keys%, ahk_id %keyboard_win_id%,  , Left, 1, U
; }
