
#Include %A_InitialWorkingDir%\Tool\Help.ahk

PDF_Main()
{
    CoordMode "Mouse", "Windows"

    page_count := 268
    delete_xy  := [ [1406,1905] , [1590,1962] ]

    loop page_count {
        for index, item in delete_xy {
            x := item[1] , y := item[2]
            MouseClick "Left", x, y, 1, 0
            Send "{Delete}"
        }
        MouseClick, "Left", 1016, 138, 1, 0 ; 下一页
        HelpText(A_Index, "CenterDown")
    }

    HelpText()
}
