(set-logic QF_SLIA)
(declare-const X String)
; cyber@yahoo\u{2E}com\s+Host\u{3a}\u{7D}\u{7C}richfind\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "cyber@yahoo.com") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host:}|richfind.com\u{a}"))))
(check-sat)
