(set-logic QF_SLIA)
(declare-const X String)
; eveocczmthmmq\u{2f}omzl\s+zmnjgmomgbdz\u{2f}zzmw\.gzt
(assert (str.in_re X (re.++ (str.to_re "eveocczmthmmq/omzl") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "zmnjgmomgbdz/zzmw.gzt\u{a}"))))
(check-sat)
