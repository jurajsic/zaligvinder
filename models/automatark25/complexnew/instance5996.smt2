(set-logic QF_SLIA)
(declare-const X String)
; User-Agent\u{3A}\w+\u{d}\u{a}subject=GhostVoice
(assert (str.in_re X (re.++ (str.to_re "User-Agent:") (re.+ (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (str.to_re "\u{d}\u{a}subject=GhostVoice\u{a}"))))
; Points\d+Host\u{3a}\stoBasicwww\u{2E}webcruiser\u{2E}cc
(assert (not (str.in_re X (re.++ (str.to_re "Points") (re.+ (re.range "0" "9")) (str.to_re "Host:") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "toBasicwww.webcruiser.cc\u{a}")))))
; ^\d{3}-\d{2}-\d{4}$
(assert (str.in_re X (re.++ ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
; ^[-]?\d*(\.\d*)$
(assert (str.in_re X (re.++ (re.opt (str.to_re "-")) (re.* (re.range "0" "9")) (str.to_re "\u{a}.") (re.* (re.range "0" "9")))))
; securityOmFkbWluADROARad\u{2E}mokead\u{2E}com\u{3C}\u{2F}chat\u{3E}
(assert (str.in_re X (str.to_re "securityOmFkbWluADROARad.mokead.com</chat>\u{a}")))
(check-sat)
