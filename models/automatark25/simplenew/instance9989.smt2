(declare-const X String)
; \d{2,4}
(assert (str.in_re X (re.++ ((_ re.loop 2 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
