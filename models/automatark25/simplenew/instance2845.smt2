(declare-const X String)
; (LT-?)?([0-9]{9}|[0-9]{12})
(assert (str.in_re X (re.++ (re.opt (re.++ (str.to_re "LT") (re.opt (str.to_re "-")))) (re.union ((_ re.loop 9 9) (re.range "0" "9")) ((_ re.loop 12 12) (re.range "0" "9"))) (str.to_re "\u{a}"))))
(check-sat)
