#NoEnv
#SingleInstance Force
SetBatchLines, -1

; --- CONFIG ------------------------------------------------------
LogFile          := A_ScriptDir . "\suspend_log.txt"
CheckInterval    := 1000        ; Check the log once per second
WoWCheckInterval := 1000        ; Check if WoW is running once per second

IniDir  := A_AppData . "\WoWScriptOverlay"
IniFile := IniDir . "\overlay_settings.ini"
; ----------------------------------------------------------------

; Make sure settings directory exists
FileCreateDir, %IniDir%

LastLineSeen   := ""
OverlayVisible := 0
Locked         := 0
hGui           := ""

; --- Read saved position & lock state BEFORE showing GUI ---
IniRead, posX, %IniFile%, Overlay, X, ERROR
IniRead, posY, %IniFile%, Overlay, Y, ERROR
IniRead, Locked, %IniFile%, Overlay, Locked, 0
if (Locked != 0)
    Locked := 1
else
    Locked := 0
; -------------------------------------------------------------

; --- Tray menu (no default items, we define our own) ---
Menu, Tray, NoStandard
Menu, Tray, Add, Toggle Lock Overlay, ToggleLock
Menu, Tray, Add, Exit Overlay, ExitOverlay
; -----------------------------------------------------

; Borderless always-on-top overlay
Gui, +AlwaysOnTop -Caption +ToolWindow +LastFound
Gui, Margin, 3, 3
Gui, Font, s20 Bold, Segoe UI
Gui, Add, Text, vStatusText gDragOverlay Center w40 h40, R  ; assume running at startup

Gui, Color, 0x55FF55  ; green initially (assume running)

; Show at saved position if available, otherwise default
if (posX != "ERROR" && posY != "ERROR")
{
    Gui, Show, x%posX% y%posY% AutoSize Hide, WoW Script Monitor
}
else
{
    Gui, Show, AutoSize Hide, WoW Script Monitor
}

; Get handle and apply rounded corners
hGui := WinExist()
WinSet, Region, 0-0 w50 h50 R15-15, ahk_id %hGui%

; Apply lock visuals based on saved Locked state
Gosub, ApplyLockVisuals

SetTimer, CheckWoW, %WoWCheckInterval%
return


; --- ONLY SHOW OVERLAY WHEN EITHER WoW OR OVERLAY WINDOWS EXISTS AND IS NOT MINIMIZED ---
CheckWoW:
    ; Debug: see if this timer is actually firing
    ;FileAppend, %A_Now% - CheckWoW ran`n, %A_ScriptDir%\overlay_debug.txt
    ; WoW window must exist at all
    wowID := WinExist("World of Warcraft")
    if (wowID)
    {
        ; Is WoW active?
        wowActive := WinActive("ahk_id " . wowID)
        ; Is the overlay itself active?
        overlayActive := WinActive("ahk_id " . hGui)

        if (wowActive || overlayActive)
        {
            ; Show overlay if either WoW or overlay is active
            if (!OverlayVisible)
            {
                Gui, Show, NoActivate
                OverlayVisible := 1
                Gosub, ApplyLockVisuals
                SetTimer, CheckLog, %CheckInterval%
            }
        }
        else
        {
            ; Neither WoW nor overlay is active → hide overlay
            if (OverlayVisible)
            {
                Gui, Hide
                OverlayVisible := 0
                SetTimer, CheckLog, Off
            }
        }
    }
    else
    {
        ; WoW not running → hide overlay
        if (OverlayVisible)
        {
            Gui, Hide
            OverlayVisible := 0
            SetTimer, CheckLog, Off
        }
    }
return


; ---------------------------------------------------------------------


CheckLog:
    if (!OverlayVisible)
        return

    ; If log file does not exist → assume RUNNING
    if !FileExist(LogFile)
    {
        Gui, Color, 0x55FF55
        GuiControl,, StatusText, R
        return
    }

    FileRead, content, %LogFile%
    if (ErrorLevel)
    {
        Gui, Color, 0x55FF55
        GuiControl,, StatusText, R
        return
    }

    StringReplace, content, content, `r,, All

    ; If file exists but is empty → assume RUNNING
    if (content = "")
    {
        Gui, Color, 0x55FF55
        GuiControl,, StatusText, R
        return
    }

    last := ""
    Loop, Parse, content, `n
        if (A_LoopField != "")
            last := A_LoopField

    if (last = "")
    {
        Gui, Color, 0x55FF55
        GuiControl,, StatusText, R
        return
    }

    if (last = LastLineSeen)
        return

    LastLineSeen := last

    if InStr(LastLineSeen, "unsuspended")
    {
        Gui, Color, 0x55FF55
        GuiControl,, StatusText, R
    }
    else if InStr(LastLineSeen, "suspended")
    {
        Gui, Color, 0xFF5555
        GuiControl,, StatusText, S
    }
    else
    {
        ; Any unknown log → assume running
        Gui, Color, 0x55FF55
        GuiControl,, StatusText, R
    }
return


; --- Helpers for saving position/state ---

SavePosition:
    global IniFile, hGui
    if (hGui)
    {
        WinGetPos, x, y,,, ahk_id %hGui%
        if (x != "" && y != "")
        {
            IniWrite, %x%, %IniFile%, Overlay, X
            IniWrite, %y%, %IniFile%, Overlay, Y
        }
    }
return

SaveLocked:
    global IniFile, Locked
    IniWrite, %Locked%, %IniFile%, Overlay, Locked
return


; Drag window from anywhere (when not click-through)
DragOverlay:
    ; Only drag when unlocked
    if (!Locked)
        PostMessage, 0xA1, 2,,, A
return


; Right-click on overlay toggles lock (when not click-through)
GuiContextMenu:
    Gosub, ToggleLock
return


; Tray menu: toggle lock/unlock
ToggleLock:
    Locked := !Locked

    ; Save lock state immediately
    Gosub, SaveLocked

    ; When we lock, also save position right away
    if (Locked)
        Gosub, SavePosition

    Gosub, ApplyLockVisuals
return


; Apply visual behavior + tray checkmark based on lock state
ApplyLockVisuals:
    ; Update tray checkmark
    if (Locked)
        Menu, Tray, Check, Toggle Lock Overlay
    else
        Menu, Tray, Uncheck, Toggle Lock Overlay

    ; Apply transparency & click-through based on lock state
    if (Locked)
    {
        ; ~60% transparency (153/255)
        WinSet, Transparent, 153, ahk_id %hGui%
        ; Click-through: WS_EX_TRANSPARENT (0x20)
        WinSet, ExStyle, +0x20, ahk_id %hGui%
    }
    else
    {
        WinSet, Transparent, Off, ahk_id %hGui%
        WinSet, ExStyle, -0x20, ahk_id %hGui%
    }
return


; Custom exit from tray
ExitOverlay:
    ; Optional: save latest position on exit as well
    Gosub, SavePosition
    ; Clear log on exit
    if FileExist(LogFile)
        FileDelete, %LogFile%
    ExitApp
return


GuiClose:
GuiEscape:
    Gosub, ExitOverlay
return
