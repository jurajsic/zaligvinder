(set-logic QF_SLIA)
(declare-const X String)
; ^\(?082|083|084|072\)?[\s-]?[\d]{3}[\s-]?[\d]{4}$
(assert (str.in_re X (re.union (re.++ (re.opt (str.to_re "(")) (str.to_re "082")) (str.to_re "083") (str.to_re "084") (re.++ (str.to_re "072") (re.opt (str.to_re ")")) (re.opt (re.union (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to_re "-") (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}")))))
; &#\d{2,5};
(assert (str.in_re X (re.++ (str.to_re "&#") ((_ re.loop 2 5) (re.range "0" "9")) (str.to_re ";\u{a}"))))
; ^[a-zA-z0-9]+[@]{1}[a-zA-Z]+[.]{1}[a-zA-Z]+$
(assert (str.in_re X (re.++ (re.+ (re.union (re.range "a" "z") (re.range "A" "z") (re.range "0" "9"))) ((_ re.loop 1 1) (str.to_re "@")) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z"))) ((_ re.loop 1 1) (str.to_re ".")) (re.+ (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to_re "\u{a}"))))
; Host\u{3A}\d+zmnjgmomgbdz\u{2f}zzmw\.gzt%3ftoolbar\u{2E}i-lookup\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "Host:") (re.+ (re.range "0" "9")) (str.to_re "zmnjgmomgbdz/zzmw.gzt%3ftoolbar.i-lookup.com\u{a}"))))
(check-sat)
