(declare-const X String)
; ^((\+)?(\d{2}[-]))?(\d{10}){1}?$
(assert (str.in_re X (re.++ (re.opt (re.++ (re.opt (str.to_re "+")) ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "-"))) ((_ re.loop 1 1) ((_ re.loop 10 10) (re.range "0" "9"))) (str.to_re "\u{a}"))))
(check-sat)
