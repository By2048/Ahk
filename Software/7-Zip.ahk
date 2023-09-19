
#HotIf CheckWindowActive("7-Zip", "#32770", "属性")

    <#\::{
        MoveWindowToPosition(Position(650, 900))
        SetColumnWidth("SysListView321", Map( 1,150 , 2,420 ))
    }

#HotIf


#HotIf CheckWindowActive("7-Zip")

    <#\::{
        MoveWindowToPosition(Position(1100 , 1000))
        index := " 1     3      2    4   "
        name  := " 名称  文件夹  文件  大小 "
        width := " 700   100    100  140 "
        win_title := window.title
        if (InStr(win_title, ".iso")) {
            index := " 1     4      3    2   "
            name  := " 名称  文件夹  文件  大小 "
            width := " 700   100    100  140 "
        }
        config := GetColumnConfig(index, name, width)
        SetColumnWidth("SysListView321", config)
    }

    ; 注册表相关操作
    >!\::{
        ; Clear History
        RegWrite "", "REG_BINARY", "HKEY_CURRENT_USER\Software\7-Zip\FM", "FolderHistory"
        RegWrite "", "REG_BINARY", "HKEY_CURRENT_USER\Software\7-Zip\FM", "CopyHistory"
        HelpText("`nClear History`n", "Center", "Screen", 1000)

        ; 默认列配置 Zip
        ; 其他列配置 Rar
        ; RegRead, default_columns_config, HKEY_CURRENT_USER\SOFTWARE\7-Zip\FM\Columns, 7-Zip.zip
        ; RegWrite, REG_BINARY, HKEY_CURRENT_USER, SOFTWARE\7-Zip\FM\Columns\, 7-Zip.Rar, %default_columns_config%
    }

    ; 选择所有
    >![::{
        Sleep 300

        win_title := WinGetTitle("A")
        if InStr(win_title, "rar")
            max_select := 24
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
        if InStr(win_title, "rar")
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
