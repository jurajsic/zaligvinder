(declare-const X String)
; 5[12345]\d{14}
(assert (not (str.in_re X (re.++ (str.to_re "5") (re.union (str.to_re "1") (str.to_re "2") (str.to_re "3") (str.to_re "4") (str.to_re "5")) ((_ re.loop 14 14) (re.range "0" "9")) (str.to_re "\u{a}")))))
; ^(\+48\s+)?\d{3}(\s*|\-)\d{3}(\s*|\-)\d{3}$
(assert (str.in_re X (re.++ (re.opt (re.++ (str.to_re "+48") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))))) ((_ re.loop 3 3) (re.range "0" "9")) (re.union (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "-")) ((_ re.loop 3 3) (re.range "0" "9")) (re.union (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "-")) ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
