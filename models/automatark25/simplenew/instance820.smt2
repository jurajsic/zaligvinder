(set-logic QF_SLIA)
(declare-const X String)
; Toolbar\s+wwwProbnymomspyo\u{2f}zowy
(assert (str.in_re X (re.++ (str.to_re "Toolbar") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "wwwProbnymomspyo/zowy\u{a}"))))
(check-sat)
