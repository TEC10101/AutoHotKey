#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#InstallKeybdHook
#UseHook On
#MaxThreadsPerHotkey 3
#IfWinActive, Blade & Soul

!space::return
#space::return

SetKeyDelay, 0, 50
Hotkey, ~w, Off
Hotkey, ~s, Off
Hotkey, ~LButton, Off

~*x Up::
If(LightIsOn)
{
	LightIsOn:= !LightIsOn
	Send {w Up}
	VAR_JustTurnedOff_with_xUp = 1
	Hotkey, ~w, Off
	Hotkey, ~s, Off
	Hotkey, ~LButton, Off
}
Else
{
	LightIsOn:= !LightIsOn
	Send {w down}
	VAR_TurnOn_with_xUp = 1
	Hotkey, ~w, On
	Hotkey, ~s, On
	Hotkey, ~LButton, On
}
Return

$+w::
If(LightIsOn)
{
	Send {w Up}
	Sleep, 20
	Send {w down}
	Sleep, 20
	Send +
	KeyWait, w
	Hotkey, ~w, On
	Hotkey, ~s, On
	Hotkey, ~LButton, On
	VAR_TurnOn_with_ShiftW = 1
}
Else
{
	LightIsOn:= !LightIsOn
	Send {w down}
	Send +
	Hotkey, ~w, On
	Hotkey, ~s, On
	Hotkey, ~LButton, On
	VAR_TurnOn_Light_wasnt_On = 1
}
Return

~s::
~w::
~LButton::
Hotkey, ~w, Off
Hotkey, ~s, Off
Hotkey, ~LButton, Off
If(LightIsOn)
{
	LightIsOn:= !LightIsOn
	VAR_S_and_W_TurnOff = 1
	Sleep, 100
	Send {w Up}
}
Return
