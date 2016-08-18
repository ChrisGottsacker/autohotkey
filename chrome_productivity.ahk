#Include D:\Libraries\Documents\GitHub\AutoHotKey_Private\windows_productivity.ahk

#IfWinActive, ahk_class Chrome_WidgetWin_1
!f::	; Search for selected text in new tab
	Send, ^c
	Sleep 100
	Send, ^t
	Sleep 100
	ControlSend, , %clipboard%, ahk_exe chrome.exe
	; ControlSend, Intermediate D3D Window1, %clipboard%, ahk_exe chrome.exe
	Sleep 100
	Send, {Enter}
	return

!F4::
	SendInput, ^w	;used when one of the Lenovo W540
					;touchpad Tap zones was coded to Alt+F4
	return
^+B::
	;sleep 25
	SendInput, ^+8
	return
	
#k::	; Duplicate current Google Chrome window
	SendInput, !d
	sleep, 100
	SendInput, !{Enter}
	return
^+s::	;ATTACHED TO "^+k SCRIPT" BELOW, DO NOT MOVE
		; opens tab in new window on right side of screen, moves
		;current window to left side of screen
	split:=true
^+k::	; Re-opens current tab in new Google Chrome window
	sleeps := 50
	If(split && GetWinAlign("isfull")="full")
		Align("left")
	sleep, %sleeps%
	clipSaved := clipboardAll	
		sleep, %sleeps%	;probably don't need the sleeps
	clipboard:=""
		sleep, %sleeps%
	SendInput, !d
		sleep, %sleeps%
	SendInput, ^c	;copies url
		sleep, %sleeps%
	SendInput, ^w	;closes tab
		sleep, %sleeps%
	Gosub, ^n	;opens new window
		sleep, 2*%sleeps%
	SendInput, ^v	;fixed prob switching from %clipboard%
		sleep, .5*%sleeps%
	SendInput, {Enter}	;pastes url and searches
		sleep, 100		
		;w/o this sleep, pastes AFTER clipboard is restored
	clipboard := clipSaved	;restores clipboard
		sleep, sleeps
	clipSaved:=""	;frees space
	If(split && GetWinAlign("isfull")="full"){
		Align("right")
		split:=false
	}
	return

^+n::
	num++
^n::
	num++
	Align("tidy")
	sleep, 25	; so it works consistently
	origWin:=GetWinAlign()
	if(num=1){
		SendInput, ^n
		num:=
	}
	else if(num=2){
		SendInput, ^+n
		num:=
	}
	SetTitleMatchMode, 2
	WinWaitActive, New Tab
	Align(GetWinAlign(origWin))
	return