(declare-const X String)
; ^[2-9]{2}[0-9]{8}$
(assert (str.in_re X (re.++ ((_ re.loop 2 2) (re.range "2" "9")) ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
