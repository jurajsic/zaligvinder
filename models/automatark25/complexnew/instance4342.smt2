(declare-const X String)
; ^(([0-9]{5})*-([0-9]{4}))|([0-9]{5})$
(assert (str.in_re X (re.union (re.++ (re.* ((_ re.loop 5 5) (re.range "0" "9"))) (str.to_re "-") ((_ re.loop 4 4) (re.range "0" "9"))) (re.++ ((_ re.loop 5 5) (re.range "0" "9")) (str.to_re "\u{a}")))))
; Host\u{3A}\dKeyloggercargo=
(assert (str.in_re X (re.++ (str.to_re "Host:") (re.range "0" "9") (str.to_re "Keyloggercargo=\u{a}"))))
(check-sat)
