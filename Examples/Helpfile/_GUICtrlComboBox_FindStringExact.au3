#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <Constants.au3>

$Debug_CB = False ;检查传递给 ComboBox/ComboBoxEx 函数的类名, 设置为True并输出到一个控件的句柄,用于检查它是否工作

_Main()

Func _Main()
	Local $hCombo

	; 创建 GUI
	GUICreate("ComboBox Find String Exact", 400, 296)
	$hCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState()

	; 添加文件
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, "", $DDL_DRIVES, False)
	_GUICtrlComboBox_AddString($hCombo, "This is a test")
	_GUICtrlComboBox_AddDir($hCombo, "", $DDL_DRIVES)
	_GUICtrlComboBox_AddString($hCombo, "This is eXact")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Find string
	MsgBox(4160, "信息", "Find String: " & _GUICtrlComboBox_FindStringExact($hCombo, "This is eXact"))

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
