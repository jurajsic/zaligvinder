(set-logic QF_SLIA)
(declare-const X String)
; Host\u{3A}\dtoolbar\u{2E}hotblox\u{2E}com\dHost\u{3A}http\u{3A}\u{2F}\u{2F}mysearch\.dropspam\.com\u{2F}index\.php\?tpid=
(assert (str.in_re X (re.++ (str.to_re "Host:") (re.range "0" "9") (str.to_re "toolbar.hotblox.com") (re.range "0" "9") (str.to_re "Host:http://mysearch.dropspam.com/index.php?tpid=\u{13}\u{a}"))))
; ServerHost\u{3A}tid\u{3D}\u{25}toolbar\u{5F}idcomtrustyfiles\u{2E}com
(assert (not (str.in_re X (str.to_re "ServerHost:tid=%toolbar_idcomtrustyfiles.com\u{a}"))))
; A-311\s+lnzzlnbk\u{2f}pkrm\.finSubject\u{3a}Basic
(assert (not (str.in_re X (re.++ (str.to_re "A-311") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "lnzzlnbk/pkrm.finSubject:Basic\u{a}")))))
; ((\d{4})|(\d{2}))|(0?[2469]|11)(-|\/)((0[0-9])|([12])([0-9]?)|(3[0]?))(-|\/)((0?[13578]|10|12)(-|\/)((0[0-9])|([12])([0-9]?)|(3[01]?))(-|\/)((\d{4}|\d{2})))
(assert (str.in_re X (re.union (re.++ (re.union (re.++ (re.opt (str.to_re "0")) (re.union (str.to_re "2") (str.to_re "4") (str.to_re "6") (str.to_re "9"))) (str.to_re "11")) (re.union (str.to_re "-") (str.to_re "/")) (re.union (re.++ (str.to_re "0") (re.range "0" "9")) (re.++ (re.union (str.to_re "1") (str.to_re "2")) (re.opt (re.range "0" "9"))) (re.++ (str.to_re "3") (re.opt (str.to_re "0")))) (re.union (str.to_re "-") (str.to_re "/")) (str.to_re "\u{a}") (re.union (re.++ (re.opt (str.to_re "0")) (re.union (str.to_re "1") (str.to_re "3") (str.to_re "5") (str.to_re "7") (str.to_re "8"))) (str.to_re "10") (str.to_re "12")) (re.union (str.to_re "-") (str.to_re "/")) (re.union (re.++ (str.to_re "0") (re.range "0" "9")) (re.++ (re.union (str.to_re "1") (str.to_re "2")) (re.opt (re.range "0" "9"))) (re.++ (str.to_re "3") (re.opt (re.union (str.to_re "0") (str.to_re "1"))))) (re.union (str.to_re "-") (str.to_re "/")) (re.union ((_ re.loop 4 4) (re.range "0" "9")) ((_ re.loop 2 2) (re.range "0" "9")))) ((_ re.loop 4 4) (re.range "0" "9")) ((_ re.loop 2 2) (re.range "0" "9")))))
; Host\u{3A}[^\n\r]*cache\u{2E}everer\u{2E}com\s+from\.myway\.comToolbar
(assert (str.in_re X (re.++ (str.to_re "Host:") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "cache.everer.com") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "from.myway.com\u{1b}Toolbar\u{a}"))))
(check-sat)
