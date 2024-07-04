(set-logic QF_SLIA)
(declare-const X String)
; /^router=.*?arg=[a-z\d\.]*[^a-z\d\.&]/iP
(assert (not (str.in_re X (re.++ (str.to_re "/router=") (re.* re.allchar) (str.to_re "arg=") (re.* (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re "."))) (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re ".") (str.to_re "&")) (str.to_re "/iP\u{a}")))))
; /^tcpdata\u{7c}\d+\u{7c}\d+\u{7C}[a-z0-9]+\u{2E}[a-z]{2,3}\u{7C}[a-z0-9]+\u{7C}/
(assert (str.in_re X (re.++ (str.to_re "/tcpdata|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re ".") ((_ re.loop 2 3) (re.range "a" "z")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re "|/\u{a}"))))
; ^((67\d{2})|(4\d{3})|(5[1-5]\d{2})|(6011))(-?\s?\d{4}){3}|(3[4,7])\d{2}-?\s?\d{6}-?\s?\d{5}$
(assert (not (str.in_re X (re.union (re.++ (re.union (re.++ (str.to_re "67") ((_ re.loop 2 2) (re.range "0" "9"))) (re.++ (str.to_re "4") ((_ re.loop 3 3) (re.range "0" "9"))) (re.++ (str.to_re "5") (re.range "1" "5") ((_ re.loop 2 2) (re.range "0" "9"))) (str.to_re "6011")) ((_ re.loop 3 3) (re.++ (re.opt (str.to_re "-")) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 4 4) (re.range "0" "9"))))) (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (str.to_re "-")) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 6 6) (re.range "0" "9")) (re.opt (str.to_re "-")) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 5 5) (re.range "0" "9")) (str.to_re "\u{a}3") (re.union (str.to_re "4") (str.to_re ",") (str.to_re "7")))))))
; /\bobj\u{a}\u{20}*?\/Pattern\u{20}*?\u{a}endobj\b/i
(assert (str.in_re X (re.++ (str.to_re "/obj\u{a}") (re.* (str.to_re " ")) (str.to_re "/Pattern") (re.* (str.to_re " ")) (str.to_re "\u{a}endobj/i\u{a}"))))
(check-sat)
