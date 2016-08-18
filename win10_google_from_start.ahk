;Uses Google search instead of Bing, assumes Chrome web browser is set as default
#IfWinActive, ahk_class Windows.UI.Core.CoreWindow
	Enter::
	SendInput, ^a
	sleep 25
	SendInput, ^c
	sleep 25
	SendInput, {Enter}
	sleep 1500
	IfWinActive,ahk_class Chrome_WidgetWin_1
	{
		WinMaximize
		SendInput, {Alt down}d{Alt up}
		sleep 25
		SendInput, %clipboard%
		sleep 25
		SendInput, {Enter}
	}
	#IfWinActive
	return