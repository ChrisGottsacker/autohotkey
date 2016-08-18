last_time_active := A_Now	;  YYYYMMDDHH24MISS 

;************* eye-care ***************************************
seconds_during_break := 20
minutes_between_breaks := 30
loop{
	; don't run when no one's using computer
	sleep minutes_between_breaks*60*1000	; in milliseconds
	if A_Now - last_time_active < minutes_between_breaks*100+59{	
		msgbox, 0, "20/20 rule", "Give your eyes a rest", 10
		IfMsgBox, Timeout	; send new reminder every 10 seconds until seen
			seen := false
			While(!seen){
				msgbox, 0, "20/20 rule", "Give your eyes a rest", 10
				IfMsgBox, Ok
					seen := true
			}
		t := seconds_during_break
		While t > 0{
			msgbox, 0, countdown, %t% more seconds to go :),1
			t--
		}
	}
}
;*************************************************************		


; activity detected
~RButton::
~LButton::
	last_time_active := A_Now
	return