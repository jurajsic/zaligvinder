(declare-const X String)
; ^\${1}[a-z]{1}[a-z\d]{0,6}$
(assert (str.in_re X (re.++ ((_ re.loop 1 1) (str.to_re "$")) ((_ re.loop 1 1) (re.range "a" "z")) ((_ re.loop 0 6) (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re "\u{a}"))))
(check-sat)
