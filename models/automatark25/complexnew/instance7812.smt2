(declare-const X String)
; /\u{2e}pac([\?\u{5c}\u{2f}]|$)/smiU
(assert (not (str.in_re X (re.++ (str.to_re "/.pac") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}")))))
; (^(\d+)$)|(^(\d{1,3}[ ,\.](\d{3}[ ,\.])*\d{3}|\d{1,3})$)
(assert (not (str.in_re X (re.union (re.+ (re.range "0" "9")) (re.++ (re.union (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (re.union (str.to_re " ") (str.to_re ",") (str.to_re ".")) (re.* (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (re.union (str.to_re " ") (str.to_re ",") (str.to_re ".")))) ((_ re.loop 3 3) (re.range "0" "9"))) ((_ re.loop 1 3) (re.range "0" "9"))) (str.to_re "\u{a}"))))))
; (\d{3}.?\d{3}.?\d{3}-?\d{2})
(assert (str.in_re X (re.++ (str.to_re "\u{a}") ((_ re.loop 3 3) (re.range "0" "9")) (re.opt re.allchar) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt re.allchar) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (str.to_re "-")) ((_ re.loop 2 2) (re.range "0" "9")))))
(check-sat)
