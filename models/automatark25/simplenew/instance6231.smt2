(declare-const X String)
; (^(09|9)[1][1-9]\\d{7}$)|(^(09|9)[3][12456]\\d{7}$)
(assert (not (str.in_re X (re.union (re.++ (re.union (str.to_re "09") (str.to_re "9")) (str.to_re "1") (re.range "1" "9") (str.to_re "\u{5c}") ((_ re.loop 7 7) (str.to_re "d"))) (re.++ (str.to_re "\u{a}") (re.union (str.to_re "09") (str.to_re "9")) (str.to_re "3") (re.union (str.to_re "1") (str.to_re "2") (str.to_re "4") (str.to_re "5") (str.to_re "6")) (str.to_re "\u{5c}") ((_ re.loop 7 7) (str.to_re "d")))))))
(check-sat)
