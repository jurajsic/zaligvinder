(set-logic QF_SLIA)
(declare-const X String)
; forum=\s+\u{2F}toolbar\u{2F}ico\u{2F}
(assert (not (str.in_re X (re.++ (str.to_re "forum=") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "/toolbar/ico/\u{a}")))))
(check-sat)
