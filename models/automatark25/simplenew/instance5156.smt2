(declare-const X String)
; ^(#){1}([a-fA-F0-9]){6}$
(assert (str.in_re X (re.++ ((_ re.loop 1 1) (str.to_re "#")) ((_ re.loop 6 6) (re.union (re.range "a" "f") (re.range "A" "F") (re.range "0" "9"))) (str.to_re "\u{a}"))))
(check-sat)
