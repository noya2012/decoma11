#include <array.au3>
#include <GUIConstants.au3>
#include<IE.au3>
;#include<setdefault.au3>
#include<file.au3>
#include <MsgBoxConstants.au3>
#include<excel.au3>
#RequireAdmin
#include<_html.au3>
#include<sfilter.au3>

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
Opt("TCPTimeout",100)           
Opt("TrayAutoPause",1)          
Opt("TrayIconDebug", 0)         
Opt("TrayIconHide", 0)          
Opt("TrayMenuMode",0)           
Opt("TrayOnEventMode",0)        
Opt("WinDetectHiddenText", 0)   
Opt("WinSearchChildren", 1)     
Opt("WinTextMatchMode", 1)      
Opt("WinTitleMatchMode", 1)     
Opt("WinWaitDelay", 250)   

$Form1_1 = GUICreate("Form1", 618, 325, 192, 114)
ConsoleWrite(@ScriptLineNumber&@CRLF)
$Input1 = GUICtrlCreateInput("ƥ�����", 56, 32, 433, 21)
ConsoleWrite(@ScriptLineNumber&@CRLF)
$Button1 = GUICtrlCreateButton("ѡ���б��ļ�", 496, 32, 89, 25)
ConsoleWrite(@ScriptLineNumber&@CRLF)
$List1 = GUICtrlCreateList("", 56, 168, 433, 136)
ConsoleWrite(@ScriptLineNumber&@CRLF)
$Button3 = GUICtrlCreateButton("��ʼ", 392, 136, 97, 33)
ConsoleWrite(@ScriptLineNumber&@CRLF)
$Button4 = GUICtrlCreateButton("ѡ�񱣴�·��", 496, 72, 89, 25)
ConsoleWrite(@ScriptLineNumber&@CRLF)
$Input2 = GUICtrlCreateInput("Input2", 56, 72, 433, 21)
ConsoleWrite(@ScriptLineNumber&@CRLF)
$Combo1 = GUICtrlCreateCombo("Combo1", 64, 144, 193, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
ConsoleWrite(@ScriptLineNumber&@CRLF)
$Label1 = GUICtrlCreateLabel("����б�", 56, 16, 160, 17)
ConsoleWrite(@ScriptLineNumber&@CRLF)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###While 1
Global $g_idGUIEdit
Global $g_idGUIProg
global $oIE=0
ConsoleWrite(@ScriptLineNumber&@CRLF)
Global $filepath=@scriptdir
ConsoleWrite(@ScriptLineNumber&@CRLF)
Global $size=0 ;difine listfile size
ConsoleWrite(@ScriptLineNumber&@CRLF)
Global $list_file_url=@ScriptDir&"\�����б�.txt";ҳ����ȡ���ļ�
ConsoleWrite(@ScriptLineNumber&@CRLF)

Global $line_url="http://guba.eastmoney.com/"
ConsoleWrite(@ScriptLineNumber&@CRLF)
Global $state=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
Global $stock_id=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
Global $resault_dir=@scriptdir&"\data"
ConsoleWrite(@ScriptLineNumber&@CRLF)
Global $excel_file=@scriptdir&"\�ɼ�����.xls"
ConsoleWrite(@ScriptLineNumber&@CRLF)
Global $oEventObject
GLOBAL $SIZES=0
ConsoleWrite(@ScriptLineNumber&@CRLF)
GLOBAL $CURPID=0
ConsoleWrite(@ScriptLineNumber&@CRLF)
global $TXTDATA=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
Global $oExcel, $oWorkbook
Global $cur_process=0
ConsoleWrite(@ScriptLineNumber&@CRLF)



While 1
	;GUISetState(@SW_SHOW)
$mainui_nMsg = GUIGetMsg()
ConsoleWrite(@ScriptLineNumber&@CRLF)
	Switch $mainui_nMsg
		;Case $GUI_EVENT_CLOSE
		;	Exit

case $button1

Global $size=_FileCountLines ($list_file_url)
ConsoleWrite(@ScriptLineNumber&@CRLF)
GLOBAL $iCountLines = $size
ConsoleWrite(@ScriptLineNumber&@CRLF)
if $size >0 then 
MsgBox($MB_SYSTEMMODAL, "",$list_file_url&" ����"& $size&"�У����Կ�ʼ����")

else

MsgBox($MB_SYSTEMMODAL, "", "û���ҵ���ַ�б�����д�ָ�� �����б�.txt.")

endif
case $button3
;ѡ���ļ�
;$list_file_url=$resault_dir & "\�����б�.txt"  

Global $size=_FileCountLines ($list_file_url)
ConsoleWrite(@ScriptLineNumber&@CRLF)
GLOBAL $iCountLines = $size
ConsoleWrite(@ScriptLineNumber&@CRLF)
if $size >0 then 
MsgBox($MB_SYSTEMMODAL, "",$list_file_url&" ����"& $size&"�У����Կ�ʼ����")

else
MsgBox($MB_SYSTEMMODAL, "", "û���ҵ���ַ�б�����д�ָ�� �����б�.txt.")

endif


;�����б�d
Local $aRetArray[1] = [0]
ConsoleWrite(@ScriptLineNumber&@CRLF)



   _FileReadToArray($list_file_url, $aRetArray, $FRTA_NOCOUNT, ",")
     GUICtrlSetData($List1,$aRetArray)
	 ConsoleWrite("��ʼ����")


case $button4  ;ѡ�񱣴�·��
$resault_dir=FileSelectFolder("ѡ��Ҫ�����·��", @ScriptDir)
ConsoleWrite(@ScriptLineNumber&@CRLF)
	GUICtrlSetData($Input2,$resault_dir)

    If @error Then
        ; ��ʾ����������Ϣ.
        MsgBox($MB_SYSTEMMODAL, "", "û��ѡ���κ��ļ���.")
else 
MsgBox($MB_SYSTEMMODAL, "", $resault_dir)



 ;��ʼ����IE

start_job($oIE);ִ�д򿪴���




 endif;�ر�ѡ���ļ�ѭ��


	
	EndSwitch;����ѡ���¼�����

_Excel_BookSave($oWorkbook)
WEnd
;����gui�¼�


removeIE() 





Func start_job($oie)
;���̰�����IE��������
    Local $iMsg
local $hGUIMain 
 $hGUIMain = GUICreate("IE BROWSER", 600, 500)
ConsoleWrite(@ScriptLineNumber&@CRLF)
    $g_idGUIEdit = GUICtrlCreateEdit("626" & @CRLF, 10, 20, 580, 400)
ConsoleWrite(@ScriptLineNumber&@CRLF)
    $g_idGUIProg = GUICtrlCreateProgress(10, 5, 580, 10)
ConsoleWrite(@ScriptLineNumber&@CRLF)
    Local $idGUIExit = GUICtrlCreateButton("�˳��ɼ�", 250, 450, 80, 30)
ConsoleWrite(@ScriptLineNumber&@CRLF)
    GUISetState() ;Show GUI
    Sleep(1000) ; Give it some time to load the web page
    GUISwitch($hGUIMain) ; Switch back to our GUI in case IE stole the focus
  ; We prepare the Internet Explorer as our test subject
 ieobjint()
While 1
        $iMsg = GUIGetMsg()
ConsoleWrite(@ScriptLineNumber&@CRLF)
        If $iMsg = $idGUIExit Then exit
ConsoleWrite(@ScriptLineNumber&@CRLF)
  DOWN_BY_LIST($list_file_url)  
;���б�����
WEnd
EndFunc   ;==>Example
Func DOWN_BY_LIST($list_file_url)
	

MsgBox($MB_SYSTEMMODAL, "", "��ʼ�����б�����ַ.")
$FILE_HWN=FileOpen($list_file_url,1)
ConsoleWrite(@ScriptLineNumber&@CRLF)
$size=_FileCountLines($list_file_url)
ConsoleWrite(@ScriptLineNumber&@CRLF)
If $list_file_url = "" Then 
ConsoleWrite(@ScriptLineNumber&@CRLF)
	MsgBox($MB_SYSTEMMODAL, "", "û��ѡ������б�.�����˻�")
	Return
else
	MsgBox($MB_SYSTEMMODAL, "", "�����ɾ�����ʹ����б��У���û�б��ݣ����ڿ����ȱ���ԭʼ�б����������")
EndIf
for $SIZES=$size to 1 Step -1
ConsoleWrite(@ScriptLineNumber&@CRLF)
;
$state=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
	
$line_url = FileReadLine($list_file_url,$SIZES)
ConsoleWrite(@ScriptLineNumber&@CRLF)
fileclose($line_url)
ConsoleWrite("�б�����"&$line_url)
If StringLen($line_url)>10 Then
;to be continue
 
$stock_id=StringTrimRight(StringTrimLeft( "$line_url",38 ),5)
ConsoleWrite(@ScriptLineNumber&@CRLF)
$oIE.navigate($line_url)
_ieloadwait($oIE)
sleep(500)
ConsoleWrite($LINE_URL&@CRLF)
GLOBAL $CURPID=1
ConsoleWrite(@ScriptLineNumber&@CRLF)
pagereconize()
set_stock_show()

;ending
SetError(0)


EndIf

;=========================================================
_FileWriteToLine($list_file_url,$SIZES,"",True)
fileclose($line_url)

;
Next
MsgBox($MB_SYSTEMMODAL, "", "�Ѿ���ȡ����ַ������������ѡ�˳�.")
    ;FileClose($FILE_HWN)
EXIT
ENDFUNC
;=================================================
Func IEEvent_BeforeNavigate($line_url, $iFlags, $sTargetFrameName, $dPostData, $sHeaders, $bCancel)
    ;   Note: the declaration is different from the one on MSDN.
    GUICtrlSetData($g_idGUIEdit, "BeforeNavigate: ")
SetError(0)
EndFunc   ;==>IEEvent_BeforeNavigate
;=================================================
Func IEEvent_ProgressChange($iProgress, $iProgressMax)
    If $iProgressMax > 0 Then
        GUICtrlSetData($g_idGUIProg, ($iProgress * 100) / $iProgressMax)
    EndIf
SetError(0)
EndFunc   ;==>IEEvent_ProgressChange

Func IEEvent_StatusTextChange($sText)
    GUICtrlSetData($g_idGUIEdit,  $sText)
SetError(0)
EndFunc   ;==>IEEvent_StatusTextChange
;=================================================
Func IEEvent_PropertyChange($szProperty)
SetError(0)
    GUICtrlSetData($g_idGUIEdit, "IE Changed the value of the property: " & $szProperty & @CRLF)
EndFunc   ;==>IEEvent_PropertyChange
;=================================================
Func IEEvent_DownloadComplete()
    GUICtrlSetData($g_idGUIEdit, "IE has finished a navigation operation" & @CRLF)
SetError(0)



EndFunc   ;==>IEEvent_DownloadComplete
;=================================================�����������ʶ��=====================================
Func IEEvent_NavigateComplete($line_url)
    ;   Note: the declaration is different from the one on MSDN.
    GUICtrlSetData($g_idGUIEdit, $line_url)

Switch $CURPID
CASE 1
pagereconize()

EndSwitch

SetError(0)
EndFunc   ;==>IEEvent_NavigateComplete

Func IEEvent_($sEventName)
SetError(0)
 ieobjint()
  seterror(0) 
    GUICtrlSetData($g_idGUIEdit, "Uncatched event: " & $sEventName & @CRLF )
EndFunc   ;==>IEEvent_
;======================================================================================
Func download_event($state)
SetError(0)
    GUICtrlSetData($g_idGUIEdit, "Uncatched event: " & $state & @CRLF)
EndFunc  
 

;=================================================��������====================================
Func _ErrFunc($oError)
ieobjint()
  seterror(0)
EndFunc   ;==>_ErrFunc
;=================================================�====================================


;=================================================�������������=====================================
func ieobjint()
global $oIE=0
ConsoleWrite(@ScriptLineNumber&@CRLF)
_IELoadWaitTimeout(1500)
$oIE = ObjCreate("InternetExplorer.Application.1")
ConsoleWrite(@ScriptLineNumber&@CRLF)
$oIE.Navigate("http://baidu.com") 
 $sURL = "http://guba.eastmoney.com/list,600382.html"
ConsoleWrite(@ScriptLineNumber&@CRLF)

    Local $oEventObject = ObjEvent($oIE, "IEEvent_", "DWebBrowserEvents")
ConsoleWrite(@ScriptLineNumber&@CRLF)
    If @error Then
        MsgBox($MB_OK, "�д�����", _
                "ObjEvent: Can't use event interface 'DWebBrowserEvents'. Error code: " & Hex(@error, 8))

    EndIf
    
With $oIE
        .Visible = 1
        .Top = (@DesktopHeight - 400) / 2
        .Height = 400 ; Make it a bit smaller than our GUI.
        .Width = 600
        .Silent = 1 ; Don't show IE's dialog boxes
        GLOBAL $hIEWnd = HWnd(.hWnd) ; Remember the Window, in case user decides to close it
ConsoleWrite(@ScriptLineNumber&@CRLF)
    EndWith

endfunc
;=================================================�������������=====================================
func removeIE() 
$oEventObject.Stop ; Tell IE we don't want to receive events.
    $oEventObject = 0 ; Kill the Event Object
ConsoleWrite(@ScriptLineNumber&@CRLF)
    If WinExists($hIEWnd) Then $oIE.Quit ; Close IE Window
    $oIE = 0 ; Remove IE from memory (not really necessary).
ConsoleWrite(@ScriptLineNumber&@CRLF)

    ;GUIDelete($hGUIMain) ; Remove GUI

endfunc

func set_stock_show()
GUICtrlSetData($input1,$stock_id)
endfunc

func  pagereconize()




Local $Ele = @extended
ConsoleWrite(@ScriptLineNumber&@CRLF)
;local $data=@extended
SLEEP(1000)


;=====================����============================

SLEEP(300)
Local $tags= @extended
ConsoleWrite(@ScriptLineNumber&@CRLF)

$tags = $oIE.document.GetElementsByTagName("div")
ConsoleWrite(@ScriptLineNumber&@CRLF)
Local $text_s=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
Local $tmp=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
For $tag in $tags
   ; $class_value = $tag.GetAttribute("class")
	$class_value = $tag.className
ConsoleWrite(@ScriptLineNumber&@CRLF)
    If $class_value = "zwmbtilr" Then
ConsoleWrite(@ScriptLineNumber&@CRLF)
      $tmp=$tag.innertext
ConsoleWrite(@ScriptLineNumber&@CRLF)
	  $text_s=$tmp&$text_s&@CRLF
ConsoleWrite(@ScriptLineNumber&@CRLF)
	  
EndIf
Next
$TXTDATA=HTML_Filter($text_s,0)
ConsoleWrite(@ScriptLineNumber&@CRLF)






FileWriteLine(@scriptdir&"\data.txt",$TXTDATA&"/////")
consolewrite($TXTDATA&@CRLF)
;================================================================E
LOCAL $TXTDATA="";3��
ConsoleWrite(@ScriptLineNumber&@CRLF)
;=======================ʱ��==========================
SLEEP(300)
SLEEP(300)
Local $tags= @extended
ConsoleWrite(@ScriptLineNumber&@CRLF)

$tags = $oIE.document.GetElementsByTagName("DIV")
ConsoleWrite(@ScriptLineNumber&@CRLF)
Local $text_s=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
Local $tmp=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
For $tag in $tags
   ; $class_value = $tag.GetAttribute("class")
	$class_value = $tag.className
ConsoleWrite(@ScriptLineNumber&@CRLF)
    If $class_value = "zwfbtime" Then
ConsoleWrite(@ScriptLineNumber&@CRLF)
      $tmp=$tag.innertext
ConsoleWrite(@ScriptLineNumber&@CRLF)
	  $text_s=$tmp&$text_s&@CRLF
ConsoleWrite(@ScriptLineNumber&@CRLF)
	  
EndIf
Next
$TXTDATA=HTML_Filter($text_s,0)
ConsoleWrite(@ScriptLineNumber&@CRLF)








FileWriteLine(@scriptdir&"\data.txt",$TXTDATA&"/////")
consolewrite($TXTDATA&@CRLF)
;================================================================C
LOCAL $TXTDATA=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
;======================�Ķ�===========================
SLEEP(300)
Local $tags= @extended
ConsoleWrite(@ScriptLineNumber&@CRLF)

$tags = $oIE.document.GetElementsByTagName("SPAN")
ConsoleWrite(@ScriptLineNumber&@CRLF)
Local $text_s=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
Local $tmp=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
For $tag in $tags
   ; $class_value = $tag.GetAttribute("class")
	$class_value = $tag.className
ConsoleWrite(@ScriptLineNumber&@CRLF)
    If $class_value = "tc1" Then
ConsoleWrite(@ScriptLineNumber&@CRLF)
      $tmp=$tag.innertext
ConsoleWrite(@ScriptLineNumber&@CRLF)
	  $text_s=$tmp&$text_s&@CRLF
ConsoleWrite(@ScriptLineNumber&@CRLF)
	  
EndIf
Next
$TXTDATA=HTML_Filter($text_s,0)
ConsoleWrite(@ScriptLineNumber&@CRLF)






FileWriteLine(@scriptdir&"\data.txt",$TXTDATA&"/////")
consolewrite($TXTDATA&@CRLF)
;================================================================H
LOCAL $TXTDATA=""
ConsoleWrite(@ScriptLineNumber&@CRLF)

;========================����=========================
SLEEP(300)
SLEEP(300)
Local $tags= @extended
ConsoleWrite(@ScriptLineNumber&@CRLF)

$tags = $oIE.document.GetElementsByTagName("DIV")
ConsoleWrite(@ScriptLineNumber&@CRLF)
Local $text_s=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
Local $tmp=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
For $tag in $tags
   ; $class_value = $tag.GetAttribute("class")
	$class_value = $tag.className
ConsoleWrite(@ScriptLineNumber&@CRLF)
    If $class_value = "zwconttbt" Then
ConsoleWrite(@ScriptLineNumber&@CRLF)
      $tmp=$tag.innertext
ConsoleWrite(@ScriptLineNumber&@CRLF)
	  $text_s=$tmp&$text_s&@CRLF
ConsoleWrite(@ScriptLineNumber&@CRLF)
	  
EndIf
Next
$TXTDATA=HTML_Filter($text_s,0)
ConsoleWrite(@ScriptLineNumber&@CRLF)






FileWriteLine(@scriptdir&"\data.txt",$TXTDATA&"/////")
consolewrite($TXTDATA&@CRLF)
;================================================================B
LOCAL $TXTDATA=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
;====================����=============================
SLEEP(300)
SLEEP(300)
Local $tags= @extended
ConsoleWrite(@ScriptLineNumber&@CRLF)

$tags = $oIE.document.GetElementsByTagName("SPAN")
ConsoleWrite(@ScriptLineNumber&@CRLF)
Local $text_s=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
Local $tmp=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
For $tag in $tags
   ; $class_value = $tag.GetAttribute("class")
	$class_value = $tag.className
ConsoleWrite(@ScriptLineNumber&@CRLF)
    If $class_value = "zwconbody" Then
ConsoleWrite(@ScriptLineNumber&@CRLF)
      $tmp=$tag.innertext
ConsoleWrite(@ScriptLineNumber&@CRLF)
	  $text_s=$tmp&$text_s&@CRLF
ConsoleWrite(@ScriptLineNumber&@CRLF)
	  
EndIf
Next
$TXTDATA=HTML_Filter($text_s,0)
ConsoleWrite(@ScriptLineNumber&@CRLF)






FileWriteLine(@scriptdir&"\data.txt",$TXTDATA&"/////")
consolewrite($TXTDATA&@CRLF)
;================================================================D
LOCAL $TXTDATA=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
Local $oLinks = @extended
ConsoleWrite(@ScriptLineNumber&@CRLF)
$oLinks = _IELinkGetCollection($oIE)
ConsoleWrite(@ScriptLineNumber&@CRLF)
Sleep(100)
SetError(0)
Local $curfilename3 =@scriptdir&"\pagereconize.tmp"
ConsoleWrite(@ScriptLineNumber&@CRLF)
FileDelete($curfilename3)
SetError(0)
Local $iNumLinks = @extended
ConsoleWrite(@ScriptLineNumber&@CRLF)
Local $succed = _FileCreate($curfilename3)
ConsoleWrite(@ScriptLineNumber&@CRLF)
SetError(0)
If $succed = 1 Then
ConsoleWrite(@ScriptLineNumber&@CRLF)
	FileOpen($curfilename3, $FO_APPEND)
	For $oLink In $oLinks
		$sTxt = $oLink.href & @CRLF
ConsoleWrite(@ScriptLineNumber&@CRLF)
If StringInStr($stxt, "html#storeply") =1  And StringInStr($stxt,"news,"&$stock_id)=1 Then
ConsoleWrite(@ScriptLineNumber&@CRLF)
			FileWrite($curfilename3, $stxt)
		EndIf ; ���������ʹ��
		;���������������
	Next
EndIf ;succed==1������
FileClose($curfilename3)
SetError(0)
$reply_size=_filecountlines($curfilename3)
ConsoleWrite(@ScriptLineNumber&@CRLF)
;MsgBox($MB_SYSTEMMODAL, "", $reply_size)
for $rpt=1 to $reply_size
ConsoleWrite(@ScriptLineNumber&@CRLF)
$rpt_line=StringTrimRight($line_url, 5)&"_"&$rpt&".html"
ConsoleWrite(@ScriptLineNumber&@CRLF)
_IENavigate($oie,$rpt_line)
SLEEP(1000)
;=======================�ϲ��ظ�==========================
SLEEP(300)
SLEEP(300)
Local $tags= @extended
ConsoleWrite(@ScriptLineNumber&@CRLF)

$tags = $oIE.document.GetElementsByTagName("DIV")
ConsoleWrite(@ScriptLineNumber&@CRLF)
Local $text_s=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
Local $tmp=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
For $tag in $tags
   ; $class_value = $tag.GetAttribute("class")
	$class_value = $tag.className
ConsoleWrite(@ScriptLineNumber&@CRLF)
    If $class_value = "zwlitext stockcodec" Then
ConsoleWrite(@ScriptLineNumber&@CRLF)
      $tmp=$tag.innertext
ConsoleWrite(@ScriptLineNumber&@CRLF)
	  $text_s=$tmp&$text_s&@CRLF
ConsoleWrite(@ScriptLineNumber&@CRLF)
	  
EndIf
Next
$TXTDATA=HTML_Filter($text_s,0)
ConsoleWrite(@ScriptLineNumber&@CRLF)
FileWriteLine(@scriptdir&"\data.txt",$TXTDATA&"/////")
consolewrite($TXTDATA&@CRLF)
;================================================================F
LOCAL $TXTDATA=""
ConsoleWrite(@ScriptLineNumber&@CRLF)
$data=""
ConsoleWrite(@ScriptLineNumber&@CRLF)

;===============================================
next
$curpid=0
ConsoleWrite(@ScriptLineNumber&@CRLF)






endfunc













































































































































































































































































































































































































































































