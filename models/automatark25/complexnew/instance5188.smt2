(declare-const X String)
; /^\/[a-f0-9]{32}\/[0-9]$/Ui
(assert (not (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 32 32) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "/") (re.range "0" "9") (str.to_re "/Ui\u{a}")))))
; /^\/\d+\/\d\.zip$/U
(assert (not (str.in_re X (re.++ (str.to_re "//") (re.+ (re.range "0" "9")) (str.to_re "/") (re.range "0" "9") (str.to_re ".zip/U\u{a}")))))
(check-sat)
