(set-logic QF_SLIA)
(declare-const X String)
; UI2Host\u{3A}DesktopUser-Agent\u{3a}\u{2F}notifier\u{2F}
(assert (str.in_re X (str.to_re "UI2Host:DesktopUser-Agent:/notifier/\u{a}")))
(check-sat)
