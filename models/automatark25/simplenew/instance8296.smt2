(declare-const X String)
; ^[A-Z]{1}-[0-9]{7}$
(assert (str.in_re X (re.++ ((_ re.loop 1 1) (re.range "A" "Z")) (str.to_re "-") ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
