	
;******** Shorthand ******** 
	::mtf::May the Force be with You
	::**::********
	#ifWinActive, ahk_class SWT_Window0{
		::Sys::
			Send System.out.println(
		#ifWinActive
		return
	::-->::
		Send {Alt down}{Numpad2}{Numpad6}{Alt up}
		return
	::<--::
		Send {Alt down}{Numpad2}{Numpad7}{Alt up}
		return
	::npp::
		Run, C:\Program Files (x86)\Notepad++\notepad++.exe
		return
;******** End Shorthand ******** 


;******** Word count ******** 
^+c::	; select text, then trigger this
	punctuation := [A_Space, A_Tab]
	sleep 100
	clip := ClipboardAll
	clipboard =
	SendInput, ^c
	clipwait, 1,1
	count := 0
	output := StrSplit( Clipboard, punctuation)
	count := output.MaxIndex()
	ToolTip, words: %count%
	sleep 1000
	ToolTip
	Clipboard := clip
	return
;******** End Word count ******** 


;******** minor app fixes ******** 
;This remaps RAlt essentially as Win key
ifWinNotActive ahk_class QWidget
RAlt::LWin
	return

#IfWinActive, ahk_class YYGameMakerYY 
	LShift::Enter
	#IfWinActive
	return
	
;******** End minor app fixes ******** 

;******** MISC ********
; Fixes stupid issue in Adobe Acrobat where ctrl+backspace in Find field inserts a char.
#IfWinActive, ahk_class AcrobatSDIWindow
	^Backspace:: SendInput, {Backspace 20}
	#IfWinActive
	return	
	
^+i::
	Send, ^i ; Toggle "Italics" ON
	Send, ^v
	Send, ^i ; Toggle "Italics" OFF
	
~CapsLock::
	if(GetKeyState("CapsLock", "T")){
		msg = ABC
	}
	else{
		msg = abc
	}
	ToolTip, %msg%,A_CaretX,A_CaretY
	sleep 250
	ToolTip
	return
		
~Insert::
	if(GetKeyState("Insert", "T")){
		msg = OVR
	}
	else{
		msg = INS
	}
	ToolTip, %msg%,A_CaretX,A_CaretY
	sleep 250
	ToolTip
	return
	
~NumLock::
	if(GetKeyState("NumLock", "T")){
		msg = NumLock on
	}
	else{
		msg = NumLock off
	}
	ToolTip, %msg%,A_CaretX,A_CaretY
	sleep 250
	ToolTip
	return	
	
;******** MISC ********

;/******** Windows management********
#h::	; Hibernate
	Run, cmd.exe
	sleep 1000
	Send, shutdown /h{Enter}
	sleep 1000
	Send, exit{Enter}
	return
 
~PrintScreen::
	sleep 25
	SendInput, {LWin Down}{Tab}{LWin Up}
	return

^PrintScreen::
	Run, D:\Libraries\Documents\Hotkeys_m\nircmd-x64\commands\Display off
	return

GetWinAlign(mode=""){	;returns current win alignment, or opposite of alignment passed as mode parameter
	WinGet, WinSize, MinMax
	WinGetPos,x,y,,,A
	if(WinSize=1 && mode="isfull")
		sleep 25
		return "full"
	if(WinSize!=1){		;is partial window
		if((x=0 && mode!="left") || mode="right")	;if win is left, or looking for opposite of right
			return "left"
		else if((x=A_ScreenWidth/2 && mode!="right") || mode="left")
			return "right"
		else if(x<A_ScreenWidth/4)
			return "leftish"
		else if(x>=A_ScreenWidth/4)
			return "rightish"
	}
}
	return
	
	
Align(dir){
	winAlign:=GetWinAlign()
	if((dir="left" && winAlign="full") || (dir="tidy" && winAlign="leftish"))
		SendInput, #{Left}
	else if(dir="left" && winAlign="right")
		SendInput, #{Right}
	else if((dir="right" && winAlign="full") || (dir="tidy" && winAlign="rightish"))
		SendInput, #{Right}
	else if(dir="right" && winAlign="left")
		SendInput, #{Left}
	return
}	

;******** End Windows management ******** 
	
;******** Windows Explorer ******** 
#IfWinActive, ahk_class CabinetWClass	;Windows Explorer
	+Enter::	;briefly opens Properties for selected file/folder
		SendInput, !{Enter}
		Input,Stay,T2,{Space}	;doesn't close after 2s if press Space
		if (ErrorLevel = "Timeout")
			WinClose, ahk_class #32770
		ErrorLevel := ""
		#IfWinActive
		return
		

;******** End of Windows Explorer ******** 












; Fixes stupid issue where Windows won't set Chrome as default browser (important for keyboard internet button)
; ~Enter::
	; Loop{
		; WinWaitActive, ahk_class IEFrame	
		; WinClose, ahk_class IEFrame
		; Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
		; sleep 1000
		; SendInput, {LWin down}{Up}{LWin up}
		
		; WinWaitActive, ahk_class ApplicationFrameWindow
		; WinClose, ahk_class ApplicationFrameWindow
		; Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
		; sleep 1000
		; SendInput, {LWin down}{Up}{LWin up}
	; }
	; return
	
	
; !PrintScreen::	;open dialog to put computer to sleep
	; to do- get mouse position before executing, return mouse to original spot
	
	; buffer := 10	;cursor doesn't go to full screen width in iTunes unless the 
					; value is increased past its actual value
					
	; MouseClick, left, A_ScreenWidth + buffer, A_ScreenHeight	;show desktop
	; WinWaitActive, ahk_class WorkerW
	; {
		; SendInput, !{F4}	;open Shutdown dialog
		
		; SetTitleMatchMode, 2
		; WinWaitActive, Shut Down Windows
		; {
			; SendInput, {Up 2}		;select sleep from dropdown list
		; }
	; }
	; return
	
	;******** Switch b/n Windows 10 virtual desktops ******** 
; PgDn & Right::SendInput {LWin down}{Ctrl down}{Right}{Ctrl up}{LWin up}
	; return
; PgUp & Left::SendInput {LWin down}{Ctrl down}{Left}{Ctrl up}{LWin up}
	; return
;******** END Switch b/n Windows 10 virtual desktops ******** 