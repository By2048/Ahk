
; 正在使用的键盘界面效果 

global keyboard_show_status := False
global keyboard_font_size   := 5
global keyboard_font_name   := "Verdana"  
global keyboard_font_style  := "Bold"   
global keyboard_transcolor  := "F1ECED"
global keyboard_win_id      := ""

global keyboard_x := 10
global keyboard_y := 4
global keyboard_h := 30

global keyboard_line_1 := [["Esc"],["F1"],["F2"],["F3"],["F4"],["F5"],["F6"],["F7"],["F8"],["F9"],["F10"],["F11"],["F12"],["Insert"],["Delete"],["Apps Key"]]
global keyboard_line_2 := [["~ ``"],["! 1"],["@ 2"],["# 3"],["$ 4"],["% 5"],["^ 6"],["&& 7"],["* 8"],["( 9"],[") 0"],["_ -"],["+ ="],["BackSpace",2],["Home"]]
global keyboard_line_3 := [["Tab",1.5],["Q"],["W"],["E"],["R"],["T"],["Y"],["U"],["I"],["O"],["P"],["{ ["],["} ]"],["| \",1.5],["Page Up"]]
global keyboard_line_4 := [["CapsLock",1.75],["A"],["S"],["D"],["F"],["G"],["H"],["J"],["K"],["L"],[": `;"],[""" '"],["Enter",2.25],["Page Down"]]
global keyboard_line_5 := [["Shift",2.25],["Z"],["X"],["C"],["V"],["B"],["N"],["M"],["< ,"],["> ."],["? /"],["Shift",1.75],["Up"],["End"]]
global keyboard_line_6 := [["LCtrl",1.25],["LWin",1.25],["LAlt",1.25],["Space",5.5],["RAlt",1.25],["RWin",1.25],["RCtrl",1.25],["Left"],["Down"],["Right"]]



KeyboardLine(data) 
{
    global keyboard_x, keyboard_y, keyboard_h

    for index, item in data {
        keyboard_txt := item[1]
        keyboard_txt := StrReplace(keyboard_txt, " ", "`n")

        width := item[2]
        if (not width) {
            width:=1
        }
        keyboard_w := keyboard_h * width + (width-1)

        Gui, Add, Button, w%keyboard_w% h%keyboard_h% x%keyboard_x% y%keyboard_y%, %keyboard_txt%

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
    
    keyboard_x := 10
    keyboard_y := 4
    keyboard_h := 30

    if (keyboard_show_status == False) {

        keyboard_show_status := True

        Gui, Font, s%keyboard_font_size% %keyboard_font_style%, %keyboard_font_name%
        Gui, -Caption +E0x200 +ToolWindow
        Gui, Color, %keyboard_transcolor%

        KeyboardLine(keyboard_line_1)
        KeyboardLine(keyboard_line_2)
        KeyboardLine(keyboard_line_3)
        KeyboardLine(keyboard_line_4)
        KeyboardLine(keyboard_line_5)
        KeyboardLine(keyboard_line_6)
        
        Gui, Show

        ; 移动窗口到中下位置
        WinGet, win_id, ID, A 
        WinGetPos, x, y, w, h, A
        x := A_ScreenWidth/2 - w/2
        y := A_ScreenHeight  - h
        WinMove, ahk_id %win_id%,  , %x%, %y%

        keyboard_win_id:=win_id

        ; 透明度 追上层
        WinSet, AlwaysOnTop, On, ahk_id %keyboard_win_id%
        WinSet, TransColor, %keyboard_transcolor% 220, ahk_id %keyboard_win_id%

        ; 激活鼠标下的窗口
        MouseGetPos,  ,  , win_id
        WinActivate, ahk_id %win_id%
    } else {
        keyboard_show_status := False
        Gui Hide
        Gui Destroy 
    }
}



KeyboardClick(keys)
{
    global keyboard_win_id
    keys := StrReplace(keys, " ", "`n")
    ControlClick, %keys%, ahk_id %keyboard_win_id%,  , Left, 1, D
    Sleep, 100
    ControlClick, %keys%, ahk_id %keyboard_win_id%,  , Left, 1, U
}
