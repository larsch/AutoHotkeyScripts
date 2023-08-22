;; Win+;: Input date in ISO format (2023-07-31)
#;::
FormatTime, Out, , yyyy-MM-dd
Send %out%
return

;; Win+Shift+;: Input current date+time in ISO format
#+;::
FormatTime, Out, , yyyy-MM-ddTHH:mm:ss
Send %out%
return

;; Win+/: Input current date+time in system format
#!;::
FormatTime, Out,,
Send %out%
return

;; Win+/: Input current date+time in system format
#^;::
FormatTime, Out,, yyyyMMdd
Send %out%
return

;; Input current date+time in filename friendly ISO8601 format
#^+;::
FormatTime, Out,, yyyyMMddTHHmmss
Send %out%
return

;; Examples:
;; Win+;            2023-07-31
;; Win+Shift+;      2023-07-31T15:29:18
;; Win+Ctrl+;       20230731
;; Win+Ctrl+Shift+; 20230731T152922
;; Win+Alt+;        15:29 Monday, 31 July 2023
