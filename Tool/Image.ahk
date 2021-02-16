
#include %A_WorkingDir%\Libs\Gdip_All.ahk



GetImageSize(image)
{
    token:=Gdip_Startup()
    bit_file:=Gdip_CreateBitmapFromFile(image)
    image_w:=Gdip_GetImageWidth(bit_file)
    image_h:=Gdip_GetImageHeight(bit_file)
    Gdip_DisposeImage(bit_file)
    Gdip_Shutdown(token)
    result:=[image_w,image_h]
    Return result
}
