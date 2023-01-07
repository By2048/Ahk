
#If CheckWindowActive("7-Zip")

    <#\::
        MoveWindowToDefaultPosition()
        index := " 1      2     3       4      5        "
        name  := " 名称   文件   文件夹   大小   修改时间   "
        ; 4K
        ; width := " 999    150   150     200    250      "
        ; 2K
        width := " 770    100   100     150    200      "
        config := GetColumnConfig(index, name, width)
        SetColumnWidth("SysListView321" , config)
    Return


    ; 注册表相关操作
    >!\::
        ; Clear History
        RegWrite, REG_BINARY, HKEY_CURRENT_USER, Software\7-Zip\FM, FolderHistory,
        RegWrite, REG_BINARY, HKEY_CURRENT_USER, Software\7-Zip\FM, CopyHistory,

        ; 默认列配置 Zip
        ; 其他列配置 Rar
        ; RegRead, default_columns_config, HKEY_CURRENT_USER\SOFTWARE\7-Zip\FM\Columns, 7-Zip.zip
        ; RegWrite, REG_BINARY, HKEY_CURRENT_USER, SOFTWARE\7-Zip\FM\Columns\, 7-Zip.Rar, %default_columns_config%

        HelpText("`nClear History`n", "Center", "Screen1", 1000)
    Return


    ; 选择所有
    >![::
        Sleep 500
        max_select := 19
        Loop, %max_select% {
            Send {RButton}
            Sleep 300
            Send {Down %A_Index%}
            Send {Enter}
        }
    Return


    ; 选择指定列
    >!]::
        Sleep 500
        all_select := [ 17, 18, 2, 4 ]
        for index, item in all_select {
            Send {RButton}
            Sleep 300
            Send {Down %item%}
            Send {Enter}
        }
    Return

#If
