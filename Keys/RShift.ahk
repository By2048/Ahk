#SingleInstance Force
#NoTrayIcon


if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}


global hotkeys:={} ; 快捷键图片集合
global hotkeys_show_status:=False ; 当前是否显示图片
global hotkeys_index:=1 ; 当前显示图片的序号
global hotkeys_total:=1 ; 当前展示图片组的数量

hotkeys["default"]:=["Windows.png","Windows-1.png"]
hotkeys["Windows"]:=hotkeys["default"]

hotkeys["Code.exe"]:=["VSCode.png","VSCode-1.png"]
hotkeys["VSCode"]:=hotkeys["Code.exe"]

hotkeys["Xshell.exe"]:=["XShell.png"]
hotkeys["XShell"]:=hotkeys["Xshell.exe"]

hotkeys["SumatraPDF"]:=["SumatraPDF.png"]
hotkeys["SumatraPDF.exe"]:=hotkeys["SumatraPDF"]

hotkeys["pycharm64.exe"]:=["PyCharm.png","PyCharm-1.png"]
hotkeys["PyCharm"]:=hotkeys["pycharm64.exe"]

hotkeys["QuiteRSS.exe"]:=["QuiteRSS.png"]
hotkeys["QuiteRSS"]:=hotkeys["QuiteRSS.exe"]

hotkeys["chrome.exe"]:=["Chrome.png","Chrome-1.png"]
hotkeys["Chrome"]:=hotkeys["chrome.exe"]

hotkeys["PotPlayerMini64.exe"]:=["PotPlayer.png"]
hotkeys["PotPlayer"]:=hotkeys["PotPlayerMini64.exe"]

hotkeys["cloudmusic.exe"]:=["CloudMusic.png"]
hotkeys["CloudMusic"]:=hotkeys["cloudmusic.exe"]

hotkeys["Title_Chrome_Bilibili"]:=["Chrome-Bilibili.png"]



; 快捷键帮助 获取需要展示的图片
get_image() 
{
    global hotkeys
    global hotkeys_index
    global hotkeys_total

    result:=hotkeys["default"]

    ; 优先根据应用名进行查找
    for exe, image in hotkeys {
        if WinActive("ahk_exe"+exe) {
            result:=image
        }
    }

    ; 根据应用显示的标题进行查找
    WinGetTitle, title, A
    if WinActive("ahk_exe chrome.exe") and InStr(Title,"bilibili") {
        result:=hotkeys["Title_Chrome_Bilibili"]
    }

    hotkeys_total:=result.MaxIndex()
    if (hotkeys_index>hotkeys_total) {
        hotkeys_index:=1
    } 
    if (hotkeys_index<=0) {
        hotkeys_index:=hotkeys_total
    }

    result:=result[hotkeys_index]
    result=%A_WorkingDir%\Image\Hotkey\%result%
    return result
}



show_image()
{
    global hotkeys_show_status
    global hotkeys_index
    global hotkeys_total

    image:=get_image()
    SplashImage, %image%, B1
    hotkeys_show_status:=True

    if (hotkeys_total>1) {
        w:=100
        h:=50    
        x:=A_ScreenWidth/2-w/2
        y:=A_ScreenHeight-h-5
        Progress, b fs15 zh0 x%x% y%y% w%w%, %hotkeys_index%/%hotkeys_total%
    }

    ; 显示后额外操作
    If WinActive("ahk_exe pycharm64.exe") {
        Send, {Esc} ;关闭因双击Shift打开的快速搜索界面
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

    If WinActive("ahk_exe pycharm64.exe") {
        Send, {Esc} ;关闭因双击Shift打开的快速搜索界面
    }
}



; 展示图片切换上一个下一个
change(np:="")
{
    global hotkeys
    global hotkeys_index
    global hotkeys_total
    global hotkeys_show_status

    if (hotkeys_total=1) {
        return
    }
    if (np="next") {
        hotkeys_index:=hotkeys_index+1
    }
    if (np="privious") {
        hotkeys_index:=hotkeys_index-1
    }
    show_image()
}



~RShift::
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
    }
    cnt:=0
return



#if (hotkeys_show_status=True)
    [::change("privious")
    ]::change("next")
#if


