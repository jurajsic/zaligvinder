(declare-const X String)
; ^(([a-zA-Z]{3})?([0-9]{4}))$
(assert (str.in_re X (re.++ (str.to_re "\u{a}") (re.opt ((_ re.loop 3 3) (re.union (re.range "a" "z") (re.range "A" "Z")))) ((_ re.loop 4 4) (re.range "0" "9")))))
(check-sat)
