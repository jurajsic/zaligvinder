(set-logic QF_SLIA)
(declare-const X String)
; \u{2F}rss\d+answer\sHost\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "/rss") (re.+ (re.range "0" "9")) (str.to_re "answer") (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")) (str.to_re "Host:\u{a}")))))
; ^(NAME)(\s?)<?(\w*)(\s*)([0-9]*)>?$
(assert (str.in_re X (re.++ (str.to_re "NAME") (re.opt (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.opt (str.to_re "<")) (re.* (re.union (re.range "0" "9") (re.range "A" "Z") (re.range "a" "z") (str.to_re "_"))) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (re.* (re.range "0" "9")) (re.opt (str.to_re ">")) (str.to_re "\u{a}"))))
(check-sat)
