
#If ( CheckWindowsActive("Everything") )

    <#\::
        MoveWindowsToDefaultPosition()
        global Windows_Cache
        win_id        := Windows_Cache["win_id"]
        control_name  := "SysListView321"
        control_value := { 1 : 900
                         , 2 : 850
                         , 3 : 200
                         , 4 : 250 }
        for key, value in control_value {
            key := key - 1
            SendMessage, %LVM_SETCOLUMNWIDTH%, %key%, %value%, %control_name%, ahk_id %win_id%    
        }
    Return

#If