

; �϶����ƶ�����.
LWin & LButton::
RWin & LButton::
    ; ��ȡ��ʼ�����λ�úʹ��� id, ��
    ; �ڴ��ڴ������״̬ʱ����.
    MouseGetPos,KDE_X1,KDE_Y1,KDE_id
    WinGet,KDE_Win,MinMax,ahk_id %KDE_id%

    If KDE_Win
        return

    ; ��ȡ��ʼ�Ĵ���λ��.
    WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %KDE_id%

    Loop {
        GetKeyState,KDE_Button,LButton,P ; �����ť�Ѿ����ɿ������˳�.
        If KDE_Button = U
            break
        MouseGetPos,KDE_X2,KDE_Y2 ; ��ȡ��ǰ�����λ��.
        KDE_X2 -= KDE_X1 ; �õ�����ԭ�����λ�õ�ƫ��.
        KDE_Y2 -= KDE_Y1
        KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; �����ƫ��Ӧ�õ�����λ��.
        KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
        WinMove,ahk_id %KDE_id%,,%KDE_WinX2%,%KDE_WinY2% ; �ƶ����ڵ��µ�λ��.
    }
return


; �϶����������ڴ�С.
LWin & RButton::
RWin & RButton::
    ; ��ȡ��ʼ�����λ�úʹ��� id, ��
    ; �ڴ��ڴ������״̬ʱ����.
    MouseGetPos,KDE_X1,KDE_Y1,KDE_id
    WinGet,KDE_Win,MinMax,ahk_id %KDE_id%

    If KDE_Win
        return

    ; ��ȡ��ʼ�Ĵ���λ�úʹ�С.
    WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%

    ; ������굱ǰ�����Ĵ�������.
    ; �ĸ���Ϊ����, ����, ���º�����.
    If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
        KDE_WinLeft := 1
    Else
        KDE_WinLeft := -1
    
    If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
        KDE_WinUp := 1
    Else
        KDE_WinUp := -1

    Loop {
        GetKeyState,KDE_Button,RButton,P ; �����ť�Ѿ��ɿ������˳�.
        If KDE_Button = U
            break
        MouseGetPos,KDE_X2,KDE_Y2 ; ��ȡ��ǰ���λ��.
        ; ��ȡ��ǰ�Ĵ���λ�úʹ�С.
        WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
        KDE_X2 -= KDE_X1 ; �õ�����ԭ�����λ�õ�ƫ��.
        KDE_Y2 -= KDE_Y1
        ; Ȼ������Ѷ���������ж���.
        WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; ��С�����󴰿ڵ� X ����
                                , KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2  ; ��С�����󴰿ڵ� Y ����
                                , KDE_WinW  -     KDE_WinLeft  *KDE_X2  ; ��С�����󴰿ڵ� W (���)
                                , KDE_WinH  -       KDE_WinUp  *KDE_Y2  ; ��С�����󴰿ڵ� H (�߶�)
        KDE_X1 := (KDE_X2 + KDE_X1) ; Ϊ��һ�ε��ظ��������ó�ʼλ��.
        KDE_Y1 := (KDE_Y2 + KDE_Y1)
    }
return

