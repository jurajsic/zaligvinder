(set-logic QF_SLIA)
(declare-const X String)
; X-Mailer\u{3A}\s+www\.iggsey\.com
(assert (not (str.in_re X (re.++ (str.to_re "X-Mailer:\u{13}") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "www.iggsey.com\u{a}")))))
(check-sat)
