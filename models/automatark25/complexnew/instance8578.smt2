(declare-const X String)
; ^(([0]?[1-9])|(1[0-2]))\/(([0]?[1-9])|([1,2]\d{1})|([3][0,1]))\/[12]\d{3}$
(assert (not (str.in_re X (re.++ (re.union (re.++ (re.opt (str.to_re "0")) (re.range "1" "9")) (re.++ (str.to_re "1") (re.range "0" "2"))) (str.to_re "/") (re.union (re.++ (re.opt (str.to_re "0")) (re.range "1" "9")) (re.++ (re.union (str.to_re "1") (str.to_re ",") (str.to_re "2")) ((_ re.loop 1 1) (re.range "0" "9"))) (re.++ (str.to_re "3") (re.union (str.to_re "0") (str.to_re ",") (str.to_re "1")))) (str.to_re "/") (re.union (str.to_re "1") (str.to_re "2")) ((_ re.loop 3 3) (re.range "0" "9")) (str.to_re "\u{a}")))))
; information\s+User-Agent\u{3A}MM_RECO\u{2E}EXE
(assert (not (str.in_re X (re.++ (str.to_re "information") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "User-Agent:MM_RECO.EXE\u{a}")))))
; ^[A-Z]{1,3}\d{6}$
(assert (not (str.in_re X (re.++ ((_ re.loop 1 3) (re.range "A" "Z")) ((_ re.loop 6 6) (re.range "0" "9")) (str.to_re "\u{a}")))))
(check-sat)
