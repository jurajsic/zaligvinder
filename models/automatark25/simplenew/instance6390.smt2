(declare-const X String)
; ^\d(\.\d{1,2})?$
(assert (not (str.in_re X (re.++ (re.range "0" "9") (re.opt (re.++ (str.to_re ".") ((_ re.loop 1 2) (re.range "0" "9")))) (str.to_re "\u{a}")))))
(check-sat)
