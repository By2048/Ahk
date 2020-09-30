#SingleInstance Force
#include %A_ScriptDir%\Tool.ahk
#include %A_ScriptDir%\Libs\Gdip_All.ahk



keymap_show_status:=False

keymaps:={}
keymaps["VSCode"]:=[]
keymaps["VSCode"].Push([[60,123],  "!F1", "center"])


get_image_size(img)
{
    GDIPToken:=Gdip_Startup()
    pBM:=Gdip_CreateBitmapFromFile(img)
    W:=Gdip_GetImageWidth(pBM)
    H:=Gdip_GetImageHeight(pBM)   
    Gdip_DisposeImage(pBM)
    Gdip_Shutdown(GDIPToken)
    data:=[W,H]
    Return data
}


key_help()
{
    CoordMode Pixel Window
    CoordMode Mouse Window

    global keymaps
    global keymap_show_status

    WinGet, w_id, ID, A
    WinGetPos, windows_x, windows_y, xx, xx, ahk_id %w_id%

    find_x:=0
    find_y:=0

    if (keymap_show_status=True) {
        keymap_show_status=False
        Progress Off
        Return
    }

    for exe, data in keymaps {
        for index, info in data {
            postion_x:=info[1][1]
            postion_y:=info[1][2]
            key:=info[2]

            help_image_w:=StrLen(key)*11*2
            help_image_h:=46
            
            image_size:=get_image_size(img)
            image_size_x:=image_size[1]
            image_size_y:=image_size[2]

            x:=windows_x+postion_x+(image_size_x-help_image_w)/2
            y:=windows_y+postion_y+(image_size_y-help_image_h)/2
            w:=help_image_w/2
            h:=help_image_h/2
            Progress, b fs13 zh0 x%x% y%y% w%w% h%h%, %key%,  , Courier New

            keymap_show_status:=True

        }
    }



}


RAlt:: 
    key_help()
Return


