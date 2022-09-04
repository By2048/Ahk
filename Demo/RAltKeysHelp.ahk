#Include %A_WorkingDir%\Tool\Help.ahk

#SingleInstance Force
#NoTrayIcon


global keymaps:={}
global keymap_show_status:=False

keymaps["VSCode"]:=[]
keymaps["VSCode"].Push([[47,108],  "!F1"])
keymaps["VSCode"].Push([[47,316], "!F12"])



 >!F1::Send {F13}
 >!F2::Send {F14}
 >!F3::Send {F15}
 >!F4::Send {F16}
 >!F5::Send {F17}
 >!F6::Send {F18}
 >!F7::Send {F19}
 >!F8::Send {F20}
 >!F9::Send {F21}
>!F10::Send {F22}
>!F11::Send {F23}
>!F12::Send {F24}



show_pos()
{
    MouseGetPos, xpos, ypos
    data := xpos "|" ypos
    HelpText(data,"center", ,3000)
}



get_keys()
{
    result:=[]
    for exe, keys in keymaps {
        if WinActive("ahk_exe"+exe) {
            result:=keys
        }
    }
    return result
}



show_key_help()
{
    CoordMode, Pixel, Window
    CoordMode, Mouse, Window

    global keymaps
    global keymap_show_status


    keys:=get_keys()

    if (not keys) {
        return
    }

    WinGet, w_id, ID, A
    WinGetPos, windows_x, windows_y, xx, xx, ahk_id %w_id%

    find_x:=0
    find_y:=0

    for index, info in keys {
        postion_x:=info[1][1]
        postion_y:=info[1][2]
        key:=info[2]

        help_image_w:=StrLen(key)*11*2
        help_image_h:=44

        x:=windows_x+postion_x-help_image_w/2
        y:=windows_y+postion_y-help_image_h/2

        w:=help_image_w/2
        h:=help_image_h/2
        Progress, %index%: b fs13 zh0 x%x% y%y% w%w% h%h%, %key%,  , Courier New

        keymap_show_status:=True
    }
}



hide_key_help()
{
    global keymap_show_status
    keys:=get_keys()
    for index, info in keys {
        Progress %index%: Off
    }
    keymap_show_status:=False
}



$RAlt::
    if (not cnt) {
        cnt:=1
    } else {
        cnt+=1
    }
    SetTimer, timer, -1000
return



RAlt & RWin::
    if not WinActive("ahk_class WorkerW") {
        Send ^w
    }
return



timer:
    if (cnt=1) {
        hide_key_help()
    }
    if (cnt=2) {
        show_key_help()
    }
    cnt:=0
return


