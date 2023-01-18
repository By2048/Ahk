
; 正在使用的键盘界面效果

keyboard_show_status := False
keyboard_font_size   := 5
keyboard_font_name   := "Verdana"
keyboard_font_style  := "Bold"
keyboard_transcolor  := "F1ECED"

keyboard_x := 10
keyboard_y := 4
keyboard_h := 30

keyboard_line_1 := [["Esc"],["F1"],["F2"],["F3"],["F4"],["F5"],["F6"],["F7"],["F8"],["F9"],["F10"],["F11"],["F12"],["Insert"],["Delete"],["Apps Key"]]
keyboard_line_2 := [["~ ``"],["! 1"],["@ 2"],["# 3"],["$ 4"],["% 5"],["^ 6"],["&& 7"],["* 8"],["( 9"],[") 0"],["_ -"],["+ ="],["BackSpace",2],["Home"]]
keyboard_line_3 := [["Tab",1.5],["Q"],["W"],["E"],["R"],["T"],["Y"],["U"],["I"],["O"],["P"],["{ ["],["} ]"],["| \",1.5],["Page Up"]]
keyboard_line_4 := [["CapsLock",1.75],["A"],["S"],["D"],["F"],["G"],["H"],["J"],["K"],["L"],[": `;"],["`" '"],["Enter",2.25],["Page Down"]]
keyboard_line_5 := [["Shift",2.25],["Z"],["X"],["C"],["V"],["B"],["N"],["M"],["< ,"],["> ."],["? /"],["Shift",1.75],["Up"],["End"]]
keyboard_line_6 := [["LCtrl",1.25],["LWin",1.25],["LAlt",1.25],["Space",5.5],["RAlt",1.25],["RWin",1.25],["RCtrl",1.25],["Left"],["Down"],["Right"]]



KeyboardLine(g, data)
{
    global keyboard_x, keyboard_y, keyboard_h

    for index, item in data {
        keyboard_txt := item[1]
        keyboard_txt := StrReplace(keyboard_txt, " ", "`n")

        if (item.Length == 2) {
            width := item[2]
        } else {
            width := 1
        }
        keyboard_w := keyboard_h * width + (width-1)

        g.Add("Button", Format("x{} y{} w{} h{}", keyboard_x, keyboard_y, keyboard_w, keyboard_h), keyboard_txt)

        keyboard_x := keyboard_x + keyboard_w + 1
    }

    keyboard_x := 10
    keyboard_y := keyboard_y + 30 + 1
    keyboard_h := 30
}



KeyboardGUI()
{
    global keyboard_show_status
    global keyboard_win_id
    global keyboard_x, keyboard_y, keyboard_h

    last_win_id := WinGetID("A")

    keyboard_x := 10
    keyboard_y := 4
    keyboard_h := 30

    global G
    try {
        g_id := G.Hwnd
    } catch error {
        G := Gui()
        g_id := G.Hwnd
    }

    if (keyboard_show_status == False) {
        keyboard_show_status := True

        G.SetFont( Format("s{} {}", keyboard_font_size, keyboard_font_style), keyboard_font_name )
        G.Opt("-Caption +E0x200 +ToolWindow +DPIScale")
        G.BackColor := keyboard_transcolor

        KeyboardLine(G, keyboard_line_1)
        KeyboardLine(G, keyboard_line_2)
        KeyboardLine(G, keyboard_line_3)
        KeyboardLine(G, keyboard_line_4)
        KeyboardLine(G, keyboard_line_5)
        KeyboardLine(G, keyboard_line_6)

        G.Show("NA")

        ; 移动窗口到中下位置
        WinGetPos &x, &y, &w, &h, "ahk_id" . g_id
        x := A_ScreenWidth/2 - w/2
        y := A_ScreenHeight  - h   - 5
        WinMove x, y, w, h, "ahk_id" . g_id

        ; 透明度 最上层
        WinSetAlwaysOnTop 1, "ahk_id" . g_id
        ; WinSetTransColor  keyboard_transcolor, "ahk_id" . win_id
        ; WinSetTransparent 220, "ahk_id" . win_id

        ; 激活鼠标下的窗口
        ; MouseGetPos &_, &_, &_, &_, win_id
        WinActivate "ahk_id" . last_win_id
    } else {
        keyboard_show_status := False
        G.Destroy()
    }
}



; KeyboardClick(keys)
; {
;     global keyboard_win_id
;     keys := StrReplace(keys, " ", "`n")
;     ControlClick, %keys%, ahk_id %keyboard_win_id%,  , Left, 1, D
;     Sleep, 100
;     ControlClick, %keys%, ahk_id %keyboard_win_id%,  , Left, 1, U
; }
