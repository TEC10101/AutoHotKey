#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; launch app by path
Run "C:\Program Files\Git\git-bash.exe" "--cd-to-home"
Sleep, 1000
Send cd ..{Enter}
Sleep, 50
Send cd ..{Enter}
Sleep, 50
Send cd Projects{Enter}
Sleep, 50
Send cd Portfolio{Enter}
ExitApp
Return