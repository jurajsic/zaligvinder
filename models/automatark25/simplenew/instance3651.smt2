(set-logic QF_SLIA)
(declare-const X String)
; www\u{2E}maxifiles\u{2E}comServidor\u{2E}
(assert (not (str.in_re X (str.to_re "www.maxifiles.comServidor.\u{13}\u{a}"))))
(check-sat)
