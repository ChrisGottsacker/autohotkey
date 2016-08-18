#IfWinActive, ahk_class SALFRAME
	^l::	; delete current line 
		SendInput, {End}{Shift down}{Home}{Shift up}{Backspace 2}
		return
	^d::	; duplicatin current line
		SendInput, {End}{Shift down}{Home}{Shift up}^c{End}{Enter}^v
		return
	^,:: SendInput, {Ctrl down}-{Ctrl up}
		return
	^SC034:: SendInput, {Ctrl down}{NumpadAdd}{Ctrl up}
		return