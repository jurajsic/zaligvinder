(declare-const X String)
; ^([0-9a-fA-F]{1,2})(\s[0-9a-fA-F]{1,2})*$
(assert (str.in_re X (re.++ ((_ re.loop 1 2) (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F"))) (re.* (re.++ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) ((_ re.loop 1 2) (re.union (re.range "0" "9") (re.range "a" "f") (re.range "A" "F"))))) (str.to_re "\u{a}"))))
(check-sat)
