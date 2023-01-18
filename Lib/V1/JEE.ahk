
; 源代码链接
; https://www.autohotkey.com/boards/viewtopic.php?t=33129

;IColumnManager interface (Windows)
;https://msdn.microsoft.com/en-us/library/windows/desktop/bb776149(v=vs.85).aspx

;IFolderView2 interface (Windows)
;https://msdn.microsoft.com/en-us/library/windows/desktop/bb775541(v=vs.85).aspx



WinGetObj(hWnd)
{
	for oWin in ComObjCreate("Shell.Application").Windows
		if (oWin.HWND == hWnd)
			break
	return oWin
}



GetInterfaces(oWin, ByRef isp="", ByRef isb="", ByRef isv="", ByRef ifv2="", ByRef icm="")
{
    IID_IServiceProvider := "{6D5140C1-7436-11CE-8034-00AA006009FA}"
    IID_TopLevelBrowser  := "{4C96BE40-915C-11CF-99D3-00AA004AE837}"
    SID_SShellBrowser    := "{000214E2-0000-0000-C000-000000000046}"
    IID_IFolderView2     := "{1AF3A467-214F-4298-908E-06B03E0B39F9}"
    IID_IColumnManager   := "{D8EC27BB-3F3B-4042-B10A-4ACFD924D453}"
	isp := ComObjQuery(oWin, IID_IServiceProvider)
	isb := ComObjQuery(isp, IID_TopLevelBrowser, SID_SShellBrowser)
    ;QueryActiveShellView
	if (DllCall(NumGet(NumGet(isb+0)+15*A_PtrSize), "Ptr",isb, "PtrP",isv) < 0)
		return
	ifv2 := ComObjQuery(isv, IID_IFolderView2)
	icm  := ComObjQuery(ifv2, IID_IColumnManager)
}



GetColumnCount(icm, vMode="")
{
    ;CM_ENUM_ALL := 0x1
	;CM_ENUM_VISIBLE := 0x2
	vFlags := InStr(vMode, "All") ? 0x1 : 0x2
    ;GetColumnCount
	DllCall(NumGet(NumGet(icm+0)+5*A_PtrSize), "Ptr",icm, "UInt",vFlags, "UIntP",vCountCol)
	return vCountCol
}



; mode : Name CLSID All
GetColumns(icm, vMode="Name", vSep="`n")
{
    ;CM_ENUM_ALL := 0x1
	;CM_ENUM_VISIBLE := 0x2
	vFlags := InStr(vMode, "All") ? 0x1 : 0x2
    ;GetColumnCount
	DllCall(NumGet(NumGet(icm+0)+5*A_PtrSize), Ptr,icm, UInt,vFlags, UIntP,vCountCol)
	vOutput := ""
	VarSetCapacity(vOutput, vCountCol*100*2)
	vOutput := ""
	vArrayPROPERTYKEY := ""
	VarSetCapacity(vArrayPROPERTYKEY, vCountCol*20, 0)
    ;GetColumns
	DllCall(NumGet(NumGet(icm+0)+6*A_PtrSize), Ptr,icm, UInt,vFlags, Ptr,&vArrayPROPERTYKEY, UInt,vCountCol)
	loop, % vCountCol
	{
		vOffset := (A_Index-1)*20
		if InStr(vMode, "CLSID") {
			DllCall("ole32\StringFromCLSID", Ptr,&vArrayPROPERTYKEY+vOffset, PtrP,vAddrCLSID)
			vCLSID := StrGet(vAddrCLSID, "UTF-16")
			vNum := NumGet(vArrayPROPERTYKEY, vOffset+16, "UInt")
			vOutput .= vCLSID " " vNum
		}
		if InStr(vMode, "Name") {
			if InStr(vMode, "CLSID")
				vOutput .= "`t"
			DllCall("propsys\PSGetNameFromPropertyKey", Ptr,&vArrayPROPERTYKEY+vOffset, PtrP,vAddrName)
			vName := StrGet(vAddrName, "UTF-16")
			vOutput .= vName
		}
		vOutput .= vSep
	}
	vOutput := SubStr(vOutput, 1, -StrLen(vSep))
	return vOutput
}



SetColumns(icm, vList, vSep=",")
{
    ;GetColumnCount
	DllCall(NumGet(NumGet(icm+0)+5*A_PtrSize), "Ptr",icm, "UInt",vFlags, "UIntP",vCountCol)
	vList := StrReplace(vList, vSep, vSep, vCountCol)
	vCountCol++
	vArrayPROPERTYKEY := ""
	VarSetCapacity(vArrayPROPERTYKEY, vCountCol*20, 0)
	loop, parse, vList, % vSep
	{
		vOffset := (A_Index-1)*20
		DllCall("propsys\PSGetPropertyKeyFromName", "Str",A_LoopField, "Ptr",&vArrayPROPERTYKEY+vOffset)
	}
	DllCall(NumGet(NumGet(icm+0)+7*A_PtrSize), "Ptr",icm, "Ptr",&vArrayPROPERTYKEY, "UInt",vCountCol)
	return
}




GetColumnWidth(icm, vName)
{
	VarSetCapacity(PROPERTYKEY, 20, 0)
	DllCall("propsys\PSGetPropertyKeyFromName", Ptr,&vName, Ptr,&PROPERTYKEY)
	VarSetCapacity(CM_COLUMNINFO, 184, 0)
	;CM_MASK_WIDTH := 0x1
    ;CM_MASK_IDEALWIDTH := 0x4
	NumPut(184, CM_COLUMNINFO, 0, "UInt") ;cbSize
	NumPut(0x5, CM_COLUMNINFO, 4, "UInt") ;dwMask
    ;GetColumnInfo
	DllCall(NumGet(NumGet(icm+0)+4*A_PtrSize), "Ptr",icm, "Ptr",&PROPERTYKEY, "Ptr",&CM_COLUMNINFO)
	vWidthIdeal := NumGet(CM_COLUMNINFO, 20, "UInt") ;uIdealWidth
    uWidth := NumGet(CM_COLUMNINFO, 12, "UInt") ;uWidth
	return uWidth . "|" . vWidthIdeal
}



SetColumnWidth(icm, vName, vWidth)
{
	VarSetCapacity(PROPERTYKEY, 20, 0)
	DllCall("propsys\PSGetPropertyKeyFromName", Ptr,&vName, Ptr,&PROPERTYKEY)
	VarSetCapacity(CM_COLUMNINFO, 184, 0)
	NumPut(184, CM_COLUMNINFO, 0, "UInt") ;cbSize
	;CM_MASK_WIDTH := 0x1
	NumPut(0x1, CM_COLUMNINFO, 4, "UInt") ;dwMask
	NumPut(vWidth, CM_COLUMNINFO, 12, "UInt") ;dwMask
    ;SetColumnInfo
	DllCall(NumGet(NumGet(icm+0)+3*A_PtrSize), Ptr,icm, Ptr,&PROPERTYKEY, Ptr,&CM_COLUMNINFO)
}



GetSortColumnCount(ifv2)
{
	DllCall(NumGet(NumGet(ifv2+0)+26*A_PtrSize), Ptr,ifv2, IntP,vCountCol) ;GetSortColumnCount
	return vCountCol
}



GetSortColumns(ifv2, vMode="Name", vSep="`n")
{
    ;GetSortColumnCount
	DllCall(NumGet(NumGet(ifv2+0)+26*A_PtrSize), Ptr,ifv2, IntP,vCountCol)
	vOutput := ""
	vArraySORTCOLUMN := ""
	VarSetCapacity(vArraySORTCOLUMN, vCountCol*24, 0)
    ;GetSortColumns
	DllCall(NumGet(NumGet(ifv2+0)+28*A_PtrSize), Ptr,ifv2, Ptr,&vArraySORTCOLUMN, Int,vCountCol)
	loop, % vCountCol
	{
		vOffset := (A_Index-1)*24
		if (vMode = "Name") {
			DllCall("propsys\PSGetNameFromPropertyKey", Ptr,&vArraySORTCOLUMN+vOffset, PtrP,vAddrName)
			vName := StrGet(vAddrName, "UTF-16")
			;SORT_ASCENDING := 1
            ;SORT_DESCENDING := -1
			vDirection := NumGet(vArraySORTCOLUMN, vOffset+20, "Int")
			vOutput .= vName " " vDirection vSep
		} else if (vMode = "CLSID") {
			DllCall("ole32\StringFromCLSID", Ptr,&vArraySORTCOLUMN+vOffset, PtrP,vAddrCLSID)
			vCLSID := StrGet(vAddrCLSID, "UTF-16")
			vNum := NumGet(vArraySORTCOLUMN, vOffset+16, "UInt")
			vDirection := NumGet(vArraySORTCOLUMN, vOffset+20, "Int")
			vOutput .= vCLSID " " vNum " " vDirection vSep
		}
	}
	vOutput := SubStr(vOutput, 1, -StrLen(vSep))
	return vOutput
}



SetSortColumns(ifv2, vList, vSep="`n")
{
	vList := StrReplace(vList, vSep, vSep, vCountCol)
	vCountCol++
	vArraySORTCOLUMN := ""
	VarSetCapacity(vArraySORTCOLUMN, vCountCol*24, 0)
	loop, parse, vList, % vSep
	{
		vOffset := (A_Index-1)*24
		vPos := InStr(A_LoopField, " ", 0, -1)
		vName := SubStr(A_LoopField, 1, vPos-1)
		vDirection := SubStr(A_LoopField, vPos+1)
		DllCall("propsys\PSGetPropertyKeyFromName", "Str",vName, "Ptr",&vArraySORTCOLUMN+vOffset)
		;SORT_ASCENDING := 1
        ;SORT_DESCENDING := -1
		NumPut(vDirection, vArraySORTCOLUMN, vOffset+20, "Int")
	}
    ;SetSortColumns
	DllCall(NumGet(NumGet(ifv2+0)+27*A_PtrSize), Ptr,ifv2, Ptr,&vArraySORTCOLUMN, Int,vCountCol)
}
