#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 623, 236, 192, 114)
$Button1 = GUICtrlCreateButton("Button1", 96, 76, 425, 57)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd
func storefile($filepath_t)
	local $arrays[0]
	
	_FileReadToArray($filepath_t)
	
	EndFunc
	
	
	
	
	
	func m($src,$filepath_t)

local $hhw
local $arr[0]
_FileReadToArray($src,$arr)
ConsoleWrite($arr)
 $scc=_FileCreate($filepath_t)  
 $hhw=FileOpen($filepath_t,128)
	ConsoleWrite($scc)
	_ArrayDelete($arr,0)
		_ArrayDelete($arr,1)
	
_FileWriteFromArray($filepath_t,$arr)
FileClose($hhw)


EndFunc

	
	
	
	
	
	
	
	
	
	

Func rc4($sKey, $sStr)
    Local $s[256], $j = 0, $x, $res, $y, $i
    Local $uBound
    For $i = 0 To 255
        $s[$i] = $i
    Next
    For $i = 0 To 255
        $j = Mod(($j + $s[$i] + Asc(StringMid($sKey, Mod($i, StringLen($sKey))+1, 1))), 256)
        $x = $s[$i]
        $s[$i] = $s[$j]
        $s[$j] = $x
    Next
    $i = 0
    $j = 0
    For $y = 0 To StringLen($sStr)-1
        $i = Mod(($i + 1), 256)
        $j = Mod(($j + $s[$i]), 256)
        $x = $s[$i]
        $s[$i] = $s[$j]
        $s[$j] = $x
        $res &= Chr(BitXOR(Asc(StringMid($sStr, $y+1, 1)), ($s[Mod(($s[$i] + $s[$j]), 256)])))
    Next
    Return $res
EndFunc