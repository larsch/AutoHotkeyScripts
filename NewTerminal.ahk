;; Open new Windows Terminal tab
#ENTER::
  IfWinExist, ahk_exe WindowsTerminal.exe
  {
    WinActivate, ahk_exe WindowsTerminal.exe
    WinWaitActive, ahk_exe WindowsTerminal.exe
    ; Run, %LOCALAPPDATA%\Microsoft\WindowsApps\wt.exe -M -w 1 new-tab
    Send ^+T ; open new TAB with Ctrl+T instead of new-tab to ensure it opens in focused window
  }
  Else
  {
    WinActivate, ahk_class Shell_TrayWnd ; workaround to prevent window to open in background
    Run, %LOCALAPPDATA%\Microsoft\WindowsApps\wt.exe, , Max
  }
return
