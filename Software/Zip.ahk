
#If ( CheckWindowsActive( "Zip" ) )

    <#\::
        MoveWindowsToDefaultPosition()
        win_id        := Windows_Cache["win_id"]
        control_name  := "SysListView321"
        control_value := { 1 : 999   ;名称
                         , 2 : 150   ;大小 
                         , 3 : 150   ;文件夹
                         , 4 : 200   ;大小
                         , 5 : 250 } ;修改时间

        for key, value in control_value {
            key := key - 1
            SendMessage, %LVM_SETCOLUMNWIDTH%, %key%, %value%, %control_name%, ahk_id %win_id%
        }
    Return

#If
