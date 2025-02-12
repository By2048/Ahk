
RegisterSoftware( "7zFM" , "ZipMain"   )
RegisterSoftware( "7zG"  , "ZipDialog" )

RegisterHelpInfo("Zip", FilePath(A_LineFile, "Zip.help"))


UnZipPath := [ "T:\" , "V:\#\" ]


#Include *i Zip.Private.ahk


ZipSetPath(path) {
    ControlSetText(path, "Edit1", "A")
}
ZipSetPathPrev() {
    path := ControlGetText("Edit1", "A")
    path := LoopList(UnZipPath, &path, -1)
    ZipSetPath(path)
}
ZipSetPathNext() {
    path := ControlGetText("Edit1", "A")
    path := LoopList(UnZipPath, &path, +1)
    ZipSetPath(path)
}


#HotIf CheckWindowActive( "ZipDialog" , "#32770" , "浏览文件夹" )
    \::Send "{Esc}"
#HotIf


#HotIf CheckWindowActive( "ZipDialog" , "#32770" , "*解压*" )

    ; 浏览文件夹
    \::ControlClick("Button1", "A")
    
    ; 切换输入框
    Insert::{
        contro_name := ControlGetClassNN(ControlGetFocus("A"))
        if ( contro_name == "Edit1" )
            ControlFocus("Edit2", "A")
        else if ( contro_name == "Edit2" )
            ControlFocus("Edit3", "A")
        else if ( contro_name == "Edit3" )
            ControlFocus("Edit1", "A")
        else
            ControlFocus("Edit2", "A")
    }
    
    ; 确认解压
    Enter::ControlClick("Button7", "A")
    
    `;::ZipSetPath("V:\#\")
     '::ZipSetPath("T:\"  )

    [::ZipSetPathPrev()

    ]::ZipSetPathNext()

    AppsKey::{
        WinClose("A")
        Send "{Esc}"
    }
     
    #Include *i Zip.Joy.ahk

#HotIf


#HotIf CheckWindowActive( "ZipMain" , "#32770" , "复制" )
     [::ZipSetPathPrev()
     ]::ZipSetPathNext()
    `;::ZipSetPath("V:\#\")
     '::ZipSetPath("T:\"  )
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


#HotIf CheckWindowActive( "ZipMain" )

    ~NumLock::WinClose("A")
    Numpad3::WinClose("A")

    #\::{
        MoveWindowPosition(Position(1100 , 1000))
        cfg := " 1:名称:700  3:文件夹:100  2:文件:100  4:大小:140 "
        if InStr(window.title, ".iso")
            cfg := " 1:名称:700  2:文件夹:100  3:文件:100  4:大小:140 "
        cfg := GetColumnConfig(cfg)
        SetColumnWidth("SysListView321", cfg)
    }

    ; 注册表相关操作 Clear History
    >!\::{
        RegWrite("", "REG_BINARY", "HKEY_CURRENT_USER\SOFTWARE\7-Zip\Compression", "ArcHistory"   )
        RegWrite("", "REG_BINARY", "HKEY_CURRENT_USER\SOFTWARE\7-Zip\Extraction",  "PathHistory"  )
        RegWrite("", "REG_BINARY", "HKEY_CURRENT_USER\Software\7-Zip\FM",          "FolderHistory")
        RegWrite("", "REG_BINARY", "HKEY_CURRENT_USER\Software\7-Zip\FM",          "CopyHistory"  )
        HelpText("`n Clear History `n", "Center", "Screen", 1000)
        ; 默认列配置 Zip
        ; 其他列配置 Rar
        ; RegRead, default_columns_config, HKEY_CURRENT_USER\SOFTWARE\7-Zip\FM\Columns, 7-Zip.zip
        ; RegWrite, REG_BINARY, HKEY_CURRENT_USER, SOFTWARE\7-Zip\FM\Columns\, 7-Zip.Rar, %default_columns_config%
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
