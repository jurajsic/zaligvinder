(declare-const X String)
; /^[a-z]\u{3d}[a-f\d]{80,140}$/Pi
(assert (str.in_re X (re.++ (str.to_re "/") (re.range "a" "z") (str.to_re "=") ((_ re.loop 80 140) (re.union (re.range "a" "f") (re.range "0" "9"))) (str.to_re "/Pi\u{a}"))))
; offers\u{2E}bullseye-network\u{2E}com[^\n\r]*this\dwww\u{2E}trustedsearch\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "offers.bullseye-network.com") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "this") (re.range "0" "9") (str.to_re "www.trustedsearch.com\u{a}"))))
; \d{4}-?\d{4}-?\d{4}-?\d{4}
(assert (str.in_re X (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (re.opt (str.to_re "-")) ((_ re.loop 4 4) (re.range "0" "9")) (re.opt (str.to_re "-")) ((_ re.loop 4 4) (re.range "0" "9")) (re.opt (str.to_re "-")) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
; ^([A-Za-z0-9]\s?)+([,]\s?([A-Za-z0-9]\s?)+)*$
(assert (not (str.in_re X (re.++ (re.+ (re.++ (re.union (re.range "A" "Z") (re.range "a" "z") (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))))) (re.* (re.++ (str.to_re ",") (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.+ (re.++ (re.union (re.range "A" "Z") (re.range "a" "z") (re.range "0" "9")) (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))))))) (str.to_re "\u{a}")))))
; ^\(?082|083|084|072\)?[\s-]?[\d]{3}[\s-]?[\d]{4}$
(assert (not (str.in_re X (re.union (re.++ (re.opt (str.to_re "(")) (str.to_re "082")) (str.to_re "083") (str.to_re "084") (re.++ (str.to_re "072") (re.opt (str.to_re ")")) (re.opt (re.union (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}"))))))
(check-sat)
