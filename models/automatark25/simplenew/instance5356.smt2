(declare-const X String)
; ((19|20)[\d]{2}/[\d]{6}/[\d]{2})
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") (re.union (str.to_re "19") (str.to_re "20")) ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "/") ((_ re.loop 6 6) (re.range "0" "9")) (str.to_re "/") ((_ re.loop 2 2) (re.range "0" "9"))))))
(check-sat)
