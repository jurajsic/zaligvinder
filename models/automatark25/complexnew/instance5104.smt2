(declare-const X String)
; /^\u{2f}[a-z\d]{1,8}\.exe$/Ui
(assert (not (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 1 8) (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re ".exe/Ui\u{a}")))))
; /new (java|org)/Ui
(assert (not (str.in_re X (re.++ (str.to_re "/new ") (re.union (str.to_re "java") (str.to_re "org")) (str.to_re "/Ui\u{a}")))))
; /\/pdfx\.html$/U
(assert (not (str.in_re X (str.to_re "//pdfx.html/U\u{a}"))))
(check-sat)
