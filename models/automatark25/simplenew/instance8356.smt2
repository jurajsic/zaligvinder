(set-logic QF_SLIA)
(declare-const X String)
; /(\u{19}\u{0}|\u{0}\u{5C})\u{0}n\u{0}w\u{0}d\u{0}b\u{0}l\u{0}i\u{0}b\u{0}\.\u{0}d\u{0}l\u{0}l\u{0}\u{0}\u{0}/i
(assert (str.in_re X (re.++ (str.to_re "/") (re.union (str.to_re "\u{19}\u{0}") (str.to_re "\u{0}\u{5c}")) (str.to_re "\u{0}n\u{0}w\u{0}d\u{0}b\u{0}l\u{0}i\u{0}b\u{0}.\u{0}d\u{0}l\u{0}l\u{0}\u{0}\u{0}/i\u{a}"))))
(check-sat)
