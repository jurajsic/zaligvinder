(declare-const X String)
; ^([a-zA-Z]{5})([a-zA-Z0-9-]{3,12})
(assert (not (str.in_re X (re.++ ((_ re.loop 5 5) (re.union (re.range "a" "z") (re.range "A" "Z"))) ((_ re.loop 3 12) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "-"))) (str.to_re "\u{a}")))))
(check-sat)
