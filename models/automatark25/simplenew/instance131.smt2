(set-logic QF_SLIA)
(declare-const X String)
; YAHOODesktopHost\u{3a}LOGHost\u{3A}tvshowticketsResultsFROM\u{3A}
(assert (str.in_re X (str.to_re "YAHOODesktopHost:LOGHost:tvshowticketsResultsFROM:\u{a}")))
(check-sat)
