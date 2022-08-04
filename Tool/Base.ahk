
For Arg_Index, Arg_Value In A_Args {
    If (Arg_Value == "Start" Or Arg_Value == "Reload") {
        Reload
    } Else If (Arg_Value == "Stop" Or Arg_Value == "Exit") {
        ExitApp
    } Else If (Arg_Value == "Pause") {
        Pause
    }
}
