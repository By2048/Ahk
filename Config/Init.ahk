
#Include *i .\Screen.ahk
#Include *i .\Software.ahk
#Include *i ..\Tool\Other.ahk


Init := {}

Init.setup    := False
Init.width    := 606
Init.height   := 808
Init.config   := []
Init.script   := A_InitialWorkingDir . "\Config\Script.txt"
Init.new_line := "-----------------------------------------------------------------"
Init.input         := A_InitialWorkingDir . "\Config\Input.txt"
Init.input_private := A_InitialWorkingDir . "\Config\Input.Private.txt"


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
    file := Init.input
    if (FileExist(file)) {
        config := FileRead(file)
        Init.config.Push(config)
    }

    Init.config.Push(Init.new_line)
    file := Init.input_private
    if (FileExist(file)) {
        config := FileRead(file)
        Init.config.Push(config)
    }

    Init.config.Push(Init.new_line)
    file := Init.script
    if (FileExist(file)) {
        config := FileRead(file)
        Init.config.Push(config)
    }
    Init.config.Push(Init.new_line)
}
