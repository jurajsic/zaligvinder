(set-logic QF_SLIA)
(declare-const X String)
; ^[A-Z]{4}[1-8](\d){2}$
(assert (not (str.in_re X (re.++ ((_ re.loop 4 4) (re.range "A" "Z")) (re.range "1" "8") ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "\u{a}")))))
; Host\u{3A}[^\n\r]*cache\u{2E}everer\u{2E}com\s+from\.myway\.comToolbar
(assert (not (str.in_re X (re.++ (str.to_re "Host:") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "cache.everer.com") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "from.myway.com\u{1b}Toolbar\u{a}")))))
; ^((\d{2,4})/)?((\d{6,8})|(\d{2})-(\d{2})-(\d{2,4})|(\d{3,4})-(\d{3,4}))$
(assert (not (str.in_re X (re.++ (re.opt (re.++ ((_ re.loop 2 4) (re.range "0" "9")) (str.to_re "/"))) (re.union ((_ re.loop 6 8) (re.range "0" "9")) (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 2 2) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 2 4) (re.range "0" "9"))) (re.++ ((_ re.loop 3 4) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 3 4) (re.range "0" "9")))) (str.to_re "\u{a}")))))
(check-sat)
