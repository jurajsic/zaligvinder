(declare-const X String)
; ^(((0|((\+)?91(\-)?))|((\((\+)?91\)(\-)?)))?[7-9]\d{9})?$
(assert (not (str.in_re X (re.++ (re.opt (re.++ (re.opt (re.union (re.++ (str.to_re "(") (re.opt (str.to_re "+")) (str.to_re "91)") (re.opt (str.to_re "-"))) (str.to_re "0") (re.++ (re.opt (str.to_re "+")) (str.to_re "91") (re.opt (str.to_re "-"))))) (re.range "7" "9") ((_ re.loop 9 9) (re.range "0" "9")))) (str.to_re "\u{a}")))))
(check-sat)
