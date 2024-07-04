(set-logic QF_SLIA)
(declare-const X String)
; /^Content-Type\u{3a}[\u{20}\u{9}]+application\/octet-stream/smiH
(assert (str.in_re X (re.++ (str.to_re "/Content-Type:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}"))) (str.to_re "application/octet-stream/smiH\u{a}"))))
(check-sat)
