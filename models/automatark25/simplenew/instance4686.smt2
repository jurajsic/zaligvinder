(declare-const X String)
; ^\$?\d+(\.(\d{2}))?$
(assert (str.in_re X (re.++ (re.opt (str.to_re "$")) (re.+ (re.range "0" "9")) (re.opt (re.++ (str.to_re ".") ((_ re.loop 2 2) (re.range "0" "9")))) (str.to_re "\u{a}"))))
(check-sat)
