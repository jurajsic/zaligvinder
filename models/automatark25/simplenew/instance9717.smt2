(declare-const X String)
; [A-Za-z]{5}
(assert (not (str.in_re X (re.++ ((_ re.loop 5 5) (re.union (re.range "A" "Z") (re.range "a" "z"))) (str.to_re "\u{a}")))))
(check-sat)
