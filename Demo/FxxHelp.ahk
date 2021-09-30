
global FxxData:={}

FxxData["Default"] := ["F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","F12"]
FxxData["VSCode"]  := ["F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","Run"]


Fxx()
{
    Progress Off
    CoordMode Pixel Screen
    CoordMode Mouse Screen

    FD:=FxxData["default"]

    ; 优先根据应用名进行查找
    for exe, fxxdata in FxxData {
        if WinActive("ahk_exe"+" "+exe) {
            FD:=fxxdata
        }
    }

    content .= Format("{1} {2} {3} {4}",  FD[1], FD[2], FD[3], FD[4])
    content .= " | "
    content .= Format("{1} {2} {3} {4}",  FD[5], FD[6], FD[7], FD[8])
    content .= " | "
    content .= Format("{1} {2} {3} {4}",  FD[9], FD[10], FD[11], FD[12])
    content .= data

    ; 屏幕1底部
    ; w:=screen_1_w*2/3
    ; h:=58
    ; x:=(screen_1_xx-w)/2
    ; y:=screen_1_h-h-3

    ; 屏幕3顶部
    w:=screen_3_w
    h:=58
    x:=screen_3_x
    y:=screen_3_y+100

    w:=w/2
    h:=h/2

    SetTitleMatchMode, 2
    title:="fxx_help_info"
    ; Progress, b zh0 fs18 c11 CWC0C0C0 ws1000 x%x% y%y% w%w% h%h%, %content%,  , %title%, "Source Code Pro"
    Progress, zh0 fs18 c11 CWC0C0C0 ws1000 x%x% y%y% w%w% h%h%, %content%,  , %title%, "Source Code Pro"
    
    ; WinSet, TransColor, %keyboard_transcolor% 220, ahk_id %k_ID%      
    WinSet, TransColor, F1ECED 25, %title%

}





#if WindowsActive("Explorer")
    F1::Run, D:\\
    F2::Run, E:\\
    F3::Run, F:\\
    F4::Run, R:\\
#if


F12::Fxx()
