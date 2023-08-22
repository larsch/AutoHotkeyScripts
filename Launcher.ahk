Run(path)
{
    Run %path%
}

; DWIM function for command prompts
Prompt(title, path)
{
    Launch(title, "C:\Windows\System32\cmd.exe /k title " . title . " & cd " . path)
}

;;; Notification
CleanNotification()
{
    ; ToolTip
    Progress, off
}

Notify(text)
{
    SysGet, Area, MonitorWorkArea
    Y := AreaBottom-128
    Progress, hide Y%Y% W1000 b zh0 cwFFFFFF FM16 CT00BB00,, %text%, AutoHotKeyProgressBar, Backlash BRK
    WinSet, TransColor, FFFFFF 255, AutoHotKeyProgressBar
    Progress, show
    SetTimer, CleanNotification, -2000
}

; DWIM function to activate, launch, or minimize a window. Activates window with
; matching title if it exists or launches program if it doesn't exists and
; forces activation. Minimizes window if already active (use as toggle).
Launch(title, path, WorkDir:=false, DetectHidden:=false)
{
    DetectHiddenWindows, %DetectHidden%
    IfWinExist %title%
    {
        IfWinActive
        {
            WinGet, out, MinMax, %title%
            IfEqual, out, -1
            {
                Notify("Restore " . title)
                WinRestore ; store if minimized
            }
            Else
            {
                Notify("Minimize " . title)
                WinMinimize ; minimize if active
            }
        }
        Else
        {
            WinGet, out, MinMax, %title%
            IfEqual, out, -1
            {
                Notify("Restore " . title)
                WinRestore ; restore if minimized
            }
            Notify("Activate " . title)
            WinActivate ; bring to front
        }
    }
    Else
    {
        Notify("Launching " . path)
        WinActivate, ahk_class Shell_TrayWnd ; workaround to prevent window to open in background
        Run, %path%, %WorkDir%
        WinWait, %title%
        WinActivate
        WinWait, %title%
        ToolTip
        ; RestoreActive()
    }
    DetectHiddenWindows, Off
}

;; Examples:
;;
;; EnvGet, LocalAppData, LOCALAPPDATA
;; #t::Launch("ahk_class TTOTAL_CMD", "C:\Program Files\TOTALCMD\TOTALCMD64.EXE")
;; #o::Launch("Outlook ahk_class OlkWV2Frame ahk_exe olk.exe", "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE", DetectHidden=true)
;; #y::Launch("ahk_exe Teams.exe", LocalAppData . "\Microsoft\Teams\current\Teams.exe")
;; #+k::Launch("KeePassXC", "C:\Program Files\KeePassXC\KeePassXC.exe")
;; #c::Launch("ahk_exe qalculate-qt.exe", "c:\Program Files\Qalculate\qalculate-qt.exe")
