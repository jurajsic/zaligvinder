(declare-const X String)
; /\?[a-f0-9]{4}$/miU
(assert (not (str.in_re X (re.++ (str.to_re "/?") ((_ re.loop 4 4) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "/miU\u{a}")))))
(check-sat)
