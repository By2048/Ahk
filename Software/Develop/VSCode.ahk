
RegisterProcess( "Code" , "VSCode" )

RegisterHelp( "VSCode" , FilePath(A_LineFile, "VSCode.help")     )
RegisterHelp( "VSCode" , FilePath(A_LineFile, "VSCode.Fxx.help") )

RegisterPosition( "VSCode" , Position(-6 , -6) , "Default" )
RegisterPosition( "VSCode" , Position("[Center][2]" , -10 , 1600) , "Backup"  )


; 快捷键设置
#HotIf CheckWindowActive( "VSCode" , "" , "*User\KeyBindings.json | *键盘快捷方式" )

    RShift::HelpFile("Software\Microsoft\VSCode.Setting.help")

#HotIf


#HotIf CheckWindowActive( "VSCode" , "" , " *.sql | *.ps1 | *.md " )

    #IncludeAgain *i %A_InitialWorkingDir%\Key\Reset.ahk

#HotIf


#HotIf CheckWindowActive( "VSCode" , "#32770" , "VisualStudioCode" )
    Insert::{
        win_text := WinGetText("A")
        if ( InStr(win_text, "移动到回收站") )
            Send "!m"
    }
    Delete::{
        win_text := WinGetText("A")
        if ( InStr(win_text, "移动到回收站") )
            Send "{Esc}"
    }
#HotIf


#HotIf CheckWindowActive("VSCode")

    #IncludeAgain *i %A_InitialWorkingDir%\Key\Replace.ahk

    ; ~*LShift::{
    ;     if InStr(A_PriorHotkey, "LShift")
    ;         if ( A_TimeSincePriorHotkey < 333 ) {
    ;             Send "^+/"
    ;             CapsLockToEsc := True
    ;         }
    ; }

    ; ~*LCtrl::{
    ;     if InStr(A_PriorHotkey, "LCtrl")
    ;         if ( A_TimeSincePriorHotkey < 333 ) {
    ;             Send "!+/"
    ;             CapsLockToEsc := True
    ;         }
    ; }

    ; 切换标签页
    !Tab::Send "^{Tab}"
    !+Tab::Send "^+{Tab}"

    ; 关闭标签页
    ^CapsLock::Return
    ^+CapsLock::Return
    ~!CapsLock::Send "^{CapsLock}"
    ~!+CapsLock::Send "^+{CapsLock}"

    ; 特殊按键覆盖 F4
    !F4::Send "!{F16}"
    !+F4::Send "!+{F16}"

    ;窗口全屏
    #Enter::{
        Send "^!{NumLock}"
        SetNumLockState "Off"
    }
    ;窗口全屏选项
    #+Enter::{
        Send "^!+{NumLock}"
        SetNumLockState "Off"
    }

    ; 命令 / 文件
    >^Space::Send "^+/"
    >!Space::Send "!+/"

    ; 项目 结构
    ~CapsLock & [::{
        if !GetKeyState("LShift", "P")
            Send "^!["
        else
            Send "^!+["
    }
    ~CapsLock & ]::{
        if !GetKeyState("LShift", "P")
            Send "^!]"
        else
            Send "^!+]"
    }

    ; 窗口大小调整
    ~CapsLock & Left:: Send "^!{Left}"
    ~CapsLock & Right::Send "^!{Right}"
    ~CapsLock & Up::   Send "^!{Up}"
    ~CapsLock & Down:: Send "^!{Down}"

    ; 代码注释
    LAlt & RShift::{
        if !GetKeyState("LShift", "P")
            Send "^\"
        else
            Send "^+\"
    }

    ; 切换编辑器焦点
    RAlt & RShift::Send "{F15}"
    RShift & RAlt::Send "+{F15}"

#HotIf


#Include *i VSCode.Private.ahk
