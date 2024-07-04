(set-logic QF_SLIA)
(declare-const X String)
; User-Agent\u{3A}Host\u{3A}TeomaBarHost\u{3A}HoursHost\u{3A}
(assert (str.in_re X (str.to_re "User-Agent:Host:TeomaBarHost:HoursHost:\u{a}")))
; (^\d{3,5}\,\d{2}$)|(^\d{3,5}$)
(assert (not (str.in_re X (re.union (re.++ ((_ re.loop 3 5) (re.range "0" "9")) (str.to_re ",") ((_ re.loop 2 2) (re.range "0" "9"))) (re.++ ((_ re.loop 3 5) (re.range "0" "9")) (str.to_re "\u{a}"))))))
(check-sat)
