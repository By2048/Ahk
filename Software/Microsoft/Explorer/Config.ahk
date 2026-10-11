
Explorer :=
{
    Pos : {
        check_offset  : 30    ,
        tree_width    : 325   ,
        input_width   : 209   ,
        total_height  : 1250  ,
        total_width   : 1534  ,
    },

    Ctl : {
        Tree : "SysTreeView321" ,
        Main : "DirectUIHWND3" ,
    },

    ; 快速切换地址栏路径
    Address : [ LN("Temp") , LN("Cache") ] ,
}


ErQuickCfg :=
{
    show    : False ,
    page    : 0     ,
    folder  : ""    ,

    paths   : []  ,  ; 快速移动路径
    command : ""  ,  ; 快速命令

    path_focus   : "" ,
    path_selects : "" ,
    path_folder  : "" ,
    file_name    : "" ,
    file_rename  : "" ,

    margin_x : 19 ,
    margin_y : -4 ,

    folder_size : 13 ,
    title_size  : 9  ,
    rename_size : 11 ,

    font_name  : "Verdana"  ,
    font_color : "000000" ,
    back_color : "ffffff" ,

    select_fore : "bdbebd" ,
    select_back : "f0f0f0" ,

    line  : "--------------------------------------------------" ,
    info  : "----------------------{----}----------------------"
}

ErQuickCfg.width := StrLen(ErQuickCfg.line) * 8


#Include *i Config.Private.ahk
