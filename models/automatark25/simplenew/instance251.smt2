(declare-const X String)
; /\/3\/[A-Z]{2}\/[a-f0-9]{32}\/\d+\.\d+\.\d+\.\d+\//
(assert (not (str.in_re X (re.++ (str.to_re "//3/") ((_ re.loop 2 2) (re.range "A" "Z")) (str.to_re "/") ((_ re.loop 32 32) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "/") (re.+ (re.range "0" "9")) (str.to_re ".") (re.+ (re.range "0" "9")) (str.to_re ".") (re.+ (re.range "0" "9")) (str.to_re ".") (re.+ (re.range "0" "9")) (str.to_re "//\u{a}")))))
(check-sat)
