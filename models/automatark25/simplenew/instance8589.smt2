(set-logic QF_SLIA)
(declare-const X String)
; User-Agent\u{3A}Runnerads\.grokads\.comHost\u{3A}mcndvwoemn\u{2f}lvv\.jde
(assert (not (str.in_re X (str.to_re "User-Agent:Runnerads.grokads.comHost:mcndvwoemn/lvv.jde\u{a}"))))
(check-sat)
