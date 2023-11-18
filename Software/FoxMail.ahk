
RegisterProcess("Foxmail" , "FoxMail")

#HotIf CheckWindowActive( "FoxMail" )

    ; 收取所有邮件
    F4::Return
    AppsKey::Send "{F4}"

    #\::{
        MoveWindowToPosition(Position(2233,1250))

        width_folder := 300
        width_mail   := 550
        check_split_folder := 10
        check_split_mail   := 20

        ; 邮箱列表
        GetActiveWindowInfo(False)
        info := window.controls.TVirtualDrawTree2
        if Abs(info.w - width_folder) > check_split_folder {
            MouseMove info.x + info.w , (info.y + info.h) / 2
            offset := GetOffset("X", 1, 20, "Unknown")
            MoveControlUDLR(info, "Right", width_folder, offset)
        }

        ; 邮件列表
        GetActiveWindowInfo(False)
        info := window.controls.TVirtualDrawTree1
        if Abs(info.w - width_mail) > check_split_mail {
            MouseMove info.x + info.w , (info.y + info.h) / 2
            offset := GetOffset("X", 1, 20, "Unknown")
            MoveControlUDLR(info, "Right", width_mail + width_folder, offset)
        }
    }

#HotIf
