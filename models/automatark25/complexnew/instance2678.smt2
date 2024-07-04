(set-logic QF_SLIA)
(declare-const X String)
; ^([9]{1})([234789]{1})([0-9]{8})$
(assert (str.in_re X (re.++ ((_ re.loop 1 1) (str.to_re "9")) ((_ re.loop 1 1) (re.union (str.to_re "2") (str.to_re "3") (str.to_re "4") (str.to_re "7") (str.to_re "8") (str.to_re "9"))) ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "\u{a}"))))
; [\d+]{10}\@[\w]+\.?[\w]+?\.?[\w]+?\.?[\w+]{2,4}/i
(assert (str.in_re X (re.++ ((_ re.loop 10 10) (re.union (re.range "0" "9") (str.to_re "+"))) (str.to_re "@") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.opt (str.to_re ".")) (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.opt (str.to_re ".")) (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.opt (str.to_re ".")) ((_ re.loop 2 4) (re.union (str.to_re "+") (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "/i\u{a}"))))
; This\s+\u{7D}\u{7B}Password\u{3A}\d+
(assert (not (str.in_re X (re.++ (str.to_re "This") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "}{Password:\u{1b}") (re.+ (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
