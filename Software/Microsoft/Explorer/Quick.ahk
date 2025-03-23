
Arg.ErQuick :=
{
    show    : False ,
    page    : 1     ,
    folder  : ""    ,
    command : ""    ,

    margin_x : 19 ,
    margin_y : -4 ,

    folder_size : 13 ,
    title_size  : 9  ,
    
    font_name  : "Verdana"  ,
    font_color : "000000" ,
    back_color : "ffffff" ,

    select_fore : "bdbebd" ,
    select_back : "f0f0f0" ,

    line  : "--------------------------------------------------" ,
    info  : "----------------------{____}----------------------"
}


Arg.ErQuick.width := StrLen(Arg.ErQuick.line) * 8


#Include Quick.Gui.ahk
#Include Quick.Tool.ahk
