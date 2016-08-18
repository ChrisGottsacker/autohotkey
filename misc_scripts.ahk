#Include F:/Libraries/Documents/Hotkeys/Autohotkey/LidWatcher.ahk


;******** Other Keys ********



	
#IfWinActive, ahk_class QWidget		;RStudio
	SC027::<-	;replaces semi-collon with arrow, shortcut for assignment
	return
	
;******** End Other Keys ******** 



;******** Command Line ******** 

;Command line
#ifWinActive, ahk_class ConsoleWindowClass
	
	;open to Python 2.7 script directory
	^p::
		SendInput, cd..{Enter}cd..{Enter}cd Python27{Enter}
	return

;******** End of Commmand Line ******** 

;******** Media Keys ********
#IfWinNotExist, winthatllneverexist
^#Space::	; play/pause media
	SendInput, {Media_Play_Pause}
	return

^#Left::	;previous media	
	SendInput, {Media_Prev}
	return

^#Right::	;next media
	SendInput, {Media_Next}
	return
	
^#Up::	;volume up
	SendInput, {Volume_Up}
	return

^#Down::	;volume down
	SendInput, {Volume_Down}
	return

;******** End Media Keys ******** 


;******** Blender ********
#ifWinActive, ahk_class GHOST_WindowClass
	;Space::!a
	return
	
	0::Numpad0
	1::Numpad1
	2::Numpad2
	3::Numpad3
	4::Numpad4
	5::Numpad5
	6::Numpad6
	7::Numpad7
	8::Numpad8
	9::Numpad9

	.::NumpadDot
	
	NumpadDot::.
	
	=::NumpadAdd
	-::NumpadSub
	
	NumpadAdd::=
	NumpadSub::-
;******** End Blender ******** 
	

;******** IntelliJ IDEA ******** 
#IfWinActive, ahk_class SunAwtFrame
	^d::
		Send, !+{F10}{Enter}
	return
;******** End IntelliJ IDEA ******** 


;******** Utility hotkeys for writing scripts ******** 
	^+m::	;get mouse position
		mouseGetPos, outputVarX, outputVarY
		msgbox, %outputVarX%, %outputVarY%
		return
;******** End Utility hotkeys for writing scripts ******** 


;******** Letter Commands ********

#c::
	;close current window
	WinClose, A
	return
	
;!#c::	;OpenOffice open keyboard command customization 
#IfWinActive, ahk_class SALFRAME
		!#c::	
			SendInput, !Tc
			return
		
		^+b::
			SendInput, +{F12} 
		return
		
		^l::	;clear current line
			SendInput, {End}{Shift Down}{Home}{Shift Up}{Backspace 2}
		return

^x::	;Copies text+formatting, but only deletes 
		;text when using OpenOffice Calc
	sleep, 25	;pause to perform check on Window Title
SetTitleMatchMode, 2
#IfWinActive, OpenOffice Calc
	;^x::
	SendInput, ^c{Backspace}
	return
	
/*
#!^+d::	;Pastes today's date, unless in Google Chrome Window
	#ifWinNotActive, ahk_class Chrome_WidgetWin_1
		^+d::
		FormatTime,Date,,LongDate
		clipSaved := clipboardAll
		clipboard := Date
		SendInput, ^v
		clipboard := clipSaved
		clipSaved := 
	return
*/	

!+^d::	;used by Thinkpad trackpad Tap Zone b/c its macro won't record Windows key

	buffer := 10	;cursor doesn't go to full screen width in iTunes unless the 
					;value is increased past its actual value
					
	CoordMode, Mouse, Screen
	MouseGetPos, xPos, yPos
	sleep, 25
	MouseClick, left, A_ScreenWidth + buffer, A_ScreenHeight
	sleep, 25
	MouseMove, xPos, yPos
	return
	

#f::
	;opens facebook from anywhere
	Run https://facebook.com
	return


; #IfWinNotActive, Gamma Panel::
	; #d::	;Low brightness 
	; Run C:\Program Files (x86)\Gamma Panel\gapa.exe
	; sleep, 100
	; SendInput, {Left 50}
	; sleep, 10000
	; SendInput, !{F4}
	; brightness := 0
	; return
	
	; #b::	;Normal brightness
	; Run C:\Program Files (x86)\Gamma Panel\gapa.exe
	; sleep, 100
	; SendInput, {Right 50}
	; sleep, 10000
	; SendInput, !{F4}
	; brightness := 45
	; return

^+g::
	;opens gmail from anywhere
	Run https://mail.google.com/mail/u/0/#inbox
	return

	
;#h Run help file if .ahk file is open in editor
	SetTitleMatchMode 2
	#IfWinActive, .ahk
		^h::
		Run C:\Program Files(x86)\AutoHotkey\AutoHotkey.chm
	return
	
#n::
	;opens netflix from anywhere
	run http://www.netflix.com/WiHome
	return
	
!r::	;save and reload AutoHotkey.ahk file
	;SetTitleMatchMode 2
	; IfWinActive, .ahk
		msgbox, about to run
		Reload
		Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
		MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
		IfMsgBox, Yes, Edit
		return
	return

#+s::	;run Snipping Tool
		;does not run, try adding code to run as admin
	SendInput, {LWin}
	sleep, 50
	SendInput, SnippingTool.exe{Enter}
	return
	Run, snippingTool.exe
	
#u::	;move line of text to top of list
	SendInput, {Home}+{End}^c^{Home}{Enter}{Up}^v
	return
	
;******** End Letter Commands	

;******** Non-Hot-Keys ******** 
;Turn off display when lid closes
r := Start_LidWatcher()

if r != "233"
	msgbox hi

