
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#include-once
#include <misc.au3>
;#include<makefile.au3>
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <IE.au3>
#include <MsgBoxConstants.au3>
#include <file.au3>


#Region ### START Koda GUI section ### Form=d:\autoit3\����\�ɼ�����.kxf
$Form1_1 = GUICreate("��ַ�⽨��", 623, 107, 201, 278)
$Label2 = GUICtrlCreateLabel("Ҫ�ɼ������µ�����", 64, 20, 112, 17)
$Input3 = GUICtrlCreateInput("0.1", 184, 16, 133, 21)
$Label3 = GUICtrlCreateLabel("��Ʊ���", 128, 48, 52, 17)
$Input4 = GUICtrlCreateInput("601138", 184, 44, 133, 21)
$Button2 = GUICtrlCreateButton("����Դ��ַ", 332, 16, 105, 49)
$input1 = GUICtrlCreateInput("��ǰ��Ϣ", 16, 80, 597, 21)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
Global $RGtring = "/(\w+):\/\/([^/:]+)(:\d*)?([^# ]*)/"

Global $tmpfile = @ScriptDir & "\tmp.tmp"

Global $aera = "http://guba.eastmoney.com"
$sSnipet = ""

Global $oIE = _IECreate("http://guba.eastmoney.com")
$oIE.visible = False
$globaldb="dbc.data /link"
Global $sstring = ""
;���ڽ��ܵ���ҳ���ַ
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

			
		Case $Button2
			
			
			$start_time = GUICtrlRead($Input3) * 50
			$stock_id = GUICtrlRead($Input4)
			Global $filepath_t = @ScriptDir & "\" & $stock_id
			$succ = _FileCreate($filepath_t & "\urllist.txt")
			
			Global $uulist = "news," & $stock_id
			Global $starturl = "http://guba.eastmoney.com/list,"
			

			
			ConsoleWrite($succ)
			If $succ = 1 Then
				
				Global $file1 = $filepath_t & "\urllist.txt"
				Global $file_hw = FileOpen($file1)
				;load supply service
				For $u = 1 To $start_time
					$list_url = $starturl & $stock_id & "_" & $u & ".html"
					FileWriteLine($file_hw, $list_url)
					ConsoleWrite($list_url)
					FileClose($file_hw)
					getlist($list_url)
					
				Next
				MsgBox($MB_SYSTEMMODAL, "��ַ�ռ����", "������ɣ������Ż�����.", 1)
				FileClose($succ)
				checkfile()
				FileClose($tmpfile)
				FileDelete($tmpfile)
				
				;Local $iReturn = ShellExecuteWait("notepad.exe")
			EndIf
			
	EndSwitch
WEnd
$oIE.visible=True
_IEQuit($oIE)
$oIE = 0
Func getlist($list_url)
	Local $oIE = 0
	Local $down = $list_url

	If $down = "" Then MsgBox(16, "����", "û������������")

	If @error Then
		GUICtrlSetData($input1, "���󣬹�Ʊ����Ƿ���ȷ")
	Else
		ConsoleWrite($list_url)
		Global $tmpfile = @ScriptDir & "\tmp.tmp"
		Global $tag = @CRLF
		Local $pathdown = InetGet($list_url, $tmpfile)
		$sstring = _data(FileRead($tmpfile))
	EndIf
	Return $sstring
	ConsoleWrite($sstring)
EndFunc   ;==>getlist



Func _data($sSnipet)
	Local $head_rpl = "about:"
	Global $_IEBDY_ = "READY"
	_IEBodyWriteHTML($oIE, $sSnipet)
	$oLinks = _IELinkGetCollection($oIE)
	$iNumLinks = @extended

	
	Local $arr_txt[0]
	$file_hw = FileOpen($file1, 1)
	For $oLink In $oLinks
		
		$nstxt = $olink.href & $tag
		GUICtrlSetData($input1, $nstxt)
		
		If StringInStr($nstxt, $uulist, 0, 1, 1) And StringInStr($nstxt, $head_rpl) Then
			ConsoleWrite($nstxt)
			$nstxt = StringReplace($nstxt, $head_rpl, $aera)
			FileWriteLine($file_hw, $nstxt)
		EndIf
	Next
	;_FileWriteFromArray($file1,$arr_txt)
	FileClose($file_hw)
EndFunc   ;==>_data


Func checkfile()
	
	If FileCopy(@ScriptDir & "\include\merge.bat", $filepath_t & "\MERGE.bat") Then
		ShellExecuteWait($filepath_t & "\MERGE.bat")
	Else
		FileCopy(@ScriptDir & "\merge.bak", $filepath_t & "\MERGE.bat")
		RunWait($filepath_t & "\MERGE.bat")
	EndIf
	MsgBox($MB_SYSTEMMODAL, "ɾ�����ظ�����", "ɾ�����ظ����У����ݱ����ڱ���ļ�����DBC.data�����.", 2)
	MsgBox($MB_SYSTEMMODAL, "ɾ�����ظ�����", "���Խ���Ŀ¼��ִ�п�ʼ��ȡ����", 1)
	FileDelete($filepath_t & "\MERGE.bat")
	Sleep(1000)
	ShellExecute($filepath_t)

EndFunc   ;==>checkfile
