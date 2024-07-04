(set-logic QF_SLIA)
(declare-const X String)
; Host\u{3A}\w+User-Agent\u{3A}\sTeomaBarHost\u{3A}HoursHost\u{3A}Host\u{3A}
(assert (str.in_re X (re.++ (str.to_re "Host:") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "User-Agent:") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "TeomaBarHost:HoursHost:Host:\u{a}"))))
(check-sat)
