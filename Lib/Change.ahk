
; True False
StrToBool(value)
{
    if ( value == "True" )
        return True
    if ( value == "False" )
        return False
    return value
}


StrRemove(original_text, search_text)
{
    temp := StrReplace(original_text, search_text)
    return temp
}


; 屏幕参数名转换
ScreenNameToId(screen_name)
{

    screen_name := Format("{:L}", screen_name)
    if ( ! screen_name ) 
        return "1"
    if ( screen_name == "screen" || screen_name == "main" )
        return "1"
    if ( screen_name == "screen_main" || screen_name == "screenmain" )
        return "1"
    screen_name := StrReplace(screen_name  , "screen", "")
    screen_name := StrReplace(screen_name  , "_"     , "")
    screen_id   := screen_name
    return screen_id
}


; 十进制转二进制 ToBase(a,2)
; 十进制转十六进制 ToBase(a,16)
; 十进制转八进制 ToBase(a,8)
; 十进制转n进制 ToBase(a,n)
; 十六进制转n进制 ToBase(a,n) a以0x开头
ToBase(n, b)
{
    result := ( n<b ? "" : ToBase(n//b, b) ) . ( ( d:=Mod(n, b) ) < 10 ? d : Chr(d+55) )
    return result
}


; Center / [Center] / [Center][1] / 0.7 / -15
; 屏幕坐标参数转换
Position(args*)
{
    if ( args.Length == 2 ) {
        x := "Center"
        y := "Center"
        w := args[1]
        h := args[2]
    } else if ( args.Length == 3 ) {
        x := args[1]
        y := args[1]
        w := args[2]
        h := args[3]
    } else if ( args.Length == 4 ) {
        x := args[1]
        y := args[2]
        w := args[3]
        h := args[4]
    }

    win_x := x , win_y := y , win_w := w , win_h := h

    GetScreenIndex(arg) {
        screen_index := 1
        if ( StrLower(arg) == "[center]" || StrLower(arg) == "center" ) {
            screen_index := 1
        } else if ( InStr( StrLower(arg) , "center" ) ) {
            check := RegExMatch(StrLower(arg), "\[center\]\[([1-9])\]", &re_match)
            if ( check )
                screen_index := re_match.1
        }
        if ( screen_index > Screens.Count )
            screen_index := 1
        return screen_index
    }

    screen_index := GetScreenIndex(x)
    if ( w > 0 && w < 1 )
        win_w := Screens.%screen_index%.w * w
    else if ( w <= 0 )
        win_w := Screens.%screen_index%.w + w

    if ( InStr( StrLower(x) , "center" ) )
        win_x := Screens.%screen_index%.x + Screens.%screen_index%.w/2 - win_w/2

    screen_index := GetScreenIndex(y)
    if ( h > 0 && h < 1 )
        win_h := Screens.%screen_index%.h * h
    else if ( h <= 0 )
        win_h := Screens.%screen_index%.h + h

    if ( InStr( StrLower(y) , "center" ) )
        win_y := Screens.%screen_index%.y + Screens.%screen_index%.h/2 - win_h/2

    win_x := Round(win_x)
    win_y := Round(win_y)
    win_w := Round(win_w)
    win_h := Round(win_h)
    return { x : win_x  ,  y : win_y  ,  w : win_w  ,  h : win_h }
}


AID(id)
{
    if ( ! id )
        return "A"
    return Format("ahk_id {}", id)
}


AEXE(exe)
{
    if ( ! exe )
        return "A"
    if ( ! InStr(exe, ".exe") ) {
        try {
            exe := Software_Rename.Get(StrLower(exe))
            return Format("ahk_exe {}", exe)
        } catch {
            return "A"
        }
    }
    return Format("ahk_exe {}", exe)
}


; 通过文件所在位置来获取路径
FilePath(path, name)
{
    SplitPath(path, &file_name, &file_dir)
    file_path := file_dir . "\" . name
    return file_path
}


; 保留一个匹配项 替换其他所有匹配项
KeepOne(original_text, search_text)
{
    if ( ! InStr(original_text, search_text) )
        return original_text    
    pos := InStr(original_text, search_text)
    temp := StrReplace(original_text, search_text)
    ; 在第一个匹配项的位置重新插入搜索文本
    result := SubStr(temp, 1, pos-1) . search_text . SubStr(temp, pos)
    return result
}


MoveEnd(original_text, search_text)
{
    if ( ! InStr(original_text, search_text) )
        return original_text    
    temp := StrReplace(original_text, search_text)
    result := Trim(temp) . " " . search_text
    return result
}
