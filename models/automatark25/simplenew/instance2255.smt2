(declare-const X String)
; ^([A-Z]|[a-z]){4} ?[0-9]{6}-?[0-9]{1}$
(assert (str.in_re X (re.++ ((_ re.loop 4 4) (re.union (re.range "A" "Z") (re.range "a" "z"))) (re.opt (str.to_re " ")) ((_ re.loop 6 6) (re.range "0" "9")) (re.opt (str.to_re "-")) ((_ re.loop 1 1) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
