(declare-const X String)
; ^(\d{5}-\d{4}|\d{5}|\d{9})$|^([a-zA-Z]\d[a-zA-Z]( )?\d[a-zA-Z]\d)$
(assert (str.in_re X (re.union (re.++ (str.to_re "\u{a}") (re.union (re.range "a" "z") (re.range "A" "Z")) (re.range "0" "9") (re.union (re.range "a" "z") (re.range "A" "Z")) (re.opt (str.to_re " ")) (re.range "0" "9") (re.union (re.range "a" "z") (re.range "A" "Z")) (re.range "0" "9")) (re.++ ((_ re.loop 5 5) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 4 4) (re.range "0" "9"))) ((_ re.loop 5 5) (re.range "0" "9")) ((_ re.loop 9 9) (re.range "0" "9")))))
(check-sat)
