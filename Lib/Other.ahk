
; 比较颜色区别
; F0F0F0 | 60ABF0
CheckColor(color_base, color_compare, offse:=9)
{
    color_base_red   := SubStr(color_base, 1, 2)
    color_base_green := SubStr(color_base, 3, 2)
    color_base_blue  := SubStr(color_base, 5, 2)
    color_base_red   := ToBase("0x" . color_base_red,   10)
    color_base_green := ToBase("0x" . color_base_green, 10)
    color_base_blue  := ToBase("0x" . color_base_blue,  10)

    color_compare_red   := SubStr(color_compare, 1, 2)
    color_compare_green := SubStr(color_compare, 3, 2)
    color_compare_blue  := SubStr(color_compare, 5, 2)
    color_compare_red   := ToBase("0x" . color_compare_red,   10)
    color_compare_green := ToBase("0x" . color_compare_green, 10)
    color_compare_blue  := ToBase("0x" . color_compare_blue,  10)

    if ( Abs(color_base_red - color_compare_red) <= offse) {
        if ( Abs(color_base_green - color_compare_green) <= offse ) {
            if ( Abs(color_base_blue - color_compare_blue) <= offse ) {
                return True
            }
        }
    }
    return False
}
