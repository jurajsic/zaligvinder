(declare-const X String)
; /\/[a-zA-Z0-9]{4,10}\.jar$/U
(assert (str.in_re X (re.++ (str.to_re "//") ((_ re.loop 4 10) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9"))) (str.to_re ".jar/U\u{a}"))))
(check-sat)
