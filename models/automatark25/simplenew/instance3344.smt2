(declare-const X String)
; ^\d{1,3}\.\d{1,4}$
(assert (str.in_re X (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (str.to_re ".") ((_ re.loop 1 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
