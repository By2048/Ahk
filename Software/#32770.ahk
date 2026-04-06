
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

    #IncludeAgain .\Microsoft\Explorer\Key.ahk
    #IncludeAgain .\Microsoft\Explorer\Key.Input.ahk

    er_32770_focus()
    {
        ControlFocus("Edit1", "A")
        Send "{End}^{Left}{Left}"
    }
    er_32770_rename()
    {
        name := ControlGetText("Edit1", "A")
        name := FileRename(name)
        ControlSetText(name, "Edit1", "A")
        ControlFocus("Edit1", "A")
        Send "{End}"
    }
    er_32770_move_to_default()
    {
        MoveWindowDefault()
        try {
            window := GetActiveWindowInfo(False)
            info := window.controls.DirectUIHWND2  ;左侧信息栏
            MoveControlUDLR(info, "Left", 300, 6)
        }
        Send "^!7"  ;平铺模式
    }
    er_32770_set_clipboard()
    {
        ControlSetText(A_Clipboard, "Edit1", "A")
    }

    Insert::er_32770_focus()
    +Insert::er_32770_rename()

    NumLock::Send "!s"
    NumpadHome::er_32770_rename()
    NumpadEnd::er_32770_set_clipboard()
    NumpadPgDn::ErSetPathNext()
    NumpadPgUp::ErSetPathPrev()
    NumpadIns::WinClose("A")
    NumpadDel::er_32770_move_to_default()

    MButton::WinClose("A")

    #\::er_32770_move_to_default()

    ![::ErActivateLeft()
    !]::ErActivateRight()
    !\::ErActivateMenu()

#HotIf
