(declare-const X String)
; ^([0-9]{3,4})$
(assert (str.in_re X (re.++ ((_ re.loop 3 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
