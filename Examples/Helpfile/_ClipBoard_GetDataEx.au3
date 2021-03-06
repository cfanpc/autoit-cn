#include <GUIConstantsEx.au3>
#include <Clipboard.au3>
#include <WindowsConstants.au3>
#include <WinAPI.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $btn_SetData, $btn_GetData, $hMemory, $tData

	; 创建 GUI
	$hGUI = GUICreate("Clipboard", 600, 450)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	$btn_SetData = GUICtrlCreateButton("Set ClipBoard Data", 150, 410, 120, 30)
	$btn_GetData = GUICtrlCreateButton("Get ClipBoard Data", 300, 410, 120, 30)
	GUISetState()

	; 循环直到用户退出
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn_SetData
				_ClipBoard_SetData("ClipBoard Library")
			Case $btn_GetData
				; 打开剪贴板
				If _ClipBoard_Open($hGUI) Then

				; 读取剪贴板文本
					$hMemory = _ClipBoard_GetDataEx($CF_TEXT)
					If $hMemory = 0 Then _WinAPI_ShowError("_ClipBoard_GetDataEx failed")
					$tData = DllStructCreate("char Text[8192]", $hMemory)
					MemoWrite(DllStructGetData($tData, "Text"))

				; 关闭剪贴板
					_ClipBoard_Close()
				Else
					_WinAPI_ShowError("_ClipBoard_Open 失败")
				EndIf
		EndSwitch
	WEnd

EndFunc   ;==>_Main

; 写入消息到 memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite