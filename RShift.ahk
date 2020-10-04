#Include %A_ScriptDir%\Tool.ahk
#SingleInstance Force
#NoTrayIcon



global hotkeys:={} ; 快捷键图片集合
global windows:=False ; 当前是否显示图片
global index:=1 ; 当前显示图片的序号
global total:=1 ; 当前展示图片组的数量


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
hotkeys["Chrome_Bilibili"]:=["Chrome-Bilibili.png"]


hotkeys["PotPlayerMini64.exe"]:=["PotPlayer.png"]
hotkeys["PotPlayer"]:=hotkeys["PotPlayerMini64.exe"]

hotkeys["cloudmusic.exe"]:=["CloudMusic.png"]
hotkeys["CloudMusic"]:=hotkeys["cloudmusic.exe"]



; 快捷键帮助 获取需要展示的图片
get_image() 
{
    global index
    global hotkeys
    global total

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
        result:=hotkeys["Chrome_Bilibili"]
    }

    total:=result.MaxIndex()
    if (index>total) {
        index:=1
    } 
    if (index<=0) {
        index:=total
    }

    result:=result[index]
    result=%A_ScriptDir%\Image\Hotkey\%result%
    return result
}



show_image()
{
    global windows
    global total

    windows:=True
    image:=get_image()
    SplashImage, %image%, B1

    if (total>1) {
        w:=100
        h:=50    
        x:=A_ScreenWidth/2-w/2
        y:=A_ScreenHeight-h-5
        Progress, b fs15 zh0 x%x% y%y% w%w%, %index%/%total%
    }

    ; 显示后额外操作
    If WinActive("ahk_exe pycharm64.exe") {
        Send, {Esc} ;关闭因双击Shift打开的快速搜索界面
    }
}



hide_image()
{
    global windows
    global index

    windows:=False
    index:=1 

    SplashImage, Off
    Progress, Off

    If WinActive("ahk_exe pycharm64.exe") {
        Send, {Esc} ;关闭因双击Shift打开的快速搜索界面
    }
}



; 展示图片切换上一个下一个
change(np:="")
{
    global index
    global total

    if (total==1) {
        return
    }

    if (np="next") {
        index:=index+1
    }
    if (np="privious") {
        index:=index-1
    }
    show_image()
}



~RShift::
    if (not cnt) {
        cnt:=1
    } else {
        cnt+=1
    }
    SetTimer, timer, -700
return



timer:
    if (cnt=1) {
        hide_image()
    }
    if (cnt=2) {
        show_image()
    }
    cnt:=0
return



#if (windows=True)
    [::change("privious")
    ]::change("next")
#if


