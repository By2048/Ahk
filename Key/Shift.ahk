
~RShift::{

    Global Arg
    if (Arg.shift_cnt > 0) {
        Arg.shift_cnt += 1
        return
    } else {
        Arg.shift_cnt := 1
    }

    SetTimer Timer, -500

    Timer() {
        Global Arg
        if (Arg.shift_cnt == 1) {
            if Arg.init_show
                InitConfig()
        } else if (Arg.shift_cnt == 3) {
            InitConfig()
        }
        Arg.shift_cnt := 0
    }

}
