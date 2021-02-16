#if ( WinActive("ahk_exe FSViewer.exe") )

    \:: ;移动到收藏
        Send m
        Sleep 100
        Send 1
        Sleep 100
        Run D:\Python\_python_\Scripts\pythonw.exe E:\Git\_python_\_script_\_image_rename_.py
    Return

    /:: ;删除
        Send {Delete}
        Sleep 100
        Send {Enter}
    Return

    ]::
        Send {Right}
    Return

    [::
        Send {Left}
    Return

#If

