#RequireAdmin
#Region ;**** 由 AccAu3Wrapper_GUI 创建指令 ****
#AccAu3Wrapper_Outfile=页面识别x86.exe
#AccAu3Wrapper_Outfile_x64=页面识别x64.exe
#AccAu3Wrapper_Compile_Both=y
#AccAu3Wrapper_Res_Language=2052
#AccAu3Wrapper_Res_requestedExecutionLevel=None
#EndRegion ;**** 由 AccAu3Wrapper_GUI 创建指令 ****
#Region ;**** 编译指令由 by AutoIt3Wrapper_GUI 创建 ****
#EndRegion ;**** 编译指令由 by AutoIt3Wrapper_GUI 创建 ****
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <array.au3>
#include <GUIConstants.au3>
#include <IE.au3>
;#include<setdefault.au3>
#include <file.au3>
#include <MsgBoxConstants.au3>
#include <excel.au3>
#include <_html.au3>
#include <sfilter.au3>
#include <inet.au3>
;Opt("CaretCoordMode", 1)
;Opt("ExpandEnvStrings", 0)
Opt("ExpandVarStrings", 0)
;Opt("GUICloseOnESC", 0)
;Opt("GUICoordMode", 1)
;Opt("GUIDataSeparatorChar","|")
;Opt("GUIOnEventMode", 0)
;Opt("GUIResizeMode",0)
;Opt("GUIEventOptions",1)
Opt("MouseClickDelay", 10)
Opt("MouseClickDownDelay", 10)
Opt("MouseClickDragDelay", 250)
Opt("MouseCoordMode", 1)
Opt("MustDeclareVars", 0)
Opt("PixelCoordMode", 1)
Opt("SendAttachMode", 0)
Opt("SendCapslockMode", 1)
Opt("SendKeyDelay", 5)
Opt("SendKeyDownDelay", 1)
Opt("TCPTimeout", 100)
Opt("TrayAutoPause", 1)
Opt("TrayIconDebug", 0)
Opt("TrayIconHide", 0)
Opt("TrayMenuMode", 0)
Opt("TrayOnEventMode", 0)
Opt("WinDetectHiddenText", 0)
Opt("WinSearchChildren", 1)
Opt("WinTextMatchMode", 1)
Opt("WinTitleMatchMode", 1)
Opt("WinWaitDelay", 250)
Global $input1
Global $g_idGUIProg
Global $oIE = 0
Global $filepath = @ScriptDir
Global $size = 0 ;difine listfile size
Global $list_file_url = @ScriptDir & "\任务列表.txt" ;页面提取的文件
Global $line_url = "http://guba.eastmoney.com/"
Global $state = ""
Global $stock_id = ""
Global $resault_dir = @ScriptDir & "\data"
Global $ie_all_span = @extended
Global $ie_all_div = @extended
Global $oEventObject
Global $SIZES = 0
Global $CURPID = 0
Global $TXTDATA = ""
Global $oExcel, $oWorkbook
Global $cur_process = 0
;========================================
Global $tmpfile = @ScriptDir & "\tmp.tmp"
$source = "dbc.data"
$target = "任务列表.txt"
$resault_dir = @ScriptDir
Global $oIE = 0
Global $ierw_url = ""
;$oIE = ObjCreate("InternetExplorer.Application.1")
_IELoadWaitTimeout(100)
Global $oIE = _IECreate("http://guba.eastmoney.com")

;========================================
While 1



	If FileExists("任务列表.txt") And _FileCountLines("任务列表.txt") > 0 Then
		$uulist = @ScriptDir & "\任务列表.txt"
		$list_file_url = @ScriptDir & "\任务列表.txt"
	Else

		$succ = FileCopy($source, $target)
		If $succ = 1 Then
			
			Global $uulist = $target
			Global $starturl = "http://guba.eastmoney.com/list,"
			MsgBox($MB_SYSTEMMODAL, "", "创建第一次运行列表.", 1)
		EndIf
	EndIf

	
	MsgBox($MB_SYSTEMMODAL, "网址", "ok列表存在，从上次任务继续.", 1)
	start_job($oIE) ;执行打开窗口
WEnd
;=============================================
Func ierw($ierw_url)
	
	Local $netdata = InetGet($ierw_url, $tmpfile)
	$htms = FileRead($tmpfile)
	_IEBodyWriteHTML($oIE, $htms)
	FileClose($tmpfile)

EndFunc   ;==>ierw

removeIE()
Func start_job($oIE)

	Local $iMsg
	Local $hGUIMain
	$hGUIMain = GUICreate("IE BROWSER", 600,400)
	$input1 = GUICtrlCreateInput("show" & @CRLF, 10, 20, 580, 300)
	$g_idGUIProg = GUICtrlCreateProgress(10, 5, 580, 10)
	Local $idGUIExit = GUICtrlCreateButton("退出采集", 250, 450, 80, 30)
	GUISetState() ;Show GUI
	Sleep(1000) ; Give it some time to load the web page
	GUISwitch($hGUIMain) ; Switch back to our GUI in case IE stole the focus
	; We prepare the Internet Explorer as our test subject
	ieobjint()
	While 1
		$iMsg = GUIGetMsg()
		If $iMsg = $idGUIExit Then Exit
		DOWN_BY_LIST($list_file_url)
		;按列表下载
	WEnd
EndFunc   ;==>start_job
Func DOWN_BY_LIST($list_file_url)
	MsgBox($MB_SYSTEMMODAL, "网址", "开始下载列表里网址", 1)
	;MsgBox($MB_SYSTEMMODAL, "", "开始下载列表里网址.")
	$FILE_HWN = FileOpen($list_file_url, 1)
	$size = _FileCountLines($list_file_url)
	If $list_file_url = "" Then
		
		MsgBox($MB_SYSTEMMODAL, "", "没有选择入口列表.现在退回")
		Return
	Else
		
	EndIf
	For $SIZES = $size To 1 Step -1
		;
		$state = ""
		
		$line_url = FileReadLine($list_file_url, $SIZES)
		FileClose($line_url)
		;ConsoleWrite("列表名称" & $line_url)
		If StringLen($line_url) > 10 Then
			;to be continue

			$stock_id = StringTrimRight(StringTrimLeft("$line_url", 38), 5)
			
			;+++++++++++++++++++++++++++++++
			$oIE.navigate($line_url)
			;_ieloadwait($oIE)
			;++++++++++++++++++++++++++
			;ierw($line_url)
			;sleep(500)

			Global $CURPID = 1
			pagereconize()
			set_stock_show()
			;ending
			SetError(0)
		EndIf
		;=========================================================
		_FileWriteToLine($list_file_url, $SIZES, "", True)
		FileClose($line_url)
		;
	Next
	MsgBox($MB_SYSTEMMODAL, "", "已经提取完内容，右下任务栏选退出.")
	;FileClose($FILE_HWN)
	Exit
EndFunc   ;==>DOWN_BY_LIST
;=================================================

;=====================================================================================
Func ieobjint()

	;$oIE.Navigate("http://baidu.com")

	$sURL = "http://guba.eastmoney.com/list,600382.html"
	Local $oEventObject = ObjEvent($oIE, "IEEvent_", "DWebBrowserEvents")
	If @error Then
		MsgBox($MB_OK, "有错误发生", _
				"ObjEvent: Can't use event interface 'DWebBrowserEvents'. Error code: " & Hex(@error, 8))
	EndIf

	With $oIE
		.Visible = 1
		.Top = (@DesktopHeight - 400) / 2
		.Height = 600 ; Make it a bit smaller than our GUI.
		.Width =400
		.Silent = 1 ; Don't show IE's dialog boxes
		Global $hIEWnd = HWnd(.hWnd) ; Remember the Window, in case user decides to close it
	EndWith
EndFunc   ;==>ieobjint
;======================================================================================
Func removeIE()
	$oEventObject.Stop ; Tell IE we don't want to receive events.
	$oEventObject = 0 ; Kill the Event Object
	If WinExists($hIEWnd) Then $oIE.Quit ; Close IE Window
	$oIE = 0 ; Remove IE from memory (not really necessary).
	;GUIDelete($hGUIMain) ; Remove GUI
EndFunc   ;==>removeIE
Func set_stock_show()
	;GUICtrlSetData($input1,$stock_id)
EndFunc   ;==>set_stock_show
Func pagereconize()
	Local $Ele = @extended
	Sleep(1000)

	;=====================hot============================
	;SLEEP(300)
	Local $tags = @extended

	;$tags = $oIE.document.GetElementsByTagName("div")
	instr($oIE)
	Local $text_s = _tc1($ie_all_span)
	Local $tmp = ""

	;For $tag in $ie_all_span
	; $class_value = $tag.GetAttribute("class")
	;	$class_value = $tag.classname
	;  If $class_value = "tc1" Then
	;    $tmp=$tag.innertext
	;  $text_s=$tmp&@CRLF&$text_s&@CRLF
	
	;EndIf
	;Next
	$TXTDATA = StringStripWS(HTML_Filters($text_s, 0), 8)
	FileWriteLine(@ScriptDir & "\data.txt",$line_url & "    url/////")
	FileWriteLine(@ScriptDir & "\data.txt", $TXTDATA & "hot /////")

	Local $TXTDATA = ""
	;=======================tim==================
	;SLEEP(300)
	Local $tags = @extended

	;$tags = $oIE.document.GetElementsByTagName("DIV")
	Local $text_s = ""
	Local $tmp = ""
	;For $tag in $tags
	For $tag In $ie_all_div
		; $class_value = $tag.GetAttribute("class")
		$class_value = $tag.className
		If $class_value = "zwfbtime" Then
			$tmp = $tag.innertext
			$text_s = $tmp & @CRLF & $text_s & @CRLF
			
		EndIf
	Next
	$TXTDATA = StringStripWS(HTML_Filters($text_s, 0), 8)

	FileWriteLine(@ScriptDir & "\data.txt", $TXTDATA & "time/////")

	Local $TXTDATA = ""

	;====================bdy=============================
	;SLEEP(300)
	Local $tags = @extended

	;$tags = $oIE.document.GetElementsByTagName("DIV")
	Local $text_s = ""
	Local $tmp = ""
	;For $tag in $tags
	For $tag In $ie_all_div
		; $class_value = $tag.GetAttribute("class")
		$class_value = $tag.className
		If $class_value = "zwcontentmain" Then
			$tmp = $tag.innertext
			$text_s = $tmp & @CRLF & $text_s & @CRLF
			
		EndIf
	Next
	$TXTDATA = StringStripWS(HTML_Filters($text_s, 0), 8)



	FileWriteLine(@ScriptDir & "\data.txt", $TXTDATA & "btbdy/////")

;==================================================================================================================================
;	$text_s = _tl1($ie_all_div)
	;	FileWriteLine(@ScriptDir & "\data.txt", $TXTDATA & "/////" & @CRLF & "--end1---" & @CRLF)
	;============================================================================================================
	
	Local $TXTDATA = ""

$reply_size = _sp1($ie_all_span)
if $reply_size="" then 
	$reply_size=0
	$TXTDATA=_tl1($ie_all_div)
			FileWriteLine(@ScriptDir & "\data.txt", $TXTDATA & "end/////" & @CRLF & "-----" & @CRLF)
		GUICtrlSetData($input1 ,$TXTDATA)
Else
	$reply_size=Number($reply_size)
	
	_getrpy($reply_size)
	
;	MsgBox($MB_SYSTEMMODAL, "页数", $reply_size)

EndIf

	;MsgBox($MB_SYSTEMMODAL, "页数", $reply_size)
	


EndFunc   ;==>pagereconize

func _getrpy($reply_size)
	$curfront = StringTrimRight($line_url, 5)
	For $rpt = 0 To $reply_size
		;==========================================
		$nReply = $curfront & "_" & $rpt & ".html#storeply"
		ConsoleWrite($nReply & @CRLF)
		ierw($nReply)
		;sleep(500)
		$CURPID = 2 ;set process to 2
		;==============reconize=================
		;=======================rpys==========================start
		;SLEEP(300)
		;Local $tags = @extended

	;	$tags = $oIE.document.GetElementsByTagName("DIV")
		Local $text_s = _tl1($ie_all_div)
		
		;Local $tmp = ""
		;For $tag In $ie_all_div
			; $class_value = $tag.GetAttribute("class")
		;	$class_value = $tag.className
		;	If  StringInStr($class_value,"zwlitext stockcodec") Then
							ConsoleWrite($text_s& @CRLF) 	
			;EndIf
		;Next
		;$TXTDATA = StringStripWS(HTML_Filters($text_s, 0), 8)
$TXTDATA =HTML_Filters($text_s, 0)

		;WRITE CHECK URL

		FileWriteLine(@ScriptDir & "\data.txt", $TXTDATA & "end/////----" & @CRLF & "-----" & @CRLF)

		Local $TXTDATA = ""

	Next
GUICtrlSetData($input1 ,$TXTDATA)
	;endCollectt rply
	$data = "" ;restore data
	;===============================================
	$CURPID = 0
EndFunc

Func _tc1($ie_all_span)
	Local $tmp = ""
	For $span In $ie_all_span
		If StringInStr($span.classname, "tc1") Then
			$tmp = $tmp & $span.innertext & "_"
		EndIf
Next
	Return $tmp
EndFunc   ;==>_tc1

Func instr($oIE)
	Global $ie_all_div = $oIE.document.GetElementsByTagName("DIV")
	Global $ie_all_span = $oIE.document.GetElementsByTagName("SPAN")
EndFunc   ;==>instr




func _tl1($ie_all_div)   ;数组中搜索标签
	local $tmp=""
	For    $div IN $ie_all_div
if StringInStr($div.className,"zwlitext stockcodec") then 
$tmp=$tmp&$div.innertext&"_"
endif
Next
return $tmp
endfunc


	Func _sp1($ie_all_span)
	Local $tmp = ""
	For $span In $ie_all_span
		If StringInStr($span.classname, "sumpage") Then
			$tmp =$span.innertext 
		EndIf
Next
	Return $tmp
;MsgBox($MB_SYSTEMMODAL, "标题", "元素在span.classname"&$tmp, 1)
EndFunc   ;==>
