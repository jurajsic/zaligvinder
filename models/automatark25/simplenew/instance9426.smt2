(set-logic QF_SLIA)
(declare-const X String)
; \u{2A}PORT3\u{2A}\s+Warezxmlns\u{3A}%3flinkautomatici\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "*PORT3*") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "Warezxmlns:%3flinkautomatici.com\u{a}"))))
(check-sat)
