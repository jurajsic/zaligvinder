(set-logic QF_SLIA)
(declare-const X String)
; Host\u{3A}Attachedengineact=Download
(assert (str.in_re X (str.to_re "Host:Attachedengineact=Download\u{a}")))
(check-sat)
