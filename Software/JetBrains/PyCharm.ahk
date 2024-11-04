
#Include Tool.ahk

#Include PyCharm.Cfg.ahk
#Include PyCharm.Env.ahk
#Include PyCharm.Win.ahk


#HotIf CheckWindowActive( "PyCharm" )

    Arg.alt_appskey := False
    !AppsKey::{
        if ( Arg.alt_appskey ) {
            Send "{Esc}"
            Arg.alt_appskey := False
        } else {
            Send "!{AppsKey}"
            CenterHideWindow()
            Arg.alt_appskey := True
        }
    }

    ~^o::CenterHideWindow()  ;最近的项目
    ~^+o::CenterHideWindow() ;打开文件或项目
    ~^n::CenterHideWindow()         ;新建文件
    ~^+n::CenterHideWindow(400,800) ;新建临时文件

    <#\::MoveWindowDefault()
    <#+\::MoveWindowBackup()

    <#0::Send "^!{NumpadMult}"  ;编辑页 重置
    <#-::Send "^!{NumpadSub}"   ;编辑页 减小
    <#=::Send "^!{NumpadAdd}"   ;编辑页 增加
    <#+0::Send "^!+{NumpadMult}" ;IDE 重置
    <#+-::Send "^!+{NumpadSub}"  ;IDE 减小
    <#+=::Send "^!+{NumpadAdd}"  ;IDE 增加

    #Enter::Send "^!NumpadDiv"   ;窗口全屏
    #+Enter::Send "^!+NumpadDiv" ;Zen模式

    <^Esc::Send "^{Pause}"
    <!Esc::Send "!{Pause}"
    <+Esc::Send "+{Pause}"
    <^+Esc::Send "^+{Pause}"
    <!+Esc::Send "!+{Pause}"

    ;标签页管理
    ^Tab::Return
    ^+Tab::Return
    <!Tab::Send "^{Tab}"
    <!+Tab::Send "^+{Tab}"

    #IncludeAgain *i %A_InitialWorkingDir%\Key\Replace.ahk

    #Include Key.ahk
    #Include Key.CapsLock.ahk
    #Include Key.Fxx.ahk

#HotIf
