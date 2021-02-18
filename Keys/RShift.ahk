
#include %A_WorkingDir%\Config.ahk
#include %A_WorkingDir%\Tool\Base.ahk
#include %A_WorkingDir%\Tool\Init.ahk
#include %A_WorkingDir%\Tool\Image.ahk
#include %A_WorkingDir%\Tool\Windows.ahk
#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs %A_ScriptFullPath%
}



global hotkeys_show_status:=False ; 当前是否显示图片
global hotkeys_index:=1 ; 当前显示图片的序号
global hotkeys_total:=1 ; 当前展示图片组的数量



; 快捷键帮助 获取需要展示的图片
get_image() 
{
    global hotkeys_index
    global hotkeys_total

    WinGetTitle, win_title, A
	WinGet, win_process_name, ProcessName, A

    win_process_name := ProcessNameFormat(win_process_name)

    result := hotkeys["default"]

    ; 优先根据应用名进行查找
    for exe, image in Process_Hotkeys_Image {
        if (exe=win_process_name) {
            result:=image
        }
    }

    if ( win_process_name="Chrome" and InStr(win_title, "bilibili") ) {
        result:=hotkeys["Chrome_Bilibili"]
    }

    hotkeys_total:=result.MaxIndex()
    if (hotkeys_index>hotkeys_total) {
        hotkeys_index:=1
    } 
    if (hotkeys_index<=0) {
        hotkeys_index:=hotkeys_total
    }

    result := result[hotkeys_index]
    result := A_WorkingDir "\Image\RShift\" result
    return result
}



show_image()
{
    global hotkeys_show_status

    image:=get_image()
    
    size:=GetImageSize(image)
    size_w:=size[1]
    size_h:=size[2]
    x:=screen_1_w/2-size_w/2
    y:=screen_1_h/2-size_h/2
    
    SplashImage, %image%, X%x% Y%y% H%size_h% W%size_w% B1   ;  全屏幕居中
    ; SplashImage, %image%, B1  ; 去除任务栏屏幕居中

    hotkeys_show_status:=True

    ; 页面索引（1/2）h:=h/2
    if (hotkeys_total>1) {
        w:=200
        h:=62
        x:=screen_1_w/2-w/2
        y:=screen_1_h-h-5 ; 屏幕底部
        ; y:=screen_1_h/2+size_h/2+5 ; 图片底部
        w:=w/2
        h:=h/2
        Progress, b fs19 zh0 x%x% y%y% w%w% h%h%, %hotkeys_index%/%hotkeys_total%
    }

    ; 关闭因双击Shift打开的快速搜索界面
	WinGet, win_process_name, ProcessName, A
    win_process_name := ProcessNameFormat(win_process_name)
    If (win_process_name="PyCharm") {
        Send, {Esc}
    }
}



hide_image()
{
    global hotkeys_show_status
    global hotkeys_index
    global hotkeys_total

    SplashImage, Off
    Progress, Off

    hotkeys_show_status:=False
    hotkeys_index:=1 
    hotkeys_total:=1
}



; 展示图片切换上一个下一个
change(np="")
{
    global hotkeys_index

    if (hotkeys_total=1) {
        return
    }
    
    if (np="next") {
        hotkeys_index:=hotkeys_index+1
    } else if (np="privious") {
        hotkeys_index:=hotkeys_index-1
    }

    show_image()
}



~RShift::
	WinGet,      win_process_name, ProcessName, A
	WinGetTitle, win_title, A
    win_process_name := ProcessNameFormat(win_process_name)
    If (win_process_name="PyCharm" and win_title="Evaluate") {
        Return
    }
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
#if
