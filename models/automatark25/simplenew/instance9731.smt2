(declare-const X String)
; ^0[0-9]{3}-[0-9]{7}$
(assert (not (str.in_re X (re.++ (str.to_re "0") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 7 7) (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
