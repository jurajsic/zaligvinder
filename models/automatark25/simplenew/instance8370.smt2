(declare-const X String)
; (^0[78][2347][0-9]{7})
(assert (str.in_re X (re.++ (str.to_re "\u{a}0") (re.union (str.to_re "7") (str.to_re "8")) (re.union (str.to_re "2") (str.to_re "3") (str.to_re "4") (str.to_re "7")) ((_ re.loop 7 7) (re.range "0" "9")))))
(check-sat)
