
; Key
; [process_name]
; [process_name]_[class]
; []_[class]
; [process_name]_[title]
; [process_name]_[class]_[title]
; []_[class]_[title]
; []_[]_[title]

; Value
; 设置一些软件默认位置 [x,y,w,h]

global Windows_Default_Position := {}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

win_w := 900
win_h := 1500
win_x := screen_1_x + screen_1_w/2 - win_w/2
win_y := screen_1_y + screen_1_h/2 - win_h/2
Windows_Default_Position["_#32770_浏览文件夹"] := [win_x, win_y, win_w, win_h]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

win_x := 10
win_y := 10
win_w := screen_1_w/2 -10-10 +100
win_h := screen_1_h -10-10
Windows_Default_Position["TIM"] := [win_x, win_y, win_w, win_h]

win_x := 10
win_y := 10
win_w := screen_1_w/2 -10-10 +100
win_h := screen_1_h -10-10
Windows_Default_Position["DingDing"] := [win_x, win_y, win_w, win_h]

win_x := screen_1_w/2+10 +100
win_y := 10+14
win_w := screen_1_w/2-10-10 -100
win_h := screen_1_h-10-10-14-14
Windows_Default_Position["WeChat"] := [win_x, win_y, win_w, win_h]

win_w := screen_3_w*8/9
win_h := screen_3_h/2*5/6
win_x := screen_3_x+screen_3_w/2-win_w/2
win_y := screen_3_y+100
Windows_Default_Position["FDM"] := [win_x, win_y, win_w, win_h]

win_x := 176
win_y := 10
win_w := 3488
win_h := 2140
Windows_Default_Position["Android"] := [win_x, win_y, win_w, win_h]

win_w := screen_1_w*4/6
win_h := screen_1_h*7/9
win_x := screen_1_x+screen_1_w/2-win_w/2
win_y := screen_1_y+screen_1_h/2-win_h/2
Windows_Default_Position["CloudMusic"] := [win_x, win_y, win_w, win_h]

win_w := 2020
win_h := 300
win_x := screen_3_x+screen_3_w/2-win_w/2
win_y := 2020
Windows_Default_Position["CloudMusic_DesktopLyrics"] := [win_x, win_y, win_w, win_h]

win_w := 2000
win_h := 1500
win_x := screen_1_x+screen_1_w/2-win_w/2
win_y := screen_1_y+screen_1_h/2-win_h/2
Windows_Default_Position["7-Zip"] := [win_x, win_y, win_w, win_h]

win_w := 2150
win_h := 1250
win_x := screen_1_x+screen_1_w/2-win_w/2
win_y := screen_1_y+screen_1_h/2-win_h/2
Windows_Default_Position["Start"] := [win_x, win_y, win_w, win_h]

win_w := screen_3_w-6-6
win_h := screen_3_h/2-6-6
win_x := screen_3_x+6
win_y := screen_3_y+6
Windows_Default_Position["TaskMGR"] := [win_x, win_y, win_w, win_h]

win_w := screen_1_w * 5/6
win_h := screen_1_h * 8/9
win_x := screen_1_x + screen_1_w/2 - win_w/2
win_y := screen_1_y + screen_1_h/2 - win_h/2
Windows_Default_Position["Chrome"] := [win_x, win_y, win_w, win_h]

win_w := 900
win_h := 1500
win_x := screen_1_x+screen_1_w/2-win_w/2
win_y := screen_1_y+screen_1_h/2-win_h/2
Windows_Default_Position["Chrome__修改书签"] := [win_x, win_y, win_w, win_h]

win_w := 1661
win_h := 676
win_x := screen_2_x + screen_2_w/2 - win_w/2
win_y := screen_2_y + screen_2_h/2 - win_h/2
Windows_Default_Position["v2rayN"] := [win_x, win_y, win_w, win_h]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

win_w := screen_1_w * 5/6
win_h := screen_1_h * 8/9
win_x := screen_1_x + screen_1_w/2 - win_w/2
win_y := screen_1_y + screen_1_h/2 - win_h/2
Windows_Default_Position["VSCode"] := [win_x, win_y, win_w, win_h]

win_x := 60 
win_y := 30
win_w := screen_1_w - win_x*2 + 1
win_h := screen_1_h - win_y*2 + 1
Windows_Default_Position["PyCharm"] := [win_x, win_y, win_w, win_h]

win_w := screen_1_w/1.5 + 1
win_h := screen_1_h/1.5 + 1
win_x := screen_1_x + screen_1_w/2 - win_w/2
win_y := screen_1_y + screen_1_h/2 - win_h/2
Windows_Default_Position["PyCharm__Settings"]             := [win_x, win_y, win_w, win_h]
Windows_Default_Position["PyCharm__AddPythonInterpreter"] := [win_x, win_y, win_w, win_h]
Windows_Default_Position["PyCharm__SSHConfigurations"]    := [win_x, win_y, win_w, win_h]

win_w := 900  + 1
win_h := 1500 + 1
win_x := screen_1_x + screen_1_w/2 - win_w/2 + 1
win_y := screen_1_y + screen_1_h/2 - win_h/2 + 1
Windows_Default_Position["PyCharm__Open"]   := [win_x, win_y, win_w, win_h]
Windows_Default_Position["PyCharm__Select"] := [win_x, win_y, win_w, win_h]
