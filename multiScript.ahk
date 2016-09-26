#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;#NoTrayIcon

;remap volume laptop
RCtrl::Send {Volume_Up 5}
RAlt::Send {Volume_Down 5}

;retag insert for laptop
Insert::Backspace

; easier go to left-home of text line
>+End::Home

;refresh
AppsKey::F5

;start git shortcuts
F1::
	Send, git add .{Enter}
Return
F2::
	Send, git commit -m"
Return
;end git shortcuts

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

;start CSS/SQL comment-complete
::/*::
	;if GetKeyState("LShift", "P")
	;{
		Send, /**/{Left}{Left}
		Return
	;} 
	;else
	;{
	;	Send, /{!8}
	;	Return
	;}
;Return

^/::
	Send, */
Return
;end CSS/SQL comment-complete