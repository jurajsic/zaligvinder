(declare-const X String)
; ^(([0]([2|3|4|5|6|8|9|7])))\d{7,8}$
(assert (str.in_re X (re.++ ((_ re.loop 7 8) (re.range "0" "9")) (str.to_re "\u{a}0") (re.union (str.to_re "2") (str.to_re "|") (str.to_re "3") (str.to_re "4") (str.to_re "5") (str.to_re "6") (str.to_re "8") (str.to_re "9") (str.to_re "7")))))
(check-sat)
