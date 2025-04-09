
; 比较颜色区别
; F0F0F0 | 60ABF0
CheckColor(color_a, color_b, offset:=9)
{
    color_a_red   := SubStr(color_a, 1, 2)
    color_a_green := SubStr(color_a, 3, 2)
    color_a_blue  := SubStr(color_a, 5, 2)
    color_a_red   := ToBase("0x" . color_a_red,   10)
    color_a_green := ToBase("0x" . color_a_green, 10)
    color_a_blue  := ToBase("0x" . color_a_blue,  10)

    color_b_red   := SubStr(color_b, 1, 2)
    color_b_green := SubStr(color_b, 3, 2)
    color_b_blue  := SubStr(color_b, 5, 2)
    color_b_red   := ToBase("0x" . color_b_red,   10)
    color_b_green := ToBase("0x" . color_b_green, 10)
    color_b_blue  := ToBase("0x" . color_b_blue,  10)

    if ( Abs(color_a_red - color_b_red) <= offset)
        if ( Abs(color_a_green - color_b_green) <= offset )
            if ( Abs(color_a_blue - color_b_blue) <= offset )
                return True
    return False
}


; 顺序切换数组项
LoopList(data, &current, step:=+1, circle:=false)
{
    next_index  := 0
    check_match := false

    for loop_item in data {
        if ( loop_item == current ) {
            check_match := true
            if ( step == +1 )
                if ( A_Index < data.Length )
                    next_index := A_Index + 1
                else {
                    if ( circle )
                        next_index := +1
                    else 
                        next_index := -1
                }
            if ( step == -1 ) 
                if ( A_Index > 1 )
                    next_index := A_Index - 1
                else {
                    if ( circle )
                        next_index := -1
                    else
                        next_index := +1
                }
            break
        }
    }

    if ( ! check_match )
        if ( step == +1 )
            next_index := +1
        else if ( step == -1 )
            next_index := -1
        else
            next_index := +1

    current := data[next_index]
    return current
}
