(set-logic QF_SLIA)
(declare-const X String)
; \u{2F}cs\u{2F}pop4\u{2F}A-Spywww\u{2E}yoogee\u{2E}com
(assert (str.in_re X (str.to_re "/cs/pop4/A-Spywww.yoogee.com\u{13}\u{a}")))
(check-sat)
