#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoTrayIcon
RCtrl::Send {Volume_Up 5}
RAlt::Send {Volume_Down 5}
Insert::Backspace
>+End::Home
AppsKey::F5
F1::
	Send, git add .{Enter}
Return
F2::
	Send, git commit -m"
Return
^!+Del::ExitApp