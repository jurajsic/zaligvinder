(set-logic QF_SLIA)
(declare-const X String)
; ^[a-z0-9_.-]*@[a-z0-9-]+(.[a-z]{2,4})+$
(assert (str.in_re X (re.++ (re.* (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re "_") (str.to_re ".") (str.to_re "-"))) (str.to_re "@") (re.+ (re.union (re.range "a" "z") (re.range "0" "9") (str.to_re "-"))) (re.+ (re.++ re.allchar ((_ re.loop 2 4) (re.range "a" "z")))) (str.to_re "\u{a}"))))
; ^((\+){1}91){1}[1-9]{1}[0-9]{9}$
(assert (not (str.in_re X (re.++ ((_ re.loop 1 1) (re.++ ((_ re.loop 1 1) (str.to_re "+")) (str.to_re "91"))) ((_ re.loop 1 1) (re.range "1" "9")) ((_ re.loop 9 9) (re.range "0" "9")) (str.to_re "\u{a}")))))
; YWRtaW46cGFzc3dvcmQ\s+www\u{2E}alfacleaner\u{2E}com
(assert (not (str.in_re X (re.++ (str.to_re "YWRtaW46cGFzc3dvcmQ") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "www.alfacleaner.com\u{a}")))))
; /^range\u{7c}\d+\u{7c}\d+\u{7C}[a-z0-9]+\u{2E}[a-z]{2,3}\u{7C}[a-z0-9]+\u{7C}/
(assert (str.in_re X (re.++ (str.to_re "/range|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re ".") ((_ re.loop 2 3) (re.range "a" "z")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re "|/\u{a}"))))
; ^[+]?100(\.0{1,2})?%?$|^[+]?\d{1,2}(\.\d{1,2})?%?$
(assert (str.in_re X (re.union (re.++ (re.opt (str.to_re "+")) (str.to_re "100") (re.opt (re.++ (str.to_re ".") ((_ re.loop 1 2) (str.to_re "0")))) (re.opt (str.to_re "%"))) (re.++ (re.opt (str.to_re "+")) ((_ re.loop 1 2) (re.range "0" "9")) (re.opt (re.++ (str.to_re ".") ((_ re.loop 1 2) (re.range "0" "9")))) (re.opt (str.to_re "%")) (str.to_re "\u{a}")))))
(check-sat)
