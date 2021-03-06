﻿
#include %A_WorkingDir%\Config\All.ahk
#include %A_WorkingDir%\Tool\Base.ahk
#include %A_WorkingDir%\Tool\Init.ahk
#include %A_WorkingDir%\Tool\Image.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs %A_ScriptFullPath%
}



global hotkeys_show_status  := False ; 是否正在显示图片
global hotkeys_images       := []    ; 显示的图片组
global hotkeys_index        := 1     ; 显示图片的序号
global hotkeys_total        := 1     ; 显示图片组的数量
global hotkeys_title        := ""    ; 激活的应用窗口标题
global hotkeys_process_name := ""    ; 激活的应用



; 获取需要展示的图片
get_image() 
{
    global hotkeys_index
    global hotkeys_total
    global hotkeys_images
    global hotkeys_title
    global hotkeys_process_name

    if (not hotkeys_process_name) {
        result               := GetWindowsInfo()
        hotkeys_process_name := result.win_process_name
        hotkeys_title        := result.win_title
    }
    
    ; PyCharm计算界面不处理
    If (win_process_name="PyCharm" and win_title="Evaluate") {
        Return
    }

    hotkeys_images := GetWindowsConfig(Process_Hotkeys_Image)
    hotkeys_total  := hotkeys_images.MaxIndex()

    if (hotkeys_index>hotkeys_total) {
        hotkeys_index := 1
    } 
    if (hotkeys_index<=0) {
        hotkeys_index := hotkeys_total
    }

    result := hotkeys_images[hotkeys_index]
    result := A_WorkingDir "\Image\RShift\" result
    return result
}



show_image()
{
    global hotkeys_show_status
    global hotkeys_process_name

    image      := get_image()
    image_size := GetImageSize(image)
    image_w    := image_size[1]
    image_h    := image_size[2]
    image_x    := screen_1_w/2 - image_w/2
    image_y    := screen_1_h/2 - image_h/2

    image_w := image_w/screen_1_dpi
    image_h := image_h/screen_1_dpi
    
    Gui, Destroy
    Gui, +AlwaysOnTop +Disabled +Owner -SysMenu -Caption
    Gui, Margin, 1, 1
    Gui, Add, Picture, w%image_w% h%image_h%, %image%

    hotkeys_show_status := True

    ; 页面索引
    if (hotkeys_total>1) {
        Gui, font, s15, Cascadia Code
        Gui, Add, Text, w%image_w% +Center +Border, %hotkeys_index%/%hotkeys_total%
    }

    Gui, Show, Center NA

    ; 关闭因双击Shift打开的快速搜索界面
    If (hotkeys_process_name="PyCharm") {
        Send {Esc}
    }
}



hide_image()
{
    global hotkeys_show_status
    global hotkeys_index
    global hotkeys_total
    global hotkeys_images          
    global hotkeys_process_name
    global hotkeys_title

    Gui, Destroy

    hotkeys_show_status  := False
    hotkeys_index        := 1 
    hotkeys_total        := 1
    hotkeys_images       := []
    hotkeys_process_name := ""
    hotkeys_title        := ""
}



; 展示图片切换上一个下一个
change(np="")
{
    global hotkeys_index

    if (hotkeys_total=1) {
        return
    }
    if (np="next") {
        hotkeys_index := hotkeys_index + 1
    } else if (np="privious") {
        hotkeys_index := hotkeys_index - 1
    }
    show_image()
}



~RShift::
    if (IsGame()) {
        Return
    }
    if (not cnt) {
        cnt:=1
    } else {
        cnt+=1
    }
    SetTimer, timer, -500
return



timer:
    if (cnt=1) {
        hide_image()
    } else if (cnt=2) {
        show_image()
    } else if (cnt=3) {
        InitConfig()
    }
    cnt:=0
return



#if (hotkeys_show_status=True)
    [::change("privious")
    ]::change("next")
    Esc::hide_image()
    Pause::
        global hotkeys_index
        global hotkeys_images
        image := hotkeys_images[hotkeys_index]
        image := A_WorkingDir "\Image\RShift\" image
        Snipaste(image, "screen1")
        SetTimer, hide_image, -300
    Return
#if
