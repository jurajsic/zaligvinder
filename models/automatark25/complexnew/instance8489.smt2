(set-logic QF_SLIA)
(declare-const X String)
; /\u{2E}sum([\?\u{5c}\u{2f}]|$)/smiU
(assert (not (str.in_re X (re.++ (str.to_re "/.sum") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}")))))
; ^([a-zA-Z])*$
(assert (not (str.in_re X (re.++ (re.* (re.union (re.range "a" "z") (re.range "A" "Z"))) (str.to_re "\u{a}")))))
; ^[0-9]{4} {0,1}[A-Z]{2}$
(assert (str.in_re X (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (re.opt (str.to_re " ")) ((_ re.loop 2 2) (re.range "A" "Z")) (str.to_re "\u{a}"))))
(check-sat)
