
#Include %A_WorkingDir%\Config\Screen.ahk
#Include %A_WorkingDir%\Tool\Other.ahk

; 在 Input.ahk Private.ahk 中定义的快捷输入

Global Init := {}

Init["width"]  := 650
Init["height"] := 900
Init["config"] := []
Init["file"]   := A_WorkingDir "\Config\Init.txt"


AddInitLine()
{
    global Init
    line := ""
    length := Init["width"] / 10
    Loop %length% {
        line := line . "-"
    }
    Init["config"].Push(line)
}


GetInitConfig()
{
    AddInitLine()
    Init["config"].Push( Format(" A_WorkingDir | {1}" , A_WorkingDir ) )
    Init["config"].Push( Format(" JQB          | {1}    {2}", JQB.Phone, JQB.Windows)                                  )

    AddInitLine()
    ; | [Date]  [Time]  [DateTime]                                  |
    ; |-------------------------------------------------------------|
    ; | Phone   | Gmail    | PWD     | Aly      |         |         |
    ; | QQ      | QQ1      | QQ2     | QMail    | QMail1  | QMail2  |
    ; | FXY     | ShengRi  | SFZ     | HuJi     | DiZhi   |         |
    ; | \       | py       | py.exe  | pip.exe  | yg      | pipjx   | 
    ; | -       | #        |         |          |         |         |
    ; | LOL-RM  | Scrcpy   |         |          |         |         |
    file  := A_LineFile
    slice := [ A_LineNumber - 9 , A_LineNumber - 2 ]
    data  := ReadConfig(file, slice, "    `;")
    Init["config"].Push(data)

    AddInitLine()
    init_file := Init["file"]
    FileRead, init_file_config, %init_file%
    Init["config"].Push( init_file_config )

    AddInitLine()    
}


GetInitConfig()
