(declare-const X String)
; ^[0-9]{4} {0,1}[A-Z]{2}$
(assert (str.in_re X (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (re.opt (str.to_re " ")) ((_ re.loop 2 2) (re.range "A" "Z")) (str.to_re "\u{a}"))))
(check-sat)
