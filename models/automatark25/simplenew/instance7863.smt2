(set-logic QF_SLIA)
(declare-const X String)
; X-Mailer\u{3a}SpyAgentRootHost\u{3A}
(assert (not (str.in_re X (str.to_re "X-Mailer:\u{13}SpyAgentRootHost:\u{a}"))))
(check-sat)
