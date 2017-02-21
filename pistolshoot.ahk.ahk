ScrollLock::
Suspend, Toggle

+Capslock::Capslock

$Numpad9::
waitTime := 4
return

$Numpad8::
waitTime := 50
return

$Numpad7::
waitTime := 150
return

NumpadAdd::
waitTime += 10
return

NumpadSub::
waitTime -= 10
return

$capslock::
loop
{
    GetKeyState, var, capslock, P
    If var = U
        Break 

    ;MouseClick, left
;    send, {capslock up}
;    send, u
;    sleep, %waitTime%
;send, {p up}
;Random, waitTime, %ranVarMin%, %ranVarMax%
;sleep, %waitTime%
    send, {u down}
    sleep, 4
    send, {u up}
    sleep, %waitTime%
    SetCapsLockState, Off
}
return