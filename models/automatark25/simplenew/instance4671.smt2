(declare-const X String)
; /[a-z]\u{3d}[a-f\d]{126}/P
(assert (not (str.in_re X (re.++ (str.to_re "/") (re.range "a" "z") (str.to_re "=") ((_ re.loop 126 126) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "/P\u{a}")))))
(check-sat)
