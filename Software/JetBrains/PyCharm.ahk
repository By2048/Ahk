﻿
#Include Tool.ahk

#Include PyCharm\Config.Arg.ahk
#Include PyCharm\Config.Position.ahk

RegisterSoftware( "pycharm64" , "PyCharm" )
RegisterHelpInfo( "PyCharm", FilePath(A_LineFile, "PyCharm\Key.Base.help"    ) )
RegisterHelpInfo( "PyCharm", FilePath(A_LineFile, "PyCharm\Key.Fxx.help"     ) )
RegisterHelpInfo( "PyCharm", FilePath(A_LineFile, "PyCharm\Key.CapsLock.help") )

#Include PyCharm\HotIF.ahk
