#include <GUIConstantsEx.au3>
#include <GuiButton.au3>
#include <WindowsConstants.au3>
#include <GuiMenu.au3>

Global $btn, $iMemo

; 注意这些按钮的控件 ID 无法使用 GuiCtrlRead 读取

_Main()

Func _Main()
	Local $hGUI

	$hGUI = GUICreate("Buttons", 400, 400)
	$iMemo = GUICtrlCreateEdit("", 10, 65, 390, 325, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")

	$btn = _GUICtrlButton_Create($hGUI, "Button1", 10, 10, 160, 40, BitOR($BS_COMMANDLINK, $BS_DEFPUSHBUTTON, $BS_PUSHLIKE))
	_GUICtrlButton_SetNote($btn, "This is a test of Vista")

	GUISetState()

	MemoWrite("Note: " & _GUICtrlButton_GetNote($btn))
	MemoWrite("Note Length: " & _GUICtrlButton_GetNoteLength($btn))
	MemoWrite("Button Text: " & _GUICtrlButton_GetText($btn))

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit

EndFunc   ;==>_Main

; 写入一行到 memo 控件
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
