(declare-const X String)
; /\u{3e}\u{d}\u{a}SUBJECT\u{3a} (\d{1,3}\u{2e}){3}\d{1,3}\u{7c}[^\r\n]*\u{7c}\d{2,4}\u{d}\u{a}/G
(assert (str.in_re X (re.++ (str.to_re "/>\u{d}\u{a}SUBJECT: ") ((_ re.loop 3 3) (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (str.to_re "."))) ((_ re.loop 1 3) (re.range "0" "9")) (str.to_re "|") (re.* (re.union (str.to_re "\u{d}") (str.to_re "\u{a}"))) (str.to_re "|") ((_ re.loop 2 4) (re.range "0" "9")) (str.to_re "\u{d}\u{a}/G\u{a}"))))
; ^(\d){8}$
(assert (str.in_re X (re.++ ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "\u{a}"))))
; \u{2F}toolbar\u{2F}supremetb\s+wjpropqmlpohj\u{2f}lo\s+resultsmaster\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "/toolbar/supremetb") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "wjpropqmlpohj/lo") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "resultsmaster.com\u{13}\u{a}"))))
; /onload\s*\u{3D}\s*[\u{22}\u{27}]?location\.reload\s*\u{28}/smi
(assert (str.in_re X (re.++ (str.to_re "/onload") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "=") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.opt (re.union (str.to_re "\u{22}") (str.to_re "'"))) (str.to_re "location.reload") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "(/smi\u{a}"))))
; Toolbar[^\n\r]*User-Agent\u{3A}\w+Host\u{3A}.*toX-Mailer\u{3a}Logsmax-Cookie\u{3a}AppName
(assert (not (str.in_re X (re.++ (str.to_re "Toolbar") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "User-Agent:") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "Host:") (re.* re.allchar) (str.to_re "toX-Mailer:\u{13}Logsmax-Cookie:AppName\u{a}")))))
(check-sat)
