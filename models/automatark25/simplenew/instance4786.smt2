(declare-const X String)
; ^([0-9]{0,5}|[0-9]{0,5}\.[0-9]{0,3})$
(assert (str.in_re X (re.++ (re.union ((_ re.loop 0 5) (re.range "0" "9")) (re.++ ((_ re.loop 0 5) (re.range "0" "9")) (str.to_re ".") ((_ re.loop 0 3) (re.range "0" "9")))) (str.to_re "\u{a}"))))
(check-sat)
