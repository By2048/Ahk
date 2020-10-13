#SingleInstance Force
#NoTrayIcon


global keyboard_show_status:=false

k_FontSize = 5
k_FontName = Verdana  
k_FontStyle = Bold   
k_TC = F1ECED

k_x:=10
k_y:=4
k_h:=30

line4_12="`n'
line0:=[[""],["F13"],["F14"],["F15"],["F16"],["F17"],["F18"],["F19"],["F20"],["F21"],["F22"],["F23"],["F24"],[""],[""],[""]]
line1:=[["Esc"],["F1"],["F2"],["F3"],["F4"],["F5"],["F6"],["F7"],["F8"],["F9"],["F10"],["F11"],["F12"],["Print`nScreen"],["Pause`nBreak"],["Delete"]]
line11:=[["Esc"],["F1`nF13"],["F2`nF14"],["F3`nF15"],["F4`nF16"],["F5`nF17"],["F6`nF18"],["F7`nF19"],["F8`nF20"],["F9`nF21"],["F10`nF22"],["F11`nF23"],["F12`nF24"],["Print`nScreen"],["Pause`nBreak"],["Delete"]]
line2:=[["~`n``"],["!`n1"],["@`n2"],["#`n3"],["$`n4"],["%`n5"],["^`n6"],["&&`n7"],["*`n8"],["(`n9"],[")`n0"],["_`n-"],["+`n="],["BackSpace",2],["Home"]]
line3:=[["Tab",1.5],["Q"],["W"],["E"],["R"],["T"],["Y"],["U"],["I"],["O"],["P"],["{`n["],["}`n]"],["|`n\",1.5],["Page`nUp"]]
line4:=[["CapsLock",1.75],["A"],["S"],["D"],["F"],["G"],["H"],["J"],["K"],["L"],[":`n;"],[line4_12],["Enter",2.25],["Page`nDown"]]
line5:=[["Shift",2.25],["Z"],["X"],["C"],["V"],["B"],["N"],["M"],["<`n,"],[">`n."],["?`n/"],["Shift",1.75],["↑"],["End"]]
line6:=[["Ctrl",1.25],["Win",1.25],["Alt",1.25],["Space",5.5],["Alt",1.25],["Fn",1.25],["Ctrl",1.25],["←"],["↓"],["→"]]



show_line(data) 
{
    global k_x
    global k_h
    global k_y
    for index, item in data
    {
        name:=item[1]
        length:=item[2]
        if not (length) {
            length:=1
        }
        k_w:=k_h*length+(length-1)
        Gui, Add, Button, w%k_w% h%k_h% x%k_x% y%k_y%, %name%
        k_x:=k_x+k_w+1
    }
    k_x:=10
    k_y:=k_y+30+1
    k_h:=30
}



show_keyboard()
{
    global keyboard_show_status

    global line0
    global line1
    global line11
    global line2
    global line3
    global line4
    global line5
    global line6

    global k_FontSize  
    global k_FontName 
    global k_FontStyle
    global k_TC

    global k_x
    global k_h
    global k_y
    
    k_x:=10
    k_y:=4
    k_h:=30


    if (keyboard_show_status=false) {
        keyboard_show_status:=True
        Gui, Font, s%k_FontSize% %k_FontStyle%, %k_FontName%
        Gui, -Caption +E0x200 +ToolWindow
        Gui, Color, %k_TC%

        ; show_line(line0)
        show_line(line1)
        ; show_line(line11)
        show_line(line2)
        show_line(line3)
        show_line(line4)
        show_line(line5)
        show_line(line6)

        keyboard_show_status:=True

        Gui, Show

        ; 移动窗口到中下位置
        WinGet, k_ID, ID, A 
        WinGetPos, x, y, w, h, A
        x:=A_ScreenWidth/2-w/2
        y:=A_ScreenHeight-h
        WinMove, ahk_id %k_ID%, , %x%, %y%
        WinSet, AlwaysOnTop, On, ahk_id %k_ID%
        WinSet, TransColor, %k_TC% 220, ahk_id %k_ID%      

        ; 激活鼠标下的窗口
        MouseGetPos, , , wid
        WinActivate, ahk_id %wid%
    } else {
        keyboard_show_status:=False
        Gui Hide
        Gui Destroy 
    }

}


#if (keyboard_show_status=True)
    AppsKey::
        global keyboard_show_status
        keyboard_show_status:=False
        Gui Hide
        Gui Destroy 
    Return
#if