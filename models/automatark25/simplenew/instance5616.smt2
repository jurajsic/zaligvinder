(set-logic QF_SLIA)
(declare-const X String)
; User-Agent\u{3A}Host\u{3A}TeomaBarHost\u{3A}HoursHost\u{3A}
(assert (not (str.in_re X (str.to_re "User-Agent:Host:TeomaBarHost:HoursHost:\u{a}"))))
(check-sat)
