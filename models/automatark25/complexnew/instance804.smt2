(set-logic QF_SLIA)
(declare-const X String)
; pjpoptwql\u{2f}rlnjsportsHost\u{3A}Subject\u{3a}YAHOOdestroyed\u{21}
(assert (str.in_re X (str.to_re "pjpoptwql/rlnjsportsHost:Subject:YAHOOdestroyed!\u{a}")))
; Host\u{3A}PG=SPEEDBARReferer\u{3a}
(assert (not (str.in_re X (str.to_re "Host:PG=SPEEDBARReferer:\u{a}"))))
(check-sat)
