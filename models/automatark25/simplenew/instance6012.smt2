(set-logic QF_SLIA)
(declare-const X String)
; SystemSleuth1\u{2E}0versionHost\u{3A}ArrowHost\u{3a}3Awebsearch\u{2E}drsnsrch\u{2E}comhostieiWonHost\u{3a}pjpoptwql\u{2f}rlnj
(assert (not (str.in_re X (str.to_re "SystemSleuth\u{13}1.0versionHost:ArrowHost:3Awebsearch.drsnsrch.com\u{13}hostieiWonHost:pjpoptwql/rlnj\u{a}"))))
(check-sat)
