#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.uytu
#SingleInstance Force ; Allow only one running instance of script.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

MsgBox, 4, MessageBox, Begin?
IfMsgBox Yes
   GoSub, LogCode
return

LogCode:
   Loop,
   {
      Input, Var, L1 V
      FileAppend, %Var%, Log.txt
   }
return
^!+