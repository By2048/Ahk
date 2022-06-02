
#If CheckWindowsActive("7-Zip")

    <#\::
        MoveWindowsToDefaultPosition()
        
        _id    := window.win_id
        _name  := "SysListView321"
        _width := { 1 : 999   ;名称
                  , 3 : 150   ;文件夹
                  , 2 : 150   ;文件
                  , 4 : 200   ;大小
                  , 5 : 230 } ;修改时间
        SetColumnWidth(_id, _name, _width)
    Return


    ; 注册表相关操作
    !/::
        ; Clear History
        RegWrite, REG_BINARY, HKEY_CURRENT_USER, Software\7-Zip\FM, FolderHistory, 
        RegWrite, REG_BINARY, HKEY_CURRENT_USER, Software\7-Zip\FM, CopyHistory,   

        ; 默认列配置 Zip
        ; 其他列配置 Rar
        ; RegRead, default_columns_config, HKEY_CURRENT_USER\SOFTWARE\7-Zip\FM\Columns, 7-Zip.zip
        ; RegWrite, REG_BINARY, HKEY_CURRENT_USER, SOFTWARE\7-Zip\FM\Columns\, 7-Zip.Rar, %default_columns_config%

        HelpText("Clear History", "center_down", "screen1", 1000)
    Return


    ; 选择所有
    !F11::
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
    !F12::
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
