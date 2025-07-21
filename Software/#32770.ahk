
RegisterPosition("_#32770"           , Position(1522 , 1122) )
RegisterPosition("_#32770_SaveFile"  , Position(1522 , 1122) )
RegisterPosition("_#32770_SaveVideo" , Position(1522 , 1122) )
RegisterPosition("_#32770_浏览"       , Position(1522 , 1122) )
RegisterPosition("_#32770_打开"       , Position(1522 , 1122) )
RegisterPosition("_#32770_另存为"     , Position(1522 , 1122) )
RegisterPosition("_#32770_打开文件"    , Position(1522 , 1122) )
RegisterPosition("_#32770_选择文件夹"  , Position(1522 , 1122) )
RegisterPosition("_#32770_浏览文件夹"  , Position(666 , 1122)  )
RegisterPosition("_#32770_浏览计算机"  , Position(666 , 1122)  )



#HotIf CheckWindowActive( "" , "#32770" , "确认另存为" )
    Insert::
    Enter::{
        Send "!y"
    }
    Esc::
    NumLock::
    Delete::{
        Send "!n"
    }
#HotIf



#HotIf CheckWindowActive( "" , "#32770" , "删除|删除文件|删除文件夹|删除多个项目|删除快捷方式|确认文件删除" )
    Delete::{
        Send "{Esc}"
    }
    Insert::{
        if ( CheckWindowActive("Explorer") ) {
            ErDelete()
            return
        }
        Send "{Enter}"
    }
    BackSpace::{
        if ( CheckWindowActive("Explorer") ) {
            ErDeleteForever()
            return
        }
        Send "{Esc}"
    }
#HotIf



#HotIf    CheckWindowActive( "" , "#32770" , "打开|打开文件|选择文件|选择文件夹" )
       || CheckWindowActive( "" , "#32770" , "更改图标|另存为|浏览" )
       || CheckWindowActive( "" , "#32770" , "SaveFile|SaveVideo" )
       || CheckWindowActive( "" , "#32770" , "图像另存为" )
       
    #IncludeAgain .\Microsoft\Explorer\Key\Base.ahk
    #IncludeAgain .\Microsoft\Explorer\Key\Date.ahk
    
    MButton::WinClose("A")

    ; 文件名修改框
    Insert::{
        ControlFocus("Edit1", "A")
        Send "{End}^{Left}{Left}"
    }

    NumLock::{
        name := ControlGetText("Edit1", "A")
        name := StrReplace(name, "  " , " ")
        name := StrReplace(name, "  " , " ")
        name := StrReplace(name, "  " , " ")
        name := Trim(name)
        ControlSetText(name, "Edit1", "A")
        Send "!s"
    }

    CapsLock::
    NumpadHome::{
        name := ControlGetText("Edit1", "A")

        name := FileRename(name)
        ; 
        name := StrReplace(name, "#", " ")
        name := StrReplace(name, "@", " ")
        name := StrReplace(name, "|", " ")
        name := StrReplace(name, "\", " ")
        name := StrReplace(name, "/", " ")
        name := StrReplace(name, ":", " ")
        ; 
        name := name . " "
        ; 
        ControlSetText(name, "Edit1", "A")
        ControlFocus("Edit1", "A")
        Send "{End}"
    }
    NumpadEnd::ControlSetText(A_Clipboard, "Edit1", "A")

    NumpadPgDn::ErSetPathNext()
    NumpadPgUp::ErSetPathPrev()

    ![::ErActivateLeft()
    !]::ErActivateRight()
    !\::ErActivateMenu()

    NumpadIns::WinClose("A")

    ; 默认位置
    NumpadDel::
    #\::{
        MoveWindowDefault()
        try {
            window := GetActiveWindowInfo(False)
            info := window.controls.DirectUIHWND2  ;左侧信息栏
            MoveControlUDLR(info, "Left", 300, 6)
        } catch {
            return
        }
        Send "^!7"  ;平铺模式
    }

#HotIf
