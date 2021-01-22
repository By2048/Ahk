
ListToStr(data)
{
    result:=""
    For index, value In data {
        result .= value . "|"
    }
    Return result
}
