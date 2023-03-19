
#HotIf CheckWindowActive( "Android" , "" , "部落冲突" )

    Space::{
        SetKeyDelay 100
        ; Sleep 100
        ; Send {3}{Click}
        ; Send {4}{Click}
        ; Send {5}{Click}
        ; Send {6}{Click}
        ; Send {7}{Click}
        ; Sleep 100
        SetKeyDelay -1
    }

    -::{
        Send "z"
        Sleep 300
        ; 气球
        MouseClick "Left", 1359, 348, 1, 0
        Sleep 300
        MouseClick "Left", 1722, 1244, 9, 0
        Sleep 300
        Send "\"
    }

    =::{
        Send "z"
        Sleep 300
        ; 法术
        MouseClick "Left", 1633, 322, 1, 0
        Sleep 300
        MouseClick "Left", 934, 1217, 1, 0
        Sleep 300
        MouseClickDrag "Left", 2845, 614, 1213, 602, 9
        Sleep 300
        Send "\"
    }

    b::{
        Send "{7}{LButton}{7}"
        Sleep 1000
        Send "{1}{LButton 6}"
    }

    CocSelect(images)
    {
        CoordMode "Mouse", "Window"
        CoordMode "Pixel", "Window"
        MouseGetPos &x_origin, &y_origin
        x1 := 200
        y1 := 1740
        x2 := 3200
        y2 := 2000
        for index, image in images {
            image_size := GetImageSize(image)
            image_w    := image_size["w"]
            image_h    := image_size["h"]
            ImageSearch x_find, y_find, x1, y1, x2, y2, image
            if (x_find and y_find) {
                x_find := x_find + image_w/2
                y_find := y_find + image_h/2
                MouseClick "Left", x_find, y_find, 1, 0
                MouseMove x_origin, y_origin, 0
                break
            }
        }
    }

    Activity() {
        CoordMode "Mouse", "Window"
        xy := "598,1866|777,1872|955,1873|1137,1881|1327,1872|1507,1868|1684,1872"
        cc := "6       |2       |2      | 3       | 1        | 15      | 1       "
        xy := StrSplit(xy, "|")
        cc := StrSplit(cc, " ")
        data := []
        for index, item in xy {
            item := StrSplit(item, ",")
            x := item[1]
            y := item[2]
            c := cc[index]
            data.Push( [ x , y, c ] )
        }
        MouseGetPos &x_origin, &y_origin
        for index, item in data {
            x := item[1]
            y := item[2]
            c := item[3]
            MouseClick "Left", x, y, 1, 0
            Sleep 300
            MouseClick "Left", x_origin, y_origin, c, 0
        }
    }

    ; 降杯
    DownItem() {
        HelpText("降杯", "center_down", "screen_1")

        CoordMode "Mouse", "Window"

        Send "Q"
        Sleep 500
        Send "\"
        Sleep 500

        Send "Q"
        Sleep 500
        Send "R"
        Sleep 5000

        Send "0"
        Sleep 500
        Send "\"
        Sleep 500

        y := 0
        Loop 4 {
            y := y + 300
            MouseClick "Left", 300, y
            Sleep 100
            MouseClick "Left", 1700, y
            Sleep 100
            MouseClick "Left", 2800, y
            Sleep 100
        }

        Send "A"
        Sleep 500
        Send "S"
        Sleep 500
        Send "D"
        Sleep 3000

        Send "\"

        Sleep 500
        HelpText()
    }


    ScreenShort() {
        x := 340
        y := 290
        w := 270
        h := 237
        file := "D:\#\coc.png"
        cmd  := Format("{1} snip --area {2} {3} {4} {5} -o {6}", Snipaste, x, y, w, h, file)
        Run cmd
    }

    ORC() {
        file := "D:\#\coc.png"
        url := "http://127.0.0.1:1331/coc/" . file
        whr := ComObject("WinHttp.WinHttpRequest.5.1")
        whr.Open("GET", url, True)
        whr.Send()
        whr.WaitForResponse()
        response := whr.ResponseText
        ; result := JSON.Parse(response)
        result := {}
        return result
    }

    SearchSleep() {
        CoordMode "Pixel", "Screen"
        color_x       := 295
        color_y       := 1603
        color_compare := "F95D62"
        color_offset  := 5
        Loop {
            color_base := PixelGetColor(color_x, color_y, "RGB")
            color_base := SubStr(color_base, 3)
            if ( CheckColor(color_base, color_compare, color_offset) ) {
                break
            } else {
                Sleep 333
            }
        }
    }


    ; Init_Coc_Args:
    ;     Global Android_COC_Loop := [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 ]
    ; Return

    `::Send "{LButton}"

    Tab::Send "{LButton 4}"

    PgUp::{
        Send "{m Down}"
        Send "."
        Send "{m Up}"
    }

    PgDn::{
        Send "{m Down}"
        Send "{, 3}"
        Send "{m Up}"
    }

    ; 退出
    BackSpace::{
        HelpText("BackSpace","center_down","screen_1")
        Send "a"
        Sleep 100
        Send "s"
        Sleep 2000
        Send "d"
        Sleep 3000
        Send "\"
        Sleep 500
        HelpText()
    }

    ; 补兵
    CapsLock::{
        HelpText("CapsLock", "center_down", "screen_1")

        Send "a"
        Sleep 100
        Send "s"
        Sleep 1000
        Send "d"
        Sleep 3000

        Send "\"
        Sleep 100

        Send "z"
        Sleep 100
        Send "x"
        Sleep 100
        Send "c"
        Sleep 100

        Send "\"
        Sleep 500

        HelpText()
    }
    CapsLock Up::{
        SetCapsLockState "Off"
    }

    ; 兵种选择
    ~e::{
        Android_COC_Current := -1
    }

    ~1::
    ~2::
    ~3::
    ~4::
    ~5::
    ~6::
    ~7::
    ~8::
    ~9::
    ~0::{
        index := StrReplace(A_ThisHotkey, "~", "")
        index := index + 0
        Android_COC_Current := index
    }

    ; 按顺序切换兵种 1-6
    ; LAlt::
    ;     GoSub Init_Coc_Args
    ;     Global Android_COC_Current
    ;     if (not Android_COC_Current) {
    ;         Android_COC_Current := 1
    ;         Send %Android_COC_Current%
    ;         Return
    ;     }
    ;     for index, value in Android_COC_Loop {
    ;         if (value == Android_COC_Current) {
    ;             if (index == Android_COC_Loop.MaxIndex()) {
    ;                 Android_COC_Current := 1
    ;                 Send %Android_COC_Current%
    ;                 Return
    ;             } else {
    ;                 Android_COC_Current := Android_COC_Loop[index + 1]
    ;                 Send %Android_COC_Current%
    ;                 Return
    ;             }
    ;         }
    ;     }
    ; Return

    ; 按顺序切换兵
    ; LShift::
    ;     GoSub Init_Coc_Args
    ;     Global Android_COC_Current
    ;     if (not Android_COC_Current) {
    ;         next_index := Android_COC_Loop.MaxIndex()
    ;         Android_COC_Current := Android_COC_Loop[next_index]
    ;         Send %Android_COC_Current%
    ;         Return
    ;     }
    ;     for index, value in Android_COC_Loop {
    ;         if (value == Android_COC_Current) {
    ;             if (index == 1) {
    ;                 next_index := Android_COC_Loop.MaxIndex()
    ;                 Android_COC_Current := Android_COC_Loop[next_index]
    ;                 Send %Android_COC_Current%
    ;                 Return
    ;             } else {
    ;                 Android_COC_Current := Android_COC_Loop[index - 1]
    ;                 Send %Android_COC_Current%
    ;                 Return
    ;             }
    ;         }
    ;     }
    ; Return

    ;阵形1
    F1::
    F2::
    F3::{

        CoordMode "Mouse", "Window"
        MouseGetPos &x_origin, &y_origin
        MouseClick "Left", 2321, 950
        Sleep 300
        Switch A_ThisHotkey {
            Case "F1" : MouseClick "Left", 477,  758
            Case "F2" : MouseClick "Left", 1196, 759
            Case "F3" : MouseClick "Left", 1915, 752
        }
        Sleep 500
        MouseClick "Left", 1566, 1300
        Sleep 500
        Send "{Esc}"
        Sleep 100
        MouseMove x_origin, y_origin, 0
    }

    ; 删除兵种
    F5::{

        CoordMode "Mouse", "Window"
        MouseGetPos &x_origin, &y_origin
        RemoveArm1K() {
            MouseClick "Left", 432,  363, 1, 0
            MouseClick "Left", 627,  363, 1, 0
            MouseClick "Left", 825,  363, 1, 0
            MouseClick "Left", 1021, 363, 1, 0
            MouseClick "Left", 1219, 363, 1, 0
            MouseClick "Left", 1419, 363, 1, 0
        }
        RemoveArm2K() {
            MouseClick "Left", 588,  484, 1, 0
            MouseClick "Left", 855,  482, 1, 0
            MouseClick "Left", 1127, 484, 1, 0
            MouseClick "Left", 1395, 484, 1, 0
            MouseClick "Left", 1665, 484, 1, 0
            MouseClick "Left", 1934, 484, 1, 0
        }
        RemoveArm1K()
        Sleep 100
        MouseMove x_origin, y_origin, 0
        Send "/"
    }

    ; 删除护盾
    F8::{

        Send "/"
        CoordMode "Mouse", "Window"
        MouseGetPos &x_origin, &y_origin
        Send "p"
        Sleep 100
        RemoveShield2K() {
            MouseClick "Left", 1409, 505
            Sleep 100
            MouseClick "Left", 1379, 848
        }
        RemoveShield1K() {
            MouseClick "Left", 1034, 379
            Sleep 100
            MouseClick "Left", 1008, 631
        }
        RemoveShield1K()
        Sleep 100
        MouseMove x_origin, y_origin, 0
        Sleep 100
        Send "/"
    }

    ; 部署栏拖动
    >!\::{
        Send "{LButton Down}"
        MouseMove -150, 0, 11, "R"
        MouseMove  250, 0, 11, "R"
        Send "{LButton Up}"
    }

    !q::{
        images := [ A_InitialWorkingDir . "\Image\Software\COC\gbl.png"
                  , A_InitialWorkingDir . "\Image\Software\COC\gbl_small.png" ]
        CocSelect(images)
    }

#HotIf
