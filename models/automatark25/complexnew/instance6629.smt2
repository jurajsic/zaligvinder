(set-logic QF_SLIA)
(declare-const X String)
; ^(\d{4}[- ]){3}\d{4}|\d{16}$
(assert (not (str.in_re X (re.union (re.++ ((_ re.loop 3 3) (re.++ ((_ re.loop 4 4) (re.range "0" "9")) (re.union (str.to_re "-") (str.to_re " ")))) ((_ re.loop 4 4) (re.range "0" "9"))) (re.++ ((_ re.loop 16 16) (re.range "0" "9")) (str.to_re "\u{a}"))))))
; ^\d{1,3}\.\d{1,4}$
(assert (str.in_re X (re.++ ((_ re.loop 1 3) (re.range "0" "9")) (str.to_re ".") ((_ re.loop 1 4) (re.range "0" "9")) (str.to_re "\u{a}"))))
; ^([0-7]{3})$
(assert (str.in_re X (re.++ ((_ re.loop 3 3) (re.range "0" "7")) (str.to_re "\u{a}"))))
; www\u{2E}freescratchandwin\u{2E}com\d+Server.*www\u{2E}cameup\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "www.freescratchandwin.com") (re.+ (re.range "0" "9")) (str.to_re "Server") (re.* re.allchar) (str.to_re "www.cameup.com\u{13}\u{a}"))))
(check-sat)
