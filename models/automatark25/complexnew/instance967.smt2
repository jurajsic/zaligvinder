(declare-const X String)
; (0[1-9]|[12][0-9]|3[01])\s(J(anuary|uly)|Ma(rch|y)|August|(Octo|Decem)ber)\s[1-9][0-9]{3}|
(assert (str.in_re X (re.union (re.++ (re.union (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (re.union (str.to_re "1") (str.to_re "2")) (re.range "0" "9")) (re.++ (str.to_re "3") (re.union (str.to_re "0") (str.to_re "1")))) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (re.union (re.++ (str.to_re "J") (re.union (str.to_re "anuary") (str.to_re "uly"))) (re.++ (str.to_re "Ma") (re.union (str.to_re "rch") (str.to_re "y"))) (str.to_re "August") (re.++ (re.union (str.to_re "Octo") (str.to_re "Decem")) (str.to_re "ber"))) (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (re.range "1" "9") ((_ re.loop 3 3) (re.range "0" "9"))) (str.to_re "\u{a}"))))
; ok\*\-\*PasswordAgent\u{3C}chat\u{3E}
(assert (str.in_re X (str.to_re "ok*-*PasswordAgent<chat>\u{1b}\u{a}")))
(check-sat)
