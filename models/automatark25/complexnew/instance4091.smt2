(set-logic QF_SLIA)
(declare-const X String)
; Theef2offers\u{2E}bullseye-network\u{2E}com
(assert (not (str.in_re X (str.to_re "Theef2offers.bullseye-network.com\u{a}"))))
; ^[^\u{0}-\u{1f}\u{21}-\u{26}\u{28}-\u{2d}\u{2f}-\u{40}\u{5b}-\u{60}\u{7b}-\u{ff}]+$
(assert (not (str.in_re X (re.++ (re.+ (re.union (re.range "\u{0}" "\u{1f}") (re.range "!" "&") (re.range "(" "-") (re.range "/" "@") (re.range "[" "`") (re.range "{" "\u{ff}"))) (str.to_re "\u{a}")))))
(check-sat)
