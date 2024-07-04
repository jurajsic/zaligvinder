(set-logic QF_SLIA)
(declare-const X String)
; ^( )*(\+?( )?\(?( )?(\d{1,3})?)\)?(.|-|_ )?\(?(\d{3})\)?(.|-|_ )?\(?(\d{3})\)?(.|-|_ )?\(?(\d{4})\)?( )*$
(assert (not (str.in_re X (re.++ (re.* (str.to_re " ")) (re.opt (str.to_re ")")) (re.opt (re.union re.allchar (str.to_re "-") (str.to_re "_ "))) (re.opt (str.to_re "(")) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (str.to_re ")")) (re.opt (re.union re.allchar (str.to_re "-") (str.to_re "_ "))) (re.opt (str.to_re "(")) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (str.to_re ")")) (re.opt (re.union re.allchar (str.to_re "-") (str.to_re "_ "))) (re.opt (str.to_re "(")) ((_ re.loop 4 4) (re.range "0" "9")) (re.opt (str.to_re ")")) (re.* (str.to_re " ")) (str.to_re "\u{a}") (re.opt (str.to_re "+")) (re.opt (str.to_re " ")) (re.opt (str.to_re "(")) (re.opt (str.to_re " ")) (re.opt ((_ re.loop 1 3) (re.range "0" "9")))))))
; Host\u{3A}[^\n\r]*cache\u{2E}everer\u{2E}com\s+from\.myway\.comToolbar
(assert (str.in_re X (re.++ (str.to_re "Host:") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "cache.everer.com") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "from.myway.com\u{1b}Toolbar\u{a}"))))
(check-sat)
