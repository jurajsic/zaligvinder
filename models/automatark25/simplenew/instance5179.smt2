(set-logic QF_SLIA)
(declare-const X String)
; Host\u{3a}\s+Host\u{3A}\u{2F}toolbar\u{2F}supremetb
(assert (str.in_re X (re.++ (str.to_re "Host:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host:/toolbar/supremetb\u{a}"))))
(check-sat)
