(declare-const X String)
; ^([a-z|A-Z]{1}[0-9]{3})[-]([0-9]{3})[-]([0-9]{2})[-]([0-9]{3})[-]([0-9]{1})
(assert (str.in_re X (re.++ (str.to_re "-") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 1 1) (re.range "0" "9")) (str.to_re "\u{a}") ((_ re.loop 1 1) (re.union (re.range "a" "z") (str.to_re "|") (re.range "A" "Z"))) ((_ re.loop 3 3) (re.range "0" "9")))))
(check-sat)
