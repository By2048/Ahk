
RegisterSoftware( "7zFM" , "ZipMain"   )
RegisterSoftware( "7zG"  , "ZipDialog" )

RegisterHelpInfo("Zip", FilePath(A_LineFile, "Zip.help"))

#Include    Zip.Tool.ahk
#Include *i Zip.Private.ahk



#HotIf CheckWindowActive( "ZipDialog" , "#32770" , "浏览文件夹" )
    \::Send "{Esc}"
#HotIf


#HotIf    CheckWindowActive( "ZipDialog" , "#32770" , "解压*" )
       || CheckWindowActive( "ZipMain"   , "#32770" , "复制*" )

    ; 切换输入框
    Insert::{
        contro_name := ControlGetClassNN(ControlGetFocus("A"))
        ; Edit1 文件夹路径
        ; Edit2 文件夹名字
        ; Edit3 密码
        if ( contro_name == "Edit1" ) {
            ControlFocus("Edit2", "A") 
            Send "{End}{Left}"
        } else if ( contro_name == "Edit2" ) {
            ControlFocus("Edit3", "A")
        } else if ( contro_name == "Edit3" ) {
            ControlFocus("Edit1", "A") 
            Send "{End}"
        } else {
            ControlFocus("Edit2", "A") 
            Send "{End}{Left}"
        }
    }
    
    `;::ZipSetPath(Folders.Temp)
     '::ZipSetPath(Folders.Ram )

    [::ZipSetPathPrev()

    ]::ZipSetPathNext()
    
    ; 浏览文件夹
     \::ControlClick("Button1", "A")
    +\::Send "丨"

    ^+c::{
        name := ControlGetText("Edit2", "A")
        A_Clipboard := name
        ClipWait(1)
        HelpText(name, "CenterDown", "Screen", 666)
    }

     F1::
     F2::
     F3::
     F4::
     F5::
     F6::
     F8::
     F7::
     F9::
    F10::
    F11::
    F12::
     !`:: 
     !1:: 
     !2:: 
     !3:: 
     !4:: 
     !5:: 
     !6:: 
     !7:: 
     !8:: 
     !9:: 
     !0:: 
     !-:: 
     !=:: 
     !,:: 
     !.:: 
     !/::
    CapsLock:: {
        SetEditPrefix("Edit2")
    }

    #Include *i Zip.Joy.ahk

#HotIf


#HotIf CheckWindowActive( "ZipMain" , "*FM*" , "*我的电脑*" )
    #\::{
        MoveWindowPosition(Position(1100 , 1000))
        cfg := " 1:名称:100  5:卷标:100  4:类型:100  6:文件系统:100  7:簇大小:100  3:可用空间:200  2:总大小:200 "
        cfg := " 1:名称:150  2:卷标:140  3:类型:100  4:文件系统:100  5:簇大小:100  6:可用空间:233  7:总大小:233 "
        SetColumnWidth("SysListView321", GetColumnConfig(cfg))
    }
#HotIf


#HotIf CheckWindowActive( "ZipMain | ZipDialog" , "#32770" , "属性" )
    #\::{
        MoveWindowPosition(Position(650, 900))
        SetColumnWidth("SysListView321", Map( 1,150 , 2,420 ))
    }
#HotIf


#HotIf CheckWindowActive( "ZipMain | ZipDialog" )

    ZipGuiInit() {
        if ( InStr(window.title, "确认文件替换") ) {
            MoveWindowPosition( Position(820,588) )
            ctl_rename := "Button3"
            ctl_all_no := "Button5"
            ctl_cancel := "Button6"
            ; 
            ControlGetPos(&x, &y, &w, &h, ctl_rename, "A")
            ControlMove(x,  , w, h, ctl_cancel, "A")
            ; 
            ControlFocus(ctl_cancel, "A")
            ControlSend("{Tab}", ctl_all_no, "A")
        }

        if ( InStr(window.title, "解压") ) {
            ZipSetGuiPos()
            ZipSetGuiText()
            return
        }
    }

    ~Enter::{
        if ( InStr(window.title, "正在解压") ) {
            ControlClick("Button3", "A") 
        } else if ( InStr(window.title, "解压") ) {
            ControlClick("Button7", "A") ;确认解压
        } else {
            Send "{Enter}"
        }
        Sleep 333
        Try ZipGuiInit()
    }

    RWin::{
        ZipGuiInit()
    }

#HotIf


#HotIf CheckWindowActive( "ZipMain" )

    NumLock::
    !CapsLock::{
        Send "{Blind}{vkFF}"
        WinClose("A")
    }

    BackSpace::{
        Send "{Blind}{vkFF}"
        if ( InStr(A_PriorHotkey , A_ThisHotkey) && ( A_TimeSincePriorHotkey < 456 ) )
            WinClose("A")
    }

    #\::{
        MoveWindowPosition(Position(1100 , 1000))
        cfg := " 1:名称:666  3:文件夹:100  2:文件:100  4:大小:159 "
        if ( InStr(window.title, ".iso") )
            cfg := " 1:名称:666  2:文件夹:100  3:文件:100  4:大小:159 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321", cfg)
    }

    ; 注册表相关操作 Clear History
    >!/::{
        RegWrite("", "REG_BINARY", "HKEY_CURRENT_USER\SOFTWARE\7-Zip\Compression", "ArcHistory"   )
        RegWrite("", "REG_BINARY", "HKEY_CURRENT_USER\SOFTWARE\7-Zip\Extraction",  "PathHistory"  )
        RegWrite("", "REG_BINARY", "HKEY_CURRENT_USER\Software\7-Zip\FM",          "FolderHistory")
        RegWrite("", "REG_BINARY", "HKEY_CURRENT_USER\Software\7-Zip\FM",          "CopyHistory"  )
        HelpText("`n  Clear History  `n", "Center", "Screen", 1000)
    }

    ; 选择所有
    >![::{
        Sleep 300

        win_title := WinGetTitle("A")
        if ( InStr(win_title, "rar") )
            max_select := 24
        else if ( InStr(win_title, "7z") )
            max_select := 11
        else
            max_select := 19

        Loop max_select {
            Send "{RButton}"
            Sleep 300
            Send Format("{Down {1}}", A_Index)
            Send "{Enter}"
        }
    }

    ; 选择指定列
    >!]::{
        Sleep 300

        win_title := WinGetTitle("A")
        if ( InStr(win_title, "rar") )
            all_select := [ 21, 22, 2 ]
        else
            all_select := [ 17, 18, 2 ]

        for index, item in all_select {
            Send "{RButton}"
            Sleep 300
            Send Format("{Down {1}}", item)
            Send "{Enter}"
        }
    }

#HotIf
