(declare-const X String)
; ^([0-9]{6}[\s\-]{1}[0-9]{12}|[0-9]{18})$
(assert (str.in_re X (re.++ (re.union (re.++ ((_ re.loop 6 6) (re.range "0" "9")) ((_ re.loop 1 1) (re.union (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 12 12) (re.range "0" "9"))) ((_ re.loop 18 18) (re.range "0" "9"))) (str.to_re "\u{a}"))))
(check-sat)
