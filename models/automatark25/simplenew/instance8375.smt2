(declare-const X String)
; /([etDZhns8dz]{1,3}k){3}[etDZhns8dz]{1,3}f[etDZhns8dz]{16}A/
(assert (str.in_re X (re.++ (str.to_re "/") ((_ re.loop 3 3) (re.++ ((_ re.loop 1 3) (re.union (str.to_re "e") (str.to_re "t") (str.to_re "D") (str.to_re "Z") (str.to_re "h") (str.to_re "n") (str.to_re "s") (str.to_re "8") (str.to_re "d") (str.to_re "z"))) (str.to_re "k"))) ((_ re.loop 1 3) (re.union (str.to_re "e") (str.to_re "t") (str.to_re "D") (str.to_re "Z") (str.to_re "h") (str.to_re "n") (str.to_re "s") (str.to_re "8") (str.to_re "d") (str.to_re "z"))) (str.to_re "f") ((_ re.loop 16 16) (re.union (str.to_re "e") (str.to_re "t") (str.to_re "D") (str.to_re "Z") (str.to_re "h") (str.to_re "n") (str.to_re "s") (str.to_re "8") (str.to_re "d") (str.to_re "z"))) (str.to_re "A/\u{a}"))))
(check-sat)
