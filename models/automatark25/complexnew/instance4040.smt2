(set-logic QF_SLIA)
(declare-const X String)
; /\u{2e}wk4([\?\u{5c}\u{2f}]|$)/smiU
(assert (str.in_re X (re.++ (str.to_re "/.wk4") (re.union (str.to_re "?") (str.to_re "\u{5c}") (str.to_re "/")) (str.to_re "/smiU\u{a}"))))
; (\<!--\s*.*?((--\>)|$))
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}<!--") (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.* re.allchar) (str.to_re "-->")))))
(check-sat)
