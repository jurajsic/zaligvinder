(declare-const X String)
; ^(5[1-5]\d{2})\d{12}|(4\d{3})(\d{12}|\d{9})$
(assert (not (str.in_re X (re.union (re.++ ((_ re.loop 12 12) (re.range "0" "9")) (str.to_re "5") (re.range "1" "5") ((_ re.loop 2 2) (re.range "0" "9"))) (re.++ (re.union ((_ re.loop 12 12) (re.range "0" "9")) ((_ re.loop 9 9) (re.range "0" "9"))) (str.to_re "\u{a}4") ((_ re.loop 3 3) (re.range "0" "9")))))))
(check-sat)
