;; Paste without format
#v::SendInput, %ClipBoard%

;; Paste with no format, removing newlines
#+v::
Lines := StrSplit(Clipboard, "`r`n", " `t")
str := ""
for index, param in Lines
{
    str .= param . " "
}
str := SubStr(str, 1, -1)
Send, %str%
return
