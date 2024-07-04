(set-logic QF_SLIA)
(declare-const X String)
; Host\u{3A}\s+www\.iggsey\.comcs\u{2E}smartshopper\u{2E}com
(assert (not (str.in_re X (re.++ (str.to_re "Host:") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "www.iggsey.comcs.smartshopper.com\u{a}")))))
; ((19|20)[0-9]{2})-(([1-9])|(0[1-9])|(1[0-2]))-((3[0-1])|([0-2][0-9])|([0-9]))
(assert (str.in_re X (re.++ (str.to_re "-") (re.union (re.range "1" "9") (re.++ (str.to_re "0") (re.range "1" "9")) (re.++ (str.to_re "1") (re.range "0" "2"))) (str.to_re "-") (re.union (re.++ (str.to_re "3") (re.range "0" "1")) (re.++ (re.range "0" "2") (re.range "0" "9")) (re.range "0" "9")) (str.to_re "\u{a}") (re.union (str.to_re "19") (str.to_re "20")) ((_ re.loop 2 2) (re.range "0" "9")))))
; /^\d{2}[\-\/]\d{2}[\-\/]\d{4}$/
(assert (not (str.in_re X (re.++ (str.to_re "/") ((_ re.loop 2 2) (re.range "0" "9")) (re.union (str.to_re "-") (str.to_re "/")) ((_ re.loop 2 2) (re.range "0" "9")) (re.union (str.to_re "-") (str.to_re "/")) ((_ re.loop 4 4) (re.range "0" "9")) (str.to_re "/\u{a}")))))
(check-sat)
