(declare-const X String)
; ^((5[1-5])([0-9]{2})((-|\s)?[0-9]{4}){3})$
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") ((_ re.loop 2 2) (re.range "0" "9")) ((_ re.loop 3 3) (re.++ (re.opt (re.union (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 4 4) (re.range "0" "9")))) (str.to_re "5") (re.range "1" "5")))))
; [a-zA-Z_:][a-zA-Z0-9_,\.\-]*?
(assert (str.in_re X (re.++ (re.union (re.range "a" "z") (re.range "A" "Z") (str.to_re "_") (str.to_re ":")) (re.* (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9") (str.to_re "_") (str.to_re ",") (str.to_re ".") (str.to_re "-"))) (str.to_re "\u{a}"))))
; \d{2}\s?[A-Z]{1,3}\s?\d{2,4}
(assert (str.in_re X (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 1 3) (re.range "A" "Z")) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 2 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
(check-sat)
