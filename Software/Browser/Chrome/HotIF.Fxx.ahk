
#HotIf CheckWindowActive( "Chrome" , "*WidgetWin*" , "WeTab新标签页*" )

    ; 刷新
    PgDn::{
        MouseGetPos(&x, &y)
        Send "{RButton}"
        xx := x + 50
        yy := y + 140
        MouseClick("Left", xx, yy, 1, 0)
        MouseMove(x, y, 0)
    }

    ; 下载
    PgUp::{
        MouseGetPos(&x, &y)
        Send "{RButton}"
        xx := x + 50
        yy := y + 195
        MouseClick("Left", xx, yy, 1, 0)
        MouseMove(x, y, 0)
    }

     F1::RedirectTo("code.visualstudio.com/docs")
     F2::RedirectTo("wyagd001.github.io/v2/docs")
     F3::RedirectTo("pycharm.net.cn")
     F4::RedirectTo("docs.python.org/zh-cn/3")

     F5::RedirectTo("exhentai.org/popular")
     F6::RedirectTo("e-hentai.org/popular")
     F7::RedirectTo("e-hentai.org/toplist.php?tl=13")
     F8::RedirectTo("transfercloud.io")

     F9::RedirectTo("youtube.com")
    F10::RedirectTo("kisssub.org")
    F11::RedirectTo("zhihu.com/knowledge-plan/hot-question/hot/0/hour")
    F12::RedirectTo("t.bilibili.com/?tab=8")

    AppsKey::RedirectTo("chatgpt.com")

#HotIf
