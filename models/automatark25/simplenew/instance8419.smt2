(set-logic QF_SLIA)
(declare-const X String)
; \u{3}\u{0}\u{1c}\u{0}\u{0}\u{0}\u{0}\u{0}\u{1}Furax
(assert (str.in_re X (str.to_re "\u{3}\u{0}\u{1c}\u{0}\u{0}\u{0}\u{0}\u{0}\u{1}Furax\u{a}")))
(check-sat)
