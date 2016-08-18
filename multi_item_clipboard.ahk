;This block saves three most recent versions of clipboard
OnClipboardChange:	;runs after detecting changes to clipboard
	clipboardC:=clipboardB	;discards data saved in clipboardC
	sleep 25
	clipboardB:=clipboardA	;shifts data from clipboardA to clipboardB
	sleep 25
	clipboardA:=clipboard	
	return
^!v::
	HowFar:=""		;start fresh
	Input,HowFar,T1,,1,2		;get next input
	if(HowFar=1)
		SendInput, %clipboardB%	;paste 2nd to last copied data
	else if(HowFar=2)
		SendInput, %clipboardC%	;paste 3rd to last copied data
	return
	
	
;TODO
 ; -see if ="int" is actually different than =int
 ; -write up instructions
 ; -read git shell instructions to understand how commits work and how revoking them works WRT conflicting changes, then publish
 