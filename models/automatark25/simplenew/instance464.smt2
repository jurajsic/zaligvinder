(set-logic QF_SLIA)
(declare-const X String)
; User-Agent\u{3A}etbuviaebe\u{2f}eqv\.bvv
(assert (str.in_re X (str.to_re "User-Agent:etbuviaebe/eqv.bvv\u{a}")))
(check-sat)
