(declare-const X String)
; ^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|11|12|10)-(19[0-9]{2})$
(assert (str.in_re X (re.++ (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (re.union (str.to_re "1") (str.to_re "2")) (re.range "0" "9")) (re.++ (str.to_re "3") (re.union (str.to_re "0") (str.to_re "1")))) (str.to_re "-") (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (str.to_re "11") (str.to_re "12") (str.to_re "10")) (str.to_re "-\u{a}19") ((_ re.loop 2 2) (re.range "0" "9")))))
(check-sat)
