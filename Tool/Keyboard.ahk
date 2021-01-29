
/*

正在使用的键盘界面效果

*/


global keyboard_show_status:=False

global keyboard_font_size  := 5
global keyboard_font_name  := "Verdana"  
global keyboard_font_style := "Bold"   
global keyboard_transcolor := "F1ECED"

global keyboard_x := 10
global keyboard_y := 4
global keyboard_h := 30

global keyboard_line_0  := [[""],["F13"],["F14"],["F15"],["F16"],["F17"],["F18"],["F19"],["F20"],["F21"],["F22"],["F23"],["F24"],[""],[""],[""]]
global keyboard_line_1  := [["Esc"],["F1"],["F2"],["F3"],["F4"],["F5"],["F6"],["F7"],["F8"],["F9"],["F10"],["F11"],["F12"],["Print Screen"],["Pause Break"],["Delete"]]
global keyboard_line_11 := [["Esc"],["F1 F13"],["F2 F14"],["F3 F15"],["F4 F16"],["F5 F17"],["F6 F18"],["F7 F19"],["F8 F20"],["F9 F21"],["F10 F22"],["F11 F23"],["F12 F24"],["Print Screen"],["Pause Break"],["Delete"]]
global keyboard_line_2  := [["~ ``"],["! 1"],["@ 2"],["# 3"],["$ 4"],["% 5"],["^ 6"],["&& 7"],["* 8"],["( 9"],[") 0"],["_ -"],["+ ="],["BackSpace",2],["Home"]]
global keyboard_line_3  := [["Tab",1.5],["Q"],["W"],["E"],["R"],["T"],["Y"],["U"],["I"],["O"],["P"],["{ ["],["} ]"],["| \",1.5],["Page Up"]]
global keyboard_line_4  := [["CapsLock",1.75],["A"],["S"],["D"],["F"],["G"],["H"],["J"],["K"],["L"],[": `;"],[""" '"],["Enter",2.25],["Page Down"]]
global keyboard_line_5  := [["Shift",2.25],["Z"],["X"],["C"],["V"],["B"],["N"],["M"],["< ,"],["> ."],["? /"],["Shift",1.75],["Up"],["End"]]
global keyboard_line_6  := [["Ctrl",1.25],["Win",1.25],["Alt",1.25],["Space",5.5],["Alt",1.25],["Fn",1.25],["Ctrl",1.25],["Left"],["Down"],["Right"]]
global keyboard_line_66 := [["Ctrl",1.25],["Win",1.25],["Alt",1.25],["Space",5.5],["Alt",1.25],["Win",1.25],["Ctrl",1.25],["Left"],["Down"],["Right"]]



keyboard_line(data) 
{
    global keyboard_x, keyboard_h , keyboard_y

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



Keyboard()
{
    global keyboard_show_status
    global keyboard_x, keyboard_y, keyboard_h
    
    keyboard_x := 10
    keyboard_y := 4
    keyboard_h := 30
    
    if (keyboard_show_status=False) {
        keyboard_show_status:=True
        Gui, Font, s%keyboard_font_size% %keyboard_font_style%, %keyboard_font_name%
        Gui, -Caption +E0x200 +ToolWindow
        Gui, Color, %keyboard_transcolor%

        ; keyboard_line(keyboard_line_0)
        keyboard_line(keyboard_line_1)
        ; keyboard_line(keyboard_line_11)
        keyboard_line(keyboard_line_2)
        keyboard_line(keyboard_line_3)
        keyboard_line(keyboard_line_4)
        keyboard_line(keyboard_line_5)
        ; keyboard_line(keyboard_line_6)
        keyboard_line(keyboard_line_66)
        
        Gui, Show

        ; 移动窗口到中下位置
        WinGet, wid, ID, A 
        WinGetPos, x, y, w, h, A
        x:=A_ScreenWidth/2-w/2
        y:=A_ScreenHeight-h
        WinMove, ahk_id %wid%, , %x%, %y%
        WinSet, AlwaysOnTop, On, ahk_id %wid%
        WinSet, TransColor, %keyboard_transcolor% 220, ahk_id %wid%

        ; 激活鼠标下的窗口
        MouseGetPos, , , wid
        WinActivate, ahk_id %wid%
    } else {
        keyboard_show_status:=False
        Gui Hide
        Gui Destroy 
    }
}


