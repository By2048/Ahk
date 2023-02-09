
#Include %A_InitialWorkingDir%\Tool\Gui.ahk


>+`;::Send ":"
>+'::Send "`""


cnt := 0
$RShift::{
    global cnt
    if (cnt > 0) {
        cnt += 1
        HelpText("RShift " . cnt, "Center", "Screen" . Screens.Count)
        return
    } else {
        cnt := 1
        HelpText("RShift " . cnt, "center", "Screen" . Screens.Count)
    }
    SetTimer ShiftTimer, -333
}
ShiftTimer() {
    global cnt
    if (cnt == 1) {
        HelpText()
        HideShiftImage()
    } else if (cnt == 2) {
        HelpText()
        ShowShiftImage()
    } else if (cnt == 3) {
        GetInitConfig()
        ShowInitConfig()
    }
    cnt := 0
}



hotkeys_images  := Map() ; 软件图片对应关系
hotkeys_current := []    ; 当前显示的图片组
hotkeys_index   := 0     ; 显示图片的序号


InitImageConfig()
{
    global hotkeys_images
    if (hotkeys_images.Count > 0) {
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
    file  := A_LineFile
    slice := [ A_LineNumber - 13 , A_LineNumber - 2 ]
    data  := ReadConfig(file, slice)
    data  := StrSplit(data, "`n")
    for index, item in data {
        item  := StrSplit(item, ":")
        key   := item[1]
        value := item[2]
        key   := StrReplace(key, " ", "")
        value := StrReplace(value, " ", "")
        value := StrSplit(value, ",")
        hotkeys_images[key] := value
    }
}


; 获取需要展示的图片
GetShiftImage()
{
    InitImageConfig()
    GetActiveWindowInfo()

    global window
    global hotkeys_images, hotkeys_current, hotkeys_index

    win_process_name := window.process_name
    win_title        := window.title
    hotkeys_current  := GetWindowConfig(window, hotkeys_images)

    if (hotkeys_index > hotkeys_current.Length) {
        hotkeys_index := 1
    } else if (hotkeys_index <= 0) {
        hotkeys_index := hotkeys_current.Length
    }

    result := hotkeys_current[hotkeys_index]
    result := A_InitialWorkingDir . "\Image\RShift\" . result
    A_Debug.rshift_image := result
    return result
}


ShowShiftImage()
{
    image := GetShiftImage()
    if (not image) {
        return
    }

    image_size := GetImageSize(image)
    image_w    := image_size.w
    image_h    := image_size.h
    image_x    := Screen.x + Screen.w/2 - image_w/2
    image_y    := Screen.y + Screen.h/2 - image_h/2

    global GSI
    global hotkeys_current, hotkeys_index

    try {
        win_id := GSI.Hwnd
        GSI.Destroy()
    }

    GSI := Gui()
    GSI.Opt("+AlwaysOnTop +Disabled +Owner -SysMenu -Caption -DPIScale")
    GSI.MarginX := 1
    GSI.MarginY := 1
    GSI.Add("Picture", Format("vPicture w{1} h{2}", image_w, image_h), image)

    ; 页面索引
    if (hotkeys_current.Length > 1) {
        GSI.SetFont("s15", "Cascadia Code")
        text := hotkeys_index . "/" . hotkeys_current.Length
        GSI.Add("Text", Format("+Center +Border w{}", image_w), text)
    }
    GSI.Show("NA Center")
}


HideShiftImage()
{
    global GSI
    try {
        GSI.Destroy()
    }
    hotkeys_index   := 0
    hotkeys_current := []
}


; 展示图片切换上一个下一个
ChangeShiftImage(np:="")
{
    global hotkeys_current, hotkeys_index
    if (hotkeys_current.Length == 1) {
        return
    }
    if (np == "+") {
        hotkeys_index := hotkeys_index + 1
    } else if (np == "-") {
        hotkeys_index := hotkeys_index - 1
    }
    ShowShiftImage()
}


#HotIf ( hotkeys_index != 0 )
    [::ChangeShiftImage("-")
    ]::ChangeShiftImage("+")
    Insert::HideShiftImage()
    Delete::{
        global hotkeys_current, hotkeys_index
        image := hotkeys_current[hotkeys_index]
        image := A_InitialWorkingDir . "\Image\RShift\" . image
        SnipasteImage(image, "Screen")
        SetTimer HideShiftImage, -300
    }
#HotIf
