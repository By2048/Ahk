
RegisterPosition("_#32770"           , Position(1522 , 1122) )
RegisterPosition("_#32770_SaveFile"  , Position(1522 , 1122) )
RegisterPosition("_#32770_SaveVideo" , Position(1522 , 1122) )
RegisterPosition("_#32770_浏览"       , Position(1522 , 1122) )
RegisterPosition("_#32770_打开"       , Position(1522 , 1122) )
RegisterPosition("_#32770_另存为"     , Position(1522 , 1122) )
RegisterPosition("_#32770_打开文件"   , Position(1522 , 1122) )
RegisterPosition("_#32770_选择文件夹"  , Position(1522 , 1122) )
RegisterPosition("_#32770_浏览文件夹"  , Position(666 , 1122) )
RegisterPosition("_#32770_浏览计算机"  , Position(666 , 1122) )



#HotIf CheckWindowActive( "" , "#32770" , "*删除*" )
    Delete::Send "{Esc}"
    Insert::{
        win := GetActiveWindowInfo()
        if ( win.process_name == "Explorer" ) {
            Send "!y"
            Sleep 99
            Send "{Space}"
        } else if ( win.process_name == "BitComet" ) {
            ControlClick("Button1", "A")
            Send "{Enter}"
        } else {
            Send "!y"
        }
    }
    BackSpace::{
        win := GetActiveWindowInfo()
        if ( win.process_name == "Explorer" ) {
            DelFile() {
                Send "{Esc}"
                Sleep 33
                Send "+{Delete}"
                Sleep 66
                Send "!y"
                Sleep 99
                Send "{Space}"
            }
            SetTimer(DelFile, -99)
        } else if ( win.process_name == "BitComet" ) {
            ControlClick("Button2", "A")
            Sleep 99
            Send "{Enter}"
        } else {
            Send "!y"
        }
    }
    Numpad9::Send "{Enter}"  ; 上
    Numpad3::Send "{Esc}"    ; 下
#HotIf



#HotIf    CheckWindowActive( "" , "#32770" , "打开|打开文件|选择文件|选择文件夹" )
       Or CheckWindowActive( "" , "#32770" , "更改图标|另存为|浏览" )
       Or CheckWindowActive( "" , "#32770" , "SaveFile|SaveVideo" )

    #IncludeAgain .\Microsoft\Explorer.Key.ahk

    ; 文件名修改框
    ~CapsLock::ControlFocus("Edit1", "A")

    ~NumLock::Send("!s")

    NumpadHome::{
        edit_name := ControlGetText("Edit1", "A")
        new_name  := ""
        Loop Parse edit_name 
        {
            name := A_LoopField
            if ( name == "#" )
                continue
            else if ( name == "|" )
                continue
            else if ( Ord(name) == "10" )
                new_name := new_name . " "
            else if ( Ord(name) == "13" )
                new_name := new_name . " "
            else
                new_name := new_name . name
        }
        new_name := StrReplace(new_name, "  ", " ")
        new_name := StrReplace(new_name, "  ", " ")
        new_name := StrReplace(new_name, A_Tab, " ")
        new_name := StrReplace(new_name, "video_", "")
        new_name := StrReplace(new_name, " - 知乎", "")
        ControlSetText(new_name, "Edit1", "A")
    }
    NumpadEnd::ControlSetText(A_Clipboard, "Edit1", "A")

    NumpadPgDn::MoveWindowDefault()
    NumpadPgUp::Send("^!7")

    ![::ActivateLeft()
    !]::ActivateRight()
    !\::ActivateMenu()

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
        Send("^!7")  ;平铺模式
    }

#HotIf
