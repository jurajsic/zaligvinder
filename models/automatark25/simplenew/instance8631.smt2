(declare-const X String)
; ^[3|4|5|6]([0-9]{15}$|[0-9]{12}$|[0-9]{13}$|[0-9]{14}$)
(assert (str.in_re X (re.++ (re.union (str.to_re "3") (str.to_re "|") (str.to_re "4") (str.to_re "5") (str.to_re "6")) (re.union ((_ re.loop 15 15) (re.range "0" "9")) ((_ re.loop 12 12) (re.range "0" "9")) ((_ re.loop 13 13) (re.range "0" "9")) ((_ re.loop 14 14) (re.range "0" "9"))) (str.to_re "\u{a}"))))
(check-sat)
