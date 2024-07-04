(set-logic QF_SLIA)
(declare-const X String)
; Send=\s+User-Agent\u{3A}\d+Host\u{3A}\u{2F}products\u{2F}spyblocs\u{2F}backtrust\u{2E}comv\u{2E}LoginHost\u{3a}
(assert (not (str.in_re X (re.++ (str.to_re "Send=") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "User-Agent:") (re.+ (re.range "0" "9")) (str.to_re "Host:/products/spyblocs/\u{13}backtrust.comv.LoginHost:\u{a}")))))
(check-sat)
