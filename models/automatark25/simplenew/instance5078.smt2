(set-logic QF_SLIA)
(declare-const X String)
; eveocczmthmmq\u{2f}omzlHello\u{2E}\u{2F}asp\u{2F}offers\.asp\?
(assert (not (str.in_re X (str.to_re "eveocczmthmmq/omzlHello./asp/offers.asp?\u{a}"))))
(check-sat)
