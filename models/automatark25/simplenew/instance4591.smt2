(declare-const X String)
; ^[6]\d{7}$
(assert (not (str.in_re X (re.++ (str.to_re "6") ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
