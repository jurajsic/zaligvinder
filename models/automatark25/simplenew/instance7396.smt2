(declare-const X String)
; ^-?((([1]?[0-7][0-9]|[1-9]?[0-9])\.{1}\d{1,6}$)|[1]?[1-8][0]\.{1}0{1,6}$)
(assert (str.in_re X (re.++ (re.opt (str.to_re "-")) (re.union (re.++ (re.union (re.++ (re.opt (str.to_re "1")) (re.range "0" "7") (re.range "0" "9")) (re.++ (re.opt (re.range "1" "9")) (re.range "0" "9"))) ((_ re.loop 1 1) (str.to_re ".")) ((_ re.loop 1 6) (re.range "0" "9"))) (re.++ (re.opt (str.to_re "1")) (re.range "1" "8") (str.to_re "0") ((_ re.loop 1 1) (str.to_re ".")) ((_ re.loop 1 6) (str.to_re "0")))) (str.to_re "\u{a}"))))
(check-sat)
