(declare-const X String)
; ^\d{4}(\/|-)([0][1-9]|[1][0-2])(\/|-)([0][1-9]|[1-2][0-9]|[3][0-1])$
(assert (not (str.in_re X (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (re.union (str.to_re "/") (str.to_re "-")) (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (str.to_re "1") (re.range "0" "2"))) (re.union (str.to_re "/") (str.to_re "-")) (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (re.range "1" "2") (re.range "0" "9")) (re.++ (str.to_re "3") (re.range "0" "1"))) (str.to_re "\u{a}")))))
; ^([01][012]|0[1-9])/([0-2][0-9]|[3][0-1])/([0-9][0-9][0-9][0-9])$
(assert (str.in_re X (re.++ (re.union (re.++ (re.union (str.to_re "0") (str.to_re "1")) (re.union (str.to_re "0") (str.to_re "1") (str.to_re "2"))) (re.++ (str.to_re "0") (re.range "1" "9"))) (str.to_re "/") (re.union (re.++ (re.range "0" "2") (re.range "0" "9")) (re.++ (str.to_re "3") (re.range "0" "1"))) (str.to_re "/\u{a}") (re.range "0" "9") (re.range "0" "9") (re.range "0" "9") (re.range "0" "9"))))
(check-sat)
