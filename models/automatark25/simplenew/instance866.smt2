(declare-const X String)
; /\/i\.html\?[a-z0-9]+\=[a-zA-Z0-9]{25}/U
(assert (str.in_re X (re.++ (str.to_re "//i.html?") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re "=") ((_ re.loop 25 25) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))) (str.to_re "/U\u{a}"))))
(check-sat)
