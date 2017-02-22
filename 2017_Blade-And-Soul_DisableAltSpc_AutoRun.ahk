#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#InstallKeybdHook
#UseHook On
#MaxThreadsPerHotkey 2
#IfWinActive, Blade & Soul

;Hotkeys off by default until I'm AutoRunning
Hotkey, $w, Off
Hotkey, ~s, Off
Hotkey, ~LButton, Off
Hotkey, $w up, Off

!space::Return
#space::Return
~Capslock::SetCapsLockState, Off
Return

SetKeyDelay, 0, 50

;press and release x, is the autorun hotkey
$*x Up::
If AutoRunning
{
	;Stop AutoRunning
	AutoRunning:= !AutoRunning
	Send {w Up}
	Hotkey, $w, Off
	Hotkey, ~s, Off
	Hotkey, ~LButton, Off
}
Else 	;Start AutoRunningw
{
	w_phys_pressed:=GetKeyState("w", "P")			;if w is being  pressed
	If w_phys_pressed
	{
		Sleep, 10
		BlockInput, MouseMoveOff 			;block w from being input physically
		AutoRunning:= !AutoRunning
		Sleep, 300
		BlockInput,  Off
		Keywait, w
		Hotkey, $w, On
		Hotkey, ~s, On
		Hotkey, ~LButton, On
		;Turn On hotkeys which can Stop AutoRunning
	}
	Else
	{
		send {w down}
		AutoRunning:= !AutoRunning
		Hotkey, $w, On
		Hotkey, ~s, On
		Hotkey, ~LButton, On
	}
}
Return

$+w::
AutoRunning:= !AutoRunning
Send {w Down}
Send +
Hotkey, $w, On
Hotkey, ~s, On
Hotkey, ~LButton, On
Return

~s::
~LButton::
Hotkey, ~s, Off
Hotkey, ~LButton, Off
Hotkey, $w, Off
If AutoRunning
{
	AutoRunning:= !AutoRunning
	Sleep, 100
	Send w
}
Return

$w::
If AutoRunning		;if fake w being pressed aka autorun
{
	AutoRunning:= !AutoRunning
	Send w
	Hotkey, $w, Off
}
Return