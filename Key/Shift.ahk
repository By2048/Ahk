
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Base.ahk
#Include %A_WorkingDir%\Tool\Init.ahk
#Include %A_WorkingDir%\Tool\File.ahk
#Include %A_WorkingDir%\Tool\Other.ahk
#Include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon



Global hotkeys_show_status  := False ; 是否正在显示图片
Global hotkeys_images       := []    ; 显示的图片组
Global hotkeys_index        := 1     ; 显示图片的序号
Global hotkeys_total        := 1     ; 显示图片组的数量
Global hotkeys_title        := ""    ; 激活的应用窗口标题
Global hotkeys_process_name := ""    ; 激活的应用

; 快捷键图片对应关系
Global Process_Hotkeys_Image := { "-" : [ "---------------------------------" ]
    , "Default"                       : [ "Windows.png"                       ]
    , "Explorer_CabinetWClass"        : [ "Explorer.png"                      ]
    , "Explorer_WorkerW"              : [ "Windows.png"                       ]
    , "VSCode"                        : [ "VSCode-Fxx.png", "VSCode.png"      ]
    , "Xshell"                        : [ "Xshell.png"                        ]
    , "SumatraPDF"                    : [ "SumatraPDF.png"                    ]
    , "PyCharm"                       : [ "PyCharm-Fxx.png", "PyCharm.png"    ]
    , "QuiteRSS"                      : [ "QuiteRSS.png"                      ]
    , "Chrome"                        : [ "Chrome.png"                        ]
    , "Chrome__Bilibili"              : [ "Chrome-Bilibili.png"               ]
    , "PotPlayer"                     : [ "PotPlayer.png"                     ]
    , "CloudMusic"                    : [ "CloudMusic.png"                    ]
    , "+"                             : [ "+++++++++++++++++++++++++++++++++" ] } 



; 获取需要展示的图片
GetShiftImage() 
{
    global hotkeys_index
    global hotkeys_total
    global hotkeys_images
    global hotkeys_title
    global hotkeys_process_name

    global Process_Hotkeys_Image

    if (not hotkeys_process_name) {
        result           := GetActiveWindowsInfo()
        win_process_name := result.win_process_name
        win_title        := result.win_title
    }
    
    ; PyCharm计算界面不处理
    If (win_process_name=="PyCharm" and win_title=="Evaluate") {
        return
    }

    hotkeys_images := GetActiveWindowsConfig(Process_Hotkeys_Image)
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



ShowShiftImage()
{
    global hotkeys_show_status
    global hotkeys_process_name

    image      := GetShiftImage()
    image_size := GetImageSize(image)
    image_w    := image_size["w"]
    image_h    := image_size["h"]
    image_x    := Screens.1.w/2 - image_w/2
    image_y    := Screens.1.h/2 - image_h/2

    image_w := image_w / Screens.1.dpi
    image_h := image_h / Screens.1.dpi
    
    Gui, Destroy
    Gui, +AlwaysOnTop +Disabled +Owner -SysMenu -Caption
    Gui, Margin, 1, 1
    Gui, Add, Picture, w%image_w% h%image_h%, %image%

    hotkeys_show_status := True

    ; 页面索引
    if (hotkeys_total > 1) {
        Gui, font, s15, "Cascadia Code"
        Gui, Add, Text, w%image_w% +Center +Border, %hotkeys_index%/%hotkeys_total%
    }

    Gui, Show, Center NA

    ; 关闭因双击Shift打开的快速搜索界面
    if (hotkeys_process_name == "PyCharm") {
        Send {Esc}
    }
}



HideShiftImage()
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
ChangeShiftImage(np="")
{
    global hotkeys_index
    if (hotkeys_total == 1) {
        return
    }
    if (np == "+") {
        hotkeys_index := hotkeys_index + 1
    } else if (np == "-") {
        hotkeys_index := hotkeys_index - 1
    }
    ShowShiftImage()
}



~RShift::
    if (cnt > 0) {
        cnt += 1
        HelpText("RShift " . cnt, "center", "screen_3")
        return
    } else {
        cnt := 1
        HelpText("RShift " . cnt, "center", "screen_3")
    }
    SetTimer, Timer, -333
Return
Timer:
    if (cnt == 1) {
        HideShiftImage()
        HelpText()
    } else if (cnt == 2) {
        ShowShiftImage()
    } else if (cnt == 3) {
        InitConfig()
    }
    cnt := 0
Return



#If ( hotkeys_show_status == True )
    [::ChangeShiftImage("-")
    ]::ChangeShiftImage("+")
    Insert::HideShiftImage()
    Delete::
        global hotkeys_index
        global hotkeys_images
        image := hotkeys_images[hotkeys_index]
        image := A_WorkingDir . "\Image\RShift\" . image
        Snipaste(image, "Screen1")
        SetTimer, HideShiftImage, -300
    Return
#If
