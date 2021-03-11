
#include %A_WorkingDir%\Config.ahk
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



global hotkeys_images           := []     ; 显示的图片组
global hotkeys_show_status      := False  ; 是否正在显示图片
global hotkeys_index            := 1      ; 显示图片的序号
global hotkeys_total            := 1      ; 显示图片组的数量
global hotkeys_process_name     := ""     ; 激活的应用
global hotkeys_title            := ""     ; 激活的应用窗口标题



; 获取需要展示的图片
get_image() 
{
    global hotkeys_index
    global hotkeys_total
    global hotkeys_images
    global hotkeys_title
    global hotkeys_process_name

    result := GetWindowsInfo()
	hotkeys_process_name := result.win_process_name
	hotkeys_title        := result.win_title
    
    If (win_process_name="PyCharm" and win_title="Evaluate") {
        Return
    }

    hotkeys_images := Process_Hotkeys_Image["default"]

    ; 优先根据应用名进行查找
    for key_exe, key_image in Process_Hotkeys_Image {
        if (key_exe=hotkeys_process_name) {
            hotkeys_images := key_image
        }
    }

    if ( hotkeys_process_name="Chrome" and InStr(hotkeys_title, "bilibili") ) {
        hotkeys_images := Process_Hotkeys_Image["Chrome_Bilibili"]
    }

    hotkeys_total := hotkeys_images.MaxIndex()
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

    
    SplashImage, %image%, X%image_x% Y%image_y% H%image_h% W%image_w% B1   ;  全屏幕居中
    ; SplashImage, %image%, B1  ; 去除任务栏屏幕居中

    hotkeys_show_status:=True

    ; 页面索引（1/2）h:=h/2
    if (hotkeys_total>=1) {
        w := 200
        h := 62
        x := screen_1_w/2-w/2
        y := screen_1_h-h-5 ; 屏幕底部
        ; y:=screen_1_h/2+size_h/2+5 ; 图片底部
        w := w/2
        h := h/2
        Progress, b fs19 zh0 x%x% y%y% w%w% h%h%, %hotkeys_index%/%hotkeys_total%
    }

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

    SplashImage, Off
    Progress, Off

    hotkeys_show_status      := False
    hotkeys_index            := 1 
    hotkeys_total            := 1
    hotkeys_images           := []
    hotkeys_process_name     := ""
    hotkeys_title            := ""
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
        HideConfig()
    } else if (cnt=2) {
        show_image()
    } else if (cnt=3) {
        ShowConfig()
    }
    cnt:=0
return



#if (hotkeys_show_status=True)
    [::change("privious")
    ]::change("next")
    Pause::
        global hotkeys_index
        global hotkeys_images
        image := hotkeys_images[hotkeys_index]
        image := A_WorkingDir "\Image\RShift\" image
        Snipaste(image, "screen1")
        SetTimer, hide_image, -300
    Return
#if
