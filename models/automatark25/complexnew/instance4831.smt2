(set-logic QF_SLIA)
(declare-const X String)
; <!--.*?-->
(assert (str.in_re X (re.++ (str.to_re "<!--") (re.* re.allchar) (str.to_re "-->\u{a}"))))
; Spy\s+\u{d}\u{a}.*YAHOOdestroyed\u{21}Host\u{3a}
(assert (str.in_re X (re.++ (str.to_re "Spy") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "\u{d}\u{a}") (re.* re.allchar) (str.to_re "YAHOOdestroyed!Host:\u{a}"))))
(check-sat)
