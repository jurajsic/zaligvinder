(set-logic QF_SLIA)
(declare-const X String)
; \b(0?[1-9]|1[0-2])(\/)(0?[1-9]|1[0-9]|2[0-9]|3[0-1])(\/)(200[0-8])\b
(assert (str.in_re X (re.++ (re.union (re.++ (re.opt (str.to_re "0")) (re.range "1" "9")) (re.++ (str.to_re "1") (re.range "0" "2"))) (str.to_re "/") (re.union (re.++ (re.opt (str.to_re "0")) (re.range "1" "9")) (re.++ (str.to_re "1") (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "9")) (re.++ (str.to_re "3") (re.range "0" "1"))) (str.to_re "/\u{a}200") (re.range "0" "8"))))
; ^[01]?[- .]?\(?[2-9]\d{2}\)?[- .]?\d{3}[- .]?\d{4}$
(assert (str.in_re X (re.++ (re.opt (re.union (str.to_re "0") (str.to_re "1"))) (re.opt (re.union (str.to_re "-") (str.to_re " ") (str.to_re "."))) (re.opt (str.to_re "(")) (re.range "2" "9") ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (str.to_re ")")) (re.opt (re.union (str.to_re "-") (str.to_re " ") (str.to_re "."))) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (re.union (str.to_re "-") (str.to_re " ") (str.to_re "."))) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
; search\.dropspam\.com.*SupportFiles.*Referer\u{3A}
(assert (not (str.in_re X (re.++ (str.to_re "search.dropspam.com") (re.* re.allchar) (str.to_re "SupportFiles\u{13}") (re.* re.allchar) (str.to_re "Referer:\u{a}")))))
; Host\u{3a}\s+e2give\.com\s+NETObservemedia\u{2E}dxcdirect\u{2E}comSubject\u{3A}quick\u{2E}qsrch\u{2E}com
(assert (not (str.in_re X (re.++ (str.to_re "Host:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "e2give.com") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "NETObservemedia.dxcdirect.comSubject:quick.qsrch.com\u{a}")))))
(check-sat)
