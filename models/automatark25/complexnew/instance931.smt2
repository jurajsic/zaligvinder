(set-logic QF_SLIA)
(declare-const X String)
; Host\u{3A}Portawww\.thecommunicator\.net
(assert (str.in_re X (str.to_re "Host:Portawww.thecommunicator.net\u{a}")))
; Host\u{3A}\s+www\u{2E}internet-optimizer\u{2E}comToolBarKeylogger
(assert (not (str.in_re X (re.++ (str.to_re "Host:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "www.internet-optimizer.comToolBarKeylogger\u{a}")))))
(check-sat)
