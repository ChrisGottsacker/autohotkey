;******** Media Keys ********
!k::	; play/pause. Also, start MusicBee and play song, keep player minimized
	IfWinNotActive, ahk_exe MusicBee.exe
	{
		IfWinNotExist, ahk_exe MusicBee.exe
		{
			Run, C:\Program Files (x86)\MusicBee\MusicBee.exe
			WinWait, ahk_exe MusicBee.exe
		}
		IfWinActive, ahk_exe MusicBee.exe
		{
			WinMinimize, ahk_exe MusicBee.exe
			sleep, 2000
		}
	}
	ControlSend,,{Space},ahk_exe MusicBee.exe
	return

!j::	; prev.
	ControlSend,,^b,ahk_exe MusicBee.exe
	return
	
!l::	; next.
	ControlSend,,^n,ahk_exe MusicBee.exe
	return
