(declare-const X String)
; ^\d{0,2}(\.\d{1,2})?$
(assert (not (str.in_re X (re.++ ((_ re.loop 0 2) (re.range "0" "9")) (re.opt (re.++ (str.to_re ".") ((_ re.loop 1 2) (re.range "0" "9")))) (str.to_re "\u{a}")))))
(check-sat)
