(declare-const X String)
; ^((\d){3})(-)?(\d){2}(-)?(\d){4}(A|B[1-7]?|M|T|C[1-4]|D)$
(assert (str.in_re X (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (str.to_re "-")) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (str.to_re "-")) ((_ re.loop 4 4) (re.range "0" "9")) (re.union (str.to_re "A") (re.++ (str.to_re "B") (re.opt (re.range "1" "7"))) (str.to_re "M") (str.to_re "T") (re.++ (str.to_re "C") (re.range "1" "4")) (str.to_re "D")) (str.to_re "\u{a}"))))
(check-sat)
