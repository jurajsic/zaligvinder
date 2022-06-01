(declare-const X String)
; My\u{2F}desktop\u{2F}WinSessionHost\u{3a}OnlineTPSystem\u{7D}\u{7C}
(assert (str.in_re X (str.to_re "My/desktop/WinSessionHost:OnlineTPSystem}|\u{a}")))
; Host\u{3A}.*Toolbar\s+Host\u{3A}
(assert (str.in_re X (re.++ (str.to_re "Host:") (re.* re.allchar) (str.to_re "Toolbar") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host:\u{a}"))))
; ^[^\*]{0,}[\*]{0,1}[^\*]{0,}$
(assert (str.in_re X (re.++ (re.* (re.comp (str.to_re "*"))) (re.opt (str.to_re "*")) (re.* (re.comp (str.to_re "*"))) (str.to_re "\u{a}"))))
; ([^_.]([a-zA-Z0-9_]*[.]?[a-zA-Z0-9_]+[^_]){2})@([a-z0-9]+[.]([a-z]{2,3}|[a-z]{2,3}[.][a-z]{2,3}))
(assert (not (str.in_re X (re.++ (str.to_re "@\u{a}") (re.union (str.to_re "_") (str.to_re ".")) ((_ re.loop 2 2) (re.++ (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_"))) (re.opt (str.to_re ".")) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_"))) (re.comp (str.to_re "_")))) (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re ".") (re.union ((_ re.loop 2 3) (re.range "a" "z")) (re.++ ((_ re.loop 2 3) (re.range "a" "z")) (str.to_re ".") ((_ re.loop 2 3) (re.range "a" "z"))))))))
; A-311[^\n\r]*Attached\sHost\u{3A}Wordmyway\.comhoroscope2
(assert (not (str.in_re X (re.++ (str.to_re "A-311") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "Attached") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "Host:Wordmyway.comhoroscope2\u{a}")))))
(check-sat)
