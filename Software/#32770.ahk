
RegisterPosition("_#32770"           , Position(1522 , 1122) )
RegisterPosition("_#32770_SaveFile"  , Position(1522 , 1122) )
RegisterPosition("_#32770_浏览"       , Position(1522 , 1122) )
RegisterPosition("_#32770_打开"       , Position(1522 , 1122) )
RegisterPosition("_#32770_另存为"     , Position(1522 , 1122) )
RegisterPosition("_#32770_打开文件"   , Position(1522 , 1122) )
RegisterPosition("_#32770_选择文件夹"  , Position(1522 , 1122) )
RegisterPosition("_#32770_浏览文件夹"  , Position(666 , 1122) )
RegisterPosition("_#32770_浏览计算机"  , Position(666 , 1122) )



#HotIf    CheckWindowActive( "" , "#32770" , "打开|打开文件|选择文件|选择文件夹" )
       Or CheckWindowActive( "" , "#32770" , "更改图标|另存为|浏览" )
       Or CheckWindowActive( "" , "#32770" , "SaveFile|SaveVideo" )

    #IncludeAgain .\Microsoft\Explorer.Key.ahk

    ; ^Tab::Return
    ; ^+Tab::Return
    ; !Tab::Send "^{Tab}"
    ; !+Tab::Send "^+{Tab}"
    ; ~!CapsLock::Send "!{F4}"

    ; 文件名修改框
    ~CapsLock::ControlFocus("Edit1", "A")

    ~NumLock::WinClose("A")

    NumpadHome::{
        old_name := ControlGetText("Edit1", "A")
        new_name := StrReplace(old_name, "#", "")
        new_name := StrReplace(new_name, "|", " ")
        new_name := StrReplace(new_name, "video_", "")
        new_name := StrReplace(new_name, "  ", " ")
        ControlSetText(new_name, "Edit1", "A")
    }
    NumpadEnd::Send "!s"

    NumpadPgdn::Send "^v"


    ![::ControlFocus("SysTreeView321", "A")
    !]::{
        ControlFocus("DirectUIHWND2", "A")
        Send "{Space}"
    }

    ; 默认位置
    #\::{
        MoveWindowDefault()
        GetActiveWindowInfo(False)
        try {
            info := window.controls.DirectUIHWND2  ;左侧信息栏
        } catch {
            return
        }
        MoveControlUDLR(info, "Left", 300, 6)
        Send "^!7"  ;平铺模式
    }

#HotIf
