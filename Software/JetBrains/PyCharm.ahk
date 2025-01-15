
#Include Tool.ahk

#Include PyCharm\Position.ahk
#Include PyCharm\Window.ahk

RegisterSoftware( "pycharm64" , "PyCharm" )

RegisterHelpInfo( "PyCharm", FilePath(A_LineFile, "PyCharm\Key.Base.help")     )
RegisterHelpInfo( "PyCharm", FilePath(A_LineFile, "PyCharm\Key.Fxx.help")      )
RegisterHelpInfo( "PyCharm", FilePath(A_LineFile, "PyCharm\Key.CapsLock.help") )

Global PyCharm := {

    CapsLockActivate : False ,
    CapsLockToEsc    : False ,

    ClickCnt : 0  ,
    ClickKey : "" ,

    AppsKeyActivate   : False ,
    AppsKeyEnterCount : 0     ,

    FloatWindow : [] ,
}

#HotIf CheckWindowActive( "PyCharm" )
    
    `;::Send ":"
    +;::Send ";"

    #Include PyCharm\Key.Base.ahk
    #Include PyCharm\Key.CapsLock.ahk
    #Include PyCharm\Key.Fxx.ahk
    #Include PyCharm\Key.Joy.ahk
    #Include PyCharm\Key.Mouse.ahk

#HotIf
