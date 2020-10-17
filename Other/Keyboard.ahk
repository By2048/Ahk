#SingleInstance Force
#NoTrayIcon



global keyboard_show_status:=False

global keyboard_font_size  := 5
global keyboard_font_name  := "Verdana"  
global keyboard_font_style := "Bold"   
global keyboard_transcolor := "F1ECED"

global keyboard_x := 10
global keyboard_y := 4
global keyboard_h := 30

global keyboard_line_4_12 := """`n'"
global keyboard_line_0    := [[""],["F13"],["F14"],["F15"],["F16"],["F17"],["F18"],["F19"],["F20"],["F21"],["F22"],["F23"],["F24"],[""],[""],[""]]
global keyboard_line_1    := [["Esc"],["F1"],["F2"],["F3"],["F4"],["F5"],["F6"],["F7"],["F8"],["F9"],["F10"],["F11"],["F12"],["Print`nScreen"],["Pause`nBreak"],["Delete"]]
global keyboard_line_11   := [["Esc"],["F1`nF13"],["F2`nF14"],["F3`nF15"],["F4`nF16"],["F5`nF17"],["F6`nF18"],["F7`nF19"],["F8`nF20"],["F9`nF21"],["F10`nF22"],["F11`nF23"],["F12`nF24"],["Print`nScreen"],["Pause`nBreak"],["Delete"]]
global keyboard_line_2    := [["~`n``"],["!`n1"],["@`n2"],["#`n3"],["$`n4"],["%`n5"],["^`n6"],["&&`n7"],["*`n8"],["(`n9"],[")`n0"],["_`n-"],["+`n="],["BackSpace",2],["Home"]]
global keyboard_line_3    := [["Tab",1.5],["Q"],["W"],["E"],["R"],["T"],["Y"],["U"],["I"],["O"],["P"],["{`n["],["}`n]"],["|`n\",1.5],["Page`nUp"]]
global keyboard_line_4    := [["CapsLock",1.75],["A"],["S"],["D"],["F"],["G"],["H"],["J"],["K"],["L"],[":`n;"],[keyboard_line_4_12],["Enter",2.25],["Page`nDown"]]
global keyboard_line_5    := [["Shift",2.25],["Z"],["X"],["C"],["V"],["B"],["N"],["M"],["<`n,"],[">`n."],["?`n/"],["Shift",1.75],["↑"],["End"]]
global keyboard_line_6    := [["Ctrl",1.25],["Win",1.25],["Alt",1.25],["Space",5.5],["Alt",1.25],["Fn",1.25],["Ctrl",1.25],["←"],["↓"],["→"]]



keyboard_line(data) 
{
    global keyboard_x
    global keyboard_h
    global keyboard_y
    for index, item in data {
        name:=item[1]
        length:=item[2]
        if not (length) {
            length:=1
        }
        k_w:=keyboard_h*length+(length-1)
        Gui, Add, Button, w%k_w% h%keyboard_h% x%keyboard_x% y%keyboard_y%, %name%
        keyboard_x:=keyboard_x+k_w+1
    }
    keyboard_x:=10
    keyboard_y:=keyboard_y+30+1
    keyboard_h:=30
}



Keyboard()
{
    global keyboard_show_status
    
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
        keyboard_line(keyboard_line_6)
        
        Gui, Show

        ; 移动窗口到中下位置
        WinGet, k_ID, ID, A 
        WinGetPos, x, y, w, h, A
        x:=A_ScreenWidth/2-w/2
        y:=A_ScreenHeight-h
        WinMove, ahk_id %k_ID%, , %x%, %y%
        WinSet, AlwaysOnTop, On, ahk_id %k_ID%
        WinSet, TransColor, %keyboard_transcolor% 220, ahk_id %k_ID%      

        ; 激活鼠标下的窗口
        MouseGetPos, , , wid
        WinActivate, ahk_id %wid%

    } else {
        keyboard_show_status:=False
        Gui Hide
        Gui Destroy 
    }

}

