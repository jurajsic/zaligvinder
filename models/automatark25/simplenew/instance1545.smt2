(declare-const X String)
; [A-Za-z0-9]{3}
(assert (str.in_re X (re.++ ((_ re.loop 3 3) (re.union (re.range "A" "Z") (re.range "a" "z") (re.range "0" "9"))) (str.to_re "\u{a}"))))
(check-sat)
