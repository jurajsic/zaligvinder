(set-logic QF_SLIA)
(declare-const X String)
; /filename=[^\n]*\u{2e}pdf/i
(assert (not (str.in_re X (re.++ (str.to_re "/filename=") (re.* (re.comp (str.to_re "\u{a}"))) (str.to_re ".pdf/i\u{a}")))))
; /\u{3F}[0-9a-z]{32}D/U
(assert (not (str.in_re X (re.++ (str.to_re "/?") ((_ re.loop 32 32) (re.union (re.range "0" "9") (re.range "a" "z"))) (str.to_re "D/U\u{a}")))))
; engineResultUser-Agent\u{3A}
(assert (not (str.in_re X (str.to_re "engineResultUser-Agent:\u{a}"))))
; /\/stat_svc\/$/U
(assert (not (str.in_re X (str.to_re "//stat_svc//U\u{a}"))))
; ^\[0-9]{4}\-\[0-9]{2}\-\[0-9]{2}$
(assert (str.in_re X (re.++ (str.to_re "[0-9") ((_ re.loop 4 4) (str.to_re "]")) (str.to_re "-[0-9") ((_ re.loop 2 2) (str.to_re "]")) (str.to_re "-[0-9") ((_ re.loop 2 2) (str.to_re "]")) (str.to_re "\u{a}"))))
(check-sat)
