(set-logic QF_SLIA)
(declare-const X String)
; Host\u{3A}\s+Host\u{3A}.*c=MicrosoftStartupStarLoggerServerX-Mailer\u{3a}
(assert (not (str.in_re X (re.++ (str.to_re "Host:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Host:") (re.* re.allchar) (str.to_re "c=MicrosoftStartupStarLoggerServerX-Mailer:\u{13}\u{a}")))))
(check-sat)
