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
	Hotkey, ~w, Off
	Hotkey, ~s, Off
	Hotkey, ~LButton, Off
}
Else
{
	If(GetKeyState("W", "P"))
	{
		KeyWait, w, T0.3
		If(ErrorLevel = 1)
		{
			KeyWait, w
			Exit
		}
	}
	LightIsOn:= !LightIsOn
	Send {w Down}
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
	;KeyWait, w
	Hotkey, ~w, On
	Hotkey, ~s, On
	Hotkey, ~LButton, On
}
Else
{
	LightIsOn:= !LightIsOn
	Send {w Down}
	Send +
	Hotkey, ~w, On
	Hotkey, ~s, On
	Hotkey, ~LButton, On
}
Return

~s::
~LButton::
Hotkey, ~s, Off
Hotkey, ~LButton, Off
If(LightIsOn)
{
	LightIsOn:= !LightIsOn
	Sleep, 100
	Send {w Up}
}
Return

~w::
Hotkey, ~w, Off
If(LightIsOn)
{
	LightIsOn:= !LightIsOn
}
Return