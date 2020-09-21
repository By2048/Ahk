#Include %A_ScriptDir%\Tool.ahk

/*

[{a:6},"Esc","F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","F12",{a:5},"PrtSc\nNmLk","Pause\nScrLk","Delete\nInsert"],
[{a:4},"~\n`","!\n1","@\n2","#\n3","$\n4","%\n5","^\n6","&\n7","*\n8","(\n9",")\n0","_\n-","+\n=",{a:6,w:2},"Backspace","Home"],
[{a:4,w:1.5},"Tab","Q","W","E","R","T","Y","U","I","O","P","{\n[","}\n]",{w:1.5},"|\n\\",{a:6},"Page Up"],
[{a:4,w:1.75},"Caps Lock","A","S","D","F","G","H","J","K","L",":\n;","\"\n'",{a:6,w:2.25},"Enter","Page Down"],
[{w:2.25},"Shift",{a:4},"Z","X","C","V","B","N","M","<\n,",">\n.","?\n/",{a:6,w:1.75},"Shift",{a:7},"↑",{a:6},"End"],
[{w:1.25},"Ctrl",{w:1.25},"Win",{w:1.25},"Alt",{a:7,w:6.25},"",{a:6},"Alt","Fn","Ctrl",{a:7},"←","↓","→"]

*/

k_FontSize = 6
k_FontName = Verdana  
k_FontStyle = Bold   
k_Monitor = 


TransColor = F1ECED

Gui, Font, s%k_FontSize% %k_FontStyle%, %k_FontName%
Gui, -Caption +E0x200 +ToolWindow
Gui, Color, %TransColor% 


Gui, Add, Button, vEsc w30 h30 x10  y4, Esc
Gui, Add, Button, vF1  w30 h30 x41  y4, F1
Gui, Add, Button, vF2  w30 h30 x72  y4, F2
Gui, Add, Button, vF3  w30 h30 x103 y4, F3
Gui, Add, Button, vF4  w30 h30 x134 y4, F4
Gui, Add, Button, vF5  w30 h30 x165 y4, F5
Gui, Add, Button, vF6  w30 h30 x196 y4, F6
Gui, Add, Button, vF7  w30 h30 x227 y4, F7
Gui, Add, Button, vF8  w30 h30 x258 y4, F8
Gui, Add, Button, vF9  w30 h30 x289 y4, F9
Gui, Add, Button, vF10 w30 h30 x320 y4, F10
Gui, Add, Button, vF11 w30 h30 x351 y4, F11
Gui, Add, Button, vF12 w30 h30 x382 y4, F12
Gui, Add, Button, vPS  w30 h30 x413 y4, PS
Gui, Add, Button, vPB  w30 h30 x444 y4, PB
Gui, Add, Button, vNL  w30 h30 x475 y4, NL
 

Gui, Add, Button, w30 h30 x10  y35, ``
Gui, Add, Button, v01 w30 h30 x41  y35, 1
Gui, Add, Button, v02 w30 h30 x72  y35, 2
Gui, Add, Button, v03 w30 h30 x103 y35, 3
Gui, Add, Button, v04 w30 h30 x134 y35, 4
Gui, Add, Button, v05 w30 h30 x165 y35, 5
Gui, Add, Button, v06 w30 h30 x196 y35, 6
Gui, Add, Button, v07 w30 h30 x227 y35, 7
Gui, Add, Button, v08 w30 h30 x258 y35, 8
Gui, Add, Button, v09 w30 h30 x289 y35, 9
Gui, Add, Button, v00 w30 h30 x320 y35, 0
Gui, Add, Button, w30 h30 x351 y35, -
Gui, Add, Button, w30 h30 x382 y35, =
Gui, Add, Button, w61 h30 x413 y35, BackSpace
Gui, Add, Button, w30 h30 x475 y35, Home


Gui, Add, Button, w45 h30 x10  y66, Tab
Gui, Add, Button, w30 h30 x56  y66, Q
Gui, Add, Button, w30 h30 x87  y66, W	
Gui, Add, Button, w30 h30 x118 y66, E
Gui, Add, Button, w30 h30 x149 y66, R
Gui, Add, Button, w30 h30 x180 y66, T
Gui, Add, Button, w30 h30 x211 y66, Y
Gui, Add, Button, w30 h30 x242 y66, U
Gui, Add, Button, w30 h30 x273 y66, I
Gui, Add, Button, w30 h30 x304 y66, O
Gui, Add, Button, w30 h30 x335 y66, P
Gui, Add, Button, w30 h30 x366 y66, [
Gui, Add, Button, w30 h30 x397 y66, ]
Gui, Add, Button, w46 h30 x428 y66, |
Gui, Add, Button, w30 h30 x475 y66, PgUp


Gui, Add, Button, W52.5 h30 x10    y97, CapsLock
Gui, Add, Button, w30   h30 x63.5  y97, A
Gui, Add, Button, w30   h30 x94.5  y97, S	
Gui, Add, Button, w30   h30 x125.5 y97, D
Gui, Add, Button, w30   h30 x156.5 y97, F
Gui, Add, Button, w30   h30 x187.5 y97, G
Gui, Add, Button, w30   h30 x218.5 y97, H
Gui, Add, Button, w30   h30 x249.5 y97, J
Gui, Add, Button, w30   h30 x280.5 y97, K
Gui, Add, Button, w30   h30 x311.5 y97, L
Gui, Add, Button, w30   h30 x342.5 y97, `;
Gui, Add, Button, w30   h30 x373.5 y97, `'
Gui, Add, Button, w70.5 h30 x404.5 y97, Enter
Gui, Add, Button, w30   h30 x475   y97, PgDn


Gui, Add, Button, W70.5 h30 x10    y128, Shift
Gui, Add, Button, w30   h30 x81.5  y128, Z
Gui, Add, Button, w30   h30 x112.5 y128, X	
Gui, Add, Button, w30   h30 x143.5 y128, C
Gui, Add, Button, w30   h30 x174.5 y128, V
Gui, Add, Button, w30   h30 x205.5 y128, B
Gui, Add, Button, w30   h30 x236.5 y128, N
Gui, Add, Button, w30   h30 x267.5 y128, M
Gui, Add, Button, w30   h30 x298.5 y128, <
Gui, Add, Button, w30   h30 x329.5 y128, >
Gui, Add, Button, w30   h30 x360.5 y128, ?
Gui, Add, Button, w52.5 h30 x391   y128, Shift
Gui, Add, Button, w30   h30 x444   y128, ↑
Gui, Add, Button, w30   h30 x475   y128, End


Gui, Add, Button, W37.5  h30 x10    y159, Ctrl
Gui, Add, Button, w37.5  h30 x48.5  y159, Win
Gui, Add, Button, w37.5  h30 x86    y159, Alt
Gui, Add, Button, w195.5 h30 x124.5 y159, Space
Gui, Add, Button, w30    h30 x320   y159, Alt
Gui, Add, Button, w30    h30 x351   y159, Fn
Gui, Add, Button, w30    h30 x382   y159, Ctrl
Gui, Add, Button, w30    h30 x413   y159, ←
Gui, Add, Button, w30    h30 x444   y159, ↓
Gui, Add, Button, w30    h30 x475   y159, →


Gui, Show



WinGet, k_ID, ID, A   ; Get its window ID.
WinGetPos,  ,  , w, h, A
x:=A_ScreenWidth/2-w/2
y:=A_ScreenHeight-h
WinMove, A, , %x%, %y%
WinSet, AlwaysOnTop, On, ahk_id %k_ID%
WinSet, TransColor, %TransColor% 220, ahk_id %k_ID%




; Loop
; 	{
; 		Transform, k_char, Chr, %k_ASCII%
; 		StringUpper, k_char, k_char
; 		if k_char not in <,>,^,~,?`,
; 			Hotkey, ~*%k_char%, k_KeyPress
; 			; In the above, the asterisk prefix allows the key to be detected regardless
; 			; of whether the user is holding down modifier keys such as Control and Shift.
; 		if k_ASCII = 93
; 			break
; 		k_ASCII++
; 	}
; return

