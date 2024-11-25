
#Include Tool.ahk

#Include PyCharm\Position.ahk
#Include PyCharm\Window.ahk

RegisterProcess( "pycharm64" , "PyCharm" )

RegisterHelp( "PyCharm", FilePath(A_LineFile, "PyCharm\Key.Base.help")     )
RegisterHelp( "PyCharm", FilePath(A_LineFile, "PyCharm\Key.Fxx.help")      )
RegisterHelp( "PyCharm", FilePath(A_LineFile, "PyCharm\Key.CapsLock.help") )

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

    #IncludeAgain *i %A_InitialWorkingDir%\Key\Replace.ahk

    #Include PyCharm\Key.Base.ahk
    #Include PyCharm\Key.CapsLock.ahk
    #Include PyCharm\Key.Fxx.ahk
    #Include PyCharm\Key.Joy.ahk
    #Include PyCharm\Key.Mouse.ahk

#HotIf
