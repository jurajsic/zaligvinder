(declare-const X String)
; @{2}((\S)+)@{2}
(assert (str.in_re X (re.++ ((_ re.loop 2 2) (str.to_re "@")) (re.+ (re.comp (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}")))) ((_ re.loop 2 2) (str.to_re "@")) (str.to_re "\u{a}"))))
; Host\u{3A}[^\n\r]*cache\u{2E}everer\u{2E}com\s+from\.myway\.comToolbar
(assert (str.in_re X (re.++ (str.to_re "Host:") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "cache.everer.com") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "from.myway.com\u{1b}Toolbar\u{a}"))))
; ^\([0-9]{3}\)[0-9]{3}(-)[0-9]{4}
(assert (not (str.in_re X (re.++ (str.to_re "(") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re ")") ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}")))))
; ((EE|EL|DE|PT)-?)?[0-9]{9}
(assert (not (str.in_re X (re.++ (re.opt (re.++ (re.union (str.to_re "EE") (str.to_re "EL") (str.to_re "DE") (str.to_re "PT")) (re.opt (str.to_re "-")))) ((_ re.loop 9 9) (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
