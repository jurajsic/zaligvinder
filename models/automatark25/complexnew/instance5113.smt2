(declare-const X String)
; ^(Function|Sub)(\s+[\w]+)\([^\(\)]*\)
(assert (str.in_re X (re.++ (re.union (str.to_re "Function") (str.to_re "Sub")) (str.to_re "(") (re.* (re.union (str.to_re "(") (str.to_re ")"))) (str.to_re ")\u{a}") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))))))
; ^[A-Z]{3}(\d|[A-Z]){8,12}$
(assert (str.in_re X (re.++ ((_ re.loop 3 3) (re.range "A" "Z")) ((_ re.loop 8 12) (re.union (re.range "0" "9") (re.range "A" "Z"))) (str.to_re "\u{a}"))))
; ^[B|K|T|P][A-Z][0-9]{4}$
(assert (not (str.in_re X (re.++ (re.union (str.to_re "B") (str.to_re "|") (str.to_re "K") (str.to_re "T") (str.to_re "P")) (re.range "A" "Z") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}")))))
; ^\s+|\s+$
(assert (not (str.in_re X (re.union (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.++ (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "\u{a}"))))))
(check-sat)
