#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#NoTrayIcon
::SEL::SELECT

;killswitch
^!+Del::ExitApp
;start reloadSwitch
^+#Del::
	Reload
	Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
	MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
	IfMsgBox, Yes, Edit
Return
;end reloadSwitch

;CSS / SQL comment out selection
{Ctrl}9::
	Send, {Ctrl Up}
	Send, {Ctrl Down}x{Ctrl Up}/**/{left}{left}
	Sleep, 50
	Send, {Ctrl Down}v{Ctrl Up}
Return

::DB::DATABASE

;::CREATE{A_Space}T::
;	Send, CREATE TABLE
;Return