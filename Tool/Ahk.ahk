
; VSCode修改Ahk文件编码到UTF-8 WITH BOM
Encoding_To_UTF8BOM()
{
    Send "{F17}"
    Sleep 100
    Send "encoding"
    Sleep 100
    Send "{Enter}"
    Sleep 100
    Send "{Down}"
    Sleep 100
    Send "{Enter}"
    Sleep 100
    Send "utf-8 with bom"
    Sleep 100
    Send "{Down}"
    Send "{Enter}"
    Sleep 100
    Send "^s"
}
