(set-logic QF_SLIA)
(declare-const X String)
; ^(05)[0-9]{8}$
(assert (str.in_re X (re.++ (str.to_re "05") ((_ re.loop 8 8) (re.range "0" "9")) (str.to_re "\u{a}"))))
; (((0[123456789]|10|11|12)(([1][9][0-9][0-9])|([2][0-9][0-9][0-9]))))
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") (re.union (re.++ (str.to_re "0") (re.union (str.to_re "1") (str.to_re "2") (str.to_re "3") (str.to_re "4") (str.to_re "5") (str.to_re "6") (str.to_re "7") (str.to_re "8") (str.to_re "9"))) (str.to_re "10") (str.to_re "11") (str.to_re "12")) (re.union (re.++ (str.to_re "19") (re.range "0" "9") (re.range "0" "9")) (re.++ (str.to_re "2") (re.range "0" "9") (re.range "0" "9") (re.range "0" "9")))))))
; Host\u{3a}[^\n\r]*pgwtjgxwthx\u{2f}byb\.xky[^\n\r]*source%3Dultrasearch136%26campaign%3Dsnap
(assert (not (str.in_re X (re.++ (str.to_re "Host:") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "pgwtjgxwthx/byb.xky") (re.* (re.union (str.to_re "\u{a}") (str.to_re "\u{d}"))) (str.to_re "source%3Dultrasearch136%26campaign%3Dsnap\u{a}")))))
; ^\d{5}-\d{4}|\d{5}|[A-Z]\d[A-Z] \d[A-Z]\d$
(assert (not (str.in_re X (re.union (re.++ ((_ re.loop 5 5) (re.range "0" "9")) (str.to_re "-") ((_ re.loop 4 4) (re.range "0" "9"))) ((_ re.loop 5 5) (re.range "0" "9")) (re.++ (re.range "A" "Z") (re.range "0" "9") (re.range "A" "Z") (str.to_re " ") (re.range "0" "9") (re.range "A" "Z") (re.range "0" "9") (str.to_re "\u{a}"))))))
; www\u{2E}webcruiser\u{2E}ccJMailBoxHostGENERAL_PARAM2FT
(assert (str.in_re X (str.to_re "www.webcruiser.ccJMailBoxHostGENERAL_PARAM2FT\u{a}")))
(check-sat)
