func m($filepath_t)
local $src=$filepath_t
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