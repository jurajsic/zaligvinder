(declare-const X String)
; \d{1,3}.?\d{0,3}\s[a-zA-Z]{2,30}\s[a-zA-Z]{2,15}
(assert (not (str.in_re X (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (re.opt re.allchar) ((_ re.loop 0 3) (re.range "0" "9")) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) ((_ re.loop 2 30) (re.union (re.range "a" "z") (re.range "A" "Z"))) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) ((_ re.loop 2 15) (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to_re "\u{a}")))))
(check-sat)
