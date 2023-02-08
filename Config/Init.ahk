
#Include %A_InitialWorkingDir%\Config\Screen.ahk
#Include %A_InitialWorkingDir%\Config\Software.ahk
#Include %A_InitialWorkingDir%\Tool\Other.ahk


Init := {}

Init.setup    := False
Init.width    := 610
Init.height   := 900
Init.config   := []
Init.file     := A_InitialWorkingDir . "\Config\Command.txt"
Init.new_line := "-----------------------------------------------------------------"


GetInitConfig()
{
    check := Init.setup
    if (check) {
        return
    } else {
        Init.setup := True
    }

    Init.config.Push(Init.new_line)
    Init.config.Push( Format(" A_InitialWorkingDir | {1}" , A_InitialWorkingDir ) )
    Init.config.Push( Format(" JQB                 | {1}    {2}", JQB.Phone, JQB.Windows)                                  )

    Init.config.Push(Init.new_line)
    ; | \Date  \Time  \DateTime  \Dism  \Sfc  -#/                   |
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
    Init.config.Push(data)

    Init.config.Push(Init.new_line)
    init_file := Init.file
    if (FileExist(init_file)) {
        init_file_config := FileRead(init_file)
        Init.config.Push( init_file_config )
    }
    Init.config.Push(Init.new_line)
}
