#ifWinActive World of Warcraft ;Checks if the World of Warcraft window is opened
#MaxThreadsPerHotkey 4 ;Used to control how many "instances" of a given hotkey or hotstring subroutine are allowed to exist simultaneously

SendTime:= 20 ; Time in milliseconds to repeat key press

;--- Logging setup ---
LogFile := A_ScriptDir . "\suspend_log.txt" ; Log file in same folder as script
;---------------------

$0:: ; Number 0
$^0:: ; Ctrl + 0
$+0:: ; Shift + 0
$!0:: ; Alt + 0
Loop ;Begins the code for looping/repeats
{ ;Begging code structure
if not GetKeyState("0", "P") ;Checks to see if a key is pressed down
break ; Terminates the Loop
if GetKeyState("Ctrl", "P") ;Checks if Ctrl is pressed
Send ^0 ;Sends Ctrl + 0
else if GetKeyState("Shift", "P") ;Checks if Shift is pressed
Send +0 ;Sends Shift + 0
else if GetKeyState("Alt", "P") ;Checks if Alt is pressed
Send !0 ;Sends Alt + 0
else ;Checks if Number 1 is pressed
Send 0 ;Sends Number 1
sleep %SendTime% ;Sends whatever sendTime value is set as
} ;Ending code structure
return

$1::
$^1::
$+1::
$!1::
Loop{
if not GetKeyState("1", "P")
break
if GetKeyState("Ctrl", "P")
Send ^1
else if GetKeyState("Shift", "P")
Send +1
else if GetKeyState("Alt", "P")
Send !1
else
Send 1
sleep %SendTime%
}
return

$2::
$^2::
$+2::
$!2::
Loop{
if not GetKeyState("2", "P")
break
if GetKeyState("Ctrl", "P")
Send ^2
else if GetKeyState("Shift", "P")
Send +2
else if GetKeyState("Alt", "P")
Send !2
else
Send 2
sleep %SendTime%
}
return

$3::
$^3::
$+3::
$!3::
Loop{
if not GetKeyState("3", "P")
break
if GetKeyState("Ctrl", "P")
Send ^3
else if GetKeyState("Shift", "P")
Send +3
else if GetKeyState("Alt", "P")
Send !3
else
Send 3
sleep %SendTime%
}
return

$4::
$^4::
$+4::
$!4::
Loop{
if not GetKeyState("4", "P")
break
if GetKeyState("Ctrl", "P")
Send ^4
else if GetKeyState("Shift", "P")
Send +4
else if GetKeyState("Alt", "P")
Send !4
else
Send 4
sleep %SendTime%
}
return

$5::
$^5::
$+5::
$!5::
Loop{
if not GetKeyState("5", "P")
break
if GetKeyState("Ctrl", "P")
Send ^5
else if GetKeyState("Shift", "P")
Send +5
else if GetKeyState("Alt", "P")
Send !5
else
Send 5
sleep %SendTime%
}
return

$6::
$^6::
$+6::
$!6::
Loop{
if not GetKeyState("6", "P")
break
if GetKeyState("Ctrl", "P")
Send ^6
else if GetKeyState("Shift", "P")
Send +6
else if GetKeyState("Alt", "P")
Send !6
else
Send 6
sleep %SendTime%
}
return

$7::
$^7::
$+7::
$!7::
Loop{
if not GetKeyState("7", "P")
break
if GetKeyState("Ctrl", "P")
Send ^7
else if GetKeyState("Shift", "P")
Send +7
else if GetKeyState("Alt", "P")
Send !7
else
Send 7
sleep %SendTime%
}
return

$8::
$^8::
$+8::
$!8::
Loop{
if not GetKeyState("8", "P")
break
if GetKeyState("Ctrl", "P")
Send ^8
else if GetKeyState("Shift", "P")
Send +8
else if GetKeyState("Alt", "P")
Send !8
else
Send 8
sleep %SendTime%
}
return

$9::
$^9::
$+9::
$!9::
Loop{
if not GetKeyState("9", "P")
break
if GetKeyState("Ctrl", "P")
Send ^9
else if GetKeyState("Shift", "P")
Send +9
else if GetKeyState("Alt", "P")
Send !9
else
Send 9
sleep %SendTime%
}
return

$q::
$^q::
$+q::
$!q::
Loop{
if not GetKeyState("q", "P")
break
if GetKeyState("Ctrl", "P")
Send ^q
else if GetKeyState("Shift", "P")
Send +q
else if GetKeyState("Alt", "P")
Send !q
else
Send q
sleep %SendTime%
}
return

$e::
$^e::
$+e::
$!e::
Loop{
if not GetKeyState("e", "P")
break
if GetKeyState("Ctrl", "P")
Send ^e
else if GetKeyState("Shift", "P")
Send +e
else if GetKeyState("Alt", "P")
Send !e
else
Send e
sleep %SendTime%
}
return

$r::
$^r::
$+r::
$!r::
Loop{
if not GetKeyState("r", "P")
break
if GetKeyState("Ctrl", "P")
Send ^r
else if GetKeyState("Shift", "P")
Send +r
else if GetKeyState("Alt", "P")
Send !r
else
Send r
sleep %SendTime%
}
return

$t::
$^t::
$+t::
$!t::
Loop{
if not GetKeyState("t", "P")
break
if GetKeyState("Ctrl", "P")
Send ^t
else if GetKeyState("Shift", "P")
Send +t
else if GetKeyState("Alt", "P")
Send !t
else
Send t
sleep %SendTime%
}
return

$f::
$^f::
$+f::
$!f::
Loop{
if not GetKeyState("f", "P")
break
if GetKeyState("Ctrl", "P")
Send ^f
else if GetKeyState("Shift", "P")
Send +f
else if GetKeyState("Alt", "P")
Send !f
else
Send f
sleep %SendTime%
}
return

$g::
$^g::
$+g::
$!g::
Loop{
if not GetKeyState("g", "P")
break
if GetKeyState("Ctrl", "P")
Send ^g
else if GetKeyState("Shift", "P")
Send +g
else if GetKeyState("Alt", "P")
Send !g
else
Send g
sleep %SendTime%
}
return

$z::
$^z::
$+z::
$!z::
Loop{
if not GetKeyState("z", "P")
break
if GetKeyState("Ctrl", "P")
Send ^z
else if GetKeyState("Shift", "P")
Send +z
else if GetKeyState("Alt", "P")
Send !z
else
Send z
sleep %SendTime%
}
return

$x::
$^x::
$+x::
$!x::
Loop{
if not GetKeyState("x", "P")
break
if GetKeyState("Ctrl", "P")
Send ^x
else if GetKeyState("Shift", "P")
Send +x
else if GetKeyState("Alt", "P")
Send !x
else
Send x
sleep %SendTime%
}
return

$c::
$^c::
$+c::
$!c::
Loop{
if not GetKeyState("c", "P")
break
if GetKeyState("Ctrl", "P")
Send ^c
else if GetKeyState("Shift", "P")
Send +c
else if GetKeyState("Alt", "P")
Send !c
else
Send c
sleep %SendTime%
}
return

$v::
$^v::
$+v::
$!v::
Loop{
if not GetKeyState("v", "P")
break
if GetKeyState("Ctrl", "P")
Send ^v
else if GetKeyState("Shift", "P")
Send +v
else if GetKeyState("Alt", "P")
Send !v
else
Send v
sleep %SendTime%
}
return

$VKC0:: ; This is ~
Loop{
if not GetKeyState("~", "P")
break
else
SendInput, {VKC0}
sleep %SendTime%
}
return

$F6::
$^F6::
$+F6::
$!F6::
Loop{
if not GetKeyState("F6", "P")
break
if GetKeyState("Ctrl", "P")
SendInput, ^{F6}
else if GetKeyState("Shift", "P")
SendInput, +{F6}
else if GetKeyState("Alt", "P")
SendInput, !{F6}
else
SendInput, {F6}
sleep %SendTime%
}
return

PgDn::
Suspend
FormatTime, now,, yyyy-MM-dd HH:mm:ss
FileAppend, % now " - Script " (A_IsSuspended ? "suspended" : "unsuspended") "`n", %LogFile%
Sleep %SendTime%
return

End::ExitApp
