(declare-const X String)
; ^[0-9]{11}$
(assert (not (str.in_re X (re.++ ((_ re.loop 11 11) (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
