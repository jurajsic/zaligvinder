(declare-const X String)
; Everyware.*Email.*Host\u{3A}stepwww\u{2E}kornputers\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "Everyware") (re.* re.allchar) (str.to_re "Email") (re.* re.allchar) (str.to_re "Host:stepwww.kornputers.com\u{a}"))))
; /filename=[^\n]*\u{2e}mkv/i
(assert (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".mkv/i\u{a}"))))
; /Libs\/Starter(CmdExec|NetUtils|Rec|ScreenShots|Settings)\.py/
(assert (str.in_re X (re.++ (str.to_re "/Libs/Starter") (re.union (str.to_re "CmdExec") (str.to_re "NetUtils") (str.to_re "Rec") (str.to_re "ScreenShots") (str.to_re "Settings")) (str.to_re ".py/\u{a}"))))
; SpyAgent\d+nick_name=CIA-Test\d+url=http\u{3A}HANDY\u{2F}NFO\u{2C}Registered
(assert (str.in_re X (re.++ (str.to_re "SpyAgent") (re.+ (re.range "0" "9")) (str.to_re "nick_name=CIA-Test") (re.+ (re.range "0" "9")) (str.to_re "url=http:\u{1b}HANDY/NFO,Registered\u{a}"))))
; /\/[a-z]{2}\/testcon.php$/U
(assert (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 2 2) (re.range "a" "z")) (str.to_re "/testcon") re.allchar (str.to_re "php/U\u{a}"))))
(check-sat)
