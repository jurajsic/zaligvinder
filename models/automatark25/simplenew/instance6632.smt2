(declare-const X String)
; ((20)[0-9]{2})-((0[1-9])|(1[0-2]))-((3[0-1])|([0-2][1-9]|([1-2][0-9])))\s((2[0-3])|[0-1][0-9]):[0-5][0-9]
(assert (not (str.in_re X (re.++ (str.to_re "-") (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (str.to_re "1") (re.range "0" "2"))) (str.to_re "-") (re.union (re.++ (str.to_re "3") (re.range "0" "1")) (re.++ (re.range "0" "2") (re.range "1" "9")) (re.++ (re.range "1" "2") (re.range "0" "9"))) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (re.union (re.++ (str.to_re "2") (re.range "0" "3")) (re.++ (re.range "0" "1") (re.range "0" "9"))) (str.to_re ":") (re.range "0" "5") (re.range "0" "9") (str.to_re "\u{a}20") ((_ re.loop 2 2) (re.range "0" "9"))))))
(check-sat)
