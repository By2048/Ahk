
for Arg_Index, Arg_Value in A_Args {
    if (Arg_Value == "Start" or Arg_Value == "Reload") {
        Reload
    } else if (Arg_Value == "Stop" or Arg_Value == "Exit") {
        ExitApp
    } else if (Arg_Value == "Pause") {
        Pause
    }
}
