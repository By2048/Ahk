
ListToStr(data)
{
    result:=""
    For index, value In data {
        result .= value . "|"
    }
    result:=RTrim(result,"|")
    Return result
}
