
for Arg_Index, Arg_Value in A_Args {
    if (Arg_Value="start" or Arg_Value="reload") {
        Reload
    } else if (Arg_Value="stop" or Arg_Value="exit") {
        ExitApp
    } else if (Arg_Value="pause") {
        Pause
    }
}
