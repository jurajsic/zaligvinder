(set-logic QF_SLIA)
(declare-const X String)
; /^antiddos\u{7c}\d+\u{7c}\d+\u{7C}[a-z0-9]+\u{2E}[a-z]{2,3}\u{7C}[a-z0-9]+\u{7C}/
(assert (str.in_re X (re.++ (str.to_re "/antiddos|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.range "0" "9")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re ".") ((_ re.loop 2 3) (re.range "a" "z")) (str.to_re "|") (re.+ (re.union (re.range "a" "z") (re.range "0" "9"))) (str.to_re "|/\u{a}"))))
; [0-9]{2}-?[DF][A-Z]{2}-?[0-9]{1}|[DF][A-Z]{1}-?[0-9]{3}-?[A-Z]{1}|[DF]-?[0-9]{3}-?[A-Z]{2}|[DF][A-Z]{2}-?[0-9]{2}-?[A-Z]{1}$
(assert (not (str.in_re X (re.union (re.++ ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (str.to_re "-")) (re.union (str.to_re "D") (str.to_re "F")) ((_ re.loop 2 2) (re.range "A" "Z")) (re.opt (str.to_re "-")) ((_ re.loop 1 1) (re.range "0" "9"))) (re.++ (re.union (str.to_re "D") (str.to_re "F")) ((_ re.loop 1 1) (re.range "A" "Z")) (re.opt (str.to_re "-")) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (str.to_re "-")) ((_ re.loop 1 1) (re.range "A" "Z"))) (re.++ (re.union (str.to_re "D") (str.to_re "F")) (re.opt (str.to_re "-")) ((_ re.loop 3 3) (re.range "0" "9")) (re.opt (str.to_re "-")) ((_ re.loop 2 2) (re.range "A" "Z"))) (re.++ (re.union (str.to_re "D") (str.to_re "F")) ((_ re.loop 2 2) (re.range "A" "Z")) (re.opt (str.to_re "-")) ((_ re.loop 2 2) (re.range "0" "9")) (re.opt (str.to_re "-")) ((_ re.loop 1 1) (re.range "A" "Z")) (str.to_re "\u{a}"))))))
; ([A-Za-z0-9.]+\s*)+,
(assert (str.in_re X (re.++ (re.+ (re.++ (re.+ (re.union (re.range "A" "Z") (re.range "a" "z") (re.range "0" "9") (str.to_re "."))) (re.* (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))))) (str.to_re ",\u{a}"))))
; e2give\.com.*Login\s+adfsgecoiwnf\u{23}\u{23}\u{23}\u{23}User-Agent\u{3A}
(assert (str.in_re X (re.++ (str.to_re "e2give.com") (re.* re.allchar) (str.to_re "Login") (re.+ (re.union (str.to_re " ") (str.to_re "\u{9}") (str.to_re "\u{a}") (str.to_re "\u{c}") (str.to_re "\u{d}"))) (str.to_re "adfsgecoiwnf\u{1b}####User-Agent:\u{a}"))))
(check-sat)
