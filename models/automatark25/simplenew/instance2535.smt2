(declare-const X String)
; (^(5[0678])\d{11,18}$)
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") ((_ re.loop 11 18) (re.range "0" "9")) (str.to_re "5") (re.union (str.to_re "0") (str.to_re "6") (str.to_re "7") (str.to_re "8"))))))
(check-sat)
