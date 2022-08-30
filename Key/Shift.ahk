
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Base.ahk
#Include %A_WorkingDir%\Tool\Init.ahk
#Include %A_WorkingDir%\Tool\File.ahk
#Include %A_WorkingDir%\Tool\Other.ahk
#Include %A_WorkingDir%\Tool\Window.ahk

#SingleInstance Force
#NoTrayIcon



>+`;::Send :
>+'::Send "



$RShift::
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
        GetInitConfig()
        InitConfig()
    }
    cnt := 0
Return



#If ( hotkeys_show_status == True )
    [::ChangeShiftImage("-")
    ]::ChangeShiftImage("+")
    Insert::HideShiftImage()
    Delete::
        image := hotkeys_current[hotkeys_index]
        image := A_WorkingDir . "\Image\RShift\" . image
        Snipaste(image, "Screen1")
        SetTimer, HideShiftImage, -300
    Return
#If



Global Hotkeys_Images       := {}    ; 软件图片对应关系
Global hotkeys_show_status  := False ; 是否正在显示图片
Global hotkeys_current      := []    ; 当前显示的图片组
Global hotkeys_index        := 1     ; 显示图片的序号
Global hotkeys_total        := 1     ; 显示图片组的数量



InitImageConfig()
{
    check_total := Hotkeys_Images.Count()
    if (check_total) {
        return
    }
    ; 快捷键图片对应关系
    ; Default                : Windows.png
    ; Explorer_CabinetWClass : Explorer.png
    ; Explorer_WorkerW       : Windows.png
    ; VSCode                 : VSCodeFxx.png , VSCode.png
    ; Xshell                 : Xshell.png
    ; SumatraPDF             : SumatraPDF.png
    ; PyCharm                : PyCharmFxx.png , PyCharm.png
    ; QuiteRSS               : QuiteRSS.png
    ; Chrome                 : Chrome.png
    ; Chrome__Bilibili       : ChromeBilibili.png
    ; PotPlayer              : PotPlayer.png
    ; CloudMusic             : CloudMusic.png
    file := A_LineFile
    slice := [ A_LineNumber - 13 , A_LineNumber - 2 ]
    data := ReadConfig(file, slice)
    data := StrSplit(data, "`n")
    for index, item in data {
        item  := StrSplit(item, ":")
        key   := item[1]
        value := item[2]
        key   := StrReplace(key, " ", "")
        value := StrReplace(value, " ", "")
        value := StrSplit(value, ",")
        Hotkeys_Images[key] := value
    }
}



; 获取需要展示的图片
GetShiftImage()
{
    GetActiveWindowInfo()
    InitImageConfig()

    win_process_name := window.process_name
    win_title        := window.title

    hotkeys_current := GetWindowConfig(Hotkeys_Images)
    hotkeys_total   := hotkeys_current.MaxIndex()

    if (hotkeys_index > hotkeys_total) {
        hotkeys_index := 1
    }
    if (hotkeys_index <= 0) {
        hotkeys_index := hotkeys_total
    }

    result := hotkeys_current[hotkeys_index]
    result := A_WorkingDir "\Image\RShift\" result
    return result
}



ShowShiftImage()
{
    image      := GetShiftImage()
    image_size := GetImageSize(image)
    image_w    := image_size["w"]
    image_h    := image_size["h"]
    image_x    := Screen.w/2 - image_w/2
    image_y    := Screen.h/2 - image_h/2

    Gui, Destroy
    Gui, +AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale
    Gui, Margin, 1, 1
    Gui, Add, Picture, w%image_w% h%image_h%, %image%

    ; 页面索引
    if (hotkeys_total > 1) {
        Gui, font, s15, "Cascadia Code"
        Gui, Add, Text, w%image_w% +Center +Border, %hotkeys_index%/%hotkeys_total%
    }

    Gui, Show, Center NA
    hotkeys_show_status := True
}



HideShiftImage()
{
    Gui, Destroy
    hotkeys_show_status := False
    hotkeys_index       := 1
    hotkeys_total       := 1
    hotkeys_current     := []
}



; 展示图片切换上一个下一个
ChangeShiftImage(np:="")
{
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
