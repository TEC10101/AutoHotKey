#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;#NoTrayIcon

;remap volume laptop
+RCtrl::Send {Volume_Up 5}
+RAlt::Send {Volume_Down 5}

;retag insert for laptop
Insert::Backspace

; easier go to left-home of text line
>+End::
	Send, {Rshift UP}{Home}
Return

>+PgDn::
	Send, {Rshift Down}{Home}
Return
	
;** F5 / Refresh **
AppsKey::F5
RCtrl::F5
RAlt::F5
!AppsKey::
	Send, AppsKey
Return

;start git shortcuts
F1::
	Send, git add .{Enter}
Return
F2::
	Send, git commit -m"
Return
;end git shortcuts

;start CSS/SQL aut-complete comment
::/*::
	Send, /**/{Left}{Left}
Return

;CSS / SQL comment out selection
;^+/::
;	Send, ^x/**/{left}{left}
;	Sleep, 50
;	Send, ^v
;Return

;start CSS.... interferes with the above
^/::*/
;Return
;end CSS/SQL comment-complete

^-::
	Send, -
Return
+-::
	Send, _
Return

-::=

;killswitch keep at bottom/end
^!+Del::ExitApp
;start reloadSwitch
^+#Del::
	Reload
	Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
	MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
	IfMsgBox, Yes, Edit
Return
;end reloadSwitch