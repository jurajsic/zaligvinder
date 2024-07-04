(set-logic QF_SLIA)
(declare-const X String)
; /^http\u{7c}\d+\u{7c}\d+\u{7C}[a-z0-9]+\u{2E}[a-z]{2,3}\u{7C}[a-z0-9]+\u{7C}/
(assert (str.in_re X (re.++ (str.to_re "/http|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re ".") ((_ re.loop 2 3) (re.range "a" "z")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re "|/\u{a}"))))
; ^((192\.168\.0\.)(1[7-9]|2[0-9]|3[0-2]))$
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}192.168.0.") (re.union (re.++ (str.to_re "1") (re.range "7" "9")) (re.++ (str.to_re "2") (re.range "0" "9")) (re.++ (str.to_re "3") (re.range "0" "2")))))))
(check-sat)
