(declare-const X String)
; ^[S-s]( |-)?[1-9]{1}[0-9]{2}( |-)?[0-9]{2}$
(assert (str.in_re X (re.++ (re.range "S" "s") (re.opt (re.union (str.to_re " ") (str.to_re "-"))) ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "-"))) ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
