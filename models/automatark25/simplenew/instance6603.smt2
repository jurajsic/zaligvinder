(set-logic QF_SLIA)
(declare-const X String)
; CMDLoginExciteSubject\u{3A}downloadfile\u{2e}org
(assert (str.in_re X (str.to_re "CMDLoginExciteSubject:downloadfile.org\u{a}")))
(check-sat)
