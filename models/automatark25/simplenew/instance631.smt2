(declare-const X String)
; (ES-?)?([0-9A-Z][0-9]{7}[A-Z])|([A-Z][0-9]{7}[0-9A-Z])
(assert (str.in_re X (re.union (re.++ (re.opt (re.++ (str.to_re "ES") (re.opt (str.to_re "-")))) (re.union (re.range "0" "9") (re.range "A" "Z")) ((_ re.loop 7 7) (re.range "0" "9")) (re.range "A" "Z")) (re.++ (str.to_re "\u{a}") (re.range "A" "Z") ((_ re.loop 7 7) (re.range "0" "9")) (re.union (re.range "0" "9") (re.range "A" "Z"))))))
(check-sat)
