(declare-const X String)
; ((([7-9])(\d{3})([-])(\d{4}))|(([7-9])(\d{7})))
(assert (not (str.in_re X (re.++ (re.union (re.++ (re.range "7" "9") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 4 4) (re.range "0" "9"))) (re.++ (re.range "7" "9") ((_ re.loop 7 7) (re.range "0" "9")))) (str.to_re "\u{a}")))))
(check-sat)
