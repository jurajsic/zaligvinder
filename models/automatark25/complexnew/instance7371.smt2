(declare-const X String)
; \-?(90|[0-8]?[0-9]\.[0-9]{0,6})\,\-?(180|(1[0-7][0-9]|[0-9]{0,2})\.[0-9]{0,6})
(assert (not (str.in_re X (re.++ (re.opt (str.to_re "-")) (re.union (str.to_re "90") (re.++ (re.opt (re.range "0" "8")) (re.range "0" "9") (str.to_re ".") ((_ re.loop 0 6) (re.range "0" "9")))) (str.to_re ",") (re.opt (str.to_re "-")) (re.union (str.to_re "180") (re.++ (re.union (re.++ (str.to_re "1") (re.range "0" "7") (re.range "0" "9")) ((_ re.loop 0 2) (re.range "0" "9"))) (str.to_re ".") ((_ re.loop 0 6) (re.range "0" "9")))) (str.to_re "\u{a}")))))
; [\s]+
(assert (str.in_re X (re.++ (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "\u{a}"))))
(check-sat)
