(declare-const X String)
; ^\d{5}(\d{3})?$
(assert (str.in_re X (re.++ ((_ re.loop 5 5) (re.range "0" "9")) (re.opt ((_ re.loop 3 3) (re.range "0" "9"))) (str.to_re "\u{a}"))))
(check-sat)
