(set-logic QF_SLIA)
(declare-const X String)
; /^datapost\u{7c}\d+\u{7c}\d+\u{7C}[a-z0-9]+\u{2E}[a-z]{2,3}\u{7C}[a-z0-9]+\u{7C}/
(assert (not (str.in_re X (re.++ (str.to_re "/datapost|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re ".") ((_ re.loop 2 3) (re.range "a" "z")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re "|/\u{a}")))))
; ^[A-Z][a-z]+((i)?e(a)?(u)?[r(re)?|x]?)$
(assert (str.in_re X (re.++ (re.range "A" "Z") (re.+ (re.range "a" "z")) (str.to_re "\u{a}") (re.opt (str.to_re "i")) (str.to_re "e") (re.opt (str.to_re "a")) (re.opt (str.to_re "u")) (re.opt (re.union (str.to_re "r") (str.to_re "(") (str.to_re "e") (str.to_re ")") (str.to_re "?") (str.to_re "|") (str.to_re "x"))))))
(check-sat)
