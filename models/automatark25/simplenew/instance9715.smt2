(declare-const X String)
; ^[0-9]{1,15}(\.([0-9]{1,2}))?$
(assert (str.in_re X (re.++ ((_ re.loop 1 15) (re.range "0" "9")) (re.opt (re.++ (str.to_re ".") ((_ re.loop 1 2) (re.range "0" "9")))) (str.to_re "\u{a}"))))
(check-sat)
