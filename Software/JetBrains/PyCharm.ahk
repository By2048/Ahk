
#Include Tool.ahk

#Include PyCharm\Config.ahk

RegisterSoftware( "pycharm64" , "PyCharm" )
RegisterHelpInfo( "PyCharm", FilePath(A_LineFile, "PyCharm\Key.Base.help"    ) )
RegisterHelpInfo( "PyCharm", FilePath(A_LineFile, "PyCharm\Key.Fxx.help"     ) )
RegisterHelpInfo( "PyCharm", FilePath(A_LineFile, "PyCharm\Key.CapsLock.help") )

#Include PyCharm\HotIF.Arg.ahk
#Include PyCharm\HotIF.Win.ahk
#Include PyCharm\HotIF.Key.ahk
