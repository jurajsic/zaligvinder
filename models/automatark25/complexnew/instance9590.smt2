(set-logic QF_SLIA)
(declare-const X String)
; ^\{(.+)|^\\(.+)|(\}*)
(assert (not (str.in_re X (re.union (re.++ (str.to_re "{") (re.+ re.allchar)) (re.++ (str.to_re "\u{5c}") (re.+ re.allchar)) (re.++ (re.* (str.to_re "}")) (str.to_re "\u{a}"))))))
; www\u{2E}freescratchandwin\u{2E}com\d+Server.*www\u{2E}cameup\u{2E}com
(assert (str.in_re X (re.++ (str.to_re "www.freescratchandwin.com") (re.+ (re.range "0" "9")) (str.to_re "Server") (re.* re.allchar) (str.to_re "www.cameup.com\u{13}\u{a}"))))
; ^(user=([a-z0-9]+,)*(([a-z0-9]+){1});)?(group=([a-z0-9]+,)*(([a-z0-9]+){1});)?(level=[0-9]+;)?$
(assert (str.in_re X (re.++ (re.opt (re.++ (str.to_re "user=") (re.* (re.++ (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re ","))) ((_ re.loop 1 1) (re.+ (re.union (re.range "a" "z") (re.range "0" "9")))) (str.to_re ";"))) (re.opt (re.++ (str.to_re "group=") (re.* (re.++ (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re ","))) ((_ re.loop 1 1) (re.+ (re.union (re.range "a" "z") (re.range "0" "9")))) (str.to_re ";"))) (re.opt (re.++ (str.to_re "level=") (re.+ (re.range "0" "9")) (str.to_re ";"))) (str.to_re "\u{a}"))))
; ^([a-zA-Z][a-zA-Z0-9]{1,100})$
(assert (not (str.in_re X (re.++ (str.to_re "\u{a}") (re.union (re.range "a" "z") (re.range "A" "Z")) ((_ re.loop 1 100) (re.union (re.range "a" "z") (re.range "A" "Z") (re.range "0" "9")))))))
; ^\d+([^.,])?$
(assert (str.in_re X (re.++ (re.+ (re.range "0" "9")) (re.opt (re.union (str.to_re ".") (str.to_re ","))) (str.to_re "\u{a}"))))
(check-sat)
