(declare-const X String)
; ^[a-zA-Z0-9\-]+\.cn$
(assert (str.in_re X (re.++ (re.+ (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "-"))) (str.to_re ".cn\u{a}"))))
(check-sat)
