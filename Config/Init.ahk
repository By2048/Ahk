
#Include *i .\Screen.ahk
#Include *i .\Software.ahk
#Include *i ..\Tool\Other.ahk


Init := {}

Init.setup    := False
Init.width    := 606
Init.height   := 808
Init.config   := []
Init.new_line := "-----------------------------------------------------------------"
Init.script   := A_InitialWorkingDir . "\Config\Script.help"
Init.input    := A_InitialWorkingDir . "\Setup\Input.help"
Init.private  := A_InitialWorkingDir . "\Setup\Input.Private.help"

Init.config.Push(Init.new_line)
Init.config.Push( Format(" A_InitialWorkingDir | {1}" , A_InitialWorkingDir ) )
Init.config.Push( Format(" JQB                 | {1}    {2}", JQB.Phone, JQB.Windows)   )

Init.config.Push(Init.new_line)
if (FileExist(Init.input)) {
    config := FileRead(Init.input)
    Init.config.Push(config)
}

Init.config.Push(Init.new_line)
if (FileExist(Init.private)) {
    config := FileRead(Init.private)
    Init.config.Push(config)
}

Init.config.Push(Init.new_line)
if (FileExist(Init.script)) {
    config := FileRead(Init.script)
    Init.config.Push(config)
}

Init.config.Push(Init.new_line)
