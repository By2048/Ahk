F12::

    ;~ COM Object: Shell.Application
    ;~ Purpose: Retrieves file properties.
    ;~ System Requirements: General
    ;~ Documentation Link: GetDetailsOf, ParseName
    ;~ Other Links: Retrieving Extended File Properties
    ;~ Basic Code Example - this example demonstrates how to retrieve the properties of a specified file :

    filepath:="C:\Windows\System32\notepad.exe"   ;set the target full file path
    SplitPath, filepath , FileName, DirPath,
    objShell:=ComObjCreate("Shell.Application")
    objFolder:=objShell.NameSpace(DirPath)      ;set the directry path
    objFolderItem:=objFolder.ParseName(FileName)   ;set the file name
    Loop 283
        if propertyitem:=objFolder.GetDetailsOf(objFolderItem, A_Index) {
            properties.=A_Index." ".objFolder.GetDetailsOf(objFolder.Items, A_Index).":`t ".propertyitem."`n"
        }
        msgbox %properties%
    return

return